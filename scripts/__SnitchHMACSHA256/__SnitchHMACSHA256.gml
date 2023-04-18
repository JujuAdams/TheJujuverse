/// @jujuadams 2021-09-16
///
/// @param keyString
/// @param message
/// @param [returnString=true]

function __SnitchHMACSHA256(_key, _message, _returnString = true)
{
    var _block_size  = 64; //bytes
    var _return_size = 32; //bytes
    
    var _inner_pad_buffer = buffer_create(_block_size + string_byte_length(_message), buffer_fixed, 1);
    var _outer_pad_buffer = buffer_create(_block_size + _return_size, buffer_fixed, 1);
    
    var _key_length = string_byte_length(_key);
    if (_key_length > _block_size)
    {
        //If the key is longer than the block size, we hash the key and use that instead
        var _temp_buffer = buffer_create(string_byte_length(_key), buffer_fixed, 1);
        buffer_write(_temp_buffer, buffer_text, _key);
        var _hash = __SnitchBufferSHA256(_temp_buffer, undefined, undefined, true, false);
        
        //Add the (hashed) key to the inner and outer pad buffers, XOR'd as necessary
        var _n = 0;
        repeat(8)
        {
            var _value = _hash[_n];
            //Reverse endianness
            _value = ((_value & 0x000000ff) << 24)
                   | ((_value & 0x0000ff00) <<  8)
                   | ((_value & 0x00ff0000) >>  8)
                   | ((_value & 0xff000000) >> 24);
            
            buffer_write(_inner_pad_buffer, buffer_u32, 0x36363636 ^ _value);
            buffer_write(_outer_pad_buffer, buffer_u32, 0x5c5c5c5c ^ _value);
            
            _n++;
        }
        
        //Set the key length to the return size for the benefit of figuring out how much padding to add
        _key_length = _return_size;
    }
    else
    {
        //If the key is smaller than the block size, just use the key
        var _n = 1;
        repeat(_key_length)
        {
            var _value = string_byte_at(_key, _n);
            buffer_write(_inner_pad_buffer, buffer_u8, 0x36 ^ _value);
            buffer_write(_outer_pad_buffer, buffer_u8, 0x5c ^ _value);
            _n++;
        }
    }
    
    //Pad out the rest too!
    buffer_fill(_inner_pad_buffer, _key_length, buffer_u8, 0x36, _block_size - _key_length);
    buffer_fill(_outer_pad_buffer, _key_length, buffer_u8, 0x5c, _block_size - _key_length);
    buffer_seek(_inner_pad_buffer, buffer_seek_start, _block_size);
    buffer_seek(_outer_pad_buffer, buffer_seek_start, _block_size);
    
    //Append the message to the inner padding, and hash the whole lot
    buffer_write(_inner_pad_buffer, buffer_text, _message);
    var _hash = __SnitchBufferSHA256(_inner_pad_buffer, 0, buffer_tell(_inner_pad_buffer), true, false);
    
    //Add the (hashed) inner pad to the outer pad buffer
    var _n = 0;
    repeat(8)
    {
        var _value = _hash[_n];
        
        //Reverse endianness
        buffer_write(_outer_pad_buffer, buffer_u32, ((_value & 0x000000ff) << 24)
                                                  | ((_value & 0x0000ff00) <<  8)
                                                  | ((_value & 0x00ff0000) >>  8)
                                                  | ((_value & 0xff000000) >> 24));
        
        _n++;
    }
    
    //And finally hash the outer padding too
    return __SnitchBufferSHA256(_outer_pad_buffer, 0, buffer_tell(_outer_pad_buffer), true, _returnString);
}

///  @jujuadams 2021-09-16
/// 
/// @param buffer
/// @param [offset]
/// @param [size]
/// @param [disposeBuffer=false]
/// @param [returnString=true]

#macro __SHA256_BLOCK_SIZE             64  ///bytes
#macro __SHA256_WORD_DATATYPE  buffer_u32
#macro __SHA256_WORD_SIZE               4  ///bytes
#macro __SHA256_BLOCK_WORDS    (__SHA256_BLOCK_SIZE / __SHA256_WORD_SIZE)
#macro __SHA256_ROUND_COUNT            64


//Reused arrays
global.__sha256_round_constants = [ 0x428a2f98, 0x71374491, 0xb5c0fbcf, 0xe9b5dba5, 0x3956c25b, 0x59f111f1, 0x923f82a4, 0xab1c5ed5,
                                    0xd807aa98, 0x12835b01, 0x243185be, 0x550c7dc3, 0x72be5d74, 0x80deb1fe, 0x9bdc06a7, 0xc19bf174,
                                    0xe49b69c1, 0xefbe4786, 0x0fc19dc6, 0x240ca1cc, 0x2de92c6f, 0x4a7484aa, 0x5cb0a9dc, 0x76f988da,
                                    0x983e5152, 0xa831c66d, 0xb00327c8, 0xbf597fc7, 0xc6e00bf3, 0xd5a79147, 0x06ca6351, 0x14292967,
                                    0x27b70a85, 0x2e1b2138, 0x4d2c6dfc, 0x53380d13, 0x650a7354, 0x766a0abb, 0x81c2c92e, 0x92722c85,
                                    0xa2bfe8a1, 0xa81a664b, 0xc24b8b70, 0xc76c51a3, 0xd192e819, 0xd6990624, 0xf40e3585, 0x106aa070,
                                    0x19a4c116, 0x1e376c08, 0x2748774c, 0x34b0bcb5, 0x391c0cb3, 0x4ed8aa4a, 0x5b9cca4f, 0x682e6ff3,
                                    0x748f82ee, 0x78a5636f, 0x84c87814, 0x8cc70208, 0x90befffa, 0xa4506ceb, 0xbef9a3f7, 0xc67178f2 ];

global.__sha256_message_schedule = array_create(__SHA256_ROUND_COUNT, 0x00);

function __SnitchBufferSHA256(_in_buffer, _in_offset = 0, _size = (buffer_get_size(_in_buffer) - _in_offset), _dispose = false, _return_string = true)
{
    if (!buffer_exists(_in_buffer)) show_error("Buffer " + string(_in_buffer) + " doesn't exist", true);
    if (_in_offset + _size > buffer_get_size(_in_buffer)) show_error("Attempting to read outside buffer (offset + size = " + string(_in_offset + _size) + ", buffer size = " + string(buffer_get_size(_in_buffer)) + ")", true);
    
    var _state_array_0 = 0x6a09e667;
    var _state_array_1 = 0xbb67ae85;
    var _state_array_2 = 0x3c6ef372;
    var _state_array_3 = 0xa54ff53a;
    var _state_array_4 = 0x510e527f;
    var _state_array_5 = 0x9b05688c;
    var _state_array_6 = 0x1f83d9ab;
    var _state_array_7 = 0x5be0cd19;
    
    var _block_count = ceil(_size / __SHA256_BLOCK_SIZE);
    
    //If we don't have space after the final block to store the bit size of the input buffer, add on an extra block
    var _last_block_remaining = __SHA256_BLOCK_SIZE*_block_count - _size;
    if (_last_block_remaining < 9) _block_count++; //Ensure we have enough room to append a 0x80 byte and a 64-bit integer at the end
    
    if (_dispose)
    {
        var _buffer = _in_buffer;
        var _offset = _in_offset;
        
        buffer_resize(_buffer, _offset + __SHA256_BLOCK_SIZE*_block_count);
    }
    else
    {
        var _buffer = buffer_create(__SHA256_BLOCK_SIZE*_block_count, buffer_fixed, 1);
        var _offset = 0;
        
        buffer_copy(_in_buffer, _offset, _size, _buffer, 0);
    }
    
    buffer_poke(_buffer, _offset + _size, buffer_u8, 0x80);
    
    //Store the number of bits right at the end of the buffer
    //This is stored as a big endian number
    var _bits = 8*_size;
    buffer_seek(_buffer, buffer_seek_start, _offset + __SHA256_BLOCK_SIZE*_block_count - 8);
    buffer_write(_buffer, buffer_u8, _bits >> 56);
    buffer_write(_buffer, buffer_u8, _bits >> 48);
    buffer_write(_buffer, buffer_u8, _bits >> 40);
    buffer_write(_buffer, buffer_u8, _bits >> 32);
    buffer_write(_buffer, buffer_u8, _bits >> 24);
    buffer_write(_buffer, buffer_u8, _bits >> 16);
    buffer_write(_buffer, buffer_u8, _bits >>  8);
    buffer_write(_buffer, buffer_u8, _bits      );
    
    //Jump back to where the data begins
    buffer_seek(_buffer, buffer_seek_start, _offset);
    
    //Perform round for each block
    repeat(_block_count)
    {
        var _message_schedule = global.__sha256_message_schedule;
        
        var _i = 0;
        repeat(__SHA256_BLOCK_WORDS)
        {
            var _value = buffer_read(_buffer, __SHA256_WORD_DATATYPE);
            //Reverse endianness
            _message_schedule[@ _i] = ((_value & 0x000000ff) << 24)
                                    | ((_value & 0x0000ff00) <<  8)
                                    | ((_value & 0x00ff0000) >>  8)
                                    | ((_value & 0xff000000) >> 24);
            ++_i;
        }
        
        var _i = __SHA256_BLOCK_WORDS;
        repeat(__SHA256_ROUND_COUNT - __SHA256_BLOCK_WORDS)
        {
            var _p = _message_schedule[_i - 15];
            var _q = _message_schedule[_i -  2];
            
            _message_schedule[@ _i] = ((((_q >> 17) | (_q << 15)) ^ ((_q >> 19) | (_q << 13)) ^ (_q >> 10)) //sigma 1
                                    +  _message_schedule[_i - 7]
                                    + (((_p >> 7) | (_p << 25)) ^ ((_p >> 18) | (_p << 14)) ^ (_p >> 3)) //sigma 0
                                    +  _message_schedule[_i - 16])
                                    & 0xffffffff;
            
            _i++;
        }
        
        var a = _state_array_0;
        var b = _state_array_1;
        var c = _state_array_2;
        var d = _state_array_3;
        var e = _state_array_4;
        var f = _state_array_5;
        var g = _state_array_6;
        var h = _state_array_7;
        
        var _i = 0;
        repeat(__SHA256_ROUND_COUNT)
        {
            var t1 = h
                   + ((((e >> 6) | (e << 26))   ^   ((e >> 11) | (e << 21))   ^   ((e >> 25) | (e << 7))) & 0xffffffff) //sum 1
                   + ((e & f) ^ (~e & g))
                   + global.__sha256_round_constants[_i]
                   + _message_schedule[_i];
               
            var t2 = ((((a >> 2) | (a << 30))   ^   ((a >> 13) | (a << 19))   ^   ((a >> 22) | (a << 10))) & 0xffffffff) //sum 0
                   + ((a & b) ^ (a & c) ^ (b & c));
        
            h = g;
            g = f;
            f = e;
            e = (d + t1) & 0xffffffff;
            d = c;
            c = b;
            b = a;
            a = (t1 + t2) & 0xffffffff;
        
            ++_i;
        }
    
        _state_array_0 = (_state_array_0 + a) & 0xffffffff;
        _state_array_1 = (_state_array_1 + b) & 0xffffffff;
        _state_array_2 = (_state_array_2 + c) & 0xffffffff;
        _state_array_3 = (_state_array_3 + d) & 0xffffffff;
        _state_array_4 = (_state_array_4 + e) & 0xffffffff;
        _state_array_5 = (_state_array_5 + f) & 0xffffffff;
        _state_array_6 = (_state_array_6 + g) & 0xffffffff;
        _state_array_7 = (_state_array_7 + h) & 0xffffffff;
    }
    
    if (_return_string)
    {
        //Construct hex string from array
        //We use a buffer method here to avoid string concat
        //We also reuse the working buffer for the sake of reducing the memory footprint slightly
        buffer_seek(_buffer, buffer_seek_start, 0);
        
        var _i = 0;
        repeat(8)
        {
            switch(_i)
            {
                case 0: var _value = _state_array_0; break;
                case 1: var _value = _state_array_1; break;
                case 2: var _value = _state_array_2; break;
                case 3: var _value = _state_array_3; break;
                case 4: var _value = _state_array_4; break;
                case 5: var _value = _state_array_5; break;
                case 6: var _value = _state_array_6; break;
                case 7: var _value = _state_array_7; break;
            }
            
            var _j = 8*__SHA256_WORD_SIZE;
            repeat(__SHA256_WORD_SIZE)
            {
                var _msf = (_value >> (_j-4)) & 0x0f;
                var _lsf = (_value >> (_j-8)) & 0x0f;
                buffer_write(_buffer, buffer_u8, (_msf < 10)? (_msf + 48) : (_msf + 87));
                buffer_write(_buffer, buffer_u8, (_lsf < 10)? (_lsf + 48) : (_lsf + 87));
                
                _j -= 8;
            }
            
            ++_i;
        }
        
        buffer_write(_buffer, buffer_u8, 0x00);
        buffer_seek(_buffer, buffer_seek_start, 0);
        var _string = buffer_read(_buffer, buffer_string);
        
        //Get rid of the working buffer
        buffer_delete(_buffer);
        
        return _string;
    }
    else
    {
        return [ _state_array_0,
                 _state_array_1,
                 _state_array_2,
                 _state_array_3,
                 _state_array_4,
                 _state_array_5,
                 _state_array_6,
                 _state_array_7 ];
    }
}
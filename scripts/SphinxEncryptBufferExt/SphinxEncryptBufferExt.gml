/// Encrypts part of a buffer, and returns a new buffer containing encrypted data
/// 
/// @param buffer   Buffer to encrypt
/// @param offset   Position in the buffer to start encryption
/// @param size     Total number of bytes to encrypt
/// @param key      64-bit integer to "lock" the buffer

function SphinxEncryptBufferExt(_buffer, _offset, _size, _key)
{
    var _compressed = buffer_compress(_buffer, _offset, _size);
    
    var _compressed_size = buffer_get_size(_compressed);
    var _i = 0;
    var _state = _key;
    repeat(min(SPHINX_MAXIMUM_XOR_BYTES, _compressed_size))
    {
        //Basic XORShift32, nothing fancy
        _state ^= _state << 13;
        _state ^= _state >> 17;
        _state ^= _state <<  5;
        
        buffer_poke(_compressed, _i, buffer_u8, buffer_peek(_compressed, _i, buffer_u8) ^ (_state & 0xFF));
        
        ++_i;
    }
    
    return _compressed;
}





#region (System)

#macro  __SPHINX_VERSION  "1.0.0"
#macro  __SPHINX_DATE     "2021-06-08"

show_debug_message("Welcome to Sphinx by @jujuadams! This is version " + string(__SPHINX_VERSION) + ", " + string(__SPHINX_DATE));

#endregion
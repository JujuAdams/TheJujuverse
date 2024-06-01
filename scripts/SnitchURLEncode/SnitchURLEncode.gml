// Feather disable all
function SnitchURLEncode(_url)
{
    static _inBuffer     = buffer_create(1024, buffer_grow, 1);
    static _outBuffer    = buffer_create(1024, buffer_grow, 1);
    static _allowedArray = array_create(256);
    static _hexArray     = array_create(256);
    static _initialized  = false;
    
    if (!_initialized)
    {
        _initialized = true;
        
        for(var _i = ord("A"); _i <= ord("Z"); _i++) _allowedArray[_i] = true;
        for(var _i = ord("a"); _i <= ord("z"); _i++) _allowedArray[_i] = true;
        for(var _i = ord("0"); _i <= ord("9"); _i++) _allowedArray[_i] = true;
        _allowedArray[ord("-")] = true;
        _allowedArray[ord("_")] = true;
        _allowedArray[ord(".")] = true;
        _allowedArray[ord("!")] = true;
        _allowedArray[ord("~")] = true;
        _allowedArray[ord("*")] = true;
        _allowedArray[ord("'")] = true;
        _allowedArray[ord("(")] = true;
        _allowedArray[ord(")")] = true;
        
        var _i = 0;
        repeat(256)
        {
            var _value = 0;
            
            //Lower part of the byte
            var _work = (_i >> 4);
            if (_work >= 10)
            {
                _value = ord("A") + _work - 10;
            }
            else
            {
                _value = ord("0") + _work;
            }
            
            //Upper part of the byte
            _work = _i & 0x0F;
            if (_work >= 10)
            {
                _value |= (ord("A") + _work - 10) << 8;
            }
            else
            {
                _value |= (ord("0") + _work) << 8;
            }
            
            _hexArray[_i] = _value;
            
            ++_i;
        }
    }
    
    buffer_seek(_inBuffer, buffer_seek_start, 0);
    buffer_write(_inBuffer, buffer_text, _url);
    
    var _byteCount = buffer_tell(_inBuffer);
    buffer_seek(_inBuffer,  buffer_seek_start, 0);
    buffer_seek(_outBuffer, buffer_seek_start, 0);
    
    repeat(_byteCount)
    {
        var _byte = buffer_read(_inBuffer, buffer_u8);
        if (_allowedArray[_byte])
        {
            buffer_write(_outBuffer, buffer_u8, _byte);
        }
        else
        {
            buffer_write(_outBuffer, buffer_u8, ord("%"));
            buffer_write(_outBuffer, buffer_u16, _hexArray[_byte]);
        }
    }
    
    buffer_write(_outBuffer, buffer_u8, 0);
    buffer_seek(_outBuffer, buffer_seek_start, 0);
    return buffer_read(_outBuffer, buffer_string);
}

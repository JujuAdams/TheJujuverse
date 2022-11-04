/// Decrypts part of a buffer, and returns a new buffer containing decrypted data
/// 
/// @param buffer   Buffer to decrypt
/// @param offset   Position in the buffer to start decryption
/// @param size     Total number of bytes to decrypt
/// @param key      64-bit integer to "unlock" the buffer

function SphinxDecryptBufferExt(_buffer, _offset, _size, _key)
{
    var _tempBuffer = buffer_create(_size, buffer_fixed, 1);
    buffer_copy(_buffer, _offset, _size, _tempBuffer, 0);
    
    var _i = 0;
    var _state = _key;
    repeat(min(SPHINX_MAXIMUM_XOR_BYTES, _size))
    {
        //Basic XORShift32, nothing fancy
        _state ^= _state << 13;
        _state ^= _state >> 17;
        _state ^= _state <<  5;
        
        buffer_poke(_tempBuffer, _i, buffer_u8, buffer_peek(_tempBuffer, _i, buffer_u8) ^ (_state & 0xFF));
        ++_i;
    }
    
    var _decompressed = buffer_decompress(_tempBuffer);
    buffer_delete(_tempBuffer);
    
    return _decompressed;
}
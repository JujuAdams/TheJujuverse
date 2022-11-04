/// Encrypts a string, and returns a base64-encoded buffer
/// 
/// @param string   String to encrypt
/// @param key      64-bit integer to use to "lock" the encrypted string

function SphinxEncryptString(_string, _key)
{
    var _buffer = buffer_create(string_byte_length(_string), buffer_fixed, 1);
    buffer_write(_buffer, buffer_text, _string);
    
    var _encrypted = SphinxEncryptBuffer(_buffer, _key);
    buffer_delete(_buffer);
    
    var _result = buffer_base64_encode(_encrypted, 0, buffer_get_size(_encrypted));
    buffer_delete(_encrypted);
    
    return _result;
}
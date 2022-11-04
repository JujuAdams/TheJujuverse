/// Encrypts an entire buffer, and returns that encrypted buffer
/// 
/// @param buffer   Buffer to encrypt
/// @param key      64-bit integer to "lock" the buffer

function SphinxEncryptBuffer(_buffer, _key)
{
    return SphinxEncryptBufferExt(_buffer, 0, buffer_get_size(_buffer), _key);
}
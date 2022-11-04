/// Decrypts an entire buffer, and returns that decrypted buffer
/// 
/// @param buffer   Buffer to encrypt
/// @param key      64-bit integer to "unlock" the buffer

function SphinxDecryptBuffer(_buffer, _key)
{
    return SphinxDecryptBufferExt(_buffer, 0, buffer_get_size(_buffer), _key);
}
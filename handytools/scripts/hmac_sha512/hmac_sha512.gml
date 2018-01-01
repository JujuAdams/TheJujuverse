/// hmac_sha512( key, string )
// 
//  Implementation of the HMAC algorithm using the SHA512 hash function.
//  This algorithm is typically used for web authorisation, especially
//  when using the OAuth standard.
// 
//      key          encryption key, string
//      string       plaintext to encrypt, string
// 
/// GMLscripts.com/license

{
    var key = argument0;
    var str = argument1;

    //Create reference string for decimal hex value look-up (because of GM's
    //silly string indexing, this reference returns N+1)
    var hexRef = "0123456789abcdef";
    
    //Create buffers to hold our data. We use buffers rather than strings because
    //0x00 - the NULL character in ASCII - typically terminates a string and may
    //cause weirdness.
    var buf_key = buffer_create( 128, buffer_fixed, 1 );
  
    //128-bytes of padding and then enough room for the string
    var buf_innerPad = buffer_create( 128 + string_length( str ), buffer_fixed, 1 );
  
    //NB - Using 192 here - SHA1 returns 64 bytes of data and we append that to
    //128-bytes of padding
    var buf_outerPad = buffer_create( 192, buffer_fixed, 1 );
  
    if ( string_length( key ) > 128 ) {
  
        //If the key is longer than SHA512's block size, we hash the key and use
        //that instead.
        var sha = string_sha512( key );
      
        //Since SHA512 returns a hex *string*, we need to turn that into 8-bit bytes.
        for( var n = 1; n <= 128; n += 2 ) buffer_write( buf_key, buffer_u8,
            string_pos( string_char_at( sha, n+1 ), hexRef )
        + ( string_pos( string_char_at( sha, n ), hexRef ) * 16 ) - 17 );
      
    } else {
      
        //If the key is smaller than SHA512's block size, just use the key. Since
        //we're in a 128 byte buffer, it automatically pads with 0x00
        buffer_write( buf_key, buffer_text, key );
    }
  
    for( var n = 0; n < 128; n++ ) {
        var keyVal = buffer_peek( buf_key, n, buffer_u8 );
      
        //Bitwise XOR between the inner/outer padding and the key
        buffer_poke( buf_innerPad, n, buffer_u8, $36 ^ keyVal );
        buffer_poke( buf_outerPad, n, buffer_u8, $5C ^ keyVal );
    }
  
    //Seek to the end of the padding  for both the inner and outer pads
    buffer_seek( buf_innerPad, buffer_seek_start, 128 );
    buffer_seek( buf_outerPad, buffer_seek_start, 128 );
  
    //Append the string to encrypt
    buffer_write( buf_innerPad, buffer_text, str );
  
    //Apply SHA512 to (innerPad + string)
    var sha = buffer_sha512( buf_innerPad, 0, buffer_tell( buf_innerPad ) );
  
    //Turn the SHA1 output into bytes and append this to the outer pad
    for( var n = 1; n <= 128; n += 2 ) buffer_write( buf_outerPad, buffer_u8,
        string_pos( string_char_at( sha, n+1 ), hexRef )
    + ( string_pos( string_char_at( sha, n ), hexRef ) * 16 ) - 17 );
  
    //Apply SHA512 to (outerPad + result)
    var result = buffer_sha512( buf_outerPad, 0, buffer_tell( buf_outerPad ) );
  
    buffer_delete( buf_key );
    buffer_delete( buf_innerPad );
    buffer_delete( buf_outerPad );
  
    return result;
}
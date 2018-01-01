/// @description Returns the SHA512 hash of a string
/// @param string

var _string = argument0;
var _size = string_byte_length( _string );
var _buffer = buffer_create( _size, buffer_fixed, 1 );
buffer_write( _buffer, buffer_text, _string );
var _result = sha512_buffer( _buffer, 0, _size );
buffer_delete( _buffer );
return _result;
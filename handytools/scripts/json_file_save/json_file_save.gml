/// @param json
/// @param filename

var _map      = argument0;
var _filename = argument1;

var _text = json_encode( _map );
var _length = string_byte_length( _text );
var _buffer = buffer_create( _length, buffer_fixed, 1 );
buffer_write( _buffer, buffer_text, _text );

buffer_save( _buffer, _filename );
buffer_delete( _buffer );
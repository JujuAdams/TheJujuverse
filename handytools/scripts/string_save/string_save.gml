/// @param filename
/// @param string

var _name   = argument0;
var _string = argument1;

var _buffer = buffer_create( string_length( _string ), buffer_fixed, 1 );
buffer_write( _buffer, buffer_text, _string );
buffer_save( _buffer, _name );
buffer_delete( _buffer );
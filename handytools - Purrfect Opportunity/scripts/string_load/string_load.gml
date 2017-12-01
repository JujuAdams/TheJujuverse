///@param filename

var _name = argument0;

var _buffer = buffer_load( _name );
var _string = buffer_read( _buffer, buffer_text );
buffer_delete( _buffer );

return _string;
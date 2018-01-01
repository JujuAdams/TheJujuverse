/// @description Loads a JSON directly from a file on disk (synchronously)
/// @param filename

var _filename = argument0;

var _buffer = buffer_load( _filename );
var _text = buffer_read( _buffer, buffer_text );
buffer_delete( _buffer );

return json_decode( _text );
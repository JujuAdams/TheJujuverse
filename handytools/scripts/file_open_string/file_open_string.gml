///@param filename
///@description reads in an entire file as string
///@returns string|undefined

var _filename = argument0;

if ( file_exists( _filename ) ) {
    var _file = file_text_open_read( _filename );
    var _str = file_text_read_string( _file );
    file_text_close( _file );
    return _str;
}

return undefined;
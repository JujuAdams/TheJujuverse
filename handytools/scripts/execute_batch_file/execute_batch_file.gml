///@param string

var _str = argument0;

file_delete( "windev.bat" );

var _buffer = buffer_create( string_length( _str ), buffer_fixed, 1 );
buffer_write( _buffer, buffer_text, _str );
buffer_save( _buffer, "windev.bat" );
buffer_delete( _buffer );

var _func = external_define( "WinDev.dll", "shell_execute" , dll_cdecl, ty_real, 2, ty_string, ty_string );
external_call( _func, game_save_id + "windev.bat", "" );
external_free( "WinDev.dll" );
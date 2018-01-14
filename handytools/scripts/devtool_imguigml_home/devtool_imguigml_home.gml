/// @description Customisation for DEVTOOL's home page

if imguigml_button( "New game instance" ) new_game_instance();
imguigml_same_line();
if imguigml_button( "Quit game" ) game_end();
if ( TRACKER_ON ) {
    imguigml_same_line();
    if imguigml_button( "Tracker dump" ) trace_f( tracker_dump() );
    imguigml_same_line();
    if imguigml_button( "Tracker dump to clipboard" ) { clipboard_set_text( tracker_dump() ); imguigml_popup( "", "Copied to clipboard!" ); }
}
imguigml_new_line();
if ( FPS_ON ) {
    if ( imguigml_checkbox( "Show FPS", global.fps_show ) ) global.fps_show = !global.fps_show;
}
imguigml_separator();

var _size = ds_list_size( global.master_game_output );
for( var _i = max( 0, _size-5 ); _i < _size; _i++ ) imguigml_text( global.master_game_output[| _i ] );
imguigml_separator();

imguigml_new_line();
imguigml_text( concat( "Current room=", QU, room_get_name( room ), QU, " (", room, ")" ) );
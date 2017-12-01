if imguigml_button( "New game instance" ) new_game_instance();
imguigml_same_line();
if imguigml_button( "Main Menu" ) room_goto( rm_main_menu );
imguigml_new_line();
imguigml_separator();

var _size = ds_list_size( global.master_game_output );
for( var _i = max( 0, _size-5 ); _i < _size; _i++ ) imguigml_text( global.master_game_output[| _i ] );
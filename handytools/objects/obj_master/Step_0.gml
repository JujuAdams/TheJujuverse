if ( audio_group_is_loaded_all() && !loaded ) {
	loaded = true;
	trace_f( "Audio groups loaded" );
	master_start_services();
	trace_f( "--------------------", NL,
	         "  SERVICES  LOADED", NL,
	         "--------------------" );
	master_start_game();
}

if ( QUIT_ON_ESCAPE && keyboard_check_pressed( vk_escape ) ) game_end();

if ( ALLOW_F4_FULLSCREEN && keyboard_check_pressed( vk_f4 ) ) {
	if ( RESOLUTION_ON ) {
		resolution_toggle_fullscreen();
	} else {
		options_set( "fullscreen", !options_get( "fullscreen" ) );
		window_set_fullscreen( options_get( "fullscreen" ) );
		on_fullscreen_toggle();
	}
}
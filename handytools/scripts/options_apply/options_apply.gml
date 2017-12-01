audio_master_gain( options_get( "master volume", 1.0 ) );
audio_group_set_gain( global.audio_group_map[? "music"  ], options_get( "music" , 0.40 ), 200 );
audio_group_set_gain( global.audio_group_map[? "sounds" ], options_get( "sounds", 0.75 ),   0 );

if ( options_get( "window width" , DEFAULT_WINDOW_WIDTH   ) >= display_get_width()  )
|| ( options_get( "window height" , DEFAULT_WINDOW_HEIGHT ) >= display_get_height() ) {
	window_set_fullscreen( true );
}

if ( !options_get( "fullscreen", false ) ) {
	window_set_rectangle( options_get( "window x"     , DEFAULT_WINDOW_X      ),
	                      options_get( "window y"     , DEFAULT_WINDOW_Y      ),
						  options_get( "window width" , DEFAULT_WINDOW_WIDTH  ),
	                      options_get( "window height", DEFAULT_WINDOW_HEIGHT ) );
}
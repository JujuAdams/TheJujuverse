if ( !window_get_fullscreen() ) {
	options_set( "window x", window_get_x() );
	options_set( "window y", window_get_y() );
	options_set( "window width", window_get_width() );
	options_set( "window height", window_get_height() );
}
	
alarm[0] = 20;
phase = 0;
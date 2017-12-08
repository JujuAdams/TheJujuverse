if ( !window_get_fullscreen() ) {
	window_set_rectangle( options_get( "window x"      ),
	                      options_get( "window y"      ),
						  options_get( "window width"  ),
	                      options_get( "window height" ) );			  
	display_set_gui_size( options_get( "window width"  ), options_get( "window height" ) );
} else {
	display_set_gui_size( display_get_width(), display_get_height() );
}

alarm[2] = 20;
phase = 2;
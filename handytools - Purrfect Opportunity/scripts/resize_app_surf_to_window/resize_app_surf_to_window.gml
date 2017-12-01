if ( ( surface_get_width( application_surface ) != window_get_width() ) or ( surface_get_height( application_surface ) != window_get_height() ) )
&& ( window_get_width()  > 0 )
&& ( window_get_height() > 0 ) {
	surface_resize( application_surface, window_get_width(), window_get_height() );
}
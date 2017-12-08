draw_set_colour( c_black );
switch( phase ) {
	case 0: draw_set_alpha( 1-clamp( parameter( 0, 20, alarm[0] ), 0, 1 ) ); break;
	case 1: draw_set_alpha( 1 ); break;
	case 2: draw_set_alpha( clamp( parameter( 0, 20, alarm[2] ), 0, 1 ) ); break;
}
draw_rectangle( 0, 0, display_get_gui_width()-1, display_get_gui_height()-1, false );
draw_set_alpha( 1 );
draw_set_colour( c_white );
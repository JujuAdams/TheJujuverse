///@desc Post-create event

switch( target_room ) {
	case rm_main_menu:
		colour = merge_colour( $763800, c_black, 0.8 );
		break;
	case rm_options:
		colour = merge_colour( $174be1, c_black, 0.8 );
		break;
	case rm_single:
		colour = merge_colour( $b5e300, c_black, 0.8 );
		break;
	default:
		colour = c_black;
		break;
}
if ( room == rm_init ) colour = c_black;
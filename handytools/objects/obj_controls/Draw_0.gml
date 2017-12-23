if ( !GRIP_ON || ( grip_get_current() == "2d" ) ) {
	draw_sprite( spr_cursor, control_property( 0, "state", "mouse" ) & HELD,
	                         control_property( 0, "mouse", "point x" ),
				             control_property( 0, "mouse", "point y" ) );
}
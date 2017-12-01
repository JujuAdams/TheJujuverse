mouse_over = ( visible ) and point_in_rectangle( control_property( 0, "mouse", "point x" ), control_property( 0, "mouse", "point y" ),
                                                 mouse_bbox_left, mouse_bbox_top, mouse_bbox_right, mouse_bbox_bottom );
mouse_clicked = false;

if ( mouse_over ) or ( mouse_draggable and mouse_down ) {
	
	if ( control_property( 0, "state", "mouse" ) == PRESSED ) {
		if ( !mouse_down ) {
			mouse_down_x = control_property( 0, "mouse", "point x" ) - x;
			mouse_down_y = control_property( 0, "mouse", "point y" ) - y;
		}
		mouse_down = true;
	} else if ( !( control_property( 0, "state", "mouse" ) & HELD ) ) and ( mouse_down ) {
		mouse_down = false;
		mouse_clicked = true;
		sound_play( snd_ui_click, 1, false );
	}	
	
} else {

	mouse_down = false;
	
}
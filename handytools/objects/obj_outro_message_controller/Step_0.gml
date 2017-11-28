if ( time_passed( start_time, 1700 ) ) {
	
	start_time = current_time;
	
	state++;
	switch( state ) {
		case 1: instance_create_layer( 150, 190, "Messages", obj_message_outro_b ); break;
		case 2:
			start_time -= 1000;
			with( obj_parent_message ) {
				out_tween = true;
				out_tween_start_time = current_time;
				out_tween_length = 500;
			}
			instance_destroy(); 
		break;
	}

}
switch( camera_state ) {
	
	case e_camera_state.static:
	break;
	
	case e_camera_state.follow:
		cam_set_by_focus();
	break;
	
	case e_camera_state.pan:
		
		tween_t = clamp( ( current_time - tween_start ) / tween_duration, 0, 1 );
		tween_q = ease_quad_inout( tween_t );
		camera_focus_x = lerp( tween_start_x, tween_end_x, tween_q );
		camera_focus_y = lerp( tween_start_y, tween_end_y, tween_q );
			
		if ( camera_do_zoom ) {
			if ( tween_zoom_do_centre ) {
				
				if ( tween_t <= 0.5 ) {
					camera_zoom = lerp( tween_start_zoom, tween_centre_zoom, ease_quad_inout( 2*tween_t ) );
				} else {
					camera_zoom = lerp( tween_centre_zoom, tween_end_zoom, ease_quad_inout( 2*tween_t - 1 ) );
				}
				
			} else {
				
				camera_zoom = lerp( tween_start_zoom, tween_end_zoom, tween_q );
				
			}
		}
			
		if ( tween_t >= 1 ) camera_state = e_camera_state.follow;
		
		var _w = view_get_wport( view ) / camera_zoom;
		var _h = view_get_hport( view ) / camera_zoom;
	
		var _left = clamp( camera_focus_x - _w/2, 0, room_width  - _w );
		var _top  = clamp( camera_focus_y - _h/2, 0, room_height - _h );

		camera_set_view_pos( camera, _left, _top );
		camera_set_view_size( camera, _w, _h );
		
	break;
	
}
/*
if ( tween_t >= 1 ) {
	
	if ( test_ping_pong_state ) {
		test_ping_pong_state = 0;
		cam_pan( 768, 384, 1,
			    undefined,
				512, 384, 1,
				1000, 2000 );
	} else {
		test_ping_pong_state = 1;
		cam_pan( 512, 384, 1,
			    undefined,
				768, 384, 1,
				1000, 2000 );
	}
	
}
*/
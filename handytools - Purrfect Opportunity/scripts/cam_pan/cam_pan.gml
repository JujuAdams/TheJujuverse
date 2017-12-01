/// @param start_x
/// @param start_y
/// @param start_zoom
/// @param centre_zoom
/// @param end_x
/// @param end_y
/// @param end_zoom
/// @param delay
/// @param duration

with( obj_camera ) {
	
	if ( argument0 == undefined ) var _start_x  = camera_focus_x; else var _start_x  = argument0;
	if ( argument1 == undefined ) var _start_y  = camera_focus_y; else var _start_y  = argument1;
	if ( argument2 == undefined ) var _start_z  = camera_zoom;    else var _start_z  = argument2;
	var _centre_z = argument3;
	var _end_x    = argument4;
	var _end_y    = argument5;
	if ( argument6 == undefined ) var _end_z    = _start_z;       else var _end_z    = argument6;
	if ( argument7 == undefined ) var _delay    = 0;              else var _delay    = argument7;
	if ( argument8 == undefined ) var _duration = tween_duration; else var _duration = argument8;

	camera_state = e_camera_state.pan;
			
	tween_start      = current_time + _delay;
	tween_duration   = _duration;
	tween_start_x    = _start_x;
	tween_start_y    = _start_y;
	tween_start_zoom = _start_z;

	if ( _centre_z == undefined ) or ( _centre_z <= 0 ) {
		tween_zoom_do_centre = false;
		tween_centre_zoom    = mean( _start_z, _end_z );
	} else {
		tween_zoom_do_centre = true;
		tween_centre_zoom = _centre_z;
	}

	tween_end_x      = _end_x;
	tween_end_y      = _end_y;
	tween_end_zoom   = _end_z;

}
event_inherited();

if ( mouse_clicked ) {
	global.controls_focus = id;
}

if ( global.controls_focus == id ) {
	
	if ( keyboard_check_pressed( vk_anykey ) ) {
		global.controls_focus = noone;
		
		var _str = control_key_to_name( keyboard_lastkey );
		if ( _str != "" ) {
			json_write( global.options_json, "controls", 0, "keyboard mapping", control_set_property, _str );
			options_set_mappings();
			text = control_set_name + " = " + _str;
			script_execute( fit_function, 130 );
		}
		
	}
}

if ( in_tween ) {
	in_tween_t = clamp( ( current_time - in_tween_start_time ) / in_tween_length, 0, 1 );
	y = lerp( ystart - room_height, ystart, dsin( in_tween_t * 90 ) );
	if ( in_tween_t >= 1 ) in_tween = false;
	script_execute( fit_function, 140 );
}

if ( out_tween ) {
	out_tween_t = clamp( ( current_time - out_tween_start_time ) / out_tween_length, 0, 1 );
	y = lerp( ystart - room_height, ystart, dsin( 90 + out_tween_t * 90 ) );
	if ( out_tween_t >= 1 ) out_tween = false;
	script_execute( fit_function, 140 );
}
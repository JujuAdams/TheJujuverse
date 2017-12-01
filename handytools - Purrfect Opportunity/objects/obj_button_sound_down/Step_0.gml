event_inherited();

if ( mouse_clicked ) and ( time_passed( click_time, 200 ) ) {
	click_time = current_time;
	var _volume = options_get( "sounds" );
	_volume = clamp( _volume-0.05, 0, 1 );
	options_set( "sounds", _volume );
	options_apply();
}

if ( in_tween ) {
	in_tween_t = clamp( ( current_time - in_tween_start_time ) / in_tween_length, 0, 1 );
	y = lerp( ystart - room_height, ystart, dsin( in_tween_t * 90 ) );
	if ( in_tween_t >= 1 ) in_tween = false;
	script_execute( fit_function, 10 );
}

if ( out_tween ) {
	out_tween_t = clamp( ( current_time - out_tween_start_time ) / out_tween_length, 0, 1 );
	y = lerp( ystart - room_height, ystart, dsin( 90 + out_tween_t * 90 ) );
	if ( out_tween_t >= 1 ) out_tween = false;
	script_execute( fit_function, 10 );
}
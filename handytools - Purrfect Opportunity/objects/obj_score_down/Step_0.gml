visible = true;

if ( in_tween ) {
	in_tween_t = clamp( ( current_time - in_tween_start_time ) / in_tween_length, 0, 1 );
	y = lerp( ystart - 120, ystart, dsin( in_tween_t * 90 ) );
	if ( in_tween_t >= 1 ) {
		in_tween = false;
		instance_destroy();
	}
}
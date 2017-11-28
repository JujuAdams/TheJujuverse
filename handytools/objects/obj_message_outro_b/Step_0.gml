if ( in_tween ) {
	in_tween_t = clamp( ( current_time - in_tween_start_time ) / in_tween_length, 0, 1 );
	image_xscale = lerp( 0, 1, dsin( in_tween_t * 90 ) );
	image_yscale = image_xscale;
	if ( in_tween_t >= 1 ) in_tween = false;
}

if ( out_tween ) {
	out_tween_t = clamp( ( current_time - out_tween_start_time ) / out_tween_length, 0, 1 );
	image_xscale = lerp( 1, 0, dsin( out_tween_t * 90 ) );
	image_yscale = image_xscale;
	if ( out_tween_t >= 1 ) {
		out_tween = false;
		instance_destroy();
	}
}
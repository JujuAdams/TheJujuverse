mouse_active_force_colour();
camera_click_handle_fog();

if ( outro_t < 1 ) {
	s_shader_uniform_f( "u_fVibrate", lerp( 0, 9, outro_t ) );
	s_shader_uniform_f( "u_fGarbage", random(1) );
}

event_user( DRAW_USER_EVENT );

mouse_active_reset_colour();

if ( outro_t < 1 ) {
	s_shader_uniform_f( "u_fVibrate", 0 );
	s_shader_uniform_f( "u_fGarbage", 0 );
}
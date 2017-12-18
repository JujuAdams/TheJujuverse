mouse_active_force_colour();
camera_click_handle_fog();

if ( outro_t < 1 ) {
    shader_set_uniform_f( shader_get_uniform( shd_per_texel_lighting, "u_fVibrate" ), lerp( 0, 9, outro_t ) );
    shader_set_uniform_f( shader_get_uniform( shd_per_texel_lighting, "u_fGarbage" ), random( 1 ) );
}

event_user( DRAW_USER_EVENT );

mouse_active_reset_colour();

if ( outro_t < 1 ) {
    shader_set_uniform_f( shader_get_uniform( shd_per_texel_lighting, "u_fVibrate" ), 0.0 );
    shader_set_uniform_f( shader_get_uniform( shd_per_texel_lighting, "u_fGarbage" ), 0.0 );
}
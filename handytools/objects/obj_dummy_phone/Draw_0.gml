mouse_active_force_colour();
camera_click_handle_fog();

if ( audio_is_playing( phone_ring_sound_instance ) ) {
    var _track_position = audio_sound_get_track_position( phone_ring_sound_instance );
    if ( _track_position > 0.1 ) && ( _track_position < 1.05 ) shader_set_uniform_f( shader_get_uniform( shd_psx, "u_fVibrate" ), 1.0 );
    shader_set_uniform_f( shader_get_uniform( shd_psx, "u_fGarbage" ), random( 1 ) );
}

event_user( DRAW_USER_EVENT );
mouse_active_reset_colour();

shader_set_uniform_f( shader_get_uniform( shd_psx, "u_fVibrate" ), 0.0 );
shader_set_uniform_f( shader_get_uniform( shd_psx, "u_fGarbage" ), 0.0 );
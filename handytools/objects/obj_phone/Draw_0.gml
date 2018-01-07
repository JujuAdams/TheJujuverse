mouse_active_force_colour();
screen_click_handle_fog( global.mirror_render? 128 : 0 );

if ( audio_is_playing( phone_ring_sound_instance ) ) {
    var _track_position = audio_sound_get_track_position( phone_ring_sound_instance );
    if ( _track_position > 0.1 ) && ( _track_position < 1.05 )s_shader_float( "u_fVibrate", 1.0 );
    s_shader_float( "u_fGarbage", random(1) );
}

event_user( DRAW_USER_EVENT );

mouse_active_reset_colour();
s_shader_float( "u_fVibrate", 0 );
s_shader_float( "u_fGarbage", 0 );
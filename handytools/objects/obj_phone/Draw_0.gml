mouse_active_force_colour();

if ( audio_is_playing( phone_ring_sound_instance ) ) {
    var _track_position = audio_sound_get_track_position( phone_ring_sound_instance );
    if ( _track_position > 0.1 ) and ( _track_position < 1.05 ) shader_set_uniform_f( shader_get_uniform( shd_psx, "u_fVibrate" ), 1.0 );
    shader_set_uniform_f( shader_get_uniform( shd_psx, "u_fGarbage" ), random( 1 ) );
}

matrix_chain_begin();
matrix_chain_rotate_x( -90 );
matrix_chain_rotate_z( image_angle );
if ( global.game_room == 6 ) matrix_chain_scale( 1, 1, -1 );
matrix_chain_translate( x, y, z );
if ( global.game_room != 6 ) matrix_chain_translate( 0, 0, global.game_swell );
if ( global.game_room == 6 ) matrix_chain_translate( 0, 0, -global.game_swell );
matrix_chain_end( matrix_world );
vertex_submit( global.vbf_phone_base, pr_trianglelist, sprite_get_texture( spr_tex_phone_base, 0 ) );
vertex_submit( global.vbf_phone_rotary , pr_trianglelist, sprite_get_texture( spr_tex_phone_rotary, 0 ) );

matrix_chain_begin();
matrix_chain_rotate_x( -90 );
matrix_chain_rotate_y( 45*headset_t );
matrix_chain_translate( 0, -5, 5 );
matrix_chain_rotate_x( 80*headset_t );
matrix_chain_translate( 0, 5, -5 );
matrix_chain_translate( 7*headset_t, -2*headset_t, 8*headset_t );
matrix_chain_rotate_z( image_angle );
if ( global.game_room == 6 ) matrix_chain_scale( 1, 1, -1 );
matrix_chain_translate( x, y, z );
if ( global.game_room != 6 ) matrix_chain_translate( 0, 0, global.game_swell );
if ( global.game_room == 6 ) matrix_chain_translate( 0, 0, -global.game_swell );
matrix_chain_end( matrix_world );
vertex_submit( global.vbf_phone_headset, pr_trianglelist, sprite_get_texture( spr_tex_phone_headset, 0 ) );
matrix_reset_world();

mouse_active_reset_colour();

shader_set_uniform_f( shader_get_uniform( shd_psx, "u_fVibrate" ), 0.0 );
shader_set_uniform_f( shader_get_uniform( shd_psx, "u_fGarbage" ), 0.0 );
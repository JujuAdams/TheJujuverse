/*
mouse_active_force_colour();

if ( audio_is_playing( phone_ring_sound_instance ) ) {
    var _track_position = audio_sound_get_track_position( phone_ring_sound_instance );
    if ( _track_position > 0.1 ) and ( _track_position < 1.05 ) shader_set_uniform_f( shader_get_uniform( shd_psx, "u_fVibrate" ), 1.0 );
    shader_set_uniform_f( shader_get_uniform( shd_psx, "u_fGarbage" ), random( 1 ) );
}

d3d_transform_set_rotation_x( -90 );
d3d_transform_add_rotation_z( image_angle );
if ( global.game_room == 6 ) d3d_transform_add_scaling( 1, 1, -1 );
d3d_transform_add_translation( x, y, z );
if ( global.game_room != 6 ) d3d_transform_add_translation( 0, 0,  global.game_swell );
if ( global.game_room == 6 ) d3d_transform_add_translation( 0, 0, -global.game_swell );
vertex_submit( global.vbf_phone_base, pr_trianglelist, sprite_get_texture( spr_tex_phone_base, 0 ) );
vertex_submit( global.vbf_phone_rotary , pr_trianglelist, sprite_get_texture( spr_tex_phone_rotary, 0 ) );

d3d_transform_set_rotation_x( -90 );
d3d_transform_add_rotation_y( 45*headset_t );
d3d_transform_add_translation( 0, -5, 5 );
d3d_transform_add_rotation_x( 80*headset_t );
d3d_transform_add_translation( 0, 5, -5 );
d3d_transform_add_translation( 7*headset_t, -2*headset_t, 8*headset_t );
d3d_transform_add_rotation_z( image_angle );
if ( global.game_room == 6 ) d3d_transform_add_scaling( 1, 1, -1 );
d3d_transform_add_translation( x, y, z );
if ( global.game_room != 6 ) d3d_transform_add_translation( 0, 0,  global.game_swell );
if ( global.game_room == 6 ) d3d_transform_add_translation( 0, 0, -global.game_swell );
vertex_submit( global.vbf_phone_headset, pr_trianglelist, sprite_get_texture( spr_tex_phone_headset, 0 ) );

d3d_transform_set_identity();

mouse_active_reset_colour();

shader_set_uniform_f( shader_get_uniform( shd_psx, "u_fVibrate" ), 0.0 );
shader_set_uniform_f( shader_get_uniform( shd_psx, "u_fGarbage" ), 0.0 );
*/
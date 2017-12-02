mouse_active_force_colour();

if ( audio_is_playing( phone_ring_sound_instance ) ) {
    var _track_position = audio_sound_get_track_position( phone_ring_sound_instance );
    if ( _track_position > 0.1 ) and ( _track_position < 1.05 ) shader_set_uniform_f( shader_get_uniform( shd_psx, "u_fVibrate" ), 1.0 );
    shader_set_uniform_f( shader_get_uniform( shd_psx, "u_fGarbage" ), random( 1 ) );
}

var _m = matrix_build( 0, 0, 0,   -90, 0, 0,   1, 1, 1 );
_m = matrix_multiply( _m, matrix_build( 0, 0, 0,   0, 0, image_angle,   1, 1, 1 ) );
if ( global.game_room == 6 ) _m = matrix_multiply( _m, matrix_build( 0, 0, 0,   0, 0, 0,   1, 1, -1 ) );
_m = matrix_multiply( _m, matrix_build( x, y, z,   0, 0, 0,   1, 1, 1 ) );
if ( global.game_room != 6 ) _m = matrix_multiply( _m, matrix_build( 0, 0,  global.game_swell,   0, 0, 0,   1, 1, 1 ) );
if ( global.game_room == 6 ) _m = matrix_multiply( _m, matrix_build( 0, 0, -global.game_swell,   0, 0, 0,   1, 1, 1 ) );
matrix_set_world( _m );
vertex_submit( global.vbf_phone_base, pr_trianglelist, sprite_get_texture( spr_tex_phone_base, 0 ) );
vertex_submit( global.vbf_phone_rotary , pr_trianglelist, sprite_get_texture( spr_tex_phone_rotary, 0 ) );

_m = matrix_build( 0, 0, 0,   -90, 0, 0,   1, 1, 1 );
_m = matrix_multiply( _m, matrix_build( 0, 0, 0,    0, 45*headset_t, 0,   1, 1, 1 ) );
_m = matrix_multiply( _m, matrix_build( 0, -5, 5,   0, 0, 0,   1, 1, 1 ) );
_m = matrix_multiply( _m, matrix_build( 0, 0, 0,    80*headset_t, 0, 0,   1, 1, 1 ) );
_m = matrix_multiply( _m, matrix_build( 0, 5, -5,   0, 0, 0,    1, 1, 1 ) );
_m = matrix_multiply( _m, matrix_build( 7*headset_t, -2*headset_t, 8*headset_t,   0, 0, 0,    1, 1, 1 ) );
_m = matrix_multiply( _m, matrix_build( 0, 0, 0,    0, 0, image_angle,   1, 1, 1 ) );

if ( global.game_room == 6 ) _m = matrix_multiply( _m, matrix_build( 0, 0, 0,   0, 0, 0,   1, 1, -1 ) );
_m = matrix_multiply( _m, matrix_build( x, y, z,   0, 0, 0,   1, 1, 1 ) );
if ( global.game_room != 6 ) _m = matrix_multiply( _m, matrix_build( 0, 0,  global.game_swell,   0, 0, 0,   1, 1, 1 ) );
if ( global.game_room == 6 ) _m = matrix_multiply( _m, matrix_build( 0, 0, -global.game_swell,   0, 0, 0,   1, 1, 1 ) );

matrix_set_world( _m );
vertex_submit( global.vbf_phone_headset, pr_trianglelist, sprite_get_texture( spr_tex_phone_headset, 0 ) );
matrix_reset_world();

mouse_active_reset_colour();

shader_set_uniform_f( shader_get_uniform( shd_psx, "u_fVibrate" ), 0.0 );
shader_set_uniform_f( shader_get_uniform( shd_psx, "u_fGarbage" ), 0.0 );
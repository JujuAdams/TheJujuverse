mouse_active_force_colour();

if ( intro_t < 1 ) {
    shader_set_uniform_f( shader_get_uniform( shd_psx, "u_fVibrate" ), lerp( 500, 1, intro_t ) );
    shader_set_uniform_f( shader_get_uniform( shd_psx, "u_fGarbage" ), random( 1 ) );
}

var _m = matrix_build( 0, 0, 0,   -90, 0, 0,   1, 1, 1 );
_m = matrix_multiply( _m, matrix_build( 0, 0, 0,     0, 0, image_angle,   1, 1, 1 ) );
_m = matrix_multiply( _m, matrix_build( x, y, z,     0, 0, 0,   1, 1, 1 ) );
_m = matrix_multiply( _m, matrix_build( 0, 0, global.game_swell,     0, 0, 0,   1, 1, 1 ) );
matrix_set_world( _m );
vertex_submit( global.vbf_door, pr_trianglelist, sprite_get_texture( spr_tex_door, 0 ) );
matrix_reset_world();

mouse_active_reset_colour();

if ( intro_t < 1 ) {
    shader_set_uniform_f( shader_get_uniform( shd_psx, "u_fVibrate" ), 0.0 );
    shader_set_uniform_f( shader_get_uniform( shd_psx, "u_fGarbage" ), 0.0 );
}
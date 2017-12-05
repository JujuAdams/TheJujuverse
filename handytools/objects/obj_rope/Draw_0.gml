mouse_active_force_colour();
camera_click_handle_fog();

if ( outro_t < 1 ) {
    shader_set_uniform_f( shader_get_uniform( shd_psx, "u_fVibrate" ), lerp( 0, 9, outro_t ) );
    shader_set_uniform_f( shader_get_uniform( shd_psx, "u_fGarbage" ), random( 1 ) );
}

matrix_chain_begin();
matrix_chain_rotate_x( -90 );
matrix_chain_rotate_z( image_angle );
matrix_chain_translate( x, y, z );
matrix_chain_end( matrix_world );
if ( cut ) {
    vertex_submit( global.vbf_rope_cut, pr_trianglelist, sprite_get_texture( spr_tex_rope, 0 ) );
} else {
    vertex_submit( global.vbf_rope, pr_trianglelist, sprite_get_texture( spr_tex_rope, 0 ) );
}
matrix_reset_world();

mouse_active_reset_colour();

if ( outro_t < 1 ) {
    shader_set_uniform_f( shader_get_uniform( shd_psx, "u_fVibrate" ), 0.0 );
    shader_set_uniform_f( shader_get_uniform( shd_psx, "u_fGarbage" ), 0.0 );
}
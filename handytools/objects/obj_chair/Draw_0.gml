mouse_active_force_colour();
camera_click_handle_fog();

if ( outro_t < 1 ) {
    shader_set_uniform_f( shader_get_uniform( shd_psx, "u_fVibrate" ), lerp( 0, 9, outro_t ) );
    shader_set_uniform_f( shader_get_uniform( shd_psx, "u_fGarbage" ), random( 1 ) );
}

matrix_chain_begin();
matrix_chain_rotate_x( -90 );
matrix_chain_rotate_z( image_angle );
if ( global.game_room == 6 ) matrix_chain_scale( 1, 1, -1 );
matrix_chain_translate( x, y, z );
if ( global.game_room != 6 ) matrix_chain_translate( 0, 0,  global.game_swell );
if ( global.game_room == 6 ) matrix_chain_translate( 0, 0, -global.game_swell );
matrix_chain_end( matrix_world );
vertex_submit( global.vbf_chair, pr_trianglelist, sprite_get_texture( spr_tex_chair, 0 ) );
matrix_reset_world();

mouse_active_reset_colour();

if ( outro_t < 1 ) {
    shader_set_uniform_f( shader_get_uniform( shd_psx, "u_fVibrate" ), 0.0 );
    shader_set_uniform_f( shader_get_uniform( shd_psx, "u_fGarbage" ), 0.0 );
}
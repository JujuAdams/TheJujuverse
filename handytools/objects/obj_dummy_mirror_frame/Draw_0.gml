mouse_active_force_colour();

matrix_chain_begin();
matrix_chain_rotate_x( -90 );
matrix_chain_rotate_z( image_angle );
matrix_chain_translate( x + swell_x, y + swell_y, z );
matrix_chain_end( matrix_world );
vertex_submit( global.vbf_mirror_frame, pr_trianglelist, sprite_get_texture( spr_tex_mirror_frame, 0 ) );
matrix_reset_world();

mouse_active_reset_colour();
/*
if ( !global.click_render ) {
    shader_reset();
    d3d_transform_set_rotation_z( image_angle );
    d3d_transform_add_translation( x + swell_x, y + swell_y, z );
    d3d_primitive_begin_texture( pr_trianglestrip, surface_get_texture( srf_mirror ) );
    d3d_vertex_texture_colour( 0, -42, 62,   1, 0,   c_white, 1 );
    d3d_vertex_texture_colour( 0, -42,  3,   1, 1,   c_white, 1 );
    d3d_vertex_texture_colour( 0,  46, 62,   0, 0,   c_white, 1 );
    d3d_vertex_texture_colour( 0,  46,  3,   0, 1,   c_white, 1 );
    d3d_primitive_end();
    d3d_transform_set_identity();
    shader_set( shd_psx );
}
*/
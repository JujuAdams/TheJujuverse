mouse_active_force_colour();

matrix_chain_begin();
matrix_chain_rotate_x( -90 );
matrix_chain_rotate_z( image_angle );
matrix_chain_translate( x + swell_x, y + swell_y, z );
matrix_chain_end( matrix_world );
vertex_submit( global.vbf_mirror_frame, pr_trianglelist, sprite_get_texture( spr_tex_mirror_frame, 0 ) );
matrix_reset_world();

mouse_active_reset_colour();

if ( !global.click_render ) {
	
    shader_reset();
	
	matrix_chain_begin();
	matrix_chain_rotate_z( image_angle );
	matrix_chain_translate( x + swell_x, y + swell_y, z );
	matrix_chain_end( matrix_world );
	
	var _model = tr_vertex_create_buffer();
	vertex_begin( _model, global.vft_simple );
	vertex_position_3d( _model, 0, -42, 62 ); vertex_texcoord( _model, 1, 0 ); vertex_colour( _model, c_white, 1 ); vertex_normal( _model, 1, 0, 0 );
	vertex_position_3d( _model, 0, -42,  3 ); vertex_texcoord( _model, 1, 1 ); vertex_colour( _model, c_white, 1 ); vertex_normal( _model, 1, 0, 0 );
	vertex_position_3d( _model, 0,  46, 62 ); vertex_texcoord( _model, 0, 0 ); vertex_colour( _model, c_white, 1 ); vertex_normal( _model, 1, 0, 0 );
	vertex_position_3d( _model, 0,  46,  3 ); vertex_texcoord( _model, 0, 1 ); vertex_colour( _model, c_white, 1 ); vertex_normal( _model, 1, 0, 0 );
	vertex_end( _model );
	vertex_submit( _model, pr_trianglestrip, surface_get_texture( srf_mirror ) );
	vertex_delete_buffer( _model );
	
    matrix_reset_world();
    shader_set( shd_psx );
	
} else if ( !global.mirror_render ) {
	
    gpu_set_fog( false, c_white, 0, 0 );
	
	matrix_chain_begin();
	matrix_chain_rotate_z( image_angle );
	matrix_chain_translate( x + swell_x, y + swell_y, z );
	matrix_chain_end( matrix_world );
	
	var _model = tr_vertex_create_buffer();
	vertex_begin( _model, global.vft_simple );
	vertex_position_3d( _model, 0, -42, 62 ); vertex_texcoord( _model, 1, 0 ); vertex_colour( _model, c_white, 1 ); vertex_normal( _model, 1, 0, 0 );
	vertex_position_3d( _model, 0, -42,  3 ); vertex_texcoord( _model, 1, 1 ); vertex_colour( _model, c_white, 1 ); vertex_normal( _model, 1, 0, 0 );
	vertex_position_3d( _model, 0,  46, 62 ); vertex_texcoord( _model, 0, 0 ); vertex_colour( _model, c_white, 1 ); vertex_normal( _model, 1, 0, 0 );
	vertex_position_3d( _model, 0,  46,  3 ); vertex_texcoord( _model, 0, 1 ); vertex_colour( _model, c_white, 1 ); vertex_normal( _model, 1, 0, 0 );
	vertex_end( _model );
	vertex_submit( _model, pr_trianglestrip, surface_get_texture( srf_mirror_click ) );
	vertex_delete_buffer( _model );
	
    matrix_reset_world();
	
}
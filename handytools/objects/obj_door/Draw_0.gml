if ( global.screen_click_render && global.screen_mirror_render ) exit; //Don't render the door on a mirror click surface

mouse_active_force_colour();
camera_click_handle_fog();

if ( intro_t < 1 ) {
	s_shader_uniform_f( "u_fVibrate", lerp( 500, 1, intro_t ) );
	s_shader_uniform_f( "u_fGarbage", random(1) );
}

matrix_chain_begin();
matrix_chain_rotate_x( -90 );
matrix_chain_rotate_z( image_angle );
matrix_chain_translate( x, y, z+global.game_swell );
matrix_chain_end( matrix_world );
vertex_submit( obj_from_name( "door" ), pr_trianglelist, sprite_get_texture( spr_tex_door, 0 ) );
matrix_reset_world();

mouse_active_reset_colour();

if ( intro_t < 1 ) {
	s_shader_uniform_f( "u_fVibrate", 0 );
	s_shader_uniform_f( "u_fGarbage", 0 );
}
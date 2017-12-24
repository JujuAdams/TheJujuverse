if !( editor_is_open() && global.show_spawners ) exit;
	
camera_click_handle_fog();

s_shader_colour( "u_vForceColour", colour, 1 );

var _m = matrix_build( 0, 0, 0,   0, 0, 0,   5, 5, 5 );
_m = matrix_multiply( _m, matrix_build( x, y, z,   0, 0, 0,   1, 1, 1 ) );
matrix_set_world( _m );
vertex_submit( obj_model( "cube" ), pr_trianglelist, sprite_get_texture( spr_white_pixel, 0 ) );
matrix_reset_world();

s_shader_colour( "u_vForceColour", c_white, 0 );
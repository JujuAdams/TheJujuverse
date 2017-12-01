if ( !global.game_editing ) exit;

shader_set_uniform_f( shader_get_uniform( shd_psx, "u_vForceColour" ), colour_get_red( colour )/255,
                                                                       colour_get_green( colour )/255,
                                                                       colour_get_blue( colour )/255,
                                                                       1.0 );
																	   
matrix_stack_set_build(  0, 0, 0,   0, 0, 0,   5, 5, 5 );
matrix_stack_push_build( x, y, z,   0, 0, 0,   1, 1, 1 );
matrix_stack_apply_to_world();
vertex_submit( global.vbf_cube, pr_trianglelist, sprite_get_texture( spr_white_pixel, 0 ) );
matrix_reset_world();

shader_set_uniform_f( shader_get_uniform( shd_psx, "u_vForceColour" ), 1.0, 1.0, 1.0, 0.0 );
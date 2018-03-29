if ( !global.do_walls ) exit;

mouse_active_force_colour();
screen_click_handle_fog( global.mirror_render? 128 : 0 );

matrix_chain_begin();
matrix_chain_rotate_z( image_angle );
matrix_chain_translate( x1 + swell_x, y1 + swell_y, z );
matrix_chain_end( matrix_world );
vertex_submit( vbf_wall, pr_trianglelist, texture );

mouse_active_reset_colour();
mouse_active_force_colour();
camera_click_handle_fog();

matrix_chain_begin();
matrix_chain_rotate_x( -90 );
matrix_chain_rotate_z( image_angle );
matrix_chain_translate( x, y, z );
matrix_chain_end( matrix_world );
vertex_submit( global.vbf_rope_pole, pr_trianglelist, sprite_get_texture( spr_tex_rope_pole, 0 ) );
matrix_reset_world();

mouse_active_reset_colour();
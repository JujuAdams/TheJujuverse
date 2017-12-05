mouse_active_force_colour();
camera_click_handle_fog();

matrix_chain_begin();
matrix_chain_rotate_x( -90 );
matrix_chain_rotate_z( image_angle );
matrix_chain_translate( x, y, z );
if ( global.game_room != 6 ) matrix_chain_translate( 0, 0, global.game_swell );
matrix_chain_end( matrix_world );
vertex_submit( global.vbf_vase1, pr_trianglelist, sprite_get_texture( spr_tex_vase1, 0 ) );
matrix_reset_world();

mouse_active_reset_colour();
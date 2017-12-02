mouse_active_force_colour();

matrix_chain_begin();
matrix_chain_rotate_x( -90 );
matrix_chain_translate( x, y, z );
if ( global.game_room != 6 ) matrix_chain_translate( 0, 0, global.game_swell );
matrix_chain_end( matrix_world );
vertex_submit( global.vbf_pedestal, pr_trianglelist, sprite_get_texture( spr_tex_pedestal, 0 ) );
matrix_reset_world();

mouse_active_reset_colour();
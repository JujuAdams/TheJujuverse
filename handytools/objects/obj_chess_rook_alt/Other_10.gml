matrix_chain_begin();
matrix_chain_rotate_x( -90 );
matrix_chain_rotate_z( image_angle );
matrix_chain_translate( x, y, z );
matrix_chain_end( matrix_world );
vertex_submit( global.vbf_chess_rook, pr_trianglelist, sprite_get_texture( spr_tex_chess_green, 0 ) );
matrix_reset_world();
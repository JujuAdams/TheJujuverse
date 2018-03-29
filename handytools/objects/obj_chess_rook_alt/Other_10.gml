matrix_chain_begin();
matrix_chain_rotate_x( -90 );
matrix_chain_rotate_z( image_angle );
matrix_chain_translate( x, y, z );
matrix_chain_end( matrix_world );
dotobj_submit( "chess_rook_alt" );
matrix_chain_begin();
matrix_chain_scale( 1, 1, 1 );
matrix_chain_translate( x, y, z );
matrix_chain_end( matrix_world );
vertex_submit_sprite( global.vbf_sphere );
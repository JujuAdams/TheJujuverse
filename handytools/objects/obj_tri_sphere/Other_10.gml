matrix_chain_begin();
matrix_chain_scale( scale, scale, scale );
matrix_chain_translate( x, y, z );
matrix_chain_end( matrix_world );
vertex_submit_sprite( global.vbf_sphere );
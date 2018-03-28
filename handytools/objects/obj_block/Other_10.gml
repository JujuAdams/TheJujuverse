matrix_chain_begin();
matrix_chain_scale( 32, 32, 200 );
matrix_chain_translate( x, y, z );
matrix_chain_end( matrix_world );
vertex_submit( dotobj_model( "cube" ), pr_trianglelist, sprite_get_texture( spr_tex_white, 0 ) );
matrix_reset_world();
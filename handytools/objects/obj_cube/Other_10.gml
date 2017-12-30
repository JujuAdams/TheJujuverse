/*if ( current_time mod 1000 < 500 ) {*/
    matrix_chain_begin();
    matrix_chain_scale( 32, 32, 32 );
    matrix_chain_translate( x, y, z );
    matrix_chain_end( matrix_world );
    vertex_submit( obj_model( "cube" ), pr_trianglelist, sprite_get_texture( spr_tex_white, 0 ) );/*
} else {
    matrix_chain_begin();
    matrix_chain_scale( 32, 32, 32 );
    matrix_chain_translate( x, y, z );
    matrix_chain_end( matrix_world );
    vertex_submit( collision_model, pr_trianglelist, sprite_get_texture( spr_tex_white, 0 ) );
}*/

matrix_reset_world();
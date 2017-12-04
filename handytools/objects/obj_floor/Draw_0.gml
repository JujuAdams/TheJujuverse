matrix_set_world( matrix_build( x, y, global.game_swell,   0, 0, 0,   1, 1, 1 ) );
vertex_submit( vbf_floor, pr_trianglelist, texture );
matrix_reset_world();
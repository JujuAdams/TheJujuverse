camera_click_handle_fog();

matrix_set_world( matrix_build( 0, 0, -global.game_swell,   0, 0, 0,   1, 1, 1 ) );
vertex_submit( vbf_ceiling, pr_trianglelist, sprite_get_texture( spr_tex_white, 0 ) );
matrix_reset_world();
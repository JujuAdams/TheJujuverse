if ( grip_current() == ID_STR ) exit;

screen_click_handle_fog( global.mirror_render? 128 : 0 );

s_shader_rgba( "u_vForceColour", colour, 1 );

matrix_set_world( matrix );
vertex_submit( global.vbf_cone, pr_trianglelist, sprite_get_texture( spr_tex_white, 0 ) );
matrix_reset_world();

s_shader_rgba( "u_vForceColour", c_white, 0 );
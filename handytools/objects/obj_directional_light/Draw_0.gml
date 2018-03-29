if !( editor_is_open() && global.show_spawners ) exit;
if ( grip_current() == UNIQUE_NAME ) exit;

screen_click_handle_fog( global.mirror_render? 128 : 0 );

s_shader_rgba( "u_vForceColour", colour, 1 );

matrix_set_world( matrix );
vertex_submit_sprite( global.vbf_cone );

s_shader_rgba( "u_vForceColour", c_white, 0 );
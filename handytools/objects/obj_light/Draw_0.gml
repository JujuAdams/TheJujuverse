/*
screen_click_handle_fog( global.mirror_render? 128 : 0 );

s_shader_rgba( "u_vForceColour", colour, 1 );

matrix_chain_begin();
matrix_chain_scale( 2+range/100, 2+range/100, 2+range/100 );
matrix_chain_translate( x, y, z );
matrix_chain_end( matrix_world );
vertex_submit_sprite( global.vbf_sphere );

s_shader_rgba( "u_vForceColour", c_white, 0 );
*/
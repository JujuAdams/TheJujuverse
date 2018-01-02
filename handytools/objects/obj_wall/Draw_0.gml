if ( !global.do_walls ) exit;

mouse_active_force_colour();
screen_click_handle_fog( global.mirror_render? 128 : 0 );

//matrix_stack_set_build(  0, 0, 0,    0, 0, image_angle,   1, 1, 1 );
//matrix_stack_push_build( x1 + swell_x, y1 + swell_y, z,   0, 0, 0,    1, 1, 1 );
//matrix_stack_apply_to_world();
var _m = matrix_build( 0, 0, 0,    0, 0, image_angle,   1, 1, 1 );
_m = matrix_multiply( _m, matrix_build( x1 + swell_x, y1 + swell_y, z,   0, 0, 0,    1, 1, 1 ) );
matrix_set_world( _m );
vertex_submit( vbf_wall, pr_trianglelist, texture );
matrix_reset_world();

mouse_active_reset_colour();
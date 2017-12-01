mouse_active_force_colour();

if ( obj_screen.do_3d ) {
	//matrix_stack_set_build(  0, 0, 0,    0, 0, image_angle,   1, 1, 1 );
	//matrix_stack_push_build( x1 + swell_x, y1 + swell_y, z,   0, 0, 0,    1, 1, 1 );
    //matrix_stack_apply_to_world();
    var _m = matrix_build( 0, 0, 0,    0, 0, image_angle,   1, 1, 1 );
	matrix_multiply( _m, matrix_build( x1 + swell_x, y1 + swell_y, z,   0, 0, 0,    1, 1, 1 ) );
	matrix_set_world( _m );
	vertex_submit( vbf_wall, pr_trianglelist, texture );
    matrix_reset_world();
} else {
    draw_self();
}

mouse_active_reset_colour();
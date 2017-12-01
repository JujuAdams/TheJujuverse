if ( global.game_got_hammer ) {
	var _pz = look_pz_angle;
	var _xy = look_xy_angle;
	
	matrix_stack_set_build(   0,  0,  0,  -85,   0,   0,    1,  1,  1 );
	matrix_stack_push_build(  0,  0,  0,    0,   0, -15,    1,  1,  1 );
	matrix_stack_push_build(  0,  0,  0,    0,   0,   0,   .7, .7, .7 );
	matrix_stack_push_build(  9, -8, -7,    0,   0,   0,    1,  1,  1 );
	matrix_stack_push_build(  0,  0,  0,    0, _pz,   0,    1,  1,  1 );
	matrix_stack_push_build(  0,  0,  0,    0, _xy,   0,    1,  1,  1 );
	matrix_stack_push_build(  x,  y,  z,    0,   0,   0,    1,  1,  1 );
    matrix_stack_apply_to_world();
    vertex_submit( global.vbf_hammer, pr_trianglelist, sprite_get_texture( spr_tex_hammer, 0 ) );
	matrix_reset_world();
}

if ( global.game_got_scissors ) {
	var _pz = look_pz_angle;
	var _xy = look_xy_angle;
	
	matrix_stack_set_build(    0,  0,  0,  -160,   0,   0,    1,  1,  1 );
	matrix_stack_push_build(   0,  0,  0,     0,   0, -20,    1,  1,  1 );
	matrix_stack_push_build(   0,  0,  0,     0,   0,   0,   .7, .7, .7 );
	matrix_stack_push_build(  10, -8, -5,     0,   0,   0,    1,  1,  1 );
	matrix_stack_push_build(   0,  0,  0,     0, _pz,   0,    1,  1,  1 );
	matrix_stack_push_build(   0,  0,  0,     0, _xy,   0,    1,  1,  1 );
	matrix_stack_push_build(   x,  y,  z,     0,   0,   0,    1,  1,  1 );
    vertex_submit( global.vbf_scissors, pr_trianglelist, sprite_get_texture( spr_tex_red, 0 ) );
	matrix_reset_world();
}
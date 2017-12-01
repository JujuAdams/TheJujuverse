if ( global.game_editing ) {
        
    mouse_active_force_colour();
    
	matrix_stack_set_build(  0, 0, 0,   -90, 0, 0,   1, 1, 1 );
	matrix_stack_push_build( 0, 0, 0,     0, 0, 0,  .6, 1, 1 );
	matrix_stack_push_build( 0, 0, 0,     0, 0, image_angle+270,   1, 1, 1 );
	matrix_stack_push_build( x, y, z,     0, 0, 0,   1, 1, 1 );
	matrix_stack_apply_to_world();
    vertex_submit( global.vbf_prism, pr_trianglelist, sprite_get_texture( spr_tex_white, 0 ) );
    matrix_reset_world();
	
    mouse_active_reset_colour();
    
}
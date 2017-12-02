if ( global.game_editing ) {
    
    if ( ( current_time mod 500 ) < 450 ) {
        
        mouse_active_force_colour();
        /*
		matrix_stack_set_build(  0, 0, 0,   -90, 0, 0,   1, 1, 1 );
		matrix_stack_push_build( 0, 0, 0,     0, 0, image_angle,   1, 1, 1 );
		matrix_stack_push_build( x, y, z,     0, 0, 0,   1, 1, 1 );
        matrix_stack_apply_to_world();
        vertex_submit( global.vbf_door, pr_trianglelist, sprite_get_texture( spr_tex_door, 0 ) );
        matrix_reset_world();
		*/
		matrix_chain_begin();
		matrix_chain_rotate_x( -90 );
		matrix_chain_rotate_z( image_angle );
		matrix_chain_translate( x, y, z );
		matrix_chain_end( matrix_world );
        vertex_submit( global.vbf_door, pr_trianglelist, sprite_get_texture( spr_tex_door, 0 ) );
        matrix_reset_world();
		
        mouse_active_reset_colour();
        
    }
    
}
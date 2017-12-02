if ( global.game_editing ) {
    
    if ( ( current_time mod 500 ) < 450 ) {
        
        mouse_active_force_colour();
        
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
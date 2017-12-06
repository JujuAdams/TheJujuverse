if ( keyboard_check( ord( "0" ) ) and ( DEVELOPMENT ) ) {
    
    if ( surface_exists( srf_click ) ) draw_surface_ext( srf_click, 0, 0, APP_TO_WINDOW_SCALE, APP_TO_WINDOW_SCALE, 0, c_white, 1 );
    
} else {
    
    if ( global.do_dither ) {
        
        gpu_set_blendenable( false );
        shader_set( shd_dither );
        texture_set_stage( shader_get_sampler_index( shd_dither, "u_sDither" ), global.dither_texture );
        shader_set_uniform_f( shader_get_uniform( shd_dither, "u_vTextureSize" ), 320, 240 );
        if ( !DEVELOPMENT ) or !instance_exists( obj_debug ) or ( global.debug_tool != e_tool.delete ) {
            draw_surface_ext( srf_pov, 0, 0, APP_TO_WINDOW_SCALE, APP_TO_WINDOW_SCALE, 0, c_white, 1 );
        } else {
            draw_surface_ext( srf_pov, 0, 0, APP_TO_WINDOW_SCALE, APP_TO_WINDOW_SCALE, 0, c_red, 1 );
        }
        shader_reset();
        gpu_set_blendenable( true );
        
    } else {
        
        gpu_set_blendenable( false );
        draw_surface_ext( srf_pov, 0, 0, APP_TO_WINDOW_SCALE, APP_TO_WINDOW_SCALE, 0, c_white, 1 );
        gpu_set_blendenable( true );
    
    }
    
}

smoothed_timer = lerp( smoothed_timer, get_timer() - frame_start_time, 0.008 );
if ( FPS_ON ) frame_start_time = get_timer();

s_shader_end();
draw_set_colour( c_white );
draw_set_alpha( 1 );

if ( SCREEN_3D ) {
    
    //Assign all instances a "click index" for click detection rendering
    global.click_array[ instance_count-1 ] = noone;
    global.click_array[ 0                ] = noone;
    global.click_array = undefined;
    global.click_index = 1;
    with( all ) {
        my_click_index = global.click_index++;
        global.click_array[ my_click_index ] = id;
    }
	
    //Set up uniforms in our shader
    if ( SCREEN_ALLOW_DEFERRED && global.screen_do_deferred ) {
		s_shader_begin( SCREEN_3D_MRT_SHADER );
        s_shader_float( "u_fZFar", DEFAULT_Z_FAR );
        s_shader_rgba( "u_vForceColour", c_white, 0 );
        s_shader_end();
    } else {
		s_shader_begin( SCREEN_3D_FORWARD_SHADER );
        s_shader_float( "u_fZFar", DEFAULT_Z_FAR );
        screen_set_shader_ambient_light();
        screen_set_shader_lights_nearest( grip_get_xfrom( "3d" ), grip_get_yfrom( "3d" ), grip_get_zfrom( "3d" ), light_priority );
        s_shader_rgba( "u_vForceColour", c_white, 0 );
    }
    s_shader_end();
    
} else {
    
    //2D stuff idk
    
}

//Render out manual grips
grip_handle_predraw();
if ( FPS_ON ) frame_start_time = get_timer();

s_shader_end();
draw_set_colour( c_white );
draw_set_alpha( 1 );

if ( SCREEN_3D ) {
    
    //Assign all instances a "click index" for click detection rendering
    global.click_array = undefined;
    global.click_array[ instance_count-1 ] = noone;
    global.click_array[ 0                ] = noone;
    global.click_index = 1;
    with( all ) {
        my_click_index = global.click_index++;
        global.click_array[ my_click_index ] = id;
    }
    
    
    //Set up uniforms for the lighting shader
    ds_priority_clear( light_priority );
    var _light = 0;
    
    s_shader_begin( SCREEN_3D_SHADER );
    if ( ALLOW_LIGHTING && global.screen_do_lighting ) {
        
        s_shader_rgba( "u_vAmbientColour", C_AMBIENT, 0 );
        with( obj_camera ) s_shader_set_light( _light++, x, y, z, 100, c_gray, 1 );
        
        var _cam_x = grip_get_xfrom( "3d" );
        var _cam_y = grip_get_yfrom( "3d" );
        var _cam_z = grip_get_zfrom( "3d" );
    
        var _pri = light_priority;
        with( obj_light ) {
            if ( visible ) {
                var _dx = _cam_x - x;
                var _dy = _cam_y - y;
                var _dz = _cam_z - z;
                var _dist = _dx*_dx + _dy*_dy + _dz*_dz;
                ds_priority_add( _pri, id, _dist );
            }
        }
        
    } else {
        s_shader_rgba( "u_vAmbientColour", c_white, 1 );
    }
    
    for(; _light < SCREEN_MAX_LIGHTS; _light++ ) {
        if ( ds_priority_empty( light_priority ) ) {
            s_shader_set_light( _light, 0, 0, 0, 1, c_black, 0 );
        } else {
            with( ds_priority_delete_min( light_priority ) ) s_shader_set_light( _light, x, y, z, range, colour, 1 );
        }
    }
    
    s_shader_rgba( "u_vForceColour", c_white, 0 );
    s_shader_end();
    
} else {
    
    //2D stuff idk
    
}

//Render out manual grips
grip_handle_predraw();
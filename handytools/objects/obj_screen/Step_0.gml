if ( SCREEN_ALLOW_DEFERRED && global.screen_do_deferred ) {
	grip_set_shader( global.screen_main_camera, SCREEN_3D_MRT_SHADER );
} else {
	grip_set_shader( global.screen_main_camera, SCREEN_3D_FORWARD_SHADER );
}

if ( SCREEN_3D ) {
        
    var _sample_x = 0.5;
    var _sample_y = 0.5;
    _sample_x = window_mouse_get_x() / window_get_width();
    _sample_y = window_mouse_get_y() / window_get_height();
    _sample_x *= global.app_surf_w;
    _sample_y *= global.app_surf_h;
    
    if ( SCREEN_ALLOW_DEFERRED && global.screen_do_deferred ) { //Deferred render "what's under my mouse" code
	    
        var _surface        = grip_get_surface(        "3d" );
        var _depth_surface  = grip_get_depth_surface(  "3d" );
        var _normal_surface = grip_get_normal_surface( "3d" );
        
        //Find the instance underneath the centre of the view
        if ( surface_exists( _surface ) && surface_exists( _normal_surface ) ) {
            var _lsf = ( surface_getpixel_ext( _surface       , _sample_x, _sample_y ) >> 24 ) & 255;
            var _msf = ( surface_getpixel_ext( _normal_surface, _sample_x, _sample_y ) >> 24 ) & 255;
            global.click_colour = make_colour_rgb( _lsf, _msf, 0 );
            var _index = _lsf + _msf*256;
            global.click_instance_over = (( _index > 0 ) && ( _index < array_length_1d( global.click_array ) ) )? global.click_array[_index] : noone;
        }
		
        //Find the depth underneath the centre of the view
        if ( surface_exists( _depth_surface ) ) {
            var _colour = surface_getpixel( _depth_surface, _sample_x, _sample_y );
            var _blue  = ( _colour >> 16 ) & 255;
            var _green = ( _colour >>  8 ) & 255;
            var _red   =   _colour         & 255;
            global.click_depth    = clamp( _red/255 + _green/255/255 + _blue/255/255/255, 0.0, 1.0 );
            global.click_distance = DEFAULT_Z_NEAR + (DEFAULT_Z_FAR - DEFAULT_Z_NEAR)*global.click_depth;
        } else {
            global.click_depth    = 0;
            global.click_distance = 0;
        }
        global.click_depth_smoothed = lerp( global.click_depth_smoothed, global.click_depth, SCREEN_DOF_SMOOTH_RATE );
        
    } else { //Forward render "what's under my mouse" code
	    
        //Find the instance underneath the centre of the view
        var _surface = grip_get_surface( "click" );
        if ( surface_exists( _surface ) ) {
            global.click_colour = surface_getpixel( _surface, _sample_x, _sample_y );
            //var _blue  = ( global.click_colour >> 16 ) & 255; //We don't need this channel for default behaviour
            var _green = ( global.click_colour >>  8 ) & 255;
            var _red   =   global.click_colour         & 255;
            var _index = _red + _green*256;
            global.click_instance_over = (( _index > 0 ) && ( _index < array_length_1d( global.click_array ) ) )? global.click_array[_index] : noone;
        }
        
        global.click_depth    = 0;
        global.click_distance = 0;
        global.click_depth_smoothed = lerp( global.click_depth_smoothed, global.click_depth, SCREEN_DOF_SMOOTH_RATE );
        
    }
	
}


//Call custom script
if ( script_exists( SCREEN_STEP_SCRIPT ) ) script_execute( SCREEN_STEP_SCRIPT );
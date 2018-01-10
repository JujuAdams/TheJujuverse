if ( SCREEN_3D && GRIP_ON ) {
    
    //Find the instance underneath the centre of the view
    var _surface = grip_get_surface( "click" );
    if ( surface_exists( _surface ) ) {
        global.click_colour = surface_getpixel( _surface, global.app_surf_w*0.5, global.app_surf_h*0.5 );
        //var _blue  = ( global.click_colour>> 16 ) & 255; //We don't need this channel for default behaviour
        var _green = ( global.click_colour>>  8 ) & 255;
        var _red   =   global.click_colour        & 255;
        var _index = _red + _green*256;
        global.click_instance_over = global.click_array[_index];
    }
    
    if ( ALLOW_MRT ) {
        
        //Find the depth underneath the centre of the view
        var _surface = grip_get_depth_surface( "3d" );
        if ( surface_exists( _surface ) ) {
            var _colour = surface_getpixel( _surface, global.app_surf_w*0.5, global.app_surf_h*0.5 );
            var _blue  = ( _colour>> 16 ) & 255;
            var _green = ( _colour>>  8 ) & 255;
            var _red   =   _colour        & 255;
            global.click_depth    = clamp( _red/255 + _green/255/255 + _blue/255/255/255, 0.0, 1.0 );
            global.click_distance = DEFAULT_Z_NEAR + (DEFAULT_Z_FAR - DEFAULT_Z_NEAR)*global.click_depth;
        } else {
            global.click_depth    = 0;
            global.click_distance = 0;
        }
        global.click_depth_smoothed = lerp( global.click_depth_smoothed, global.click_depth, SCREEN_DOF_SMOOTH_RATE );
        
    }
    
}


//Call custom script
if ( script_exists( SCREEN_STEP_SCRIPT ) ) script_execute( SCREEN_STEP_SCRIPT );
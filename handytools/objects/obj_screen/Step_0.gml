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
    
}

//Call custom script
if ( script_exists( SCREEN_STEP_SCRIPT ) ) script_execute( SCREEN_STEP_SCRIPT );
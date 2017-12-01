///Step

if ( surface_exists( srf_click ) ) {
    
    if ( do_3d ) {
        var _pixel = surface_getpixel( srf_click, APP_SURF_W*0.5, APP_SURF_H*0.5 );
    } else {
        var _pixel = surface_getpixel( srf_click, 320*window_mouse_get_x()/window_get_width(),
                                                  240*window_mouse_get_y()/window_get_height() );
    }
    
    var _blue  = ( _pixel >> 16 ) & 255;
    var _green = ( _pixel >>  8 ) & 255;
    var _red   =   _pixel         & 255;
    var _index = _red + _green*256;
    click_instance_over = click_array[_index];
    click_through_mirror = ( _blue > 0 );
    
}
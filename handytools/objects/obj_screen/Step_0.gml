///Step

if ( surface_exists( srf_click ) ) {
    
    var _pixel = surface_getpixel( srf_click, APP_SURF_W*0.5, APP_SURF_H*0.5 );
    var _blue  = ( _pixel >> 16 ) & 255;
    var _green = ( _pixel >>  8 ) & 255;
    var _red   =   _pixel         & 255;
    var _index = _red + _green*256;
    click_instance_over = click_array[_index];
    click_through_mirror = ( _blue > 0 );
    
}
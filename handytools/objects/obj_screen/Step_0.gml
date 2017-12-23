//Find the instance underneath the centre of the view
var _surface = grip_get_surface( "click" );
if ( surface_exists( _surface ) ) {
    var _pixel = surface_getpixel( _surface, global.app_surf_w*0.5, global.app_surf_h*0.5 );
    var _blue  = ( _pixel >> 16 ) & 255;
    var _green = ( _pixel >>  8 ) & 255;
    var _red   =   _pixel         & 255;
    var _index = _red + _green*256;
    global.click_instance_over = global.click_array[_index];
    global.click_through_mirror = ( _blue > 0 );
}
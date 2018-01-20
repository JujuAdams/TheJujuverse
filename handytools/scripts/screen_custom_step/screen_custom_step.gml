//Check if we're clicking through a mirror

if ( SCREEN_ALLOW_DEFERRED && global.screen_do_deferred ) {
    global.click_through_mirror = false;
} else {
    var _blue = ( global.click_colour>> 16 ) & 255;
    global.click_through_mirror = ( _blue > 0 );
}
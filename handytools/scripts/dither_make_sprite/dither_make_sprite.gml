///dither_make_sprite()

var _dither = [ 0, 32,  8, 40,  2, 34, 10, 42, 
               48, 16, 56, 24, 50, 18, 58, 26, 
               12, 44,  4, 36, 14, 46,  6, 38, 
               60, 28, 52, 20, 62, 30, 54, 22, 
                3, 35, 11, 43,  1, 33,  9, 41, 
               51, 19, 59, 27, 49, 17, 57, 25, 
               15, 47,  7, 39, 13, 45,  5, 37, 
               63, 31, 55, 23, 61, 29, 53, 21 ];

var _surface = tr_surface_create( 8, 8 );
surface_set_target( _surface );
draw_clear( c_black );
for( var _i = 0; _i < 64; _i++ ) {
    var _x = _i mod 8;
    var _y = _i div 8;
    draw_point_colour( _x, _y, make_colour_hsv( 0, 0, _dither[_i] ) );
}
surface_reset_target();

var _spr = sprite_create_from_surface( _surface,   0, 0, 8, 8,   false, false, 0, 0 );
tr_surface_free( _surface );

return _spr;
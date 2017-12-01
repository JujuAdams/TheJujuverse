///dither_make_sprite()
/*
var _dither;
_dither[ 0] =  0;
_dither[ 1] = 32;
_dither[ 2] =  8;
_dither[ 3] = 40;
_dither[ 4] =  2;
_dither[ 5] = 34;
_dither[ 6] = 10;
_dither[ 7] = 42;
_dither[ 8] = 48;
_dither[ 9] = 16;
_dither[10] = 56;
_dither[11] = 24;
_dither[12] = 50;
_dither[13] = 18;
_dither[14] = 58;
_dither[15] = 26;
_dither[16] = 12;
_dither[17] = 44;
_dither[18] =  4;
_dither[19] = 36;
_dither[20] = 14;
_dither[21] = 46;
_dither[22] =  6;
_dither[23] = 38;
_dither[24] = 60;
_dither[25] = 28;
_dither[26] = 52;
_dither[27] = 20;
_dither[28] = 62;
_dither[29] = 30;
_dither[30] = 54;
_dither[31] = 22;
_dither[32] =  3;
_dither[33] = 35;
_dither[34] = 11;
_dither[35] = 43;
_dither[36] =  1;
_dither[37] = 33;
_dither[38] =  9;
_dither[39] = 41;
_dither[40] = 51;
_dither[41] = 19;
_dither[42] = 59;
_dither[43] = 27;
_dither[44] = 49;
_dither[45] = 17;
_dither[46] = 57;
_dither[47] = 25;
_dither[48] = 15;
_dither[49] = 47;
_dither[50] =  7;
_dither[51] = 39;
_dither[52] = 13;
_dither[53] = 45;
_dither[54] =  5;
_dither[55] = 37;
_dither[56] = 63;
_dither[57] = 31;
_dither[58] = 55;
_dither[59] = 23;
_dither[60] = 61;
_dither[61] = 29;
_dither[62] = 53;
_dither[63] = 21;
*/
var _dither = [ 0, 32,  8, 40,  2, 34, 10, 42, 
               48, 16, 56, 24, 50, 18, 58, 26, 
               12, 44,  4, 36, 14, 46,  6, 38, 
               60, 28, 52, 20, 62, 30, 54, 22, 
                3, 35, 11, 43,  1, 33,  9, 41, 
               51, 19, 59, 27, 49, 17, 57, 25, 
               15, 47,  7, 39, 13, 45,  5, 37, 
               63, 31, 55, 23, 61, 29, 53, 21 ];

var _surface = surface_create( 8, 8 );
surface_set_target( _surface );
draw_clear( c_black );
for( var _i = 0; _i < 64; _i++ ) {
    var _x = _i mod 8;
    var _y = _i div 8;
    draw_point_colour( _x, _y, make_colour_hsv( 0, 0, _dither[_i] ) );
}
surface_reset_target();

var _spr = sprite_create_from_surface( _surface,   0, 0, 8, 8,   false, false, 0, 0 );
surface_free( _surface );

return _spr;
var _hue = random( 255 );
while( ( _hue < 45 ) || ( ( _hue > 105 ) && ( _hue < 190 ) ) || ( _hue > 230 ) ) _hue = random( 255 );
return make_colour_hsv( _hue, random_range( 110, 130 ), 255 );
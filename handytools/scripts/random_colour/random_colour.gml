do {
	var _hue = random( 255 );
} until ( _hue < 45 ) or ( ( _hue > 105 ) and ( _hue < 190 ) ) or ( _hue > 230 );
return make_colour_hsv( _hue, random_range( 110, 130 ), 255 );
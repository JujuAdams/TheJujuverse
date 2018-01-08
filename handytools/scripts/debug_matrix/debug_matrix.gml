/// @param matrix

var _matrix = argument0;

var _string = "";
for( var _y = 0; _y < 4; _y++ ) {
	for( var _x = 0; _x < 4; _x++ ) {
		_string += string_space_padded( string_format( _matrix[ _x+_y*4 ], 0, 4 ), 9 ) + ",";
	}
	if ( _y != 3 ) _string += chr(13);
}

trace( _string );
/// @param vertex

var _vertex = argument0;

var _string = "";
var _length = array_length_1d( _vertex );
for( var _x = 0; _x < _length; _x++ ) _string += string_space_padded( string_format( _vertex[ _x ], 0, 4 ), 9 ) + ",";
	
trace( _string );
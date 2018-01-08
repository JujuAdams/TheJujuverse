/// @param x
/// @param y
/// @param z
/// @param w

if ( argument_count == 1 ) {
	var _array = argument[0];
	var _w = _array[ 3 ];
	_array[@ 0 ] /= _w;
	_array[@ 1 ] /= _w;
	_array[@ 2 ] /= _w;
	_array[@ 3 ]  = 1.0;
	return _array;
}

var _result;

_result[3] = 1.0;
_result[2] = argument[2] / argument[3];
_result[1] = argument[1] / argument[3];
_result[0] = argument[0] / argument[3];

return _result;
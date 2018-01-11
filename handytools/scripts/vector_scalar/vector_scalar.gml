/// @param scalar
/// @param x
/// @param y
/// @param z
/// @param w

var _scalar = argument[0];
if ( argument_count == 2 ) {
	var _array = argument[1];
	_array[@ 0 ] *= _scalar;
	_array[@ 1 ] *= _scalar;
	_array[@ 2 ] *= _scalar;
	_array[@ 3 ] *= _scalar;
	return _array;
}

var _result;
_result[3] = argument[4] * _scalar;
_result[2] = argument[3] * _scalar;
_result[1] = argument[2] * _scalar;
_result[0] = argument[1] * _scalar;
return _result;
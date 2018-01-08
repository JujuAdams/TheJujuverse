/// @param matrix
/// @param x
/// @param y
/// @param z
/// @param w

var _result;
var _matrix = argument[0];

if ( argument_count == 2 ) {
	
	var _array = argument[1];
	var _x = _array[0];
	var _y = _array[1];
	var _z = _array[2];
	var _w = _array[3];

	_array[@ 0] = _matrix[ 0]*_x + _matrix[ 4]*_y + _matrix[ 8]*_z + _matrix[12]*_w;
	_array[@ 1] = _matrix[ 1]*_x + _matrix[ 5]*_y + _matrix[ 9]*_z + _matrix[13]*_w;
	_array[@ 2] = _matrix[ 2]*_x + _matrix[ 6]*_y + _matrix[10]*_z + _matrix[14]*_w;
	_array[@ 3] = _matrix[ 3]*_x + _matrix[ 7]*_y + _matrix[11]*_z + _matrix[15]*_w;
	return _array;
	
}

var _x = argument[1];
var _y = argument[2];
var _z = argument[3];
var _w = argument[4];

_result[3] = _matrix[ 3]*_x + _matrix[ 7]*_y + _matrix[11]*_z + _matrix[15]*_w;
_result[2] = _matrix[ 2]*_x + _matrix[ 6]*_y + _matrix[10]*_z + _matrix[14]*_w;
_result[1] = _matrix[ 1]*_x + _matrix[ 5]*_y + _matrix[ 9]*_z + _matrix[13]*_w;
_result[0] = _matrix[ 0]*_x + _matrix[ 4]*_y + _matrix[ 8]*_z + _matrix[12]*_w;

return _result;
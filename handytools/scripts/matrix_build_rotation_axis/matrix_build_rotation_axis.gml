/// @param x
/// @param y
/// @param z
/// @param angle

var _c = dcos( -argument3 );
var _s = dsin( -argument3 );
var _omc = 1 - _c;

var _x = argument0;
var _y = argument1;
var _z = argument2;
var _b = _x*_x + _y*_y + _z*_z;
var _a = sqrt( _b );
_x /= _a;
_y /= _a;
_z /= _a;

var _matrix;
_matrix[ 0] = _omc * _x * _x + _c;
_matrix[ 1] = _omc * _x * _y + _s * _z;
_matrix[ 2] = _omc * _x * _z - _s * _y;
_matrix[ 3] = 0;

_matrix[ 4] = _omc * _x * _y - _s * _z;
_matrix[ 5] = _omc * _y * _y + _c;
_matrix[ 6] = _omc * _y * _z + _s * _x;
_matrix[ 7] = 0;

_matrix[ 8] = _omc * _x * _z + _s * _y;
_matrix[ 9] = _omc * _y * _z - _s * _x;
_matrix[10] = _omc * _z * _z + _c;
_matrix[11] = 0;

_matrix[12] = 0;
_matrix[13] = 0;
_matrix[14] = 0;
_matrix[15] = 1;

return _matrix;
///@func cross_product( x1, y1, z1, x2, y2, z2 )

var _x1 = argument0;
var _y1 = argument1;
var _z1 = argument2;
var _x2 = argument3;
var _y2 = argument4;
var _z2 = argument5;

var _result;
_result[0] = _y1*_z2 - _z1*_y2;
_result[1] = _z1*_x2 - _x1*_z2;
_result[2] = _x1*_y2 - _y1*_x2;
return _result;
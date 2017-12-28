/// @param x1
/// @param y1
/// @param z1
/// @param x2
/// @param y2
/// @param z2

var _x1 = argument0;
var _y1 = argument1;
var _z1 = argument2;
var _x2 = argument3;
var _y2 = argument4;
var _z2 = argument5;

var _rx = _y1*_z2 - _z1*_y2;
var _ry = _z1*_x2 - _x1*_z2;
var _rz = _x1*_y2 - _y1*_x2;

var _r = 1/sqrt( _rx*_rx + _ry*_ry + _rz*_rz );

var _result;
_result[0] = _r*_rx;
_result[1] = _r*_ry;
_result[2] = _r*_rz;
return _result;
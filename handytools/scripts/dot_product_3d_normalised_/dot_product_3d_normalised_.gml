///fixed_dot_product_3d_normalised( x1, y1, z1, x2, y2, z2 )

var _x1 = argument0;
var _y1 = argument1;
var _z1 = argument2;
var _x2 = argument3;
var _y2 = argument4;
var _z2 = argument5;

var _d = 1/sqrt( _x1*_x1 + _y1*_y1 + _z1*_z1 );
_x1 *= _d;
_y1 *= _d;
_z1 *= _d;

_d = 1/sqrt( _x2*_x2 + _y2*_y2 + _z2*_z2 );
_x2 *= _d;
_y2 *= _d;
_z2 *= _d;

return _x1*_x2 + _y1*_y2 + _z1*_z2;
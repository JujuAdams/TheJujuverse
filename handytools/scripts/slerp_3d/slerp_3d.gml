/// @description Performs a spherical interpolation between two 3D points
/// @param x1
/// @param y1
/// @param z1
/// @param x2
/// @param y2
/// @param z2
/// @param parameter

var _ax = argument0;
var _ay = argument1;
var _az = argument2;
var _bx = argument3;
var _by = argument4;
var _bz = argument5;
var _t  = argument6;

var _angle = arccos( dot_product_3d_normalised( _ax, _ay, _az,   _bx, _by, _bz ) );

var _s0 = sin( _angle );

var _result;
if ( abs( _s0 ) < 0.001 ) {
    
    _result[0] = 0.5*_ax + 0.5*_bx;
    _result[1] = 0.5*_ay + 0.5*_by;
    _result[2] = 0.5*_az + 0.5*_bz;
    
} else {
    
    var _s1 = sin( ( 1 - _t ) * _angle ) / _s0;
    var _s2 = sin( _t * _angle ) / _s0;
    
    _result[0] = _s1*_ax + _s2*_bx;
    _result[1] = _s1*_ay + _s2*_by;
    _result[2] = _s1*_az + _s2*_bz;

}

return _result;
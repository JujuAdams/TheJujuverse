/// @description Performs a spherical interpolation between two quaternions
/// @param quaternion1
/// @param quaternion2
/// @param parameter

var _a = argument0;
var _b = argument1;
var _t = argument2;

var _angle = abs( arccos( _a[0]*_b[0] + _a[1]*_b[1] + _a[2]*_b[2] + _a[3]*_b[3] ) );

var _s0 = sin( _angle );

var _result;
if ( abs( _s0 ) < 0.001 ) {
    
    _result[0] = 0.5*_a[0] + 0.5*_b[0];
    _result[1] = 0.5*_a[1] + 0.5*_b[1];
    _result[2] = 0.5*_a[2] + 0.5*_b[2];
    _result[3] = 0.5*_a[3] + 0.5*_b[3];
    
} else {
    
    var _s1 = sin( ( 1 - _t ) * _angle ) / _s0;
    var _s2 = sin( _t * _angle ) / _s0;
    
    _result[0] = _s1*_a[0] + _s2*_b[0];
    _result[1] = _s1*_a[1] + _s2*_b[1];
    _result[2] = _s1*_a[2] + _s2*_b[2];
    _result[3] = _s1*_a[3] + _s2*_b[3];
    
}

return _result;
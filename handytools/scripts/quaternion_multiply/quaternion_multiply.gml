/// @desc Multiplies two quaternions together, adding one rotation onto another.
/// @param quaternion_1
/// @param quaternion_2
///
/// Quaternion library
/// 7th Nov 2016
/// @jujuadams

var _a = argument0;
var _b = argument1;

return [ _a[0]*_b[0] - _a[1]*_b[1] - _a[2]*_b[2] - _a[3]*_b[3],
         _a[0]*_b[1] + _a[1]*_b[0] + _a[2]*_b[3] - _a[3]*_b[2],
         _a[0]*_b[2] + _a[2]*_b[0] + _a[3]*_b[1] - _a[1]*_b[3],
         _a[0]*_b[3] + _a[3]*_b[0] + _a[1]*_b[2] - _a[2]*_b[1] ];

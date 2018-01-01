/// @description Rotates a 3D vector (3-element 1D array) by a quaternion
/// @param vector
/// @param quaternion

var _vector     = argument0;
var _quaternion = argument1;

_vector = quaternion_multiply( _quaternion, [ 0,  _vector[0],  _vector[1],  _vector[2] ] );
_vector = quaternion_multiply( _quaternion, [ 0, -_vector[1], -_vector[2], -_vector[3] ] );

return [ _vector[1], _vector[2], _vector[3] ];

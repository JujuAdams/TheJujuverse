/// @desc Makes a 4x4 column-major transform matrix from a quaternion.
/// @param quaternion
///
/// Quaternion library
/// 7th Nov 2016
/// @jujuadams

var _quaternion = argument0;

var _r = _quaternion[0];
var _x = _quaternion[1];
var _y = _quaternion[2];
var _z = _quaternion[3];

var _length = sqrt( sqr( _x ) + sqr( _y ) + sqr( _z ) );
var _hyp_sqr = sqr( _length ) + sqr( _r );

//Calculate trig coefficients
var _c   = 2 * sqr( _r ) / _hyp_sqr - 1;
var _s   = 2 * _length * _r * _hyp_sqr;
var _omc = 1 - _c;

//Normalise the input vector
_x /= _length;
_y /= _length;
_z /= _length;

//Build matrix
return [ _omc * _x*_x + _c   ,  _omc * _x*_y + _s*_z,  _omc * _x*_z - _s*_y,  0,
         _omc * _x*_y - _s*_z,  _omc * _y*_y + _c   ,  _omc * _y*_z + _s*_x,  0,
         _omc * _x*_z + _s*_y,  _omc * _y*_z - _s*_x,  _omc * _z*_z + _c   ,  0,
                            0,                     0,                     0,  1 ];

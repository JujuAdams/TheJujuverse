/// @description Makes a 4x4 column-major transform matrix from a quaternion
/// @param quaternion

var _quaternion = argument0;

var _r = _quaternion[0];
var _x = _quaternion[1];
var _y = _quaternion[2];
var _z = _quaternion[3];

var _length = _x*_x + _y*_y + _z*_z;
var _hyp_sqr = _length + _r*_r;
_length = sqrt( _length );

//Calculate trig coefficients
var _c   = 2 * _r*_r / _hyp_sqr - 1;
var _s   = 2 * _length * _r * _hyp_sqr;
var _omc = 1 - _c;

//Normalise the input vector
_x /= _length;
_y /= _length;
_z /= _length;

var _xx = _omc*_x*_x;
var _xy = _omc*_x*_y;
var _xz = _omc*_x*_z;
var _yy = _omc*_y*_y;
var _yz = _omc*_y*_z;
var _zz = _omc*_z*_z;
var _sx =      _s*_x;
var _sy =      _s*_y;
var _sz =      _s*_z;

//Build matrix
return [ _xx + _c ,  _xy + _sz,  _xz - _sy,  0,
         _xy - _sz,  _yy + _c ,  _yz + _sx,  0,
         _xz + _sy,  _yz - _sx,  _zz + _c ,  0,
                 0,          0,          0,  1 ];

/*
//Build matrix
return [ _omc * _x*_x + _c   ,  _omc * _x*_y + _s*_z,  _omc * _x*_z - _s*_y,  0,
         _omc * _x*_y - _s*_z,  _omc * _y*_y + _c   ,  _omc * _y*_z + _s*_x,  0,
         _omc * _x*_z + _s*_y,  _omc * _y*_z - _s*_x,  _omc * _z*_z + _c   ,  0,
                            0,                     0,                     0,  1 ];
*/
/// @description Sets a view matrix implicitly for a GRIP camera
/// @param name
/// @param xfrom
/// @param yfrom
/// @param zfrom
/// @param quaternion

if ( !GRIP_ON ) return undefined;

var _name       = argument0;
var _xfrom      = argument1;
var _yfrom      = argument2;
var _zfrom      = argument3;
var _quaternion = argument4;

var _look = quaternion_transform_vector( [ 1, 0,  0 ], _quaternion );
var _up   = quaternion_transform_vector( [ 0, 0, -1 ], _quaternion );

grip_set_lookat_3d( _name,         _xfrom,          _yfrom,          _zfrom,
                          _look[0]+_xfrom, _look[1]+_yfrom, _look[2]+_zfrom,
                            _up[0]       ,   _up[1]       ,   _up[2]        );
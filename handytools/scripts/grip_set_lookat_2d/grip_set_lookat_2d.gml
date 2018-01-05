/// @description Sets a view matrix implicitly for a GRIP camera
/// @param name
/// @param x
/// @param y

if ( !GRIP_ON ) return undefined;

var _name = argument0;
var _x    = argument1;
var _y    = argument2;

var _matrix = matrix_build_lookat( _x, _y, -16000, 
                                   _x, _y, 0,
                                    0,  1, 0 );
                                     
var _map = global.grip_cameras_map[? _name ];
_map[? "view matrix" ] = _matrix;
_map[? "xfrom"       ] = _x;
_map[? "yfrom"       ] = _y;
_map[? "zfrom"       ] =  0;
camera_set_view_mat( _map[? "camera" ], _matrix );
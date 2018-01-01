/// @description Sets the projection matrix for a GRIP camera
/// @param name
/// @param matrix

if ( !GRIP_ON ) return undefined;

var _name   = argument0;
var _matrix = argument1;

var _map = global.grip_cameras_map[? _name ];
_map[? "proj matrix" ] = _matrix;
camera_set_proj_mat( _map[? "camera" ], _matrix );
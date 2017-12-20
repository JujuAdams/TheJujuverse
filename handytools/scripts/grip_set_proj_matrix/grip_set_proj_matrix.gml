///grip_camera_set_proj_matrix( name, matrix )

var _name   = argument0;
var _matrix = argument1;

var _map = global.grip_cameras_map[? _name ];
_map[? "proj matrix" ] = _matrix;
camera_set_proj_mat( _map[? "camera" ], _matrix );
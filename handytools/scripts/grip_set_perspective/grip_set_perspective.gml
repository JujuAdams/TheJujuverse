/// @description Sets the projection matrix for a GRIP camera
/// @param name
/// @param [fov]
/// @param [znear]
/// @param [zfar]

if ( !GRIP_ON ) return undefined;

var _name  = argument[0];
var _fov   = ((argument_count<2) || (argument[1]==undefined))? DEFAULT_FOV    : argument[1];
var _znear = ((argument_count<3) || (argument[2]==undefined))? DEFAULT_Z_NEAR : argument[2];
var _zfar  = ((argument_count<4) || (argument[3]==undefined))? DEFAULT_Z_FAR  : argument[3];

var _matrix = matrix_flip_y( matrix_build_projection_perspective_fov( _fov, grip_get_aspect( _name ), _znear, _zfar ) );

var _map = global.grip_cameras_map[? _name ];
_map[? "proj matrix" ] = _matrix;
camera_set_proj_mat( _map[? "camera" ], _matrix );
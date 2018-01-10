/// @description Creates a new GRIP camera
/// @param name
/// @param surface_width
/// @param surface_height
/// @param relative_to_app_surf
/// @param 3d_projection

if ( !GRIP_ON ) {
    trace_error_q( false, "Can't execute script - turn GRIP on" );
    exit;
}

var _map = tr_map_create();
tr_map_add_map( global.grip_cameras_map, argument0, _map );

_map[? "name"           ] = argument0;
_map[? "width"          ] = argument1;
_map[? "height"         ] = argument2;
_map[? "relative size"  ] = argument3;
_map[? "3d"             ] = argument4;
_map[? "active"         ] = false;
_map[? "view"           ] = undefined;
_map[? "manual draw"    ] = true;
_map[? "xfrom"          ] = 0;
_map[? "yfrom"          ] = 0;
_map[? "zfrom"          ] = 0;
_map[? "depth surface"  ] = undefined;
_map[? "normal surface" ] = undefined;
_map[? "shader"         ] = undefined;

var _actual_width  = grip_get_width( argument0 );
var _actual_height = grip_get_height( argument0 );
_map[? "surface" ] = tr_surface_create( _actual_width, _actual_height, concat( "grip: ", QU, argument0, QU ), true );

if ( _map[? "3d" ] ) {
    var _view_matrix = matrix_build_lookat( 0, 0, 0,   1, 0, 0,   0, 0, 1 );
    var _proj_matrix = matrix_build_projection_perspective_fov( DEFAULT_FOV, _actual_width/_actual_height, DEFAULT_Z_NEAR, DEFAULT_Z_FAR );
} else {
    var _view_matrix = matrix_build_lookat( _actual_width/2, _actual_height/2, -16000, 
                                            _actual_width/2, _actual_height/2, 0,
                                            0, 1, 0 );
    var _proj_matrix = matrix_build_projection_ortho( _actual_width, _actual_height, -16000, 16000 );
}

_map[? "view matrix" ] = _view_matrix;
_map[? "proj matrix" ] = _proj_matrix;

var _camera = camera_create();
camera_set_view_mat( _camera, _view_matrix );
camera_set_proj_mat( _camera, _proj_matrix );
_map[? "camera" ] = _camera;
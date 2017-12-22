///@param name
///@param view

var _name = argument0;
var _view = argument1;

if ( _view < GRIP_VIEWS_START ) || ( _view > GRIP_VIEWS_END ) {
	trace_error( false, "grip camera ", QU, _name, QU, " attempting to assign to view ", _view, " outside defined range (", GRIP_VIEWS_START, "->", GRIP_VIEWS_END, ")" );
	return undefined;
}

trace_f( "assigning grip ", QU, _name, QU, " to view ", _view );

var _map = global.grip_cameras_map[? _name ];
if ( _map[? "active" ] ) grip_deactivate( _name ) else _map[? "active" ] = true;
_map[? "view" ] = _view;

camera_destroy( _map[? "camera" ] );
var _camera = camera_create();
camera_set_view_mat( _camera, _map[? "view matrix" ] );
camera_set_proj_mat( _camera, _map[? "proj matrix" ] );
_map[? "camera" ] = _camera;

view_enabled           = true;
view_visible[_view]    = true;
view_camera[_view]     = _camera;
view_surface_id[_view] = _map[? "surface" ];
	
global.grip_view_list[| _view ] = _name;
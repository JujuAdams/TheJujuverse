/// @param view
/// @param camera
/// @param surface

var _view    = argument0;
var _camera  = argument1;
var _surface = argument2;

view_enabled = true;
view_visible[_view]    = true;
view_camera[_view]     = _camera;
view_surface_id[_view] = _surface;
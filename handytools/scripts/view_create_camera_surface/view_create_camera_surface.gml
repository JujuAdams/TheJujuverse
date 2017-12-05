///@param view
///@param camera
///@param surface

var _view    = argument0;
var _camera  = argument1;
var _surface = argument2;

view_enabled = true;
view_visible[_view]    = true;
view_camera[_view]     = _camera;
view_xport[_view]      = 0;
view_yport[_view]      = 0;
view_wport[_view]      = surface_get_width( _surface );
view_hport[_view]      = surface_get_height( _surface );
view_surface_id[_view] = _surface;
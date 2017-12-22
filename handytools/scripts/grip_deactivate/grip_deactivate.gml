///@param name

var _name = argument0;

var _map = global.grip_cameras_map[? _name ];
if ( ( _map == undefined ) || !_map[? "active" ] ) exit;

var _view = _map[? "view" ];

_map[? "active" ] = false;
_map[? "view"   ] = undefined;

view_visible[_view]    = false;
view_camera[_view]     = noone;
view_surface_id[_view] = noone;

global.grip_view_list[| _view ] = undefined;
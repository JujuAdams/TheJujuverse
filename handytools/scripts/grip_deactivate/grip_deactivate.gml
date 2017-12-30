///@param name

if ( !GRIP_ON ) {
    trace_error_q( false, "Can't execute script - turn GRIP on" );
    exit;
}

var _name = argument0;

var _map = global.grip_cameras_map[? _name ];
if ( ( _map == undefined ) || !_map[? "active" ] ) exit;

if ( _map[? "manual draw" ] ) {
    
    var _index = ds_list_find_index( global.grip_manual_list, _name );
    ds_list_delete( global.grip_manual_list, _index );
    
} else {
    
    var _view = _map[? "view" ];

    view_visible[_view]    = false;
    view_camera[_view]     = noone;
    view_surface_id[_view] = noone;

    global.grip_view_list[| _view ] = undefined;
    
}

_map[? "active"      ] = false;
_map[? "manual draw" ] = false;
_map[? "view"        ] = undefined;
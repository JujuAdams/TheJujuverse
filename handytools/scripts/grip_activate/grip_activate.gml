///@param name
///@param manual_draw

if ( !GRIP_ON ) {
    trace_error_q( false, "Can't execute script - turn GRIP on" );
    exit;
}

var _name   = argument0;
var _manual = argument1 || GRIP_FORCE_ALL_MANUAL;

if ( _manual ) {
    
    var _map = global.grip_cameras_map[? _name ];
    
    if ( _map[? "active" ] ) grip_deactivate( _name );
    _map[? "active" ] = true;
    _map[? "manual draw" ] = true;

    camera_destroy( _map[? "camera" ] );
    var _camera = camera_create();
    camera_set_view_mat( _camera, _map[? "view matrix" ] );
    camera_set_proj_mat( _camera, _map[? "proj matrix" ] );
    _map[? "camera" ] = _camera;
    
    ds_list_add( global.grip_manual_list, _name );
    
    return undefined;
    
} else {

    for( var _i = GRIP_VIEWS_START; _i <= GRIP_VIEWS_END; _i++ ) {
        if ( global.grip_view_list[| _i ] == undefined ) {
            grip_activate_on_view( _name, _i )
            return _i;
        }
    }
    
    trace_error_q( false, "cannot find free view slot for grip camera ", QU, _name, QU );
    return undefined;
}
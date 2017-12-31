/// @param name

if ( !GRIP_ON ) {
    trace_error_q( false, "Can't execute script - turn GRIP on" );
    exit;
}

var _map = global.grip_cameras_map[? argument0 ];
var _surface = _map[? "surface" ];
tr_surface_set_protect( _surface, false )
tr_surface_free( _surface );
camera_destroy( _map[? "camera" ] );
tr_map_destroy( _map );

ds_map_delete( global.grip_cameras_map, argument0 );
ds_list_find_and_replace( global.grip_view_list, argument0, undefined, true );
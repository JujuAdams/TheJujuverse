/// @description Adds a normal surface to a GRIP camera
/// @param name

if ( !GRIP_ON ) {
    trace_error_q( false, "Can't execute script - turn GRIP on" );
    exit;
}

var _name = argument0;
var _map = global.grip_cameras_map[? argument0 ];
_map[? "normal surface" ] = tr_surface_create( grip_get_width( _name ), grip_get_height( _name ),
                                               concat( "grip (normal): ", QU, argument0, QU ), true );
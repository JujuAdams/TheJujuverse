/// @description Sets if the primary surface for a GRIP camera is its depth surface
/// @param name
/// @param shdaer

if ( !GRIP_ON ) return undefined;

if ( argument1 ) {
    var _depth_surface = grip_get_depth_surface( argument0 )
    if ( ( _depth_surface == undefined ) || !surface_exists( _depth_surface ) ) {
        trace_error( false, "GRIP ", QU, argument0, QU, " has no depth surface!" );
    }
}

var _map = global.grip_cameras_map[? argument0 ];
_map[? "primary is depth" ] = argument1;
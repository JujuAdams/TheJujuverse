/// @description TRACKER set protection mode of a map
/// @param index
/// @param protect

if ( TRACKER_ON ) {
    if ( TRACKER_DEBUG_MAP_PROTECT ) trace_v( "setting protect of map ", argument0, " to ", argument1?TRACKER_PROTECTED_LABEL:TRACKER_VOLATILE_LABEL, TRACE_DIV, tr_map_details( argument0, TRACE_DIV ) );
    global.tracker_maps_protect[? argument0 ] = argument1;
}
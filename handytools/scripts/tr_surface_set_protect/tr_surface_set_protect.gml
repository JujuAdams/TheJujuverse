/// @description TRACKER set protection mode of a surface
/// @param index
/// @param protect

if ( TRACKER_ON ) {
    if ( TRACKER_DEBUG_SURFACE_PROTECT ) trace_v( "setting protect of surface ", argument0, " to ", argument1? TRACKER_PROTECTED_LABEL : TRACKER_VOLATILE_LABEL, TRACE_DIV, tr_surface_details( argument0, TRACE_DIV ) );
    global.tracker_surfaces_protect[? argument0 ] = argument1;
}
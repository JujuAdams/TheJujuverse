///@param index
///@param protect

if ( TRACKER_ON ) {
	if ( TRACKER_DEBUG_SURFACE_PROTECT ) trace_v( "setting protect of surface ", argument0, " to ", argument1?TRACKER_PROTECTED_LABEL:TRACKER_VOLATILE_LABEL, TRACE_DEFAULT_DIVIDER, tr_surface_details( argument0, TRACE_DEFAULT_DIVIDER ) );
	global.tracker_surfaces_protect[? argument0 ] = argument1;
}
/// @description TRACKER set protection mode of an instance
/// @param index
/// @param protect

if ( TRACKER_ON ) {
    if ( TRACKER_DEBUG_INSTANCE_PROTECT ) trace_v( "setting protect of surface ", argument0, " to ", argument1?TRACKER_PROTECTED_LABEL:TRACKER_VOLATILE_LABEL, TRACE_DIV, tr_instance_details( argument0, TRACE_DIV ) );
    global.tracker_instances_protect[? argument0 ] = argument1;
}
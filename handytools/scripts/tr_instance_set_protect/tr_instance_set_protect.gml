///@param index
///@param protect

if ( TRACKER_ON ) {
	if ( TRACKER_DEVELOPMENT_INSTANCE_PROTECT ) trace_v( "setting protect of surface ", argument0, " to ", argument1?TRACKER_PROTECTED_LABEL:TRACKER_VOLATILE_LABEL, TRACE_DEFAULT_DIVIDER, tr_instance_details( argument0, TRACE_DEFAULT_DIVIDER ) );
	global.tracker_instances_protect[? argument0 ] = argument1;
}
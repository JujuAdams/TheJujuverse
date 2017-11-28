///@param index
///@param protect

if ( TRACKER_ON ) {
	if ( TRACKER_DEBUG_LIST_PROTECT ) trace_v( "setting protect of list ", argument0, " to ", argument1?TRACKER_PROTECTED_LABEL:TRACKER_VOLATILE_LABEL, TRACE_DEFAULT_DIVIDER, tr_list_details( argument0, TRACE_DEFAULT_DIVIDER ) );
	global.tracker_lists_protect[? argument0 ] = argument1;
}
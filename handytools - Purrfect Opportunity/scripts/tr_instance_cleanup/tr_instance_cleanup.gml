///@param ignore_protected

if ( TRACKER_ON ) {
	var _protect = global.tracker_instances_protect[? id ];
	
	if ( _protect == undefined ) {
		
		trace_v( "unexpectedly destroying instance ", id, ", but it does not exist in tracker. May have been created by native instance_create_*() function?" );
		return false;
		
	} else if ( _protect ) {
		
		if ( argument0 ) {
			if ( TRACKER_DEBUG_INSTANCE_PROTECT ) trace_v( "ignoring protect of unexpectedly destroyed instance", TRACE_DEFAULT_DIVIDER, tr_instance_details( argument0, TRACE_DEFAULT_DIVIDER ) );
		} else {
			if ( TRACKER_ILLEGAL_THROW_ERROR ) {
				trace_error( false, "unexpecedly destroying protected instance! Room change? Native instance_destroy() function?", NL, tr_instance_details( id, NL ) );
			} else {
				trace_vf( "unexpecedly destroying protected instance! Room change? Native instance_destroy() function?", TRACE_DEFAULT_DIVIDER, tr_instance_details( id, TRACE_DEFAULT_DIVIDER ) );
			}
			return false;
		}
		
	}
	
	if ( TRACKER_DEBUG_INSTANCE_UNEXPECTED_DESTROY ) trace_v( "unexpectedly destroying instance. Room change? Native instance_destroy() function?", TRACE_DEFAULT_DIVIDER, tr_instance_details( id, TRACE_DEFAULT_DIVIDER ) );
	__tr_instance_unregister( id );
	
}

return true;
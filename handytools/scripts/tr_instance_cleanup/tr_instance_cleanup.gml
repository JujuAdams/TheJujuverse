///@param ignore_protected

var _ignore = (argument_count>0)? argument[0] : false;

if ( TRACKER_ON ) {
	var _protect = global.tracker_instances_protect[? id ];
	
	if ( _protect == undefined ) {
		
		trace_v( "unexpectedly destroying instance ", id, ", but it does not exist in tracker. May have been created by native instance_create_*() function?" );
		return false;
		
	} else if ( _protect ) {
		
		if ( _ignore ) {
			if ( TRACKER_DEBUG_INSTANCE_PROTECT ) trace_v( "ignoring protect of unexpectedly destroyed instance", TRACE_DIV, tr_instance_details( argument[0], TRACE_DIV ) );
		} else {
			if ( TRACKER_ILLEGAL_THROW_ERROR ) {
				trace_error( false, "unexpecedly destroying protected instance! Room change? Native instance_destroy() function?", NL, tr_instance_details( id, NL ) );
			} else {
				trace_vf( "unexpecedly destroying protected instance! Room change? Native instance_destroy() function?", TRACE_DIV, tr_instance_details( id, TRACE_DIV ) );
			}
			return false;
		}
		
	}
	
	if ( TRACKER_DEBUG_INSTANCE_UNEXPECTED_DESTROY ) trace_v( "unexpectedly destroying instance. Room change? Native instance_destroy() function?", TRACE_DIV, tr_instance_details( id, TRACE_DIV ) );
	__tr_instance_unregister( id );
	
}

return true;
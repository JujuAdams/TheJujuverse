///@param index

var _index = (argument_count>0)?argument[0]:id;
var _flag  = (argument_count>1)?argument[1]:false;

if ( TRACKER_ON ) {
	var _protect = global.tracker_instances_protect[? _index ];
	
	if ( _protect == undefined ) {
		trace_v( "instance ", _index, " does not exist in tracker. May have been created by native instance_create_*() function?" );
		instance_destroy( _index, _flag );
		return false;
	} else if ( _protect ) {
		if ( _index == id ) and ( TRACKER_PROTECTED_INSTANCE_CAN_DESTOY_SELF ) {
			trace_v( "protected instance destroying itself", TRACE_DEFAULT_DIVIDER, tr_instance_details( _index, TRACE_DEFAULT_DIVIDER ) );
		} else {
			if ( TRACKER_ILLEGAL_THROW_ERROR ) {
				trace_error( false, "attempting to destroy protected instance!", NL, tr_instance_details( _index, NL ) );
			} else {
				trace_vf( "attempting to destroy protected instance!", TRACE_DEFAULT_DIVIDER, tr_instance_details( _index, TRACE_DEFAULT_DIVIDER ) );
			}
			return false;
		}
	}
	
	if ( TRACKER_DEVELOPMENT_INSTANCE_DESTROY ) trace_v( "destroying instance ", _index, TRACE_DEFAULT_DIVIDER, tr_instance_details( _index, TRACE_DEFAULT_DIVIDER ) );
	__tr_instance_unregister( _index );
	
}

instance_destroy( _index, _flag );
return true;
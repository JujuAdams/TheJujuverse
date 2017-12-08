///@param x
///@param y
///@param object
///@param [note]
///@param [protected]

if ( TRACKER_ON ) {
	var _index = instance_create_depth( argument[0], argument[1], 0, argument[2] );
	
	if ( global.tracker_instances_origin[? _index ] != undefined ) {
		if ( global.tracker_instances_protect[? _index ] ) {
			if ( TRACKER_ILLEGAL_THROW_ERROR ) {
				trace_error( false, "overwriting tracker entry for PROTECTED instance=", _index, NL, tr_instance_details( _index, NL ) );
			} else {
				trace_error_q( false, "overwriting tracker entry for PROTECTED instance=", _index, NL, tr_instance_details( _index, NL ) );
			}
		} else {
			trace_v( "overwriting tracker entry for instance=", _index );
		}
	}
	
	__tr_instance_register( _index,   (argument_count>3)? argument[3] : object_get_name(argument[2]),   (argument_count>4)? argument[4] : false );
	if ( TRACKER_DEBUG_INSTANCE_CREATE ) trace_v( "creating instance=", _index, TRACE_DIV, tr_instance_details( _index, TRACE_DIV ) );
	return _index;
}

return instance_create_depth( argument[0], argument[1], 0, argument[2] );
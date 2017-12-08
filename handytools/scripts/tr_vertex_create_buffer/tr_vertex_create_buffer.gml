///@param [note]
///@param [protected]

if ( TRACKER_ON ) {
	var _index = vertex_create_buffer();
	
	if ( global.tracker_vbuffs_origin[? _index ] != undefined ) {
		if ( global.tracker_vbuffs_protect[? _index ] ) {
			if ( TRACKER_ILLEGAL_THROW_ERROR ) {
				trace_error( false, "overwriting tracker entry for PROTECTED vbuff=", _index, NL, tr_vertex_details( _index, NL ) );
			} else {
				trace_error_q( false, "overwriting tracker entry for PROTECTED vbuff=", _index, NL, tr_vertex_details( _index, NL ) );
			}
		} else {
			trace_v( "overwriting tracker entry for vbuff=", _index );
		}
	}
	
	__tr_vertex_register( _index,   (argument_count>0)? argument[0] : "",   (argument_count>1)? argument[1] : false );
	if ( TRACKER_DEBUG_VBUFF_CREATE ) trace_v( "creating vbuff=", _index, TRACE_DIV, tr_vertex_details( _index, TRACE_DIV ) );
	return _index;
}

return vertex_create_buffer();
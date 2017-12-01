///@param [note]
///@param [protected]

if ( TRACKER_ON ) {
	var _index = ds_map_create();
	
	if ( global.tracker_maps_origin[? _index ] != undefined ) {
		if ( global.tracker_maps_protect[? _index ] ) {
			if ( TRACKER_ILLEGAL_THROW_ERROR ) {
				trace_error( false, "overwriting tracker entry for PROTECTED map=", _index, ". Accidental deletion through JSON", NL, tr_map_details( _index, NL ) );
			} else {
				trace_error_q( false, "overwriting tracker entry for PROTECTED map=", _index, ". Accidental deletion through JSON?", NL, tr_map_details( _index, NL ) );
			}
		} else {
			trace_v( "overwriting tracker entry for map=", _index, ". accidental deletion through JSON?" );
		}
	}
	
	__tr_map_register( _index,   (argument_count>0)? argument[0] : "",   (argument_count>1)? argument[1] : false );
	if ( TRACKER_DEBUG_MAP_CREATE ) trace_v( "creating map=", _index, TRACE_DEFAULT_DIVIDER, tr_map_details( _index, TRACE_DEFAULT_DIVIDER ) );
	return _index;
}

return ds_map_create();
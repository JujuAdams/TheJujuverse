///@param [note]
///@param [protected]

if ( TRACKER_ON ) {
	var _index = ds_list_create();
	
	if ( global.tracker_lists_origin[? _index ] != undefined ) {
		if ( global.tracker_lists_protect[? _index ] ) {
			if ( TRACKER_ILLEGAL_THROW_ERROR ) {
				trace_error( false, "overwriting tracker entry for PROTECTED list=", _index, ". accidental deletion through JSON?", NL, tr_list_details( _index, NL ) );
			} else {
				trace_error_q( false, "overwriting tracker entry for PROTECTED list=", _index, ". accidental deletion through JSON?", NL, tr_list_details( _index, NL ) );
			}
		} else {
			trace_v( "overwriting tracker entry for list=", _index, ". accidental deletion through JSON?" );
		}
	}
	
	__tr_list_register( _index,   (argument_count>0)? argument[0] : "",   (argument_count>1)? argument[1] : false );
	if ( TRACKER_DEVELOPMENT_LIST_CREATE ) trace_v( "creating list=", _index, TRACE_DEFAULT_DIVIDER, tr_list_details( _index, TRACE_DEFAULT_DIVIDER ) );
	return _index;
}

return ds_list_create();
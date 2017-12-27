/// @description TRACKER list destruction
/// @param index

var _index = argument0;

if ( TRACKER_ON ) {
	var _protect = global.tracker_lists_protect[? _index ];
	if ( _protect == undefined ) {
		trace_v( "list ", _index, " does not exist in tracker. May have been created by a JSON?" );
		ds_list_destroy( _index );
		return false;
	} else if ( _protect ) {
		if ( TRACKER_ILLEGAL_THROW_ERROR ) {
			trace_error( false, "attempting to destroy protected list!", NL, tr_list_details( _index, NL ) );
		} else {
			trace_error_q( false, "atempting to destroy protected list!", NL, tr_list_details( _index, NL ) );
		}
		return false;
	}
	
	if ( TRACKER_DEBUG_LIST_DESTROY ) trace_v( "destroying list ", _index, TRACE_DIV, tr_list_details( _index, TRACE_DIV ) );
	__tr_list_unregister( _index );
	__tr_destroy_nested_maps(  global.tracker_list_nested_maps , _index );
	__tr_destroy_nested_lists( global.tracker_list_nested_lists, _index );
	
}

ds_list_destroy( _index );
return true;
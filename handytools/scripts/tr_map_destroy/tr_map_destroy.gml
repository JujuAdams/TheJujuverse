///@param index

var _index = argument0;

if ( TRACKER_ON ) {
	var _protect = global.tracker_maps_protect[? _index ];
	
	if ( _protect == undefined ) {
		trace_v( "ds_map ", _index, " does not exist in tracker. May have been created by a JSON?" );
		ds_map_destroy( _index );
		return false;
	} else if ( _protect ) {
		if ( TRACKER_ILLEGAL_THROW_ERROR ) {
			trace_error( false, "attempting to destroy protected map!", NL, tr_map_details( _index, NL ) );
		} else {
			trace_vf( "attempting to destroy protected map!", NL, tr_map_details( _index, NL ) );
		}
		return false;
	}
	
	if ( TRACKER_DEVELOPMENT_MAP_DESTROY ) trace_v( "destroying map ", _index, TRACE_DEFAULT_DIVIDER, tr_map_details( _index, TRACE_DEFAULT_DIVIDER ) );
	__tr_map_unregister( _index );
	__tr_destroy_nested_maps(  global.tracker_map_nested_maps , _index );
	__tr_destroy_nested_lists( global.tracker_map_nested_lists, _index );
	
}

ds_map_destroy( _index );
return true;
/// @description TRACKER internal function to destroy maps safely
/// @param tracker_map
/// @param id

var _tracker_map = argument0;
var _index       = argument1;

var _root_list = _tracker_map[? _index ];
if ( _root_list != undefined ) && ( _root_list >= 0 ) {
	
	var _size = ds_list_size( _root_list );
	for( var _i = _size-1; _i >= 0; _i-- ) {
		var _map = _root_list[| _i ];
		tr_map_set_protect( _map, false );
		tr_map_destroy( _map );
	}
	
	tr_list_destroy( _root_list );
	ds_map_delete( _tracker_map, _index );
	
}
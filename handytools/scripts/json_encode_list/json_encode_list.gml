/// @param list

var _map = ds_map_create();
ds_map_add_list( _map, "list", argument0 );
var _string = json_encode( _map );
_map[? "list" ] = undefined;
ds_map_destroy( _map );
return _string;
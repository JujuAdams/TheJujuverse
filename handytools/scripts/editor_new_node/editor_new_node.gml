/// @desc Creates a new EDITOR node and returns its id
/// @param name

var _map = ds_map_create();
_map[? "##selected" ] = false;
_map[? "name" ] = argument0;
ds_map_add_list( _map, "##properties", ds_list_create() );
ds_map_add_list( _map, "##children", ds_list_create() );
editor_add_property( _map, "x", 0, 100 );
editor_add_property( _map, "y", 0, 200 );
editor_add_property( _map, "z", 0, 300 );

return _map;
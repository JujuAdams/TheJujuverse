/// @desc Creates a new EDITOR node and returns its id
/// @param name

var _map = ds_map_create();
_map[? "##selected" ] = false;
_map[? "name" ] = argument0;
_map[? "x" ] = 0;
_map[? "y" ] = 0;
_map[? "z" ] = 0;
_map[? "absolute x" ] = 0;
_map[? "absolute y" ] = 0;
_map[? "absolute z" ] = 0;
ds_map_add_list( _map, "##children", ds_list_create() );

return _map;
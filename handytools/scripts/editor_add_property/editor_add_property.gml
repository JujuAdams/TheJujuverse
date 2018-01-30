/// @desc Creates a new EDITOR node property and adds it to a node
/// @param node_map
/// @param name
/// @param type
/// @param value

var _map = ds_map_create();
ds_list_add_map( argument0[? "##properties" ], _map );
_map[? "name"          ] = argument1;
_map[? "type"          ] = argument2;
_map[? "value"         ] = argument3;
_map[? "variable name" ] = undefined;
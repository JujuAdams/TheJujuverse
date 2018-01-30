/// @desc Creates a new EDITOR node property and adds it to a node
/// @param node_map
/// @param name
/// @param type
/// @param value
/// @param [variable_name]

var _list = argument[0];
var _map = ds_map_create();
ds_list_add_map( _list[? "##properties" ], _map );
_map[? "name"          ] = argument[1];
_map[? "type"          ] = argument[2];
_map[? "value"         ] = argument[3];
_map[? "variable name" ] = ((argument_count > 4) && (argument[4] != undefined))? argument[4] : "";
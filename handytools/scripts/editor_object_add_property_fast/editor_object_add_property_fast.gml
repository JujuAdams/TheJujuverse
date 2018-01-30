/// @param object_name
/// @param list
/// @param name
/// @param type
/// @param default_value
/// @param variable_name

var _map = tr_map_create( concat( "EDITOR ", argument0, " ", QU, argument2, QU, " property" ), true );
_map[? "name"          ] = argument2;
_map[? "type"          ] = argument3;
_map[? "value"         ] = argument4;
_map[? "variable name" ] = is_string( argument5 )? argument5 : undefined;
tr_list_add_map( argument1, _map );
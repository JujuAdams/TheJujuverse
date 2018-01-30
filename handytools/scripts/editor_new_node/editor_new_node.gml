/// @desc Creates a new EDITOR node and returns its id
/// @param name
/// @param object

var _map = ds_map_create();
_map[? "##selected" ] = false;
ds_map_add_list( _map, "##properties", ds_list_create() );
ds_map_add_list( _map, "##children", ds_list_create() );
editor_add_property( _map, "name", E_EDITOR_PROPERTY.STRING, argument0 );
editor_add_property_from_object( _map, UD );

return _map;
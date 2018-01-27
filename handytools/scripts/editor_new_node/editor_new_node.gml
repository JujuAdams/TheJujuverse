/// @desc Creates a new EDITOR node and returns its id
/// @param name

var _map = ds_map_create();
_map[? "##selected" ] = false;
ds_map_add_list( _map, "##properties", ds_list_create() );
ds_map_add_list( _map, "##children", ds_list_create() );
editor_add_property( _map, "name", E_EDITOR_PROPERTY.STRING, argument0 );
editor_add_property( _map, "visible", E_EDITOR_PROPERTY.BOOLEAN, true );
editor_add_property( _map, "x", E_EDITOR_PROPERTY.FLOAT, 100 );
editor_add_property( _map, "y", E_EDITOR_PROPERTY.FLOAT, 200 );
editor_add_property( _map, "z", E_EDITOR_PROPERTY.FLOAT, 300 );

return _map;
/// @desc Creates a new EDITOR node and returns its id
/// @param object
/// @param name
/// @param instance

var _object      = argument[0];
var _object_name = (_object != undefined) && (object_exists( _object ))? object_get_name( _object ) : "<null>";
var _name        = ((argument_count > 1) && (argument[1] != undefined))? string( argument[1] ) : _object_name;
var _instance    = ((argument_count > 2) && (argument[2] != undefined))? argument[2] : undefined;

var _map = ds_map_create();
_map[? "selected" ] = false;
_map[? "instance" ] = _instance;
_map[? "object"   ] = _object_name;
ds_map_add_list( _map, "properties", ds_list_create() );
ds_map_add_list( _map, "children", ds_list_create() );
editor_add_property( _map,   "name", E_EDITOR_PROPERTY.STRING,        _name );
editor_add_property_from_object( _map, _object );

return _map;
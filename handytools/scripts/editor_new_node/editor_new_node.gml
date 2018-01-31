/// @desc Creates a new EDITOR node and returns its id
/// @param destination_map
/// @param object
/// @param [name]
/// @param [instance]

var _dest_map    = argument[0];
var _object      = argument[1];
var _object_name = (_object != undefined) && (object_exists( _object ))? object_get_name( _object ) : "<null>";
var _name        = ((argument_count > 2) && (argument[2] != undefined))? string( argument[2] ) : _object_name;
var _instance    = ((argument_count > 3) && (argument[3] != undefined))? argument[3] : undefined;

var _map = tr_map_create();
_map[? "selected" ] = false;
_map[? "parent"   ] = _dest_map;
_map[? "instance" ] = _instance;
_map[? "object"   ] = _object_name;
tr_map_add_list( _map, "properties", ds_list_create() );
tr_map_add_list( _map, "children", ds_list_create() );
editor_add_property( _map,   "name", E_EDITOR_PROPERTY.STRING,        _name );
editor_add_property_from_object( _map, _object );

if ( _dest_map != undefined ) tr_list_add_map( _dest_map[? "children" ], _map );

return _map;
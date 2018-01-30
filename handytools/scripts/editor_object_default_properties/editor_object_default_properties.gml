/// @param object
/// @param list

var _object_name = object_get_name( argument0 );
var _list        = argument1;

editor_object_add_property_fast( _object_name, _list, "visible", E_EDITOR_PROPERTY.BOOLEAN, 0, "visible" );
editor_object_add_property_fast( _object_name, _list, "x"      , E_EDITOR_PROPERTY.FLOAT  , 0, "x"       );
editor_object_add_property_fast( _object_name, _list, "y"      , E_EDITOR_PROPERTY.FLOAT  , 0, "y"       );
editor_object_add_property_fast( _object_name, _list, "z"      , E_EDITOR_PROPERTY.FLOAT  , 0, "z"       );
editor_object_add_property_fast( _object_name, _list, "x world", E_EDITOR_PROPERTY.FLOAT  , 0, "x_world" );
editor_object_add_property_fast( _object_name, _list, "y world", E_EDITOR_PROPERTY.FLOAT  , 0, "y_world" );
editor_object_add_property_fast( _object_name, _list, "z world", E_EDITOR_PROPERTY.FLOAT  , 0, "z_world" );
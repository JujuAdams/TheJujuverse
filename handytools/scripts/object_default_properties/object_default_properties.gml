/// @param object
/// @param list

var _object_name = object_get_name( argument0 );
var _list        = argument1;

object_add_property_fast( _object_name, _list, "visible", E_EDITOR_PROPERTY.BOOLEAN, 0, "visible" );
object_add_property_fast( _object_name, _list, "x"      , E_EDITOR_PROPERTY.FLOAT  , 0, "x"       );
object_add_property_fast( _object_name, _list, "y"      , E_EDITOR_PROPERTY.FLOAT  , 0, "y"       );
object_add_property_fast( _object_name, _list, "z"      , E_EDITOR_PROPERTY.FLOAT  , 0, "z"       );
object_add_property_fast( _object_name, _list, "x world", E_EDITOR_PROPERTY.FLOAT  , 0, "x_world" );
object_add_property_fast( _object_name, _list, "y world", E_EDITOR_PROPERTY.FLOAT  , 0, "y_world" );
object_add_property_fast( _object_name, _list, "z world", E_EDITOR_PROPERTY.FLOAT  , 0, "z_world" );
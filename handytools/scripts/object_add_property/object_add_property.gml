/// @param object
/// @param name
/// @param type
/// @param default_value
/// @param variable_name

var _object_name = object_get_name( argument0 );
if ( _object_name < 0 ) {
    trace_error( false, "Object id ", QU, argument0, QU, " does not exist" );
    exit;
}

var _list = global.editor_object_properties_map[? _object_name ];
if ( _list == undefined ) {
    _list = tr_list_create( concat( "EDITOR ", _object_name, " properties" ), true );
    tr_map_add_list( global.editor_object_properties_map, _object_name, _list );
    object_default_properties( argument0, _list );
}

var _map = tr_map_create( concat( "EDITOR ", _object_name, " ", QU, argument0, QU, " property" ), true );
_map[? "name"          ] = argument1;
_map[? "type"          ] = argument2;
_map[? "value"         ] = argument3;
_map[? "variable name" ] = is_string( argument4 )? argument4 : undefined;
tr_list_add_map( _list, _map );
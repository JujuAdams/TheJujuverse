/// @param object

if ( is_array( argument0 ) ) {
    var _size = array_length_1d( argument0 );
    for( var _i = 0; _i < _size; _i++ ) object_declare_default( argument0[_i] );
    exit;
}

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
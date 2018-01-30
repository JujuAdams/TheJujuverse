/// @param source_object
/// @param destination_object

if ( is_array( argument1 ) ) {
    var _size = array_length_1d( argument1 );
    for( var _i = 0; _i < _size; _i++ ) object_copy_property( argument0, argument1[_i] );
    exit;
}

if ( !object_exists( argument0 ) ) {
    trace_error( false, "Source object id ", QU, argument0, QU, " does not exist" );
    exit;
}

if ( !object_exists( argument1 ) ) {
    trace_error( false, "Destination object id ", QU, argument1, QU, " does not exist" );
    exit;
}

var _src_object_name  = object_get_name( argument0 );
var _dest_object_name = object_get_name( argument1 );

var _src_list = global.editor_object_properties_map[? _src_object_name ];
if ( _src_list == undefined ) {
    trace_error( false, "No object properties found for ", _src_object_name, " (", argument0, ")" );
    exit;
}

var _dest_list = global.editor_object_properties_map[? _dest_object_name ];
if ( _dest_list == undefined ) {
    _dest_list = tr_list_create( concat( "EDITOR ", _dest_object_name, " properties" ), true );
    tr_map_add_list( global.editor_object_properties_map, _dest_object_name, _dest_list );
    object_default_properties( argument1, _dest_list );
}

var _src_size = ds_list_size( _src_list );
for( var _i = 0; _i < _src_size; _i++ ) {
    
    var _src_map  = _src_list[| _i ];
    var _src_name = _src_map[? "name" ];
    
    var _found = false;
    var _dest_size = ds_list_size( _dest_list );
    for( var _j = 0; _j < _dest_size; _j++ ) {
        var _map = _dest_list[| _j ];
        if ( _map[? "name" ] == _src_name ) {
            _found = true;
            break;
        }
    }
    
    if ( !_found ) {
        var _dest_map = ds_map_create();
        ds_list_add_map( _dest_list, _dest_map );
        
        for( var _key = ds_map_find_first( _src_map ); _key != undefined; _key = ds_map_find_next( _src_map, _key ) ) {
            _dest_map[? _key ] = _src_map[? _key ];
        }
    }
    
}
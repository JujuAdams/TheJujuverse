/// @desc Creates a new EDITOR node property and adds it to a node
/// @param node_map
/// @param object

var _root_map = argument0;
var _object   = (( argument1 != undefined) && object_exists( argument1 ))? object_get_name( argument1 ) : "<null>";

var _src_list = global.editor_object_properties_map[? _object ];
if ( _src_list == undefined ) {
    trace_error( false, "No object properties exist for ", _object, " (", argument1, ")" );
    exit;
}
var _dest_list = _root_map[? "##properties" ];

var _size = ds_list_size( _src_list );
for( var _i = 0; _i < _size; _i++ ) {
    
    var _dest_map = ds_map_create();
    ds_list_add_map( _dest_list, _dest_map );
    
    var _src_map = _src_list[| _i ];
    for( var _key = ds_map_find_first( _src_map ); _key != undefined; _key = ds_map_find_next( _src_map, _key ) ) _dest_map[? _key ] = _src_map[? _key ];
    
}
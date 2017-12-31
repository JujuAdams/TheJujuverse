/// @description TRACKER list nesting inside map
/// @param id
/// @param key
/// @param value

var _id    = argument0;
var _key   = argument1;
var _value = argument2;

if ( TRACKER_ON ) {
    
    var _root_list = global.tracker_map_nested_lists[? _id ];
    if ( _root_list == undefined ) {
        tr_map_add_list( global.tracker_map_nested_maps , _id, tr_list_create( "map " + string( _id ) + " nested maps"  , false ) );
        tr_map_add_list( global.tracker_map_nested_lists, _id, tr_list_create( "map " + string( _id ) + " nested lists" , false ) );
        _root_list = global.tracker_map_nested_lists[? _id ];
    }
    
    if ( _root_list >= 0 ) ds_list_add( _root_list, _value );
    
}

ds_map_add_list( _id, _key, _value );

return _value;
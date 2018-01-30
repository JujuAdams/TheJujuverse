/// @description Removes TRACKER nested map inside map
/// @param id
/// @param key

var _id  = argument0;
var _key = argument1;

if ( TRACKER_ON ) {
    
    var _root_list = global.tracker_map_nested_lists[? _id ];
    if ( _root_list == undefined ) {
        trace_error( false, "Map ", _id, " has no nested lists" );
    } else {
        var _value = _id[? _key ];
        if ( _value == undefined ) {
            trace_error( false, "Cannot find key ", QU, _key, QU, " in map ", _id );
        } else {
            ds_list_delete( _root_list, ds_list_find_index( _root_list, _id[? _key ] ) );
        }
    }
    
}

_id[? _key ] = undefined;
ds_map_delete( _id, _key );
/// @description Verifies that a control mapping contains all necessary values
/// @param map

var _map = argument0;

var _size = ds_list_size( global.control_master_list );
for( var _i = 0; _i < _size; _i++ ) {
    if ( _map[? global.control_master_list[| _i ] ] == undefined ) {
        trace_error( false, "<", global.control_master_list[| _i ], "> not found in map ", _map, "\nControl map not verified!" );
        return false;
    }
}
return true;
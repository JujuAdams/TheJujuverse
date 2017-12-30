///@param list
///@param old_value
///@param new_value
///@param all

if ( argument3 ) {
    
    var _index = ds_list_find_index( argument0, argument1 );
    while ( _index >= 0 ) {
        argument0[| _index ] = argument2;
        _index = ds_list_find_index( argument0, argument1 );
    }
    
} else {
    
    var _index = ds_list_find_index( argument0, argument1 );
    if ( _index >= 0 ) argument0[| _index ] = argument2;
    
}
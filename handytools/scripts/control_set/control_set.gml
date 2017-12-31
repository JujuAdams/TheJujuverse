/// @description Sets the state of an action for a particular player
/// @param player
/// @param action
/// @param [action...]
/// @param value

var _ds = obj_controls.controls_list;

for( var _i = 0; _i < argument_count - 2; _i++ ) {
    
    if ( is_real( argument[_i] ) ) {
        _ds = ds_list_find_value( _ds, argument[_i] );
    } else if ( is_string( argument[_i] ) ) {
        _ds = ds_map_find_value( _ds, argument[_i] );
    } else {
        _ds = undefined;
        break;
    }
    
}

if ( !is_undefined( _ds ) ) {
    if ( is_real( argument[argument_count - 2] ) ) {
        ds_list_replace( _ds, argument[argument_count - 2], argument[argument_count - 1] );
    } else {
        ds_map_replace( _ds, argument[argument_count - 2], argument[argument_count - 1] );
    }
}
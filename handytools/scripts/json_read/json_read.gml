///@param json
///@param key...

var _ds = argument[0];

for( var _i = 1; _i < argument_count; _i++ ) {
    
    if ( is_real( argument[_i] ) ) {
        _ds = ds_list_find_value( _ds, argument[_i] );
    } else if ( is_string( argument[_i] ) ) {
        _ds = ds_map_find_value( _ds, argument[_i] );
    } else {
        _ds = undefined;
        break;
    }
    
}

return _ds;
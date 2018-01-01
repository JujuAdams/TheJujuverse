/// @description Sets a value in a JSON (using a more convenient syntax!)
/// @param json
/// @param key...
/// @param ...value

var _ds = argument[0];

for( var _i = 1; _i < argument_count - 2; _i++ ) {
    
    if ( is_real( argument[_i] ) ) {
        _ds = _ds[| argument[_i] ];
    } else if ( is_string( argument[_i] ) ) {
        _ds = _ds[? argument[_i] ];
    } else {
        _ds = undefined;
        break;
    }
    
}

if ( !is_undefined( _ds ) ) {
    if ( is_real( argument[argument_count - 2] ) ) {
        _ds[| argument[argument_count - 2] ] = argument[argument_count - 1];
    } else {
        _ds[? argument[argument_count - 2] ] = argument[argument_count - 1];
    }
}
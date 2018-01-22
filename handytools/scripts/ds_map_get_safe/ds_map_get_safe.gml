/// @param map
/// @param key
/// @param [default]

if ( argument_count == 2 ) {
    var _map = argument[0];
    var _value = _map[? argument[1] ];
    return ( _value == undefined )? false : _value;
} else if ( argument_count == 3 ){
    var _map = argument[0];
    var _value = _map[? argument[1] ];
    return ( _value == undefined )? argument[2] : _value;
} else {
    trace_error( false, "Unsupported number of arguments! (", argument_count, ")" );
    return undefined;
}
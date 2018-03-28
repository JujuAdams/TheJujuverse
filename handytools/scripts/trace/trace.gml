/// @description TRACE general-purpose output (safe for non-string arguments)
/// @param value
/// @param [value...]

if ( TRACE_ON ) {
    var _str = "";
    for( var _i = 0; _i < argument_count; _i++ ) _str += string_ext( argument[_i] );
    
    if ( TRACE_CACHE_MESSAGES ) {
        var _time = global.trace_cache_map[? _str ];
        if ( ( _time != undefined ) && !time_has_passed( _time, TRACE_CACHE_TIMEOUT ) ) return "";
        global.trace_cache_map[? _str ] = current_time;
    }
    
    __trace_master( _str );
    return _str;
}
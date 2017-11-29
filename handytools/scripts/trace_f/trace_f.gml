///@param value
///@param [value...]
//
// Used for generic debugging. Forced on at all times

var _str = "";
for( var _i = 0; _i < argument_count; _i++ ) _str += string_ext( argument[_i] );
__trace_master( _str );
return _str;
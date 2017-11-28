///@param value
///@param [value...]
//
// Used for bug tracking given its greater information content. Forced on at all times

var _str = CURRENT_TIME_PADDED + "   " + object_get_name( object_index ) + ":" + string( id ) + "      ";
for( var _i = 0; _i < argument_count; _i++ ) _str += string_ext( argument[_i] );
show_debug_message( _str );
return _str;
///@param value
///@param [value...]
//
// Used for bug tracking given its greater information content

if ( TRACE_SHOW ) {
	var _str = CURRENT_TIME_PADDED + TRACE_DEFAULT_DIVIDER + object_get_name( object_index ) + ":" + string( id ) + TRACE_DEFAULT_DIVIDER;
	for( var _i = 0; _i < argument_count; _i++ ) _str += string_ext( argument[_i] );
	show_debug_message( _str );
	return _str;
}
///@param value
///@param [value...]
//
// Used for bug tracking given its greater information content

if ( TRACE_ON ) {
	var _str = CURRENT_TIME_PADDED + TRACE_DIV + object_get_name( object_index ) + ":" + string( id ) + TRACE_DIV;
	for( var _i = 0; _i < argument_count; _i++ ) _str += string_ext( argument[_i] );
	__trace_master( _str );
	return _str;
}
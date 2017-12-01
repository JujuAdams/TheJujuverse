///@param value
///@param [value...]
//
// Used for generic debugging when a pop-up is needed

if ( TRACE_SHOW ) {
	var _str = "";
	for( var _i = 0; _i < argument_count; _i++ ) _str += string_ext( argument[_i] );
	__trace_master( CURRENT_TIME_PADDED + TRACE_DEFAULT_DIVIDER + object_get_name( object_index ) + ":" + string( id ) + " <LOUD>" + TRACE_DEFAULT_DIVIDER + _str );
	show_message( _str );
	return _str;
}
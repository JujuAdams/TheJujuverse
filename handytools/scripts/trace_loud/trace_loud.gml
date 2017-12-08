///@param value
///@param [value...]
//
// Used for generic debugging when a pop-up is needed

if ( TRACE_ON ) {
	var _str = "";
	for( var _i = 0; _i < argument_count; _i++ ) _str += string_ext( argument[_i] );
	__trace_master( CURRENT_TIME_PADDED + TRACE_DIV + object_get_name( object_index ) + ":" + string( id ) + " <LOUD>" + TRACE_DIV + _str );
	show_message( _str );
	return _str;
}
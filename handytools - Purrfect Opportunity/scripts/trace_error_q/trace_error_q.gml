///@param abort
///@param value
///@param [value...]
//
// Used to report serious errors that should be amended for production, though without a pop-up

if ( TRACE_SHOW ) {
	var _str = "";
	for( var _i = 1; _i < argument_count; _i++ ) _str += string_ext( argument[_i] );
	trace_v( "ERROR", TRACE_DEFAULT_DIVIDER, string_replace_all( _str, NL, TRACE_DEFAULT_DIVIDER ) );
	return _str;
}
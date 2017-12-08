///@param abort
///@param value
///@param [value...]
//
// Used to report serious errors that should be amended for production

var _abort = is_real(argument[0])?argument[0]:false;
var _start = is_real(argument[0])?1:0;
	
if ( TRACE_SHOW_ERROR ) {
	var _str = "";
	for( var _i = _start; _i < argument_count; _i++ ) _str += string_ext( argument[_i] );
	trace_v( "ERROR", TRACE_DIV, string_replace_all( _str, NL, TRACE_DIV ) );
	show_error( _str + NL + " ", _abort );
	return _str;
} else if ( TRACE_ON ) {
	var _str = "";
	for( var _i = _start; _i < argument_count; _i++ ) _str += string_ext( argument[_i] );
	trace_v( "ERROR", TRACE_DIV, string_replace_all( _str, NL, TRACE_DIV ) );
	return _str;
}
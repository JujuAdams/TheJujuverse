/// @param key
/// @param [default]
/// @param [no_error]

var _no_error = !ERROR_KEY_NOT_FOUND || ((argument_count >= 3) && (argument[2] == true));

var _value = global.options_json[? argument[0] ];
if ( _value == undefined ) {
	if ( !_no_error ) trace_error( false, "key not found in global options (", argument[0], ")" );
	if ( argument_count >= 2 ) return argument[1];
	_value = options_get_default( argument[0] );
}
return _value;
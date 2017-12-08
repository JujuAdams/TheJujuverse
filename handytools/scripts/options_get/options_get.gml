/// @param key
/// @param [default]

var _value = global.options_json[? argument[0] ];
if ( _value == undefined ) {
	if ( ERROR_KEY_NOT_FOUND ) trace_error( false, "key not found in global options (", argument0, ")" );
	if ( argument_count > 1 ) return argument[1]
	_value = options_get_default( argument[0] );
}
return _value;
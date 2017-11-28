/// @param key
/// @param [default]

if ( argument_count == 2 ) {
	var _value = global.options_json[? argument[0] ];
	if ( _value == undefined ) return argument[1] else return _value;
} else if ( argument_count == 1 ) {
	var _value = global.options_json[? argument[0] ];
	if ( !RELEASE ) and ( _value == undefined ) trace_error( "key not found (" + string( argument[0] ) + "), and no default value provided", false );
	return _value;
} else {
	trace_error( "incorrect number of arguments (" + string( argument_count ) + ")", false );
	return undefined;
}
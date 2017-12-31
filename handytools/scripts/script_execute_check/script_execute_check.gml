/// @param script

var _script = is_string( argument0 ) ? script_get_name( argument0 ) : argument0;

if ( script_exists( _script ) ) return script_execute( _script );
trace_error( "script ", QU, argument0, QU, " does not exist!" );
return undefined;
/// @param value
/// @param a
/// @param b
/// @param limit

var _t = ( argument0 - argument1 ) / ( argument2 - argument1 );
if ( argument3 ) _t = clamp( _t, 0, 1 );
return _t;
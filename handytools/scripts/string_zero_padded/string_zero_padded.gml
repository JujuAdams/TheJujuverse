/// @param value
/// @param zeros

var _value = argument0;
var _zeros = argument1;

var _str = string( _value );
repeat( _zeros - string_length( _str ) ) _str = "0" + _str;

return _str;
/// @param array
/// @param separator
/// @param indent

var _array     = argument[0];
var _separator = (( argument_count < 2 ) || ( argument[1] == undefined ))? NL   : argument[1];
var _indent    = (( argument_count < 3 ) || ( argument[2] == undefined ))? "  " : argument[2];

var _string = "";
var _size = array_length_1d( _array )-1;
for( var _i = _size-1; _i >= 1; _i-- ) {
    repeat( _size-_i-1 ) _string += _indent;
    _string += string( _array[ _i ] ) + ((_i > 1)? _separator : "");
}
return _string;
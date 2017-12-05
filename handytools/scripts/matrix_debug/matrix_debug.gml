///@param matrix

var _matrix = argument0;

var _str = "[ ";
_str += string_format( _matrix[ 0], 1, 5 ) + ", ";
_str += string_format( _matrix[ 1], 1, 5 ) + ", ";
_str += string_format( _matrix[ 2], 1, 5 ) + ", ";
_str += string_format( _matrix[ 3], 1, 5 ) + "," + NL;

_str += "  ";
_str += string_format( _matrix[ 4], 1, 5 ) + ", ";
_str += string_format( _matrix[ 5], 1, 5 ) + ", ";
_str += string_format( _matrix[ 6], 1, 5 ) + ", ";
_str += string_format( _matrix[ 7], 1, 5 ) + "," + NL;

_str += "  ";
_str += string_format( _matrix[ 8], 1, 5 ) + ", ";
_str += string_format( _matrix[ 9], 1, 5 ) + ", ";
_str += string_format( _matrix[10], 1, 5 ) + ", ";
_str += string_format( _matrix[11], 1, 5 ) + "," + NL;

_str += "  ";
_str += string_format( _matrix[12], 1, 5 ) + ", ";
_str += string_format( _matrix[13], 1, 5 ) + ", ";
_str += string_format( _matrix[14], 1, 5 ) + ", ";
_str += string_format( _matrix[15], 1, 5 ) + " ]";

return _str;
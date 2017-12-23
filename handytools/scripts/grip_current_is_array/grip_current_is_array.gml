///@param array

var _size = array_length_1d( argument0 );
var _current = grip_get_current();
for( var _i = 0; _i < _size; _i++ ) if ( argument0[_i] == _current ) return true;
return false;
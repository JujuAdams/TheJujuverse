/// @description Returns if the current GRIP camera name is found in an array
/// @param array

if ( !GRIP_ON ) return false;

var _size = array_length_1d( argument0 );
var _current = grip_current();
for( var _i = 0; _i < _size; _i++ ) if ( argument0[_i] == _current ) return true;
return false;
///@param array
///@param value

var _size = array_length_1d( argument0 );
for( var _i = 0; _i < _size; _i++ ) if ( argument0[_i] == argument1 ) return _i;
return -1;
/// @param id
/// @param object

var _size = instance_number( argument1 );
for( var _i = 0; _i < _size; _i++ ) if ( instance_find( argument1, _i ) == argument0 ) return _i;
return noone;
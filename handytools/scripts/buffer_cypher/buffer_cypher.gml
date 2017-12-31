/// @param buffer
/// @param size
/// @param seed

var _buffer = argument0;
var _size   = argument1;
var _seed   = argument2;

var _old_seed = random_get_seed();
random_set_seed( _seed );
for( var _i = 0; _i < _size; _i++ ) buffer_poke( _buffer, _i, buffer_u8, irandom( 255 ) ^ buffer_peek( _buffer, _i, buffer_u8 ) );
random_set_seed( _old_seed );
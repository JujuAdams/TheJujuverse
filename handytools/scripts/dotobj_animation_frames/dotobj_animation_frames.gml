/// @param animation_or_array

var _animation = argument0;

if ( is_array( _animation ) ) {
	var _array = _animation;
} else {
	var _array = dotobj_animation[? _animation ];
	if ( _array == undefined ) return 0;
}

return ( array_length_1d( _array ) - DOTOBJ_ANIMATION_METADATA.SIZE ) / 2;
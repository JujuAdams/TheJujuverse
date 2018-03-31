/// @param container
/// @param animation
/// @param [speed]
/// @param [end_animation]

var _container  = argument[0];
var _animation  = argument[1];
var _speed      = ((argument_count<3) || (argument[2]==undefined))?          1 : argument[2];
var _transition = ((argument_count<4) || (argument[3]==undefined))? _animation : argument[3];

if ( dotobj_animations[? _animation ] == undefined ) {
	trace_error( false, "Animation ", QU, _animation, QU, " doesn't exist for ", UNIQUE_NAME );
	return false;
}

if ( ds_exists( dotobj_animation_containers, _animation ) ) {
	ds_map_delete( dotobj_animation_containers, _container );
} else {
	ds_list_add( dotobj_animation_containers_index, _container );
}

var _array = dotobj_animations[? _animation ];
_array[ DOTOBJ_ANIMATION_METADATA.NAME       ] = _animation;
_array[ DOTOBJ_ANIMATION_METADATA.TIME       ] = current_time;
_array[ DOTOBJ_ANIMATION_METADATA.INDEX      ] = 0;
_array[ DOTOBJ_ANIMATION_METADATA.SPEED      ] = _speed;
_array[ DOTOBJ_ANIMATION_METADATA.FINISHED   ] = false;
_array[ DOTOBJ_ANIMATION_METADATA.TRANSITION ] = _transition;
dotobj_animation_containers[? _container ] = _array;
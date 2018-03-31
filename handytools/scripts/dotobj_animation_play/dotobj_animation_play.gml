/// @param container
/// @param animation
/// @param [end_animation]

var _container  = argument[0];
var _animation  = argument[1];
var _transition = ((argument_count<3) || (argument[2]==undefined))? _animation : argument[2];

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
_array[ DOTOBJ_ANIMATION_METADATA.TRANSITION ] = 0;
dotobj_animation_containers[? _container ] = _array;
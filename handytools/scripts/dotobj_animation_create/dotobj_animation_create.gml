/// @param name
/// @param [dotobj_model]
/// @param [duration_ms]
/// @param [dotobj_model...]
/// @param [duration_ms...]

if ( !variable_instance_exists( id, "dotobj_animations" ) ) {
	dotobj_animations = tr_map_create( "dotobj animations", false );
}
if ( !variable_instance_exists( id, "dotobj_animation_containers" ) ) {
	dotobj_animation_containers = tr_map_create( "dotobj anim containers", false );
}
if ( !variable_instance_exists( id, "dotobj_animation_containers_index" ) ) {
	dotobj_animation_containers_index = tr_list_create( "dotobj anim containers index", false );
}

var _array;
for( var _i = argument_count-1; _i >= 1; _i-- ) _array[ DOTOBJ_ANIMATION_METADATA.SIZE + _i-1] = argument[_i];

ds_map_add( dotobj_animations, argument[0], _array );
return true;
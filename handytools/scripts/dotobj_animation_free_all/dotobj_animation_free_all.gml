if ( variable_instance_exists( id, "dotobj_animations" ) ) {
	tr_map_destroy( dotobj_animations );
}
if ( variable_instance_exists( id, "dotobj_animation_containers" ) ) {
	tr_map_destroy( dotobj_animation_containers );
}
if ( variable_instance_exists( id, "dotobj_animation_containers_index" ) ) {
	tr_list_destroy( dotobj_animation_containers_index );
}
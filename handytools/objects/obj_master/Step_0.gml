if ( audio_group_is_loaded_all() and !transition_exists() ) {
	trace_f( "Audio groups loaded" );
	master_start_services();
	if ( DEVELOPMENT ) instantiate_protected( obj_editor );
	instantiate_protected( obj_screen );
	instantiate_protected( obj_gameflow );
	room_goto( rm_main );
}
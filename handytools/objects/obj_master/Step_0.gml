if ( audio_group_is_loaded_all() and !transition_exists() ) {
	trace_f( "Audio groups loaded" );
	master_start_services();
	transition( obj_transition_wipe, DEFAULT, DEFAULT, RELEASE?rm_credits:rm_main_menu );
}
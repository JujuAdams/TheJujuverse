if ( audio_group_is_loaded_all() and !transition_exists() ) {
	trace_f( "Audio groups loaded" );
	master_start_services();
	master_start_game();
}
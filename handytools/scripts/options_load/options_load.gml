if ( file_exists( "options.txt" ) ) {
	trace_f( "Loading options.txt" );
	tr_map_set_protect( global.options_json, false );
	tr_map_destroy( global.options_json );
	global.options_json = json_decode( string_load( "options.txt" ) );
	//global.options_json = tr_json_decode( string_load( "options.txt" ), "options", true );
	return true;
}

trace_f( "options.txt not found, no loading possible" );
return false;
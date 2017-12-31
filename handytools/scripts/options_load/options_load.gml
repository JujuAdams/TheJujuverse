/// @description Loads options in from the options.txt file in local storage

if ( file_exists( OPTIONS_FILENAME ) ) {
    trace_f( "Loading options.txt" );
    tr_map_set_protect( global.options_json, false );
    tr_map_destroy( global.options_json );
    global.options_json = json_decode( string_load( OPTIONS_FILENAME ) );
    //global.options_json = tr_json_decode( string_load( "options.txt" ), "options", true );
    return true;
}

trace_f( "options.txt not found, no loading possible" );
return false;
if ( DEVELOPMENT && ALLOW_DATAFILE_COPYING ) {
	trace_error( false, "!!WARNING!!", NL, "Attempting to local storage into source datafiles!", NL, "Abort now if this is an unexpected operation!", NL, "!!WARNING!!", NL, NL, DATAFILES_LOCATION );
	var _backup = string_copy( DATAFILES_LOCATION, 1, string_length( DATAFILES_LOCATION )-1 ) + "_backup\\";
	remove_directory( _backup );
	sleep( 100 );
	copy_directory_recursive( DATAFILES_LOCATION, _backup );
	sleep( 100 );
	remove_directory( DATAFILES_LOCATION );
	sleep( 100 );
	copy_directory_recursive( game_save_id + "datafiles\\", DATAFILES_LOCATION );
	sleep( 100 );
}
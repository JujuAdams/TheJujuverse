if ( DEVELOPMENT && ALLOW_DATAFILE_COPYING ) {
    trace_error( false, "!!WARNING!!", NL, "Attempting to save source datafiles into local storage!", NL, "Abort now if this is an unexpected operation!", NL, "!!WARNING!!", NL, NL, DATAFILES_LOCATION );
    remove_directory( game_save_id + "datafiles\\" );
    copy_directory_recursive( DATAFILES_LOCATION, game_save_id + "datafiles\\" );
}
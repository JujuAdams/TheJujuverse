/// @param source
/// @param destination

var _src  = argument0;
var _dest = argument1;

//if ( directory_exists( _dest ) ) directory_destroy( _dest );
//directory_create( _dest );

file_delete( "batch_finished" );
file_delete( "batch_started" );

var _time_start = current_time;
var _last_ping = 0;
while( !file_exists( "batch_started" ) ) {
    if ( current_time - _last_ping > 100 ) {
        _last_ping = current_time;
        execute_batch_file( concat( "copy NUL \"", game_save_id, "batch_started\"", chr(13), chr(10),
                                    "xcopy \"", _src, "\*\" \"", _dest, "\" /s /e /i /y", chr(13), chr(10),
                                    //"pause", chr(13), chr(10),
                                    "copy NUL \"", game_save_id, "batch_finished\"" ) );
        
    }
}

var _time_start = current_time;
var _last_ping = current_time;
while( ( !file_exists( "batch_finished" ) ) /*or ( current_time - _time_start > 500 ) ) and ( current_time - _time_start < 5000 )*/ ) {
    if ( current_time - _last_ping > 500 ) {
        _last_ping = current_time;
        trace( "copy_directory_recurse (", _src, " || ", _dest, ") waiting for batch to finish" );
    }
}

file_delete( "batch_started" );
file_delete( "batch_finished" );
file_delete( "windev.bat" );
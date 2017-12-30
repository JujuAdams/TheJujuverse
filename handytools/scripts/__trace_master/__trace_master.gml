/// @description TRACE internal function to handle directing debug messages to an internal list
/// @param string

if ( TRACE_TO_GAME_OUTPUT ) {
    ds_list_add( global.master_game_output, argument0 );
    if ( ds_list_size( global.master_game_output ) > GAME_OUTPUT_MAX_MESSAGES ) ds_list_delete( global.master_game_output, 0 );
}

show_debug_message( argument0 );
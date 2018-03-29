enum E_MASTER { PAUSE, INIT, AUDIO, SERVICES, OBJ, FINISHED }

persistent = true;
global.master_game_output = ds_list_create();
global.master_start_time = current_time;
global.master_game_frames = 0;

load_phase = E_MASTER.PAUSE

draw_reset();

if ( room_width  != DEFAULT_WINDOW_WIDTH  )
|| ( room_height != DEFAULT_WINDOW_HEIGHT ) {
    trace_error( false, "Warning! Initial room dimensions (", room_width, ",", room_height, ") are different to configuration (", DEFAULT_WINDOW_WIDTH, ",", DEFAULT_WINDOW_HEIGHT, ")" );
}
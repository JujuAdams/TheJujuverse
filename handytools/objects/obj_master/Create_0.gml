enum E_MASTER { PAUSE, INIT, AUDIO, SERVICES, OBJ, FINISHED }

persistent = true;
global.master_game_output = ds_list_create();
global.master_start_time = current_time;
global.master_game_frames = 0;

load_phase = E_MASTER.PAUSE

draw_reset();
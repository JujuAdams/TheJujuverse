trace_f( "--------------------", NL,
         "    GAME  STARTS", NL,
         "--------------------" );
global.master_start_time = current_time;
global.master_game_frames = 0;

//initialise miscellaneous stuff
randomize();

//initialise graphics
display_reset( 0, true );
window_set_cursor( cr_none );
gpu_set_texfilter( false );

//initialise global services
tracker_init();
control_init();
audio_init();
wan_init();
options_init();
gameflow_init();
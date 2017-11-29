global.master_game_output = ds_list_create();
global.master_start_time = current_time;
global.master_game_frames = 0;

trace_f( "--------------------", NL,
         "    GAME  STARTS", NL,
         "--------------------" );

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

//register our game instance debug output in the tracker
if ( TRACKER_ON ) __tr_list_register( global.master_game_output, "<master game output>", true );

//we have to start the ImGUI service here for some reason?!
imguigml_start_service();
enum E_MASTER_LOAD { INIT, AUDIO, SERVICES, OBJ, FINISHED }

persistent = true;
global.master_game_output = ds_list_create();
global.master_start_time = current_time;
global.master_game_frames = 0;

trace_f( "--------------------", NL,
         "   INITIALISATION", NL,
         "--------------------" );

//initialise miscellaneous stuff
if ( !NO_RANDOMIZE ) randomize();

//initialise graphics
if ( FORCE_VSYNC ) display_reset( 0, true );
if ( FORCE_NO_CURSOR ) window_set_cursor( cr_none );
if ( FORCE_NO_INTERPOLATION ) gpu_set_texfilter( false );

load_phase = E_MASTER_LOAD.INIT;
master_init();

//register our game instance debug output in the tracker
if ( TRACKER_ON ) __tr_list_register( global.master_game_output, "<master game output>", true );
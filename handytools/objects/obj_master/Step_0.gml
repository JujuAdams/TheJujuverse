switch( load_phase ) {
    
    case E_MASTER.PAUSE:
        load_phase = E_MASTER.INIT;
    break;
    
    case E_MASTER.INIT:
        trace_f( "--------------------", NL,
                 "   INITIALISATION", NL,
                 "--------------------" );

        //initialise miscellaneous stuff
        if ( !NO_RANDOMIZE ) randomize();

        //initialise graphics
        if ( FORCE_VSYNC ) display_reset( 0, true );
        if ( FORCE_NO_CURSOR ) window_set_cursor( cr_none );
        if ( FORCE_NO_INTERPOLATION ) gpu_set_texfilter( false );
        
        master_init();

        //register our game instance debug output in the tracker
        if ( TRACKER_ON ) __tr_list_register( global.master_game_output, "<master game output>", true );
        
        load_phase = E_MASTER.SERVICES;
    break;
    
    case E_MASTER.SERVICES:
        trace_f( "--------------------", NL,
                 " STARTING  SERVICES", NL,
                 "--------------------" );
        master_start_services();
        load_phase = E_MASTER.AUDIO;
    break;
    
    case E_MASTER.AUDIO:
        if ( audio_group_is_loaded_all() ) {
            trace_f( "Audio groups loaded" );
            dotobj_load_all_models();
            load_phase = E_MASTER.OBJ;
        }
    break;
    
    case E_MASTER.OBJ:
        if ( !DOTOBJ_ON || ds_map_empty( global.obj_load_map ) ) {
            if ( DOTOBJ_ON ) trace_f( ".obj models loaded, time taken=", global.dotobj_total_time );
            trace_f( "--------------------", NL,
                     "   STARTING  GAME", NL,
                     "--------------------" );
            master_start_game();
            load_phase = E_MASTER.FINISHED;
        }
    break;
    
}

if ( QUIT_ON_ESCAPE && keyboard_check_pressed( vk_escape ) ) game_end();

if ( FORCE_NO_CURSOR && ( !imguigml_any_window_open() || ( editor_is_open() && editor_is_collapsed() ) ) ) {
    window_set_cursor( cr_none );
} else {
    window_set_cursor( cr_default );
}
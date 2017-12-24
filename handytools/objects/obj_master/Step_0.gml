switch( load_phase ) {
	case E_MASTER_LOAD.INIT:
		load_phase = E_MASTER_LOAD.SERVICES;
	break;
	
	case E_MASTER_LOAD.SERVICES:
		trace_f( "--------------------", NL,
		         " STARTING  SERVICES", NL,
		         "--------------------" );
		master_start_services();
		load_phase = E_MASTER_LOAD.AUDIO;
	break;
	
	case E_MASTER_LOAD.AUDIO:
		if ( audio_group_is_loaded_all() ) {
			trace_f( "Audio groups loaded" );
			obj_model_load_all_models();
			load_phase = E_MASTER_LOAD.OBJ;
		}
	break;
	
	case E_MASTER_LOAD.OBJ:
		if ( !OBJ_MODEL_ON || ds_map_empty( global.obj_load_map ) ) {
			if ( OBJ_MODEL_ON ) trace_f( ".obj models loaded, time taken=", global.obj_model_total_time );
			trace_f( "--------------------", NL,
			         "   STARTING  GAME", NL,
			         "--------------------" );
			master_start_game();
			load_phase = E_MASTER_LOAD.FINISHED;
		}
	break;
}

if ( QUIT_ON_ESCAPE && keyboard_check_pressed( vk_escape ) ) game_end();
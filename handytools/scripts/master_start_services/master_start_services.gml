/// @description Master service initialisation
/*
	Note: Services are created in two stages - this is the second stage.
	Service start_service() scripts should instantiate control instances for services.
	Service start_service() scripts may have dependencies, but only on global values defined in service init() scripts
	Service start_service() scripts should report when they're run and their specific master_config() macro is on.
*/

trace( "Creating service instances" );

   tracker_start_service();
  imguigml_start_service();
   control_start_service();
//     audio_start_service();
       wan_start_service();
   options_start_service();
       fps_start_service();
   devtool_start_service();
    rumble_start_service();
     trace_start_service();
resolution_start_service();
      grip_start_service();
    editor_start_service();
 obj_model_start_service();
  scribble_start_service();
transition_start_service();
     jiffy_start_service();

instantiate_protected( obj_gameflow );
instantiate_protected( obj_screen );
unload_current_room();
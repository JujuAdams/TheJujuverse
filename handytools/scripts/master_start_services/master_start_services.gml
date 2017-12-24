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

instantiate_protected( obj_gameflow );
instantiate_protected( obj_screen );
unload_current_room();
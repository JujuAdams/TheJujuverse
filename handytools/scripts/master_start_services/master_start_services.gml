trace( "Starting services" );
devtool_start_service();
//control_start_service();
//audio_start_service();
wan_start_service();
fps_start_service();

instantiate_protected( obj_debug );
instantiate_protected( obj_screen );
instantiate_protected( obj_game );
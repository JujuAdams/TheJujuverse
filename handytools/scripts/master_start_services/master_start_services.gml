trace( "Creating service instances" );

devtool_start_service();
//control_start_service();
//audio_start_service();
wan_start_service();
fps_start_service();
imguigml_start_service();
resolution_start_service();

if ( DEVELOPMENT ) instantiate_protected( obj_editor );
instantiate_protected( obj_screen );
instantiate_protected( obj_gameflow );
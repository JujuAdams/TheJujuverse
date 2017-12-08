window_set_fullscreen( options_get( "fullscreen" ) );
script_execute_safe( RESOLUTION_FULLSCREEN_TOGGLE_SCRIPT );
alarm[1] = 10;
phase = 1;
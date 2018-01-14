/// @description FPS service initialisation

if ( FPS_ON ) {
    trace_f( "FPS" );
    global.fps_show = (DEVELOPMENT && FPS_ON);
    global.fps_mode = E_FPS_MODE.STEP_PLUS_DRAW;
    global.fps_show_graph = true;
}
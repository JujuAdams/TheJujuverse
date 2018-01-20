/// @description FPS configuration

#macro FPS_MAX_SAMPLES 200
#macro FPS_SMOOTHING 0.008
#macro FPS_SHOW_GRAPH true
#macro FPS_TARGET_TIME ((global.fps_mode==E_FPS_MODE.FRAME) ? game_get_speed( gamespeed_microseconds ) : 6000)
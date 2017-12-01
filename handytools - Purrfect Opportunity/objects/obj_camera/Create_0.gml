enum e_camera_state { follow, pan, free, static }

tween_start          = current_time;
tween_duration       = 1000;
tween_t              = 0;
tween_q              = 0;
tween_start_x        = 0;
tween_start_y        = 0;
tween_end_x          = 640;
tween_end_y          = 360;
tween_zoom_do_centre = false;
tween_start_zoom     = 0.5;
tween_centre_zoom    = 0.5;
tween_end_zoom       = 0.5;

cam_init();

/*
test_ping_pong_state = 1;
cam_pan( 512, 384, 1,
         undefined,
		 768, 384, 1,
		 1000, 2000 );
*/
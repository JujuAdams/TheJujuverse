mouse_active_force_colour();
screen_click_handle_fog( global.mirror_render? 128 : 0 );

event_user( DRAW_USER_EVENT );

mouse_active_reset_colour();
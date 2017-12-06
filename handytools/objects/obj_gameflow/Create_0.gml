persistent = true;

vertex_buffer_definitions();

global.do_dither   = true;
global.do_lighting = true;
global.do_noclip   = DEVELOPMENT;

global.menu_page = 0;

global.game_editing = false;
global.game_room = 0;
global.game_swell = SWELL_SIZE*( 0.5 + 0.5*dsin( current_time/SWELL_TIME_FACTOR ) );

global.mouse_dx        = 0;
global.mouse_dy        = 0;
global.mouse_2d_x      = 0;
global.mouse_2d_y      = 0;
global.mouse_locked    = false;
global.mouse_lock_time = current_time;

unload_current_room();

enum e_transition { nothing, new_game, next_room, end_game, menu }
transition_do = true;
transition_t = 1;
transition_speed = 0.014;
transition_direction = -1;
transition_action = e_transition.next_room;
transition_colour = c_black;
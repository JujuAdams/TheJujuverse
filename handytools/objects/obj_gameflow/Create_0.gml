persistent = true;

vertex_buffer_definitions();

global.app_surf_w    = DEFAULT_APP_SURF_W;
global.app_surf_h    = DEFAULT_APP_SURF_H;
global.do_dither     = true && ALLOW_DITHER;
global.do_lighting   = true && ALLOW_LIGHTING;
global.do_noclip     = DEVELOPMENT;
global.do_fly        = DEVELOPMENT;
global.show_click    = false;
global.do_walls      = true;
global.do_ceiling    = true;
global.show_spawners = DEVELOPMENT;
global.do_culling    = DEVELOPMENT;
global.do_fxaa       = false;

global.menu_page = 0;

global.game_room = START_ROOM;
global.game_swell = SWELL_SIZE*( 0.5 + 0.5*dsin( current_time/SWELL_TIME_FACTOR ) );
global.happy_ending = false;

global.mirror_count = 0;
global.mirror_click_count = 0;

global.mouse_dx        = 0;
global.mouse_dy        = 0;
global.mouse_lock_time = current_time;

global.screen_click_render  = false;
global.mirror_render = false;

enum e_transition { nothing, new_game, next_room, end_game, menu }
transition_do = true;
transition_t = 1;
transition_speed = 0.014;
transition_direction = -1;
transition_action = e_transition.next_room;
transition_colour = c_black;
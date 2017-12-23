persistent = true;

global.do_walls      = true;
global.do_ceiling    = true;
global.show_spawners = DEVELOPMENT;

global.menu_page = 0;

global.game_room = START_ROOM;
global.game_swell = SWELL_SIZE*( 0.5 + 0.5*dsin( current_time/SWELL_TIME_FACTOR ) );
global.happy_ending = false;

enum e_transition { nothing, new_game, next_room, end_game, menu }
transition_do = true;
transition_t = 1;
transition_speed = 0.014;
transition_direction = -1;
transition_action = e_transition.next_room;
transition_colour = c_black;
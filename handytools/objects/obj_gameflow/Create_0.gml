event_inherited();

persistent = true;

refresh_wait_time = VERY_NEGATIVE;

global.cassette_grid = tr_grid_create( GRID_W, GRID_H );
global.cassette_selected = undefined;

check_x        = VERY_LARGE;
check_max      = 5;
check_time     = current_time;
check_duration = 1000*4*60/96;
event_inherited();

var _lock_mouse = DEFAULT_LOCK_MOUSE || keyboard_check( vk_shift );
if ( devtool_is_open() ) _lock_mouse = false;
control_set( 0, "mouse", "lock", _lock_mouse );

if ( time_has_passed( check_time, check_duration ) ) {
    check_time = current_time;
    check_x++;
    if ( check_x >= check_max ) check_x = 0;
    for( var _y = 0; _y < GRID_H; _y++ ) perform_match( check_x, _y );
}
var _lock_mouse = DEFAULT_LOCK_MOUSE;
if ( devtool_is_open() ) _lock_mouse = false;
control_set( 0, "mouse", "lock", _lock_mouse );
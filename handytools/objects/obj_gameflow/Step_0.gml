var _lock_mouse = true;
if ( devtool_is_open() || ( editor_is_open() && !editor_is_collapsed()) ) _lock_mouse = false;
control_set( 0, "mouse", "lock", _lock_mouse );
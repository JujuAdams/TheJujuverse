if !( options_get("animations") ) {
	in_tween_start_time = current_time - in_tween_length;
	out_tween_length = 1;
}
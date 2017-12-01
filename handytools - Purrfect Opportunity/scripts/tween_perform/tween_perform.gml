///@param tween_index
///@param force

var _index = argument0;
var _force = argument1;

tween_ping[_index] = false;

var _prev = tween_chain_prev[_index];
if ( _prev != undefined ) {
	if ( !tween_finished[_index] and tween_finished[_prev] ) tween_do[_index] = true;
}

if ( _force or tween_do[_index] ) {
	
	tween_t[_index] = ( current_time - tween_start_time[_index] ) / tween_length[_index];
	if ( tween_clamp ) tween_t[_index] = clamp( tween_t[_index], 0, 1 );
	
	if ( tween_t[_index] >= 1 ) {
		tween_do[_index] = false;
		tween_finished[_index] = true;
		tween_ping[_index] = true;
	}
	
	return true;
	
}

return false;
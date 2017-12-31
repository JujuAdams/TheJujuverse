/// @param tween_index
/// @param do
/// @param start_time
/// @param length

if ( !variable_instance_exists( id, "tween_count" ) ) tween_init( TWEEN_DEFAULT_CLAMP );

tween_do[argument0]         = (argument1 != undefined)? argument1 : false;
tween_start_time[argument0] = (argument2 != undefined)? argument2 : 0;
tween_length[argument0]     = (argument3 != undefined)? argument3 : TWEEN_DEFAULT_LENGTH;
tween_t[argument0]          = 0;
tween_finished[argument0]   = false;
tween_ping[argument0]       = false;
tween_chain_prev[argument0] = undefined;

tween_count = array_length_1d( tween_do );

tween_latest_time  = tween_start_time[argument0] + tween_length[argument0];
tween_latest_index = argument0;

return tween_count-1;
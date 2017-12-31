/// @param clamp

tween_do         = [];
tween_start_time = [];
tween_length     = [];
tween_t          = [];
tween_finished   = [];
tween_ping       = [];
tween_chain_prev = [];

tween_count        = 0;
tween_latest_index = undefined;
tween_latest_time  = VERY_NEGATIVE;

tween_clamp = (argument0!=undefined)? argument0 : TWEEN_DEFAULT_CLAMP;
///@param object
///@param in_time
///@param out_time
///@param destination_room

if ( TRANSITION_DEBUG ) trace_v( object_get_name( argument0 ), " does ", transition_get_name( room ), ",", argument1, "ms --> ", argument2, "ms,", transition_get_name( argument3 ) );

with( instantiate( argument0 ) ) {
	
	tween_init( tween_clamp );
	tween_define(       TWEEN_IN  , true     , current_time, (argument1 != undefined)? argument1 : TRANSITION_DEFAULT_DURATION );
	tween_define_chain( TWEEN_LAST, TWEEN_NEW,               (argument2 != undefined)? argument2 : TRANSITION_DEFAULT_DURATION );
	
	target_room = (argument3 == TRANSITION_RETURN)? global.transition_previous_room : argument3;
	global.transition_previous_room = room;
	
	event_user( TRANSITION_POSTCREATE_EVENT );
	
}

tween_define(       TWEEN_IN  , true     , current_time, TRANSITION_DEFAULT_DURATION );
tween_define_chain( TWEEN_LAST, TWEEN_NEW,               TRANSITION_DEFAULT_DURATION );
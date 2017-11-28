depth = -10000;
persistent = true;

target_room = room;

tween_init( false );
tween_define(       TWEEN_IN  , true     , current_time, TRANSITION_DEFAULT_DURATION );
tween_define_chain( TWEEN_LAST, TWEEN_NEW, TRANSITION_DEFAULT_DURATION );

transitioned = false;
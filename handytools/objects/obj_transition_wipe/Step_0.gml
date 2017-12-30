event_inherited();

var _update = tween_perform( TWEEN_IN, false );
if ( _update ) {
    x = tween_lerp( TWEEN_IN, room_width, 0 );
    if ( tween_ping[TWEEN_IN] ) {
        transitioned = true;
        if ( !room_exists( target_room ) ) game_end() else room_goto( target_room );
    }
}

var _update = tween_perform( TWEEN_OUT, false );
if ( _update ) {
    x = tween_lerp( TWEEN_OUT, 0, -2*room_width );
    if ( tween_ping[TWEEN_OUT] ) tr_instance_destroy();
}
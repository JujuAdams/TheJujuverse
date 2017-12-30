if ( TIMED_SPRITE ) {
    var _t = get_timer();
    draw_sprite( argument0, argument1, argument2, argument3 );
    _t = get_timer() - _t;
    if ( _t > TIMED_SPRITE_THRESHOLD ) trace_v( "JIT sprite fetch for ", sprite_get_name( argument0 ), "/", argument1 );
} else {
    draw_sprite( argument0, argument1, argument2, argument3 );
}
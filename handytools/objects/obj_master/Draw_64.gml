if ( room == rm_init ) {
    var _string = "";
    repeat( 1 + ( current_time mod 300 ) div 100 ) _string += ".";
    draw_text( 10, 10, "Loading" + _string );
}
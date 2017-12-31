/// @param [colour]
/// @param [alpha]

if ( argument_count == 1 ) {
    draw_clear_alpha( argument[0], 1 );
} else if ( argument_count == 2 ) {
    draw_clear_alpha( argument[0], argument[1] );
} else {
    draw_clear_alpha( c_black, 0 );
}
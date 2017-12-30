/// @param x              0
/// @param y              1
/// @param string          2
/// @param xscale          3
/// @param yscale          4
/// @param angle          5
/// @param colour          6
/// @param shadow_colour  7

draw_set_colour( argument7 );
draw_text_transformed( argument0+1, argument1+1, argument2, argument3, argument4, argument5 );
draw_set_colour( argument6 );
draw_text_transformed( argument0, argument1, argument2, argument3, argument4, argument5 );
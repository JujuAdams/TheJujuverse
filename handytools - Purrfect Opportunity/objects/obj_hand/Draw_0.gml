draw_set_colour( c_black );

if ( player_index == 0 ) var _colour = PLAYER_A_COLOUR_DARK else var _colour = PLAYER_B_COLOUR_DARK;
draw_hand_path( _colour, 10 );

if ( player_index == 0 ) var _colour = PLAYER_A_COLOUR_LIGHT else var _colour = PLAYER_B_COLOUR_LIGHT;
draw_hand_path( _colour, 8 );

draw_self();

if ( !is_ai ) and ( free ) and ( y > obj_barrier_line.y ) {
	var _hand_scale = 0.75;
	draw_sprite_ext( spr_hand_left , left_pressed_timer  > 0, x - 50, y - 10, _hand_scale, _hand_scale, 0, _colour, 1 );
	draw_sprite_ext( spr_hand_right, right_pressed_timer > 0, x + 50, y - 10, _hand_scale, _hand_scale, 0, _colour, 1 );
}
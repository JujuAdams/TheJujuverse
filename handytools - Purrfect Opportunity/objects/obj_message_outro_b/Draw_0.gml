draw_self();

if ( sprite_index == spr_bubble_a ) var _colour = PLAYER_A_COLOUR_LIGHT else var _colour = PLAYER_B_COLOUR_LIGHT;

draw_set_colour( c_black );
draw_set_halign( fa_center );
draw_set_valign( fa_middle );
draw_set_font( fnt_atari_30 );
draw_text_transformed_shadow( x, y, "RUN", image_xscale, image_yscale, -6, c_black, _colour );
draw_set_font( fnt_default );
draw_set_halign( fa_left );
draw_set_valign( fa_top );
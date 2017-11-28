draw_self();

draw_set_colour( c_black );
draw_set_halign( fa_center );
draw_set_valign( fa_middle );
draw_set_font( fnt_atari_20 );
draw_text_transformed_shadow( x, y, "I'VE ALWAYS\nWANTED TO FUSS\nHIS BELLY!", image_xscale, image_yscale, 4, c_black, PLAYER_B_COLOUR_LIGHT );
draw_set_font( fnt_default );
draw_set_halign( fa_left );
draw_set_valign( fa_top );
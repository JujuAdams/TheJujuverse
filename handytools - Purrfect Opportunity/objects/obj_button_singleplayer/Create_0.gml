event_inherited();

text    = "OFFLINE GAME";
font    = fnt_test;
h_align = fa_left;
v_align = fa_top;

draw_colour = c_white;
draw_font = font;

button_size_to_sprite_font();

tween_add( false, 0, 0 );
tween_add( false, 0, 0 );
tween_check_instant();
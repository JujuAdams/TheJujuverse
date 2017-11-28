event_inherited();

text    = "@jujuadams - Team Lead";
font    = fnt_test;
h_align = fa_left;
v_align = fa_top;

draw_colour = c_white;
draw_font = font;

button_size_to_sprite_font();

in_tween            = true;
in_tween_start_time = 0; //current_time + 700;
in_tween_length     = 0; //600;
in_tween_t          = 0;

out_tween            = false;
out_tween_start_time = 0;
out_tween_length     = 0; //800;
out_tween_t          = 0;

tween_check_instant();
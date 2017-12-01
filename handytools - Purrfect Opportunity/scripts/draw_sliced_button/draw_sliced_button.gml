/// @param x
/// @param y
/// @param width
/// @param text


var _x = argument0;
var _y = argument1;
var _width = argument2;
var _text = argument3;
var _over = false;
var _lift = 0;

if ( _width == undefined ) {
	draw_set_font( font );
	_width = string_width( text );
	draw_set_font( fnt_default );
}

if (variable_instance_exists(id, "mouse_over")) {
	_over = variable_instance_get(id, "mouse_over");
	
	if (_over) {
		_lift = 2;
	}
}

draw_sprite_ext(spr_button_left, -1, _x, _y + 2, 1, 1, 0, $240803, 1);
draw_sprite_stretched_ext(spr_button_center, -1, _x + sprite_get_width(spr_button_left), _y + 2, _width, sprite_get_height(spr_button_center), $240803, 1);
draw_sprite_ext(spr_button_right, -1, _x + sprite_get_width(spr_button_left) + _width, _y + 2, 1, 1, 0, $240803, 1);

draw_sprite(spr_button_left, -1, _x, _y - _lift);
draw_sprite_stretched(spr_button_center, -1, _x + sprite_get_width(spr_button_left), _y - _lift, _width, sprite_get_height(spr_button_center));
draw_sprite(spr_button_right, -1, _x + sprite_get_width(spr_button_left) + _width, _y - _lift);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_set_colour($240803);
draw_set_font(fnt_atari_12);

draw_text(
	(_x + sprite_get_width(spr_button_left) + _x + sprite_get_width(spr_button_left) + _width) div 2,
	(_y + _y + sprite_get_height(spr_button_center)) div 2 - 1 - _lift,
	_text
);

draw_set_font(fnt_default);

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_colour(c_black);
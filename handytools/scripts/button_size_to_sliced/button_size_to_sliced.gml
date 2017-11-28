var _wl = sprite_get_width(spr_button_left);
var _wr = sprite_get_width(spr_button_right);
var _h = sprite_get_height(spr_button_center);

var _width = 100;

if ( argument_count == 1 ) {
	if ( argument[0] == undefined ) {
		draw_set_font( font );
		_width = string_width( text );
		draw_set_font( fnt_default );
	} else {
		_width = argument[0];
	}
}

mouse_bbox_top = y;
mouse_bbox_bottom = y + _h;

mouse_bbox_left = x;
mouse_bbox_right = x + _wl + _wr + _width;
/*
draw_set_font( font );
var _w = string_width( text );
var _h = string_height( text );

if ( h_align == fa_left ) {
	mouse_bbox_left   = x;
	mouse_bbox_right  = x + _w;
} else if ( h_align = fa_right ) {
	mouse_bbox_left   = x - _w;
	mouse_bbox_right  = x;
} else {
	mouse_bbox_left   = x - _w/2;
	mouse_bbox_right  = x + _w/2;
}

if ( v_align == fa_top ) {
	mouse_bbox_top    = y;
	mouse_bbox_bottom = y + _h;
} else if ( v_align = fa_bottom ) {
	mouse_bbox_top    = y - _h;
	mouse_bbox_bottom = y;
} else {
	mouse_bbox_top    = y - _h/2;
	mouse_bbox_bottom = y + _h/2;
}
*/
///Draw GUI

var _w = display_get_gui_width();
var _h = display_get_gui_height();

draw_set_halign( fa_center );
draw_set_valign( fa_middle );
draw_set_alpha( alpha_t );
draw_set_font( fnt_subtitle );
draw_set_colour( c_black );
draw_text_ext( 2+_w*0.5, 2+_h*0.5, text, 40, _w );
draw_set_colour( c_white );
draw_text_ext( 1+_w*0.5, 1+_h*0.5, text, 40, _w );
draw_set_halign( fa_left );
draw_set_valign( fa_top );
draw_set_font( fnt_default );
draw_set_alpha( 1 );
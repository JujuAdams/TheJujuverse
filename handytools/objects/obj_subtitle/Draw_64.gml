var _w = display_get_gui_width();
var _h = display_get_gui_height();
scribble_draw( 2+_w*0.5, 2+_h*0.5, scribble, c_black, UD, (alpha_direction >= 0)? alpha_t : 2-alpha_t );
scribble_draw( 1+_w*0.5, 1+_h*0.5, scribble, c_white, UD, (alpha_direction >= 0)? alpha_t : 2-alpha_t );
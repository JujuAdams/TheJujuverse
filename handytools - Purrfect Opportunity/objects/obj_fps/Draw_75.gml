timer = get_timer() - timer;
smoothed_timer = lerp( smoothed_timer, timer, 0.008 );

var _str = "render time =" + string_format( timer, 4, 0 ) + "us // smoothed = " + string_format( smoothed_timer, 4, 0 ) + "us";
if ( instance_exists( obj_shooter ) ) _str += "     " + string( obj_shooter.state );
_str += "     " + gameflow_mode_string();

draw_set_font( fnt_consolas );
draw_set_valign( fa_bottom );
draw_set_colour( c_white );
draw_text( 11, display_get_gui_height()- 9, _str );
draw_set_colour( c_black );
draw_text( 10, display_get_gui_height()-10, _str );
draw_set_valign( fa_top );
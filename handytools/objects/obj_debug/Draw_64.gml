var _disp_w = display_get_gui_width();
var _disp_h = display_get_gui_height();

draw_set_font( fnt_default );
draw_set_color( c_white );

if ( global.game_editing ) {
    
    with( obj_screen ) {
        var _str = "ID=" + string( click_instance_over );
        with( click_instance_over ) {
            _str += "#" + object_get_name( object_index );
            _str += "#X=" + string( x );
            _str += "#Y=" + string( y );
            _str += "#Z=" + string( z );
            _str += "#ANGLE=" + string( image_angle );
        }
    } 
    
    draw_set_halign( fa_right );
    draw_set_valign( fa_bottom );
    draw_set_colour( c_black );
    draw_text( _disp_w- 9, _disp_h- 9, _str );
    draw_set_colour( c_white );
    draw_text( _disp_w-10, _disp_h-10, _str );
    draw_set_halign( fa_left );
    draw_set_valign( fa_top );
    
}

var _str = "";
if ( global.game_editing ) {
    
    _str += "FPS=" + string_format( fps, 4, 0 ) + "  ";
    _str += "##[TAB] TOOL="
    switch( global.debug_tool ) {
        case e_tool.place:  _str += "PLACE";  break;
        case e_tool.select: _str += "SELECT"; break;
        case e_tool.move:   _str += "MOVE";   break;
        case e_tool.rotate: _str += "ROTATE"; break;
        case e_tool.delete: _str += "DELETE"; break;
    }
    
    _str += "##FRAME TIME=" + string_format( obj_screen.smoothed_timer, 4, 0 ) + "us";
    _str += "#[2] = LIGHTS";
    _str += "#[3] = DITHERING";
    _str += "#[4] = 3D";
    _str += "#[N/M] = ZOOM IN 2D";
    _str += "#SHIFT = SLOW MOVE";
    _str += "##L.MB = TOGGLE SELECT";
    if ( global.debug_tool != e_tool.place ) _str += "#R.MB = DESELECT ALL" else _str += "#R.MB = CREATE NEW INSTANCE";
    _str += "#CTRL+S = SAVE";
    _str += "#CTRL+L = LOAD";
    _str += "##SHIFT+T = SELECT";
    _str += "#SHIFT+M = MOVE";
    _str += "#SHIFT+R = ROTATE";
    _str += "#SHIFT+BACKSPACE = DELETE";
    _str += "#SHIFT+P = PLACE";
	
}

draw_set_halign( fa_right );
draw_set_colour( c_black );
draw_text( _disp_w- 9, 11, _str );
draw_set_colour( c_white );
draw_text( _disp_w-10, 10, _str );
draw_set_halign( fa_left );
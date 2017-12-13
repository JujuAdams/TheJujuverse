var _disp_w = display_get_gui_width();
var _disp_h = display_get_gui_height();

draw_set_font( fnt_default );
draw_set_color( c_white );

var _str = "";
if editor_is_open() {
    
    _str += "FPS=" + string_format( fps, 4, 0 ) + "  ";
    _str += "\n\n[TAB] TOOL="
    switch( global.debug_tool ) {
        case e_tool.place:  _str += "PLACE";  break;
        case e_tool.select: _str += "SELECT"; break;
        case e_tool.move:   _str += "MOVE";   break;
        case e_tool.rotate: _str += "ROTATE"; break;
        case e_tool.delete: _str += "DELETE"; break;
    }
    
    _str += "\n\nFRAME TIME=" + string_format( obj_screen.smoothed_timer, 4, 0 ) + "us";
    _str += "\n[2] = LIGHTS";
    _str += "\n[3] = DITHERING";
    _str += "\n[4] = 3D";
    _str += "\n[N/M] = ZOOM IN 2D";
    _str += "\nSHIFT = SLOW MOVE";
    _str += "\n\nL.MB = TOGGLE SELECT";
    if ( global.debug_tool != e_tool.place ) _str += "\nR.MB = DESELECT ALL" else _str += "\nR.MB = CREATE NEW INSTANCE";
    _str += "\nCTRL+S = SAVE";
    _str += "\nCTRL+L = LOAD";
    _str += "\n\nSHIFT+T = SELECT";
    _str += "\nSHIFT+M = MOVE";
    _str += "\nSHIFT+R = ROTATE";
    _str += "\nSHIFT+BACKSPACE = DELETE";
    _str += "\nSHIFT+P = PLACE";
	
}

draw_set_halign( fa_right );
draw_set_colour( c_black );
draw_text( _disp_w- 9, 11, _str );
draw_set_colour( c_white );
draw_text( _disp_w-10, 10, _str );
draw_set_halign( fa_left );
var _disp_w = display_get_gui_width();
var _disp_h = display_get_gui_height();
var _str = "";
draw_clear( background_colour );
draw_set_colour( C_OFF_WHITE );

switch( global.menu_page ) {
    
    case 0:
        _str = "A Mind Is A Small Place";
        draw_set_halign( fa_center );
        draw_set_font( fnt_intro_large );
        draw_text( _disp_w*0.5, 60, _str );
        
        _str = "Made in 72 hours\nfor the 38th Ludum Dare\n\n'A SMALL WORLD'\n21st-24th April, 2017\n\nRebuilt December 2017";
        draw_set_halign( fa_center );
        draw_set_font( fnt_intro );
        draw_text( _disp_w*0.5, 140, _str );
        
        _str = "MADE BY"
        draw_set_halign( fa_center );
        draw_set_font( fnt_intro_large );
        draw_text( _disp_w*0.5, 360, _str );
        
        draw_set_font( fnt_intro );
        draw_text( _disp_w*0.5, 430, credit_string );
        
        draw_set_halign( fa_center );
        draw_set_font( fnt_intro );
        draw_text( _disp_w*0.5, 660, "Press ENTER to continue" );
    break;
    
    case 1:
        _str = "HELLO!"
        draw_set_halign( fa_center );
        draw_set_font( fnt_intro_large );
        draw_text( _disp_w*0.5, 270, _str );
        
        draw_set_font( fnt_intro );
        _str = "This is a GMS2 port of a jam game rebuilt to utilise the 'handytools' library.";
        draw_text( _disp_w*0.5, 340, _str );
        
        _str = "The code has been tidied up considerably but still bears the scars of rapid development.\nPlease be patient with the code! Everything was written by Juju"
        draw_set_halign( fa_left );
        draw_set_font( fnt_intro );
        var _width = string_width( _str );
        draw_text( _disp_w*0.5 - _width*0.5, 430, _str );
        
        draw_set_halign( fa_center );
        draw_set_font( fnt_intro );
        draw_text( _disp_w*0.5, 660, "Press ENTER to continue" );
    break;
    
    case 2:
        _str = "OUR THANKS TO"
        draw_set_halign( fa_center );
        draw_set_font( fnt_intro_large );
        draw_text( _disp_w*0.5, 200, _str );
        
        draw_set_font( fnt_intro );
        draw_text( _disp_w*0.5, 270, thanks_string + "\n\n(Sorry if we missed anyone)" );
        
        draw_set_halign( fa_center );
        draw_set_font( fnt_intro );
        draw_text( _disp_w*0.5, 660, "Press ENTER to continue" );
    break;
    
    case 3:
        _str  =  "Use WASD to move"
        _str += "\nLEFT CLICK to use items";
        _str += "\n\nPress ESCAPE to pause";
        _str += "\nHold ESCAPE to exit";
        _str += "\nPress F4 to toggle fullscreen";
        draw_set_halign( fa_left );
        draw_set_font( fnt_intro );
        var _width = string_width( _str );
        draw_text( _disp_w*0.5 - _width*0.5, 210, _str );
        
        _str = "PLEASE WEAR HEADPHONES"
        draw_set_halign( fa_center );
        draw_set_font( fnt_intro_large );
        draw_text( _disp_w*0.5, 400, _str );
        
        draw_set_halign( fa_center );
        draw_set_font( fnt_intro );
        draw_text( _disp_w*0.5, 660, "Press ENTER to continue" );
    break;
    
}

draw_set_alpha( 1 );
draw_set_halign( fa_left );
draw_set_valign( fa_top );
draw_set_colour( c_white );
draw_set_font( fnt_default );
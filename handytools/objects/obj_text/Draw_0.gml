//  April 2017
//  Juju Adams
//  julian.adams@email.com
//  @jujuadams
//
//  This code and engine are provided under the Creative Commons "Attribution - NonCommerical - ShareAlike" international license.
//  https://creativecommons.org/licenses/by-nc-sa/4.0/

draw_set_colour( c_white );
draw_set_font( fnt_consolas );

switch( test_mode ) {
    case 0:
        draw_text( 5, 5, "CUSTOM" );
        text_draw( 15, 40, lorem_ipsum_json, 1 /*0.5 + 0.5*dsin( current_time/150 )*/, 0 );
        shader_reset();
    break;
    case 1:
        draw_text( 5, 5, "SCROLLBOX" );
        text_scrollbox_draw( scrollbox_x, scrollbox_y, scrollbox, scrollbox_focus_text );
    break;
}
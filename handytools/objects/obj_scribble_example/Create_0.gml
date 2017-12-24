//  April 2017
//  Juju Adams
//  julian.adams@email.com
//  @jujuadams
//
//  This code and engine are provided under the Creative Commons "Attribution - NonCommerical - ShareAlike" international license.
//  https://creativecommons.org/licenses/by-nc-sa/4.0/

render_time_smoothed = 200;
test_mode = 0;

lorem_ipsum_string = concat( LOREM_IPSUM, "\n\n", LOREM_IPSUM, "\n\n", LOREM_IPSUM, "\n\n", LOREM_IPSUM, "\n\n", LOREM_IPSUM );
lorem_ipsum_json = scribble( lorem_ipsum_string, 800, fnt_consolas, UD, UD, 20, UD, UD );
scribble_set_shader( lorem_ipsum_json, shd_scribble_fade_char, 50 );

/*
var _str = @"This is text.

[$DADA21]This text is coloured with a hex code.
[fa_right]This is justified right.
[fa_centre][fnt_tnr_32]This is[] text [c_blue]in [fnt_verdana_32_bold]various [c_red][fnt_tnr_41]styles.[]

[fa_left]This is a [fnt_verdana_32_bold]line of text[] that is much longer than the (900px) [fnt_verdana_32_bold]maximum width[]. [fnt_tnr_41_italics]It is also possible to insert images [link|unique name|example_do_bork][spr_test][/link].[]

[fa_centre][link|twinned link|example_do_close]Click here to destroy this text[/link]
[fnt_tnr_41](or on the grumpy pug [link|twinned link][spr_test_2][/link])[].";
introduction_text_json = scribble( _str, fnt_verdana_32, c_white, fa_left, 900, 65, fa_left, fa_top );

var _str = "Nothing more to see here!#Made by [link|url|example_open_url]@jujuadams";
outro_text_json = scribble( _str, fnt_verdana_32, c_white, fa_left, 800, 65, fa_left, fa_top );
*/

/*
scrollbox_focus_text = introduction_text_json;
scrollbox = text_scrollbox_create( 940, 500, 30, 30, c_gray );
scrollbox_x = ( room_width  - scrollbox[? "width"  ] ) div 2;
scrollbox_y = ( room_height - scrollbox[? "height" ] ) div 2;
*/
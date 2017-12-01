draw_set_colour( c_black );
draw_set_font( fnt_atari_12 );
draw_text( x, y, "MUSIC " + string_space_padded( floor( options_get( "music" )*100 ), 3 ) + "%" );
draw_set_font( fnt_default );
draw_sprite( sprite_index, 0, x, y );
draw_set_font( fnt_atari_12 );
draw_set_colour( $E0E6F2 );
draw_text( x+29+1, y-5+1, "AI GOES FIRST" );
draw_set_colour( c_black );
draw_text( x+29, y-5, "AI GOES FIRST" );
draw_set_colour( c_white );
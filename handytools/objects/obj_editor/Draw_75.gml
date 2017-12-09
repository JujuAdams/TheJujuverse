surface_set_target( preview_surface );
draw_clear( c_dkgray );
draw_set_font( fnt_default );
draw_set_colour( c_white );
if ( preview_object != undefined ) {
	draw_text( 10, 10, "Preview: " + object_get_pretty_name( preview_object ) );
} else if ( selected_object != undefined ) {
	draw_text( 10, 10, object_get_pretty_name( selected_object ) );
}
draw_set_colour( c_black );
surface_reset_target();
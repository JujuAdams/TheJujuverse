tr_surface_check_auto( view_preview_surface );
surface_set_target( view_preview_surface );
if ( surface_exists( view_surface_id[view_preview] )  ) {
	gpu_set_blendenable( false );
	draw_surface_stretched( view_surface_id[view_preview], 0, 0, surface_get_width( view_preview_surface ), surface_get_height( view_preview_surface ) );
	gpu_set_blendenable( true );
} else {
	draw_clear( c_black );
}
surface_reset_target();
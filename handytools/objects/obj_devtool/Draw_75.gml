
var _name = global.grip_manual_list[| grip_preview ];
if ( _name != undefined ) {
	
	grip_preview_surface = tr_surface_check_auto( grip_preview_surface );
	surface_set_target( grip_preview_surface );

	var _surface = grip_get_surface( _name );
	if ( surface_exists( _surface )  ) {
		gpu_set_blendenable( false );
		draw_surface_stretched( _surface, 0, 0, surface_get_width( grip_preview_surface ), surface_get_height( grip_preview_surface ) );
		gpu_set_blendenable( true );
	} else {
		draw_clear( c_black );
	}
	
	surface_reset_target();
	
}
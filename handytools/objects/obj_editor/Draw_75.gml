if ( editor_is_open() ) {
	#region HEADER
	var _lookat_inst = global.click_instance_over;
	
	draw_set_font( fnt_imgui );
	switch( window_page ) {
		case E_EDITOR_PAGE.PLACE:     draw_text(  80, 15, concat( "PLACE ", object_get_pretty_name( selected_object ) ) ); break;
		case E_EDITOR_PAGE.MOVE:      draw_text( 80, 15, "MOVE"      ); break;
		case E_EDITOR_PAGE.ROTATE:    draw_text( 80, 15, "ROTATE"    ); break;
		case E_EDITOR_PAGE.INSTANCES: draw_text( 80, 15, "INSTANCES" ); break;
		case E_EDITOR_PAGE.DELETE:    draw_text( 80, 15, "DELETE"    ); break;
		case E_EDITOR_PAGE.LIGHT:     draw_text( 80, 15, "LIGHT"     ); break;
	}
	if ( window_collapsed ) {
		if ( show_hints ) {
			switch( window_page ) {
				case E_EDITOR_PAGE.PLACE:     draw_text( 80, 55, "Left Click = Clone" ); draw_text( 80, 75, "Right Click = Spawn" ); break;
				case E_EDITOR_PAGE.MOVE:      draw_text( 80, 55, "Left Click = Select" ); draw_text( 80, 75, "Right Click (hold) = Freeze" ); break;
				case E_EDITOR_PAGE.ROTATE:    draw_text( 80, 55, "Left Click = Select" ); draw_text( 80, 75, "Right Click (hold) = Freeze" ); break;
				case E_EDITOR_PAGE.INSTANCES: draw_text( 80, 55, "Left Click = Select" ); break;
				case E_EDITOR_PAGE.DELETE:    draw_text( 80, 55, "Left Click = Select" ); draw_text( 80, 75, "Right Click = Delete" ); break;
				case E_EDITOR_PAGE.LIGHT:     draw_text( 80, 55, "Left Click = Select" ); break;
			}
		}
		switch( window_page_return ) {
			case E_EDITOR_PAGE.HOME:      draw_text( 80, 35, "Previous: HOME"      ); break;
			case E_EDITOR_PAGE.PLACE:     draw_text( 80, 35, "Previous: PLACE"     ); break;
			case E_EDITOR_PAGE.INSTANCES: draw_text( 80, 35, "Previous: INSTANCES" ); break;
			case E_EDITOR_PAGE.MOVE:      draw_text( 80, 35, "Previous: MOVE"      ); break;
			case E_EDITOR_PAGE.ROTATE:    draw_text( 80, 35, "Previous: ROTATE"    ); break;
			case E_EDITOR_PAGE.DELETE:    draw_text( 80, 35, "Previous: DELETE"    ); break;
			case E_EDITOR_PAGE.LIGHT:     draw_text( 80, 35, "Previous: LIGHT"     ); break;
		}
	}
		
	#endregion
	
	#region SELECTED READOUT
	
	if ( window_collapsed && show_selected_readout ) {
		
		if ( window_page == E_EDITOR_PAGE.PLACE ) {
			draw_text( 250, 15, concat( "x=", place_x ) );
			draw_text( 350, 15, concat( "y=", place_y ) );
			draw_text( 450, 15, concat( "z=", place_z ) );
			draw_text( 550, 15, concat( "angle=", place_a ) );
		}
		
		if ( window_page == E_EDITOR_PAGE.INSTANCES )
		|| ( window_page == E_EDITOR_PAGE.MOVE )
		|| ( window_page == E_EDITOR_PAGE.ROTATE )
		|| ( window_page == E_EDITOR_PAGE.DELETE ) {
			if ( instance_exists( _lookat_inst ) ) {
				draw_text( 250, 15, concat( "LOOKAT ", object_get_pretty_name( _lookat_inst.object_index ), ":", _lookat_inst ) );
				draw_text( 450, 15, concat( "x=", _lookat_inst.x ) );
				draw_text( 550, 15, concat( "y=", _lookat_inst.y ) );
				draw_text( 650, 15, concat( "z=", _lookat_inst.z ) );
				draw_text( 750, 15, concat( "angle=", _lookat_inst.image_angle ) );
			} else {
				draw_text( 150, 15, concat( "LOOKAT ", object_get_pretty_name( undefined ) ) );
			}
			var _y = 35;
			with( obj_par_3d ) {
				if ( mouse_selected ) {
					draw_text( 250, _y, concat( object_get_pretty_name( object_index ), ":", id ) );
					draw_text( 450, _y, concat( "x=", x ) );
					draw_text( 550, _y, concat( "y=", y ) );
					draw_text( 650, _y, concat( "z=", z ) );
					draw_text( 750, _y, concat( "angle=", image_angle ) );
					_y += 20;
				}
			}
		}
		
	}
	
	#endregion
	
	if ( editor_is_collapsed() && instance_exists( obj_camera ) ) {
		draw_set_font( fnt_imgui );
		draw_set_valign( fa_bottom );
		draw_text(  10, display_get_gui_height() - 10, concat( "x=", obj_camera.x ) );
		draw_text( 110, display_get_gui_height() - 10, concat( "y=", obj_camera.y ) );
		draw_text( 210, display_get_gui_height() - 10, concat( "z=", obj_camera.z ) );
		draw_text( 310, display_get_gui_height() - 10, concat( "a=", obj_camera.look_xy_angle ) );
		draw_set_valign( fa_top );
	}
}

#region MODEL PREVIEW
surface_set_target( preview_surface );

draw_clear_alpha( c_dkgray, 0.7 );

var _object = undefined;
var _instance = noone;
if ( preview_object != undefined ) {
	_object = preview_object;
	_instance = preview_instance;
} else if ( selected_object != undefined ) {
	_object = selected_object;
	_instance = selected_instance;
}

if ( ( _object != undefined ) && instance_exists( _instance ) ) {
	
	var _old_view = matrix_get( matrix_view );
	var _old_proj = matrix_get( matrix_projection );

	var _view = matrix_build_lookat( 100, 0, 100,   0, 0, 30,   0, 0, 1 );
	var _proj = matrix_build_projection_perspective_fov( DEFAULT_FOV, surface_get_aspect( preview_surface ), 1, 4000 );
	matrix_set( matrix_view, _view );
	matrix_set( matrix_projection, _proj );

	gpu_set_ztestenable( true );
	gpu_set_zwriteenable( true );
	gpu_set_ztestenable( true );
	gpu_set_cullmode( cull_noculling );
	draw_set_lighting( false );
	shader_reset(); 
	
	with( _instance ) event_user( DRAW_USER_EVENT );

	shader_reset();
	gpu_set_ztestenable( false );
	gpu_set_zwriteenable( false );
	gpu_set_ztestenable( false );
	gpu_set_cullmode( global.do_culling? cull_counterclockwise : cull_noculling );
	draw_set_lighting( false );

	matrix_set( matrix_view, _old_view );
	matrix_set( matrix_projection, _old_proj );

	draw_set_font( fnt_default );
	draw_set_colour( c_white );
	draw_text( 10, 10, object_get_pretty_name( _object ) );
	draw_set_colour( c_black );

}
surface_reset_target();
#endregion
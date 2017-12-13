if ( editor_is_open() ) {
	
	var _lookat_inst = obj_screen.click_instance_over;
	
	draw_set_font( fnt_imgui );
	switch( window_page ) {
		case E_EDITOR_PAGE.PLACE:
			draw_text(  80, 15, concat( "PLACING ", object_get_pretty_name( selected_object ) ) );
			draw_text( 250, 15, concat( "x=", place_x ) );
			draw_text( 350, 15, concat( "y=", place_y ) );
			draw_text( 450, 15, concat( "z=", place_z ) );
			draw_text( 550, 15, concat( "angle=", place_a ) );
		break;
		case E_EDITOR_PAGE.MOVE:
			draw_text( 80, 15, "MOVING" );
			if ( instance_exists( _lookat_inst ) ) {
				draw_text( 250, 15, concat( "LOOKAT ", object_get_pretty_name( _lookat_inst.object_index ), ":", _lookat_inst ) );
				draw_text( 450, 15, concat( "x=", _lookat_inst.x ) );
				draw_text( 550, 15, concat( "y=", _lookat_inst.y ) );
				draw_text( 650, 15, concat( "z=", _lookat_inst.z ) );
				draw_text( 750, 15, concat( "angle=", _lookat_inst.image_angle ) );
			} else {
				draw_text( 150, 15, concat( "LOOKAT ", object_get_pretty_name( undefined ) ) );
			}
		break;
		case E_EDITOR_PAGE.ROTATE:
			draw_text( 80, 15, "ROTATE" );
			if ( instance_exists( _lookat_inst ) ) {
				draw_text( 250, 15, concat( "LOOKAT ", object_get_pretty_name( _lookat_inst.object_index ), ":", _lookat_inst ) );
				draw_text( 450, 15, concat( "x=", _lookat_inst.x ) );
				draw_text( 550, 15, concat( "y=", _lookat_inst.y ) );
				draw_text( 650, 15, concat( "z=", _lookat_inst.z ) );
				draw_text( 750, 15, concat( "angle=", _lookat_inst.image_angle ) );
			} else {
				draw_text( 150, 15, concat( "LOOKAT ", object_get_pretty_name( undefined ) ) );
			}
		break;
		case E_EDITOR_PAGE.INSTANCES:
			draw_text( 80, 15, "INSTANCES" );
			if ( instance_exists( instances_over ) ) {
				draw_text( 150, 15, concat( "HOVER ", object_get_pretty_name( instances_over.object_index ), ":", id ) );
			}	
		break;
	}
}

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

if ( _object != undefined ) and ( instance_exists( _instance ) ) {
	
	var _old_view = matrix_get( matrix_view );
	var _old_proj = matrix_get( matrix_projection );

	var _view = matrix_build_lookat( 100, 0, 100,   0, 0, 30,   0, 0, 1 );
	var _proj = matrix_build_projection_perspective_fov( FOV, surface_get_aspect( preview_surface ), 1, 4000 );
	matrix_set( matrix_view, _view );
	matrix_set( matrix_projection, _proj );

	gpu_set_ztestenable( true );
	gpu_set_zwriteenable( true );
	gpu_set_ztestenable( true );
	gpu_set_cullmode( editor_is_open() ? cull_counterclockwise : cull_noculling );
	draw_set_lighting( false );
	shader_reset(); 
	
	with( _instance ) event_user( DRAW_USER_EVENT );

	shader_reset();
	gpu_set_ztestenable( false );
	gpu_set_zwriteenable( false );
	gpu_set_ztestenable( false );
	gpu_set_cullmode( cull_noculling );
	draw_set_lighting( false );

	matrix_set( matrix_view, _old_view );
	matrix_set( matrix_projection, _old_proj );

	draw_set_font( fnt_default );
	draw_set_colour( c_white );
	draw_text( 10, 10, object_get_pretty_name( _object ) );
	draw_set_colour( c_black );

}
surface_reset_target();
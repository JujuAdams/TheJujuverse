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
	gpu_set_cullmode( global.game_editing ? cull_counterclockwise : cull_noculling );
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
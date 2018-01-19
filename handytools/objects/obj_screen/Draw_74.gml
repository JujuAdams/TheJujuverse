if ( SCREEN_ALLOW_DEFERRED && global.screen_do_deferred ) {
	deferred_composite_surface_a = tr_surface_check_auto( deferred_composite_surface_a );
	deferred_composite_surface_b = tr_surface_check_auto( deferred_composite_surface_b );
}

if ( SCREEN_ALLOW_DOF && global.screen_do_dof ) {
	dof_surface          = tr_surface_check_auto( dof_surface          );
	dof_transfer_surface = tr_surface_check_auto( dof_transfer_surface );
}

var _camera = global.screen_main_camera;
var _surface = grip_get_surface( _camera );
if ( _surface == undefined ) _surface = application_surface;

var _gui_w = display_get_gui_width();
var _gui_h = display_get_gui_height();
var _app_w = surface_get_width(  _surface );
var _app_h = surface_get_height( _surface );
var _scale_w = _gui_w / _app_w;
var _scale_h = _gui_h / _app_h;
var _scale = min( _scale_w, _scale_h );
if ( ( _scale >= 1 ) && FORCE_WINDOW_SCALE_INTEGER ) _scale = floor( _scale );
var _draw_w = _app_w*_scale;
var _draw_h = _app_h*_scale;
var _draw_x = 0.5*( _gui_w - _draw_w );
var _draw_y = 0.5*( _gui_h - _draw_h );

if ( SCREEN_3D && DEVELOPMENT && global.screen_show_click ) {
    
    //Debug mode for click surface checking
    gpu_set_blendenable( false );
    draw_surface_stretched( grip_get_surface( "click" ), _draw_x, _draw_y, _draw_w, _draw_h );
    gpu_set_blendenable( true );
    
} else if ( SCREEN_ALLOW_FXAA && global.screen_do_fxaa ) {
    
    gpu_set_blendenable( false );
    s_shader_begin( shd_fxaa );
    s_shader_surface_texel_dims( "u_vTexel", _surface );
    draw_surface_stretched( _surface, _draw_x, _draw_y, _draw_w, _draw_h );
    s_shader_end();
    gpu_set_blendenable( true );
        
} else if ( SCREEN_ALLOW_DITHER && global.screen_do_dither ) {
    
    gpu_set_blendenable( false );
    s_shader_begin( shd_dither );
    s_shader_texture_sampler( "u_sDither", global.dither_texture );
    s_shader_float( "u_vTextureSize", _app_w, _app_h );
    draw_surface_stretched( _surface, _draw_x, _draw_y, _draw_w, _draw_h );
    s_shader_end();
    gpu_set_blendenable( true );
        
} else {
	
	if ( SCREEN_ALLOW_DOF && global.screen_do_dof ) {
		
		if ( SCREEN_ALLOW_DEFERRED && global.screen_do_deferred ) {
			
			surface_set_target( deferred_composite_surface_b );
		    gpu_set_blendenable( false );
			draw_surface( _surface, 0, 0 );
			gpu_set_blendenable( true );
		    screen_render_deferred_lights_all( _draw_x, _draw_y, _draw_w, _draw_h, global.screen_main_camera, deferred_composite_surface_a );
			surface_reset_target();
			
			surface_blur_to_surface( deferred_composite_surface_b, dof_transfer_surface, dof_surface, shd_gaussian );
			
		    gpu_set_blendenable( false );
			screen_draw_surface_dof( deferred_composite_surface_b, _draw_x, _draw_y, _draw_w, _draw_h,
			                         grip_get_depth_surface( "3d" ), dof_surface,
									 global.click_depth_smoothed, lerp( 0.01, 0.70, global.click_depth_smoothed ) );
			gpu_set_blendenable( true );
			
		} else {
			
		    gpu_set_blendenable( false );
			screen_draw_surface_dof( _surface, _draw_x, _draw_y, _draw_w, _draw_h,
			                         grip_get_depth_surface( "3d" ), dof_surface,
									 global.click_depth_smoothed, lerp( 0.01, 0.70, global.click_depth_smoothed ) );
			gpu_set_blendenable( true );
			
		}
		
	} else {
		
	    gpu_set_blendenable( false );
	    draw_surface_stretched( _surface, _draw_x, _draw_y, _draw_w, _draw_h );
	    gpu_set_blendenable( true );
        
	    if ( SCREEN_ALLOW_DEFERRED && global.screen_do_deferred ) {
			screen_render_deferred_lights_all( _draw_x, _draw_y, _draw_w, _draw_h, global.screen_main_camera, deferred_composite_surface_a );
		}
        
	}
    
}
    
gpu_set_blendenable( true );
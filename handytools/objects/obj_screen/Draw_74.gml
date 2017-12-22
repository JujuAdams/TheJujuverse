var _pov_surface = grip_get_surface( "pov" );

var _gui_w = display_get_gui_width();
var _gui_h = display_get_gui_height();
var _app_w = surface_get_width(  _pov_surface );
var _app_h = surface_get_height( _pov_surface );
var _scale_w = _gui_w / _app_w;
var _scale_h = _gui_h / _app_h;
var _scale = min( _scale_w, _scale_h );
if ( ( _scale >= 1 ) && FORCE_WINDOW_SCALE_INTEGER ) _scale = floor( _scale );
var _draw_w = _app_w*_scale;
var _draw_h = _app_h*_scale;
var _draw_x = 0.5*( _gui_w - _draw_w );
var _draw_y = 0.5*( _gui_h - _draw_h );

if ( global.show_click && DEVELOPMENT ) {
	
    draw_surface_stretched( grip_get_surface( "click" ), _draw_x, _draw_y, _draw_w, _draw_h );
    
} else {
    
	if ( global.do_fxaa ) {
		
		s_shader_begin( shd_fxaa );
		s_shader_surface_texel_dims( "u_vTexel", _pov_surface );
		draw_surface_stretched( _pov_surface, _draw_x, _draw_y, _draw_w, _draw_h );
		s_shader_end();
		
	} else if ( global.do_dither ) {
        
        gpu_set_blendenable( false );
		s_shader_begin( shd_dither );
		s_shader_texture_sampler( "u_sDither", global.dither_texture );
		s_shader_uniform_f( "u_vTextureSize", _app_w, _app_h );
		draw_surface_stretched( _pov_surface, _draw_x, _draw_y, _draw_w, _draw_h );
		s_shader_end();
        gpu_set_blendenable( true );
        
    } else {
        
        gpu_set_blendenable( false );
        draw_surface_stretched( _pov_surface, _draw_x, _draw_y, _draw_w, _draw_h );
        gpu_set_blendenable( true );
    
    }
    
}

smoothed_timer = lerp( smoothed_timer, get_timer() - frame_start_time, 0.008 );
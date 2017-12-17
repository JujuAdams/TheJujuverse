var _gui_w = display_get_gui_width();
var _gui_h = display_get_gui_height();
var _app_w = surface_get_width( APP_SURF );
var _app_h = surface_get_height( APP_SURF );
var _scale_w = _gui_w / _app_w;
var _scale_h = _gui_h / _app_h;
var _scale = min( _scale_w, _scale_h );
if ( keyboard_check_pressed( ord( "J" ) ) ) trace( _scale_w, ",", _scale_h );
if ( ( _scale >= 1 ) && FORCE_WINDOW_SCALE_INTEGER ) _scale = floor( _scale );
if ( keyboard_check_pressed( ord( "J" ) ) ) trace( _scale );
var _draw_w = _app_w*_scale;
var _draw_h = _app_h*_scale;
var _draw_x = 0.5*( _gui_w - _draw_w );
var _draw_y = 0.5*( _gui_h - _draw_h );

if ( keyboard_check_pressed( ord( "J" ) ) ) {
	trace( _gui_w, "x", _gui_h, "   ", _app_w, "x", _app_h );
	trace( _draw_x, ",", _draw_y, "   ", _draw_w, "x", _draw_h );
}

if ( global.show_click && DEVELOPMENT ) {
    
    if ( surface_exists( srf_click ) ) draw_surface_stretched( srf_click, _draw_x, _draw_y, _draw_w, _draw_h );
    
} else {
    
    if ( global.do_dither ) {
        
        gpu_set_blendenable( false );
        shader_set( shd_dither );
        texture_set_stage( shader_get_sampler_index( shd_dither, "u_sDither" ), global.dither_texture );
        shader_set_uniform_f( shader_get_uniform( shd_dither, "u_vTextureSize" ), 320, 240 );
		draw_surface_stretched( srf_pov, _draw_x, _draw_y, _draw_w, _draw_h );
        /*if ( !DEVELOPMENT ) || !instance_exists( obj_debug ) || ( global.debug_tool != e_tool.delete ) {
            draw_surface_stretched( srf_pov, _draw_x, _draw_y, _draw_w, _draw_h );
        } else {
            draw_surface_stretched_ext( srf_pov, _draw_x, _draw_y, _draw_w, _draw_h, c_red, 1 );
        }*/
        shader_reset();
        gpu_set_blendenable( true );
        
    } else {
        
        gpu_set_blendenable( false );
        draw_surface_stretched( srf_pov, _draw_x, _draw_y, _draw_w, _draw_h );
        gpu_set_blendenable( true );
    
    }
    
}

smoothed_timer = lerp( smoothed_timer, get_timer() - frame_start_time, 0.008 );

/*
if ( keyboard_check( ord( "0" ) ) and ( DEVELOPMENT ) ) {
    
    if ( surface_exists( srf_click ) ) draw_surface_ext( srf_click, 0, 0, APP_TO_WINDOW_SCALE, APP_TO_WINDOW_SCALE, 0, c_white, 1 );
    
} else {
    
    if ( global.do_dither ) {
        
        gpu_set_blendenable( false );
        shader_set( shd_dither );
        texture_set_stage( shader_get_sampler_index( shd_dither, "u_sDither" ), global.dither_texture );
        shader_set_uniform_f( shader_get_uniform( shd_dither, "u_vTextureSize" ), 320, 240 );
        if ( !DEVELOPMENT ) || !instance_exists( obj_debug ) || ( global.debug_tool != e_tool.delete ) {
            draw_surface_ext( srf_pov, 0, 0, APP_TO_WINDOW_SCALE, APP_TO_WINDOW_SCALE, 0, c_white, 1 );
        } else {
            draw_surface_ext( srf_pov, 0, 0, APP_TO_WINDOW_SCALE, APP_TO_WINDOW_SCALE, 0, c_red, 1 );
        }
        shader_reset();
        gpu_set_blendenable( true );
        
    } else {
        
        gpu_set_blendenable( false );
        draw_surface_ext( srf_pov, 0, 0, APP_TO_WINDOW_SCALE, APP_TO_WINDOW_SCALE, 0, c_white, 1 );
        gpu_set_blendenable( true );
    
    }
    
}
*/
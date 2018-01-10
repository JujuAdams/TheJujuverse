/// @param x
/// @param y
/// @param width
/// @param height
/// @param GRIP_camera
/// @param composite_surface

var _x                 = argument0;
var _y                 = argument1;
var _w                 = argument2;
var _h                 = argument3;
var _camera            = argument4;
var _composite_surface = argument5;

if ( !SCREEN_ALLOW_LIGHTING || !global.screen_do_lighting ) exit;
if ( !SCREEN_DEFERRED_LIGHTS ) {
    trace_error( "Deferred lighting turned off!" );
    exit;
}

var _depth_surface = grip_get_depth_surface( _camera );
var _tan_aspect    = dtan( DEFAULT_FOV/2 );
var _light_count   = instance_number( obj_light );

if ( _light_count <= SCREEN_MAX_LIGHTS ) {
    
    gpu_set_blendmode_ext( bm_zero, bm_src_colour );
    
    s_shader_begin( shd_deferred_lighting );
    
    s_shader_float(           "u_fZFar"       , DEFAULT_Z_FAR                                        );
    s_shader_surface_sampler( "u_sNormal"     , grip_get_normal_surface( _camera )                   );
    s_shader_matrix(          "u_mInverseView", matrix_inverse( grip_get_view_matrix( _camera ) )    );
    s_shader_float(           "u_vTanAspect"  , _tan_aspect*grip_get_aspect( _camera ), -_tan_aspect );
    screen_set_shader_ambient_light();
    
    for( var _light = 0; _light < _light_count; _light += SCREEN_MAX_LIGHTS ) {
        screen_set_shader_lights( _light, min( SCREEN_MAX_LIGHTS, _light_count - _light ) );
        draw_surface_stretched( _depth_surface, _x, _y, _w, _h );
    }
    
    s_shader_end();
    gpu_set_blendmode( bm_normal );
    
} else {
    
    surface_set_target( _composite_surface );
        
        draw_sprite_stretched_ext( spr_white_pixel, 0, 0, 0, grip_get_width( _camera ), grip_get_height( _camera ), C_AMBIENT, 1 );
        
        gpu_set_blendmode( bm_add );
        s_shader_begin( shd_deferred_lighting );
    
        s_shader_float(           "u_fZFar"       , DEFAULT_Z_FAR                                        );
        s_shader_surface_sampler( "u_sNormal"     , grip_get_normal_surface( _camera )                   );
        s_shader_matrix(          "u_mInverseView", matrix_inverse( grip_get_view_matrix( _camera ) )    );
        s_shader_float(           "u_vTanAspect"  , _tan_aspect*grip_get_aspect( _camera ), -_tan_aspect );
        screen_set_shader_ambient_light( c_black, 0 );
    
        for( var _light = 0; _light < _light_count; _light += SCREEN_MAX_LIGHTS ) {
            screen_set_shader_lights( _light, min( SCREEN_MAX_LIGHTS, _light_count - _light ) );
            draw_surface( _depth_surface, 0, 0 );
        }
        
        s_shader_end();
    
    surface_reset_target();
    
    gpu_set_blendmode_ext( bm_zero, bm_src_colour );
    draw_surface_stretched( _composite_surface, _x, _y, _w, _h );
    gpu_set_blendmode( bm_normal );
    
}
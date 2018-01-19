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

if ( !SCREEN_ALLOW_LIGHTING || !SCREEN_ALLOW_DEFERRED || !global.screen_do_lighting ) exit;

var _surface        = grip_get_surface( _camera );
var _depth_surface  = grip_get_depth_surface( _camera );
var _normal_surface = grip_get_normal_surface( _camera );
var _tan_aspect_y   = -dtan( DEFAULT_FOV/2 );
var _tan_aspect_x   = -_tan_aspect_y*grip_get_aspect( _camera );
var _matrix_inverse = matrix_inverse( grip_get_view_matrix( _camera ) );

var _light_count    = instance_number( obj_light );

//Plonk all the lights onto our composite surface
surface_set_target( _composite_surface );
    draw_sprite_stretched_ext( spr_white_pixel, 0, 0, 0, grip_get_width( _camera ), grip_get_height( _camera ), C_AMBIENT, 1 );
        
    gpu_set_blendmode( bm_add );
    
    #region SIMPLE POINT LIGHTS
    s_shader_begin( shd_deferred_lighting );
        s_shader_float(           "u_fZFar"       , DEFAULT_Z_FAR   );
        s_shader_surface_sampler( "u_sDepth"      , _depth_surface  );
        s_shader_surface_sampler( "u_sNormal"     , _normal_surface );
        s_shader_matrix(          "u_mInverseView", _matrix_inverse );
        s_shader_float(           "u_vTanAspect"  , _tan_aspect_x,
                                                    _tan_aspect_y   );
        screen_set_shader_ambient_light( c_black, 0 );
    	s_shader_fog( false, c_black, 0, 0 );
    
        for( var _light = 0; _light < _light_count; _light += SCREEN_MAX_LIGHTS ) {
            screen_set_shader_lights( _light, min( SCREEN_MAX_LIGHTS, _light_count - _light ) );
            draw_surface( _surface, 0, 0 );
        }
    s_shader_end();
    #endregion
    
    #region SHADOW MAPPED DIRECTIONAL LIGHTS
    s_shader_begin( shd_shadowmap );
        s_shader_float(           "u_fZFar"         , DEFAULT_Z_FAR   );
        s_shader_surface_sampler( "u_sDepth"        , _depth_surface  );
        s_shader_surface_sampler( "u_sNormal"       , _normal_surface );
        s_shader_matrix(          "u_mInverseView"  , _matrix_inverse );
        s_shader_float(           "u_vTanAspect"    , _tan_aspect_x,
                                                      _tan_aspect_y   );
        s_shader_float(           "u_fBias"         , 0.005           );
        screen_set_shader_ambient_light( c_black, 0 );
        s_shader_fog( false, c_black, 0, 0 );
        
        with( obj_directional_light ) {
            var _map = global.grip_cameras_map[? UNIQUE_NAME ];
            s_shader_matrix(          "u_mLightViewProj", matrix_multiply( _map[? "view matrix" ], _map[? "proj matrix" ] ) );
            s_shader_surface_sampler( "u_sLightDepth"   , grip_get_depth_surface( UNIQUE_NAME ) );
            s_shader_rgb(             "u_vColour"       , colour );
            //s_shader_float(           "u_fSoftness"     , 1 );
            s_shader_float(           "u_vAspect"       , grip_get_aspect( UNIQUE_NAME ), 1 );
            draw_surface_stretched( grip_get_surface( UNIQUE_NAME ), _x, _y, _w, _h );
        }
    s_shader_end();
    #endregion

surface_reset_target();
    
//Then draw the composite surface
gpu_set_blendmode_ext( bm_zero, bm_src_colour );
draw_surface_stretched( _composite_surface, _x, _y, _w, _h );
gpu_set_blendmode( bm_normal );
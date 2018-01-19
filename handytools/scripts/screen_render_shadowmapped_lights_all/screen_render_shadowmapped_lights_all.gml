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
        
gpu_set_blendmode_ext( bm_zero, bm_src_colour );
        
s_shader_begin( shd_shadowmap );
s_shader_fog( false, c_black, 0, 0 );
s_shader_float(           "u_fZFar"         , DEFAULT_Z_FAR   );
s_shader_surface_sampler( "u_sDepth"        , _depth_surface  );
s_shader_surface_sampler( "u_sNormal"       , _normal_surface );
s_shader_matrix(          "u_mInverseView"  , _matrix_inverse );
s_shader_float(           "u_vTanAspect"    , _tan_aspect_x,
                                              _tan_aspect_y   );
s_shader_float(           "u_fBias"         , 0.01            );
screen_set_shader_ambient_light();
        
with( obj_directional_light ) {
    var _map = global.grip_cameras_map[? ID_STR ];
    s_shader_matrix( "u_mLightViewProj", matrix_multiply( _map[? "view matrix" ], _map[? "proj matrix" ] ) );
    s_shader_surface_sampler( "u_sLightDepth", grip_get_surface( ID_STR ) );
    draw_surface_stretched( _surface, _x, _y, _w, _h );
}
        
s_shader_end();
gpu_set_blendmode( bm_normal );
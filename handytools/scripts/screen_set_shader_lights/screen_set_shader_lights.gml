/// @desc ???
/// @param priority_queue
/// @param [max_lights]

var _pri = argument[0];
var _max = ((argument_count < 2) || (argument[1] == undefined))? SCREEN_MAX_LIGHTS : argument[1];

ds_priority_clear( _pri );
var _light = 0;
    
if ( ALLOW_LIGHTING && global.screen_do_lighting ) {
        
    s_shader_rgba( "u_vAmbientColour", C_AMBIENT, 0 );
    with( obj_camera ) s_shader_set_light( _light++, x, y, z, 100, c_gray, 1 );
        
    var _cam_x = grip_get_xfrom( "3d" );
    var _cam_y = grip_get_yfrom( "3d" );
    var _cam_z = grip_get_zfrom( "3d" );
    
    with( obj_light ) {
        if ( visible ) {
            var _dx = _cam_x - x;
            var _dy = _cam_y - y;
            var _dz = _cam_z - z;
            var _dist = _dx*_dx + _dy*_dy + _dz*_dz;
            ds_priority_add( _pri, id, _dist );
        }
    }
        
} else {
    s_shader_rgba( "u_vAmbientColour", c_white, 1 );
}
    
for(; _light < _max; _light++ ) {
    if ( ds_priority_empty( _pri ) ) {
        s_shader_set_light( _light, 0, 0, 0, 1, c_black, 0 );
    } else {
        with( ds_priority_delete_min( _pri ) ) s_shader_set_light( _light, x, y, z, range, colour, 1 );
    }
}
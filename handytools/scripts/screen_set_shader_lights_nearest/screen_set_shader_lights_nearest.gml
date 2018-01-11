/// @desc ???
/// @param camera_X
/// @param camera_y
/// @param camera_z
/// @param priority_queue
/// @param [max_lights]

var _cam_x = argument[0];
var _cam_y = argument[1];
var _cam_z = argument[2];
var _pri   = argument[3];
var _max   = ((argument_count < 5) || (argument[4] == undefined))? SCREEN_MAX_LIGHTS : argument[4];

var _light = 0;
    
if ( SCREEN_ALLOW_LIGHTING && global.screen_do_lighting ) {
    
    //with( obj_camera ) s_shader_set_light( _light++, x, y, z, 100, c_gray, 1 );
    
    ds_priority_clear( _pri );
    with( obj_light ) {
        if ( visible ) {
            var _dx = _cam_x - x;
            var _dy = _cam_y - y;
            var _dz = _cam_z - z;
            var _dist = _dx*_dx + _dy*_dy + _dz*_dz;
            ds_priority_add( _pri, id, _dist );
        }
    }
    
    for(; _light < _max; _light++ ) {
        if ( ds_priority_empty( _pri ) ) break;
        with( ds_priority_delete_min( _pri ) ) s_shader_set_light( _light, x, y, z, range, colour, 1 );
    }
    
}

for(; _light < SCREEN_MAX_LIGHTS; _light++ ) s_shader_set_light( _light, 0, 0, 0, 1, c_black, 0 );
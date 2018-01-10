/// @desc ???
/// @param start
/// @param count

var _a     = argument0;
var _count = argument1;

var _light = 0;

if ( SCREEN_ALLOW_LIGHTING && global.screen_do_lighting ) {
    
    if ( _count > SCREEN_MAX_LIGHTS ) {
        trace_error_q( false, "Number of lights specified (", _count, ") larger than definied maximum (", SCREEN_MAX_LIGHTS, ")" );
        _count = SCREEN_MAX_LIGHTS;
    }
    
    var _b = min( _a+_count, instance_number( obj_light ) );
    for( var _i = _a; _i < _b; _i++ ) {
        with( instance_find( obj_light, _i ) ) s_shader_set_light( _light++, x, y, z, range, colour, 1 );
    }
    
}

for(; _light < SCREEN_MAX_LIGHTS; _light++ ) s_shader_set_light( _light, 0, 0, 0, 1, c_black, 0 );
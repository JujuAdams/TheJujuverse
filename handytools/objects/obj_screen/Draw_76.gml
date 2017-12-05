frame_start_time = get_timer();

draw_set_colour( c_white );

var _light = 0;
with( obj_camera ) { //Make proximity light for camera
    draw_light_define_point( _light, x, y, z, 100, c_gray );
    draw_light_enable( _light, true );
    _light++;
}

with( obj_light ) { //Add scene lights
    if ( !visible ) continue;
    draw_light_define_point( _light, x, y, z, range, colour );
    draw_light_enable( _light, true );
    _light++;
}

//Reset the remainder of the lights to off
for( var _i = _light; _i < 8; _i++ ) draw_light_enable( _i, false );
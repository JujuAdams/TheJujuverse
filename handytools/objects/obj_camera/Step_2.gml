if ( !obj_gameflow.transition_do or ( obj_gameflow.transition_direction == -1 ) ) {
    look_xy_angle -= global.mouse_dx/8;
	look_xy_angle = (look_xy_angle+720) mod 360;
    look_pz_angle = clamp( look_pz_angle - global.mouse_dy/5, -89, 89 );
}

var _xy_cos = dcos( look_xy_angle );
var _xy_sin = dsin( look_xy_angle );
var _pz_cos = dcos( look_pz_angle );
var _pz_sin = dsin( look_pz_angle );

look_x = x + _xy_cos*_pz_cos;
look_y = y - _xy_sin*_pz_cos;
look_z = z + _pz_sin;

audio_listener_position( x, y, z );
audio_listener_set_orientation( 0,   look_x-x, look_y-y, look_z-z,   0, 0, -1 );
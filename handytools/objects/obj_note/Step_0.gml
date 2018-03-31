event_inherited();

x += vel_x;
y += vel_y;
z += vel_z;

var _scale = 1 - parameterise( current_time, life_start, life_start+life_duration, true );
_scale = 1 - sqr( 2*_scale - 1 )
_scale *= 2;

x_scale = _scale;
y_scale = _scale;
z_scale = _scale;

if ( time_has_passed( life_start, life_duration ) ) tr_instance_destroy();
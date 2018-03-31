event_inherited();

z = 0;

model = "note yellow 1";
tilt = choose( 1, -1 )*random_range( 0, 10 );

vel_x = x - obj_camera.x;
vel_y = y - obj_camera.y;
vel_z = z - obj_camera.z;
var _v = 1/point_distance_3d( 0, 0, 0, vel_x, vel_y, vel_z );
vel_x *= _v;
vel_y *= _v;
vel_z *= _v;

life_start = current_time;
life_duration = 700;
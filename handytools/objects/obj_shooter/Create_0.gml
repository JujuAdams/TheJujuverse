x = room_width div 2;

state         = 0;
hand          = noone;
hand_position = room_width div 2;
hand_power    = 1;
meter_timer   = current_time;

ai_launch_point = 0;

wheel_segments = 10;
wheel_index = 0;
wheel_index_prev = 0;
rotation_factor = 0.45; // speed

c_slow = c_white;
c_ideal = $00ee65;
c_fast = $440af1;

c_slow_to_ideal = $00b7ff;
c_ideal_to_fast = $0063ef;

scale = 120 * 3;
ring_width = 40;

wheel_surf = surface_create(scale, scale);
surface_set_target(wheel_surf);
draw_clear_alpha(0, 0);
surface_reset_target();

for( var _i = wheel_segments-1; _i >= 0; _i-- ) wheel_array[ _i ] = _i/wheel_segments;
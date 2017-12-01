event_inherited();

depth = layer_get_depth( layer ) - instance_number( obj_hand );
image_speed = 0.3;
acceleration = 4;

camera_lead_y = -120;
start_time    = VERY_LARGE;
velocity_x    = 0;
free          = false;
push_power    = 0;
hand_t        = 0;
hand_q        = 0;

tween_start_x = x;
tween_start_y = y;
root_x = x;

obstacles_hit = ds_list_create();

cross_index = VERY_LARGE;
path          = ds_list_create();
source_path   = ds_list_create();
scritch_path  = ds_list_create();

left_pressed_timer  = 0;
right_pressed_timer = 0;

is_ai = false;
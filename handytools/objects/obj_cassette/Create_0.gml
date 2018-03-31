event_inherited();

mouse_interactible = true;
z = 0;
flip = 0;

grid_x = UD;
grid_y = UD;

z_push = 0;
z_push_target = 0;
z_push_spring = 0.3;

z_drop = random_range( 40, 60 );
z_drop_vel = 0;
z_drop_bounce = random_range( 0.55, 0.65 );

move_do = false;
move_t = 0;
move_start = current_time;
move_flip = 0;
move_y_start = y;
move_y_target = y;
move_duration = 400;
move_old_grid_y = grid_y;

cassette_index = 0;
dotobj_animation_create( "static", concat( "cassette ", cassette_index ), 0 );
dotobj_animation_play( "main", "static" );
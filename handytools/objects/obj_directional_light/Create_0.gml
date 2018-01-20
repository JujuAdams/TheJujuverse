event_inherited();

range = random_range( 120, 400 );
colour = c_white; //make_colour_hsv( irandom( 255 ), 255, 255 );
light_sprite = spr_light_map;
light_image = 0;

quat = quaternion_create();
matrix = matrix_build_identity();

grip_create( UNIQUE_NAME, 1, 1, true, true );
grip_activate( UNIQUE_NAME, true );
grip_set_lookat_3d_quaternion( UNIQUE_NAME,   x, y, z,   quat );
grip_set_perspective( UNIQUE_NAME );
grip_set_shader( UNIQUE_NAME, shd_depth );

event_inherited();

range = random_range( 120, 400 );
colour = c_white; //make_colour_hsv( irandom( 255 ), 255, 255 );

grip_create( UNIQUE_NAME, global.app_surf_w, global.app_surf_h, false, true );
grip_activate( UNIQUE_NAME, true );

quat = quaternion_create();
grip_set_lookat_3d_quaternion( UNIQUE_NAME,   x, y, z,   quat );
grip_set_perspective( UNIQUE_NAME );
grip_set_shader( UNIQUE_NAME, shd_depth );

matrix = matrix_build_identity();
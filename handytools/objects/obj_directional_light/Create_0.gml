event_inherited();

range = random_range( 120, 400 );
colour = c_white; //make_colour_hsv( irandom( 255 ), 255, 255 );

grip_create( ID_STR, global.app_surf_w, global.app_surf_h, false, true );
grip_activate( ID_STR, true );

quat = quaternion_create();
grip_set_lookat_3d_quaternion( ID_STR,   x, y, z,   quat );
grip_set_perspective( ID_STR );
grip_set_shader( ID_STR, shd_depth );

matrix = matrix_build_identity();
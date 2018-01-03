//var _proj_matrix = matrix_flip_y( matrix_build_projection_perspective_fov( DEFAULT_FOV, grip_get_aspect( "3d" ),
//                                                                           DEFAULT_Z_NEAR, DEFAULT_Z_FAR ) );
grip_set_lookat(      "3d"   , x, y, z,   look_x, look_y, look_z,   0, 0, 1 );
grip_set_perspective( "3d" );
grip_set_lookat(      "click", x, y, z,   look_x, look_y, look_z,   0, 0, 1 );
grip_set_perspective( "click" );
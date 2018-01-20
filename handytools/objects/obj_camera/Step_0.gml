grip_set_lookat_3d(   "3d"   , x, y, z,   look_x, look_y, look_z,   0, 0, 1 );
grip_set_perspective( "3d" );

if ( !SCREEN_ALLOW_DEFERRED || !global.screen_do_deferred ) {
    grip_set_lookat_3d(   "click", x, y, z,   look_x, look_y, look_z,   0, 0, 1 );
    grip_set_perspective( "click" );
}
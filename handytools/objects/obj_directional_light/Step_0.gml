event_inherited();

quat = quaternion_rotate_worldx( quat,  0.5 );
quat = quaternion_rotate_worldy( quat,  0.2 );
quat = quaternion_rotate_worldz( quat, -0.1 );
grip_set_lookat_3d_quaternion( ID_STR,   x, y, z,   quat );

matrix = matrix_build( 0, 0, 0,   0, 0, 0,   2+range/100, 2+range/100, 2+range/100 );
matrix = matrix_multiply( matrix, matrix_build( 0, 0, 0,   0, 90, 0,   1, 1, 1 ) );
matrix = matrix_multiply( matrix, quaternion_matrix( quat ) );
matrix = matrix_multiply( matrix, matrix_build( x, y, z,   0, 0, 0,   1, 1, 1 ) );
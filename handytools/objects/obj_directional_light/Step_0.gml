event_inherited();

grip_set_lookat_3d_quaternion( UNIQUE_NAME,   x, y, z,   quat );

matrix = matrix_build( 0, 0, 0,   0, 0, 0,   2+range/100, 2+range/100, 2+range/100 );
matrix = matrix_multiply( matrix, matrix_build( 0, 0, 0,   0, 90, 0,   1, 1, 1 ) );
matrix = matrix_multiply( matrix, quaternion_matrix( quat ) );
matrix = matrix_multiply( matrix, matrix_build( x, y, z,   0, 0, 0,   1, 1, 1 ) );
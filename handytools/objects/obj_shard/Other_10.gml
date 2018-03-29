matrix_chain_begin();
matrix_chain_multiply_matrix( matrix_build_rotation_axis( rot_axis_x, rot_axis_y, rot_axis_z, rotation ) );
matrix_chain_translate( x, y, z +global.game_swell );
matrix_chain_end( matrix_world );
dotobj_submit( dotobj );
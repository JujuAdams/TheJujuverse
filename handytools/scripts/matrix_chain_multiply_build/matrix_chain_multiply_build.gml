///@param x
///@param y
///@param z
///@param xrotation
///@param yrotation
///@param zrotation
///@param xscale
///@param yscale
///@param zscale

global.matrix_chain = matrix_multiply( global.matrix_chain, matrix_build( argument0, argument1, argument2,
                                                                          argument3, argument4, argument5, 
                                                                          argument6, argument7, argument8 ) );
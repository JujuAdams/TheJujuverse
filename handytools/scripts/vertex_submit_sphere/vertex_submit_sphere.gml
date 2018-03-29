/// @param x
/// @param y
/// @param z
/// @param [scale]
/// @param [texture]

var _x       = argument[0];
var _y       = argument[1];
var _z       = argument[2];
var _scale   = ((argument_count<4) || (argument[3]==undefined))?                                      1 : argument[3];
var _texture = ((argument_count<5) || (argument[4]==undefined))? sprite_get_texture( spr_tex_white, 0 ) : argument[3];

matrix_chain_begin();
matrix_chain_scale( _scale, _scale, _scale );
matrix_chain_translate( _x, _y, _z );
matrix_chain_end( matrix_world );
vertex_submit( global.vbf_sphere, pr_trianglelist, _texture );
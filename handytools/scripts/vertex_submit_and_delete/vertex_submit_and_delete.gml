/// @param vertex_buffer
/// @param primitive_type
/// @param texture

var _vbuff   = argument[0];
var _prim    = ((argument_count<2) || (argument[1]==undefined))? pr_trianglelist                        : argument[1];
var _texture = ((argument_count<3) || (argument[2]==undefined))? sprite_get_texture( spr_tex_white, 0 ) : argument[2];

vertex_submit( _vbuff, _prim, _texture );
vertex_delete_buffer( _vbuff );
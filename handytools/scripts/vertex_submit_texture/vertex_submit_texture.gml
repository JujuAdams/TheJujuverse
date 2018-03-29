/// @param vertex_buffer
/// @param [surface]

var _vertex_buffer = argument[0];
var _texture       = ((argument_count<2) || (argument[1]==undefined))? sprite_get_texture( DEFAULT_TEXTURE_SPRITE, 0 ) : argument[1];

vertex_submit( _vertex_buffer, pr_trianglelist, _texture );
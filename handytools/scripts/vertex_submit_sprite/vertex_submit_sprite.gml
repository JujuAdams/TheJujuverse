/// @param vertex_buffer
/// @param [sprite]
/// @param [image]

var _vertex_buffer = argument[0];
var _sprite        = ((argument_count<2) || (argument[1]==undefined))? DEFAULT_TEXTURE_SPRITE : argument[1];
var _image         = ((argument_count<3) || (argument[2]==undefined))? 0 : argument[2];

vertex_submit( _vertex_buffer, pr_trianglelist, sprite_get_texture( _sprite, _image ) );
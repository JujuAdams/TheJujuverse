/// @param source_vbuff

//This script presumes the use of global.vft_simple_3d (pos 3d, texcoord, colour, normal)

var _source_vbuff = argument0;

var _format_vertex_size = 36;
var _source_count = vertex_get_number( _source_vbuff );
var _source_size  = _format_vertex_size*_source_count;

var _source = buffer_create(_source_size, buffer_grow, 1 );
buffer_copy_from_vertex_buffer( _source_vbuff, 0, _source_count, _source, 0 );
var _vbuff = vertex_create_buffer_from_buffer( _source, global.vft_simple_3d );
buffer_delete( _source );

return _vbuff;
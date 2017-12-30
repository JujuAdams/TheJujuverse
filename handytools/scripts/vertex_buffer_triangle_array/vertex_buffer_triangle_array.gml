///@param source_vbuff

//This script presumes the use of global.vft_simple_3d (pos 3d, texcoord, colour, normal)

var _source_vbuff = argument0;

var _format_vertex_size = 36;
var _source_count = vertex_get_number( _source_vbuff );
var _source_size  = _format_vertex_size*_source_count;

var _source = buffer_create(_source_size, buffer_grow, 1 );
buffer_copy_from_vertex_buffer( _source_vbuff, 0, _source_count, _source, 0 );

var _array;
_array[_source_count-1] = 0;

var _j = 0;
for( var _i = 0; _i < _source_size; _i += _format_vertex_size ) {
    _array[_j  ] = buffer_peek( _source, _i  , buffer_f32 );
    _array[_j+1] = buffer_peek( _source, _i+4, buffer_f32 );
    _array[_j+2] = buffer_peek( _source, _i+8, buffer_f32 );
    _j += 3;
}

buffer_delete( _source );

return _array;
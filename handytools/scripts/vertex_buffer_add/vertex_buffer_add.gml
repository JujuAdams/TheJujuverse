///@param dest_vbuff
///@param source_vbuff
///@param x
///@param y
///@param z
///@param scale

//This script presumes the use of global.vft_simple_3d (pos 3d, texcoord, colour, normal)

var _dest_vbuff   = argument0;
var _source_vbuff = argument1;
var _offset_x     = argument2;
var _offset_y     = argument3;
var _offset_z     = argument4;
var _scale        = argument5;

var _format_vertex_size = 36;
var _source_count = vertex_get_number( _source_vbuff );
var _dest_count   = vertex_get_number(   _dest_vbuff );
var _source_size  = _format_vertex_size*_source_count;
var _dest_size    = _format_vertex_size*  _dest_count;

var _source = buffer_create( _source_size, buffer_grow, 1 );
var _dest   = buffer_create( _dest_size + _source_size, buffer_grow, 1 );
buffer_copy_from_vertex_buffer( _source_vbuff, 0, _source_count, _source, 0 );
buffer_copy_from_vertex_buffer(   _dest_vbuff, 0,   _dest_count,   _dest, 0 );

for( var _i = 0; _i < _source_size; _i += _format_vertex_size ) {
	buffer_poke( _source, _i  , buffer_f32, _scale*buffer_peek( _source, _i  , buffer_f32 ) + _offset_x );
	buffer_poke( _source, _i+4, buffer_f32, _scale*buffer_peek( _source, _i+4, buffer_f32 ) + _offset_y );
	buffer_poke( _source, _i+8, buffer_f32, _scale*buffer_peek( _source, _i+8, buffer_f32 ) + _offset_z );
}

buffer_copy( _source, 0, _source_size, _dest, _dest_size );
var _return_vbuff = vertex_create_buffer_from_buffer( _dest, global.vft_simple_3d );

buffer_delete( _source );
buffer_delete( _dest );

return _return_vbuff;
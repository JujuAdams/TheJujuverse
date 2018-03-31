/// @param name
/// @param vertex_buffer
/// @param vertex_format
/// @param shape

var _name   = argument0;
var _vbuff  = argument1;
var _format = argument2;
var _shape  = argument3;

var _min_x = VERY_LARGE;
var _max_x = VERY_NEGATIVE;
var _min_y = VERY_LARGE;
var _max_y = VERY_NEGATIVE;
var _min_z = VERY_LARGE;
var _max_z = VERY_NEGATIVE;

var _buffer = buffer_create_from_vertex_buffer( _vbuff, buffer_fixed, 1 );
var _size = buffer_get_size( _buffer );

while( buffer_tell( _buffer ) < _size ) {
	
	if ( _format == global.vft_simple_3d ) {
	
		var _pos_x  = buffer_read( _buffer, buffer_f32 );
		var _pos_y  = buffer_read( _buffer, buffer_f32 );
		var _pos_z  = buffer_read( _buffer, buffer_f32 );
		var _tex_u  = buffer_read( _buffer, buffer_f32 );
		var _tex_v  = buffer_read( _buffer, buffer_f32 );
		var _colour = buffer_read( _buffer, buffer_u32 );
		var _norm_x = buffer_read( _buffer, buffer_f32 );
		var _norm_y = buffer_read( _buffer, buffer_f32 );
		var _norm_z = buffer_read( _buffer, buffer_f32 );
	
	} else if ( _format == global.vft_simple_2d ) {
	
		var _pos_x  = buffer_read( _buffer, buffer_f32 );
		var _pos_y  = buffer_read( _buffer, buffer_f32 );
		var _pos_z  = 0;
		var _tex_u  = buffer_read( _buffer, buffer_f32 );
		var _tex_v  = buffer_read( _buffer, buffer_f32 );
		var _colour = buffer_read( _buffer, buffer_u32 );
	
	} else {
	
		trace_error( false, "Vertex format (", _format, ") not recognised!" );
		break;
	
	}
	
}

buffer_delete( _buffer );

switch( _shape ) {
	case BUMP_SHAPE.SPHERE:
	break;
	case BUMP_SHAPE.BOX:
	break;
}
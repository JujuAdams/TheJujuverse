///@param name

if ( !OBJ_MODEL_ON ) return noone;
var _vertex_buffer = global.obj_vertex_buffer_map[? argument0 ];
if ( _vertex_buffer == undefined ) {
	trace_error( true, "Cannot find .obj reference for ", QU, argument0, QU );
	return noone;
}
return _vertex_buffer;
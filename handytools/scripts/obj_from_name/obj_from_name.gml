///@param name

var _vertex_buffer = global.obj_vertex_buffer_map[? argument0 ];
if ( _vertex_buffer == undefined ) trace_error( true, "Cannot find .obj reference for ", QU, argument0, QU )
return _vertex_buffer;
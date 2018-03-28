/// @description Finds the vertex buffer associated to a string name
/// @param name

if ( !DOTOBJ_ON ) return noone;
var _vertex_buffer = global.obj_vertex_buffer_map[? argument0 ];
if ( _vertex_buffer == undefined ) {
    if ( DOTOBJ_USE_FALLBACK ) {
        _vertex_buffer = global.obj_vertex_buffer_map[? DOTOBJ_MODEL_FALLBACK ];
        trace_error_q( !DOTOBJ_FALLBACK_CONTINUE, "Cannot find .obj reference for ", QU, argument0, QU );
    }
    if ( _vertex_buffer == undefined ) {
        trace_error( !DOTOBJ_FALLBACK_CONTINUE, "Cannot find .obj reference for ", QU, argument0, QU );
        return noone;
    }
}
return _vertex_buffer;
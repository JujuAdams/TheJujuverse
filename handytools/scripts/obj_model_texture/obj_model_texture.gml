/// @description Finds the texture associated to a string name
/// @param name

if ( !OBJMODEL_ON ) return noone;
var _texture = global.obj_texture_map[? argument0 ];
if ( _texture == undefined ) {
    if ( OBJ_USE_FALLBACK ) {
        _texture = sprite_get_texture( global.obj_vertex_buffer_map[? OBJ_MODEL_FALLBACK ], 0 );
        trace_error_q( !OBJ_FALLBACK_CONTINUE, "Cannot find .obj reference for ", QU, argument0, QU );
    } else {
        trace_error( !OBJ_FALLBACK_CONTINUE, "Cannot find .obj reference for ", QU, argument0, QU );
        return noone;
    }
}
return _texture;
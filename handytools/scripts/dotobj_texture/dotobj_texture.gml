/// @description Finds the texture associated to a string name
/// @param name

if ( !DOTOBJ_ON ) return noone;
var _texture = global.dotobj_texture_map[? argument0 ];
if ( _texture == undefined ) {
    if ( DOTOBJ_USE_FALLBACK ) {
        _texture = global.dotobj_texture_map[? DOTOBJ_MODEL_FALLBACK ];
        trace_error_q( !DOTOBJ_FALLBACK_CONTINUE, "Cannot find .obj reference for ", QU, argument0, QU );
    } else {
        trace_error( !DOTOBJ_FALLBACK_CONTINUE, "Cannot find .obj reference for ", QU, argument0, QU );
        return noone;
    }
}
return _texture;
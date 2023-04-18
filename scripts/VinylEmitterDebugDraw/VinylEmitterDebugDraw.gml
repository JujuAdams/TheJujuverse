/// Draws a visual representation of a Vinyl emitter for debugging purposes
/// 
/// This function is sensitive to the global colour and alpha state as set by
/// draw_set_color() and draw_set_alpha()
/// 
/// This function CANNOT be used with native GameMaker emitters
/// 
/// @param emitter

function VinylEmitterDebugDraw(_emitter)
{
    if (_emitter == undefined) return;
    _emitter.__DebugDraw();
}
/// Creates a Vinyl rectangle emitter and returns a reference to it
/// 
/// @param left
/// @param top
/// @param right
/// @param bottom

function VinylEmitterRectangle(_left, _top, _right, _bottom)
{
    var _emitterRef = new __VinylClassEmitterRef();
    _emitterRef.__Rectangle(_left, _top, _right, _bottom);
    return _emitterRef;
}
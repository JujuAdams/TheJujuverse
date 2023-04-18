/// Creates a Vinyl point emitter and returns a reference to it
/// 
/// @param x
/// @param y

function VinylEmitterPoint(_x, _y)
{
    var _emitterRef = new __VinylClassEmitterRef();
    _emitterRef.__Point(_x, _y);
    return _emitterRef;
}
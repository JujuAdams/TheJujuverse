/// Creates a Vinyl circle emitter and returns a reference to it
/// 
/// @param x
/// @param y
/// @param radius

function VinylEmitterCircle(_x, _y, _radius)
{
    var _emitterRef = new __VinylClassEmitterRef();
    _emitterRef.__Circle(_x, _y, _radius);
    return _emitterRef;
}
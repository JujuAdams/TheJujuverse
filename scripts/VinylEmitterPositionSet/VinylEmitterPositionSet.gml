/// Sets the position of the centre of a given Vinyl emitter
/// 
/// This function CANNOT be used with native GameMaker emitters
/// 
/// @param emitter
/// @param x
/// @param y

function VinylEmitterPositionSet(_emitter, _x, _y)
{
    if (_emitter == undefined) return;
    _emitter.__PositionSet(_x, _y);
}
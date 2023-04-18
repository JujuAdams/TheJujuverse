/// Returns a struct containing the position of a given Vinyl emitter
/// 
/// This function CANNOT be used with native GameMaker emitters
/// 
/// N.B. The returned struct is static. Do not keep a copy of this struct as it is liable to
///      change unexpectedly
/// 
/// @param emitter

function VinylEmitterPositionGet(_emitter)
{
    if (_emitter == undefined) return;
    return _emitter.__PositionGet();
}
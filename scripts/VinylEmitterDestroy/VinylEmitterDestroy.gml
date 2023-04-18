/// Destroys a Vinyl emitter
/// 
/// This function CANNOT be used with native GameMaker emitters
/// 
/// @param emitter

function VinylEmitterDestroy(_emitter)
{
    if (_emitter == undefined) return;
    _emitter.__Destroy();
}
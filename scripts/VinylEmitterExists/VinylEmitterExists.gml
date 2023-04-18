/// Returns if the Vinyl emitter exists
/// 
/// This function CANNOT be used with native GameMaker emitters
/// 
/// @param emitter

function VinylEmitterExists(_emitter)
{
    return (is_struct(_emitter) && is_instanceof(_emitter, __VinylClassEmitterRef));
}
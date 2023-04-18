/// Starts playing a sound on a Vinyl emitter and returns an ID to identify the voice
/// 
/// There is a perfomance overhead when creating and maintaining Vinyl audio voices. In
/// resource-constrained situations, you may want to consider using VinylPlaySimple() for some
/// of your audio (although audio played in such a way cannot be played on an emitter)
/// 
/// This function CANNOT be used with native GameMaker emitters
/// 
/// @param emitter
/// @param sound
/// @param [loop]
/// @param [gain=1]
/// @param [pitch=1]

function VinylPlayOnEmitter(_emitter, _sound, _loop = undefined, _gain = 1, _pitch = 1)
{
    if (!is_struct(_emitter) || !is_instanceof(_emitter, __VinylClassEmitterRef)) __VinylError("Emitter not valid");
    if (!is_struct(_emitter.__emitter)) __VinylError(_emitter, " has been destroyed");
    
    var _voice = __VinylPatternGet(_sound).__Play(_sound, undefined, _emitter, _sound, _loop, _gain, _pitch, undefined);
    return _voice.__id;
}
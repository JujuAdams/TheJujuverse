/// Starts playing a sound and returns an ID to identify the voice
/// 
/// Vinyl IDs are separate from GameMaker's native audio voices IDs and the two sets of
/// IDs cannot be used interchangeably
/// 
/// There is a perfomance overhead when creating and maintaining Vinyl audio voices. In
/// resource-constrained situations, you may want to consider using VinylPlaySimple() for some
/// of your audio
/// 
/// @param sound
/// @param [loop]
/// @param [gain=1]
/// @param [pitch=1]
/// @param [pan]

function VinylPlay(_sound, _loop = undefined, _gain = 1, _pitch = 1, _pan)
{
    var _voice = __VinylPatternGet(_sound).__Play(_sound, undefined, undefined, _sound, _loop, _gain, _pitch, _pan);
    return _voice.__id;
}
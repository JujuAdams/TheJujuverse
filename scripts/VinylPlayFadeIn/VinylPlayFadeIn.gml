// Feather disable all

/// Convenience function to play a new sound or pattern and fade it in. Please see VinylPlay() for
/// more information. The rate of change for this function is measured in "gain units per second".
/// 
/// @param sound/pattern
/// @param [loop]
/// @param [targetGain=1]
/// @oaram [rateOfChange]
/// @param [pitch=1]
/// @param [duckerName]
/// @param [duckPriority]

function VinylPlayFadeIn(_pattern, _loop = undefined, _gain = 1, _rateOfChange = VINYL_DEFAULT_FADE_IN_RATE, _pitch = 1, _duckerName = undefined, _duckPrio = undefined)
{
    var _voice = VinylPlay(_pattern, _loop, 0, _pitch, _duckerName, _duckPrio);
    VinylSetGain(_voice, _gain, _rateOfChange);
    return _voice;
}
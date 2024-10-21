// Feather disable all

/// Plays a sound or pattern. Sound playback works the same as native GameMaker functions. If you
/// are playing a pattern, the exact playback behaviour will change depending on the type of
/// pattern:
/// 
///   - Shuffle chooses a random sound from an array of sounds
///   - Blend plays multiple sounds whose balance can be adjusted by setting the blend factor
///   - Head-Loop-Tail plays a head, then a loop (until the end loop function is called), then a tail
/// 
/// This function returns a voice index which can be used with other Vinyl functions to adjust
/// playback and trigger pattern behaviours where relevant.
/// 
/// @param sound/pattern
/// @param [loop]
/// @param [gain=1]
/// @param [pitch=1]
/// @param [duckerName]
/// @param [duckPriority]

function VinylPlay(_pattern, _loop = undefined, _gain = 1, _pitch = 1, _duckerName = undefined, _duckPrio = undefined)
{
    static _patternDict = __VinylSystem().__patternDict;
    
    if (is_handle(_pattern))
    {
        return __VinylEnsurePatternSound(_pattern).__Play(undefined, _loop, _gain, _pitch, _duckerName, _duckPrio);
    }
    else if (is_string(_pattern))
    {
        var _patternStruct = _patternDict[$ _pattern];
        if (_patternStruct != undefined)
        {
            return _patternStruct.__Play(undefined, _loop, _gain, _pitch, _duckerName, _duckPrio);
        }
        else
        {
            __VinylError("Pattern \"", _pattern, "\" not found");
        }
    }
    else
    {
        __VinylError("Datatype not supported (", typeof(_pattern), ")");
    }
}
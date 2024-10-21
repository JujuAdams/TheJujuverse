// Feather disable all

/// Returns whether a pattern exists i.e. has been defined by a `VinylSetup*()` function (including
/// JSON variants). If the `explicit` parameter is set to `false` (the default) then this function
/// will always return `true` if a sound asset is passed as the parameter regardless of whether a
/// pattern has explicitly been created for the sound asset or not.
/// 
/// @param sound/pattern
/// @param [explicit=false]

function VinylPatternExists(_pattern, _explicit = false)
{
    static _soundDict   = __VinylSystem().__soundDict;
    static _patternDict = __VinylSystem().__patternDict;
    
    if (is_handle(_pattern))
    {
        if (not audio_exists(_pattern)) return false;
        if (not _explicit) return true;
        return (struct_get_from_hash(_soundDict, int64(_pattern)) != undefined);
    }
    else if (is_string(_pattern))
    {
        return (_patternDict[$ _pattern] != undefined);
    }
    
    return false;
}
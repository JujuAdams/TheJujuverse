// Feather disable all

/// @param sound

function __VinylEnsurePatternSound(_sound)
{
    static _soundDict = __VinylSystem().__soundDict;
    
    var _pattern = struct_get_from_hash(_soundDict, int64(_sound));
    if (_pattern == undefined)
    {
        _pattern = new __VinylClassPatternSound(_sound, 1, 1, undefined, (VINYL_DEFAULT_MIX == VINYL_NO_MIX)? undefined : VINYL_DEFAULT_MIX, undefined, undefined, undefined, undefined);
        struct_set_from_hash(_soundDict, int64(_sound), _pattern);
    }
    
    return _pattern;
}
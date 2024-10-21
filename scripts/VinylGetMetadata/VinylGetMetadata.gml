// Feather disable all

/// Returns the metadata associated with the sound or pattern, as set up by Vinyl's config JSON or
/// a call to VinylSetup*().
/// 
/// @param sound/pattern
/// @param [default=undefined]

function VinylGetMetadata(_pattern, _default = undefined)
{
    static _patternDict = __VinylSystem().__patternDict;
    
    if (is_handle(_pattern))
    {
        return __VinylEnsurePatternSound(_pattern).__metadata ?? _default;
    }
    else if (is_string(_pattern))
    {
        var _patternStruct = _patternDict[$ _pattern];
        if (_patternStruct != undefined)
        {
            return _patternStruct.__metadata ?? _default;
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
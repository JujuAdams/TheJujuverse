/// @param patternName
/// @param [string=basic]

function __VinylConvertPatternNameToConstructor(_patternName, _string = "basic")
{
    if (_string == "asset")
    {
        return __VinylClassPatternAsset;
    }
    else if (_string == "basic")
    {
        return __VinylClassPatternBasic;
    }
    else if (_string == "shuffle")
    {
        return __VinylClassPatternShuffle;
    }
    else if (_string == "queue")
    {
        return __VinylClassPatternQueue;
    }
    else if (_string == "multi")
    {
        return __VinylClassPatternMulti;
    }
    else
    {
        if (_patternName == undefined)
        {
            __VinylError("Pattern type \"", _string, "\" not recognised");
        }
        else
        {
            __VinylError("Pattern type \"", _string, "\" for pattern \"", _patternName, "\" not recognised");
        }
    }
}
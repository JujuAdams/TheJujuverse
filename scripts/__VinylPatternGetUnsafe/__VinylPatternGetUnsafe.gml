/// @param sound/patternName

function __VinylPatternGetUnsafe(_key)
{
    static _globalData = __VinylGlobalData();
    return _globalData.__patternDict[$ _key]; //Don't use a static here because this struct can be recreated
}
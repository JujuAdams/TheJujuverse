// Feather disable all

/// Sets up a blend pattern for playback with Vinyl. When played, a blend pattern will play
/// multiple sounds whose balance can be adjusted by setting the blend factor with the
/// VinylSetBlendFactor() and VinylSetBlendAnimCurve() functions.
/// 
/// You should typically only call this function once on boot or if you're reloading configuration
/// data due to the presence of mods. Subsequent calls to this function will only affect audio that
/// is already playing if VINYL_LIVE_EDIT is set to <true>, and even then calls to this function
/// whilst audio is playing is expensive.
/// 
/// @param patternName
/// @param soundArray
/// @param [loop]
/// @param [gain=1]
/// @param [animCurve]
/// @param [mix=VINYL_DEFAULT_MIX]
/// @param [duckerName]
/// @param [duckPriority=0]
/// @param [emitterAlias]
/// @param [metadata]

function VinylSetupBlend(_patternName, _soundArray, _loop = undefined, _gain = 1, _animCurve = undefined, _mixName = VINYL_DEFAULT_MIX, _duckerName = undefined, _duckPrio = undefined, _emitterAlias = undefined, _metadata = undefined)
{
    static _system      = __VinylSystem();
    static _patternDict = _system.__patternDict;
    
    if (is_array(_gain))
    {
        __VinylError("Cannot use an array as a blend pattern gain");
    }
    
    if (_mixName == VINYL_NO_MIX) _mixName = undefined;
    
    //Update an existing pattern if possible, otherwise make a new pattern
    var _existingPattern = _patternDict[$ _patternName];
    if (_existingPattern != undefined)
    {
        _existingPattern.__UpdateSetup(_soundArray, _loop, _gain, _animCurve, _mixName, _duckerName, _duckPrio, _metadata);
    }
    else
    {
        _patternDict[$ _patternName] = new __VinylClassPatternBlend(_patternName, _soundArray, _loop, _gain, _animCurve, _mixName, _duckerName, _duckPrio, _emitterAlias, _metadata);
    }
    
    if (VINYL_LIVE_EDIT && (not _system.__importingJSON))
    {
        __VinylResolveChanges(false);
    }
}
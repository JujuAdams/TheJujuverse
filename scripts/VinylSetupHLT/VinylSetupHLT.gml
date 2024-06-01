// Feather disable all

/// Sets up a head-loop-tail pattern for playback with Vinyl. When played, an HLT pattern will
/// first play the "head" sound. Once that sound has finished, the loop sound will be played.
/// If VinylSetLoop() is called on the HLT voice to stop looping then the tail sound will be
/// played after the loop sound has finished.
/// 
/// You should typically only call this function once on boot or if you're reloading configuration
/// data due to the presence of mods. Subsequent calls to this function will only affect audio that
/// is already playing if VINYL_LIVE_EDIT is set to <true>, and even then calls to this function
/// whilst audio is playing is expensive.
/// 
/// @param patternName
/// @param [soundHead]
/// @param soundLoop
/// @param [soundTail]
/// @param [gain=1]
/// @param [mix=VINYL_DEFAULT_MIX]
/// @param [duckerName]
/// @param [duckPriority=0]
/// @param [metadata]

function VinylSetupHLT(_patternName, _soundHead = undefined, _soundLoop, _soundTail = undefined, _gain = 1, _mixName = VINYL_DEFAULT_MIX, _duckerName = undefined, _duckPrio = undefined, _metadata = undefined)
{
    static _system      = __VinylSystem();
    static _patternDict = _system.__patternDict;
    
    if (_mixName == VINYL_NO_MIX) _mixName = undefined;
    
    //Update an existing pattern if possible, otherwise make a new pattern
    var _existingPattern = _patternDict[$ _patternName];
    if (_existingPattern != undefined)
    {
        _existingPattern.__UpdateSetup(_soundHead, _soundLoop, _soundTail, _gain, _mixName, _duckerName, _duckPrio, _metadata);
    }
    else
    {
        _patternDict[$ _patternName] = new __VinylClassPatternHLT(_patternName, _soundHead, _soundLoop, _soundTail, _gain, _mixName, _duckerName, _duckPrio, _metadata);
    }
    
    if (VINYL_LIVE_EDIT && (not _system.__importingJSON))
    {
        __VinylResolveChanges(false);
    }
}
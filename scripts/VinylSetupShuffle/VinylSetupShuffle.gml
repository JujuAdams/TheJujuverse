// Feather disable all

/// Sets up a shuffle pattern for playback with Vinyl. When played, a shuffle pattern will randomly
/// choose a sound from an array of sounds when played.
/// 
/// You should typically only call this function once on boot or if you're reloading configuration
/// data due to the presence of mods. Subsequent calls to this function will only affect audio that
/// is already playing if VINYL_LIVE_EDIT is set to <true>, and even then calls to this function
/// whilst audio is playing is expensive.
/// 
/// @param patternName
/// @param soundArray
/// @param [gain=1]
/// @param [pitch=1]
/// @param [loop]
/// @param [mix=VINYL_DEFAULT_MIX]
/// @param [duckerName]
/// @param [duckPriority=0]
/// @param [metadata]

function VinylSetupShuffle(_patternName, _soundArray, _gain = undefined, _pitch = undefined, _loop = undefined, _mixName = VINYL_DEFAULT_MIX, _duckerName = undefined, _duckPrio = undefined, _metadata = undefined)
{
    static _system      = __VinylSystem();
    static _patternDict = _system.__patternDict;
    
    if (_gain == undefined)
    {
        var _gainMin = 1;
        var _gainMax = 1;
    }
    else if (is_array(_gain))
    {
        if (array_length(_gain) == 2)
        {
            var _gainMin = _gain[0];
            var _gainMax = _gain[1];
        }
        else
        {
            __VinylError("Array length for gain argument must be 2 (found ", array_length(_gain), ")");
        }
    }
    else
    {
        var _gainMin = _gain;
        var _gainMax = _gain;
    }
    
    if (_pitch == undefined)
    {
        var _pitchMin = 1;
        var _pitchMax = 1;
    }
    else if (is_array(_pitch))
    {
        if (array_length(_pitch) == 2)
        {
            var _pitchMin = _pitch[0];
            var _pitchMax = _pitch[1];
        }
        else
        {
            __VinylError("Array length for pitch argument must be 2 (found ", array_length(_pitch), ")");
        }
    }
    else
    {
        var _pitchMin = _pitch;
        var _pitchMax = _pitch;
    }
    
    if (_mixName == VINYL_NO_MIX) _mixName = undefined;
    
    //Update an existing pattern if possible, otherwise make a new pattern
    var _existingPattern = _patternDict[$ _patternName];
    if (_existingPattern != undefined)
    {
        _existingPattern.__UpdateSetup(_soundArray, _gainMin, _gainMax, _pitchMin, _pitchMax, _loop, _mixName, _duckerName, _duckPrio, _metadata);
    }
    else
    {
        _patternDict[$ _patternName] = new __VinylClassPatternShuffle(_patternName, _soundArray, _gainMin, _gainMax, _pitchMin, _pitchMax, _loop, _mixName, _duckerName, _duckPrio, _metadata);
    }
    
    if (VINYL_LIVE_EDIT && (not _system.__importingJSON))
    {
        __VinylResolveChanges(false);
    }
}
// Feather disable all

/// Sets up a mix that can be used to control multiple sounds, patterns, and voices all at the same
/// time. Mixes should be defined before sounds and patterns.
/// 
/// You should typically only call this function once on boot. Subsequent calls to this function
/// will only affect audio that is already playing if VINYL_LIVE_EDIT is set to <true>, and even
/// then calls to this function whilst audio is playing is expensive.
/// 
/// @param mixName
/// @param [baseGain=1]
/// @param [membersLoop]
/// @param [membersDuckOn]
/// @param [metadata]

function VinylSetupMix(_mixName, _gainPattern = 1, _membersLoop = undefined, _membersDuckOn = undefined, _metadata = undefined)
{
    static _system   = __VinylSystem();
    static _mixDict  = _system.__mixDict;
    static _mixArray = _system.__mixArray;
    
    if (_mixName == VINYL_NO_MIX)
    {
        __VinylError("Cannot set up a new mix with the same name as VINYL_NO_MIX (\"", VINYL_NO_MIX, "\")");
    }
    
    //Update an existing pattern if possible, otherwise make a new pattern
    var _existingPattern = _mixDict[$ _mixName];
    if (_existingPattern != undefined)
    {
        _existingPattern.__UpdateSetup(_gainPattern, _membersLoop, _membersDuckOn, _metadata);
    }
    else
    {
        var _mixStruct = new __VinylClassMix(_mixName, _gainPattern, _membersLoop, _membersDuckOn, _metadata);
        _mixDict[$ _mixName] = _mixStruct;
        array_push(_mixArray, _mixStruct);
    }
    
    if (VINYL_LIVE_EDIT && (not _system.__importingJSON))
    {
        __VinylResolveChanges(false);
    }
}
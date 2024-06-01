// Feather disable all

/// Sets up a ducker that can be used to control dynamically control the gain of sounds depending\
/// on their priority relative to the currently playing sound:
/// 
/// - Incoming audio with a lower priority will have its gain reduced
/// - Incoming audio with the same priority will fade out the old audio and replace it
/// - Incoming audio with a higher priority will reduce the gain of the old audio
/// 
/// When a sound stops playing, sounds with a lower priority (if any exist) will have their gain
/// increased.
/// 
/// You should typically only call this function once on boot. Subsequent calls to this function
/// will only affect audio that is already playing if VINYL_LIVE_EDIT is set to <true>, and even
/// then calls to this function whilst audio is playing is expensive.
/// 
/// @param duckerName
/// @param [duckedGain=0]
/// @param [rateOfChange=1]

function VinylSetupDucker(_duckerName, _duckedGain = 0, _rateOfChange = __VINYL_DEFAULT_DUCK_RATE_OF_GAIN)
{
    static _system    = __VinylSystem();
    static _duckerDict  = _system.__duckerDict;
    static _duckerArray = _system.__duckerArray;
    
    //Update an existing pattern if possible, otherwise make a new pattern
    var _existingPattern = _duckerDict[$ _duckerName];
    if (_existingPattern != undefined)
    {
        _existingPattern.__UpdateSetup(_duckedGain, _rateOfChange);
    }
    else
    {
        var _duckerStruct = new __VinylClassDucker(_duckerName, _duckedGain, _rateOfChange);
        _duckerDict[$ _duckerName] = _duckerStruct;
        array_push(_duckerArray, _duckerStruct);
    }
    
    if (VINYL_LIVE_EDIT && (not _system.__importingJSON))
    {
        __VinylResolveChanges(false);
    }
}
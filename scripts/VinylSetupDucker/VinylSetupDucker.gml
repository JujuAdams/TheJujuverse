// Feather disable all

/// Sets up a ducker that can be used to control dynamically control the gain of sounds depending
/// on their priority relative to the currently playing sound. There are two modes, determined by
/// whether the "samePriorityInterrupt" parameter is set to <true> (the default) or <false>.
/// 
/// If "samePriorityInterrupt" is set to <true> then the following behaviour will occur:
/// 
/// - Incoming audio with a lower priority will have its gain reduced
/// - Incoming audio with the same priority will fade out the old audio and replace it
/// - Incoming audio with a higher priority will reduce the gain of the old audio
/// 
/// If "samePriorityInterrupt" is set to <false> then the following behaviour will occur:
/// 
/// - Incoming audio with a lower priority will have its gain reduced
/// - Incoming audio with the same priority will play as normal
/// - Incoming audio with a higher priority will reduce the gain of the old audio
/// 
/// Regardless, when a sound stops playing, sounds with a lower priority (if any exist) will have
/// their gain increased.
/// 
/// You should typically only call this function once on boot. Subsequent calls to this function
/// will only affect audio that is already playing if VINYL_LIVE_EDIT is set to <true>, and even
/// then calls to this function whilst audio is playing is expensive.
/// 
/// @param duckerName
/// @param [duckedGain=0]
/// @param [rateOfChange=1]
/// @param [samePriorityInterrupt=true]

function VinylSetupDucker(_duckerName, _duckedGain = 0, _rateOfChange = __VINYL_DEFAULT_DUCK_RATE_OF_GAIN, _samePriorityInterrupt = true)
{
    static _system    = __VinylSystem();
    static _duckerDict  = _system.__duckerDict;
    static _duckerArray = _system.__duckerArray;
    
    if (is_array(_duckedGain))
    {
        __VinylError("Cannot use an array as the ducked gain");
    }
    
    //Update an existing pattern if possible, otherwise make a new pattern
    var _existingPattern = _duckerDict[$ _duckerName];
    if (_existingPattern != undefined)
    {
        _existingPattern.__UpdateSetup(_duckedGain, _rateOfChange, _samePriorityInterrupt);
    }
    else
    {
        var _duckerStruct = new __VinylClassDucker(_duckerName, _duckedGain, _rateOfChange, _samePriorityInterrupt);
        _duckerDict[$ _duckerName] = _duckerStruct;
        array_push(_duckerArray, _duckerStruct);
    }
    
    if (VINYL_LIVE_EDIT && (not _system.__importingJSON))
    {
        __VinylResolveChanges(false);
    }
}
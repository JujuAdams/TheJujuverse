// Feather disable all

/// Fades out all voices currently playing in a given mix. Once a voice is set to fade out, it
/// cannot be stopped. The rate of change for this function is measured in "gain units per second".
/// If the optional `pause` parameter is set to `false` (the default) then mix voices will stop
/// once faded out. If the `pause` parameter is set to `true` then mix voices will be paused
/// instead and can be unpaused using the `VinylMixVoicesSetPause()` or `VinylSetPause()` functions.
/// When resuming playback of mix voices, it will *not* fade in.
/// 
/// @param mixName
/// @param [rateOfChange]
/// @param [pause=false]

function VinylMixVoicesFadeOut(_mixName, _rateOfChange = VINYL_DEFAULT_FADE_OUT_RATE, _pause = false)
{
    static _mixDict = __VinylSystem().__mixDict;
    
    var _mixStruct = _mixDict[$ _mixName];
    if (_mixStruct == undefined) __VinylError("Mix \"", _mixName, "\" not recognised");
     
    _mixStruct.__VoicesFadeOut(max(0.001, _rateOfChange), _pause);
}
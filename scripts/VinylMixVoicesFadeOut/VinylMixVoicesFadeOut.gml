// Feather disable all

/// Fades out all voices currently playing in a given mix. Once a voice is set to fade out, it
/// cannot be stopped. The rate of change for this function is measured in "gain units per second".
/// 
/// @param mixName
/// @param [rateOfChange]

function VinylMixVoicesFadeOut(_mixName, _rateOfChange = VINYL_DEFAULT_FADE_OUT_RATE)
{
    static _mixDict = __VinylSystem().__mixDict;
    
    var _mixStruct = _mixDict[$ _mixName];
    if (_mixStruct == undefined) __VinylError("Mix \"", _mixName, "\" not recognised");
    
    _mixStruct.__VoicesFadeOut(_rateOfChange);
}
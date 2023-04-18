/// Fades out a voice, stopping it once it reaches silence
/// 
/// Once a voice is fading out, the process cannot be halted or paused
/// This is called "shutdown" mode, and you can detect if a voice is fading
/// out by calling VinylShutdownGet()
/// 
/// If passed a label name, every voice currently assigned to the label will
/// individually fade out. This is the same as calling VinylFadeOut() for each individual
/// voice. The gain target for the label itself is NOT affected
/// 
/// This function CANNOT be used with audio played using VinylPlaySimple()
/// 
/// @param vinylID/labelName
/// @param [rate=VINYL_DEFAULT_GAIN_RATE]

function VinylFadeOut(_id, _rate = VINYL_DEFAULT_GAIN_RATE)
{
    static _globalData = __VinylGlobalData();
    static _idToVoiceDict = _globalData.__idToVoiceDict;
    
    var _voice = _idToVoiceDict[? _id];
    if (is_struct(_voice)) return _voice.__FadeOut(_rate);
    
    var _label = _globalData.__labelDict[$ _id];
    if (is_struct(_label)) return _label.__FadeOut(_rate);
    
    __VinylTrace("Warning! Failed to execute VinylFadeOut() for ", _id);
}
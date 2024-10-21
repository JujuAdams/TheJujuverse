// Feather disable all

/// Returns if the target voice's playback is paused.
/// 
/// N.B. This function only works with voices and will not work with patterns or sound assets.
/// 
/// @param voice

function VinylIsPaused(_voice)
{
    static _voiceToStructMap = __VinylSystem().__voiceToStructMap;
    
    var _voiceStruct = _voiceToStructMap[? _voice];
    if (_voiceStruct == undefined)
    {
        return (_voice != undefined)? audio_is_paused(_voice) : false;
    }
    else
    {
        return _voiceStruct.__IsPaused();
    }
}
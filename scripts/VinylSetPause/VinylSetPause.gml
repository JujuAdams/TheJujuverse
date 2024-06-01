// Feather disable all

/// Pauses or unpauses the target voice.
/// 
/// @param voice
/// @param state

function VinylSetPause(_voice, _state)
{
    static _voiceToStructMap = __VinylSystem().__voiceToStructMap;
    
    var _voiceStruct = _voiceToStructMap[? _voice];
    if (_voiceStruct == undefined)
    {
        if (_voice != undefined)
        {
            if (_state)
            {
                audio_pause_sound(_voice);
            }
            else
            {
                audio_resume_sound(_voice);
            }
        }
    }
    else
    {
        _voiceStruct.__SetPause(_state);
    }
}
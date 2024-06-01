// Feather disable all

/// Immediately stops playback of a voice.
/// 
/// @param voice

function VinylStop(_voice)
{
    static _voiceToStructMap = __VinylSystem().__voiceToStructMap;
    
    var _voiceStruct = _voiceToStructMap[? _voice];
    if (_voiceStruct == undefined)
    {
        if (_voice != undefined)
        {
            audio_stop_sound(_voice);
        }
    }
    else
    {
        _voiceStruct.__Stop();
    }
}
// Feather disable all

/// Resumes playback of a paused voice.
/// 
/// @param voice

function VinylResume(_voice)
{
    static _voiceToStructMap = __VinylSystem().__voiceToStructMap;
    
    var _voiceStruct = _voiceToStructMap[? _voice];
    if (_voiceStruct == undefined)
    {
        if (_voice != undefined)
        {
            audio_resume_sound(_voice);
        }
    }
    else
    {
        _voiceStruct.__Resume();
    }
}
// Feather disable all

/// Returns the local pitch for a voice.
/// 
/// @param voice

function VinylGetPitch(_voice)
{
    static _voiceToStructMap = __VinylSystem().__voiceToStructMap;
    
    var _voiceStruct = _voiceToStructMap[? _voice];
    if (_voiceStruct == undefined)
    {
        return (_voice != undefined)? audio_sound_get_pitch(_voice) : 0;
    }
    else
    {
        return _voiceStruct.__pitchLocal;
    }
}
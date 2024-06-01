// Feather disable all

/// Returns the local gain for a voice.
/// 
/// @param voice

function VinylGetGain(_voice)
{
    static _voiceToStructMap = __VinylSystem().__voiceToStructMap;
    
    var _voiceStruct = _voiceToStructMap[? _voice];
    if (_voiceStruct == undefined)
    {
        return (_voice != undefined)? audio_sound_get_gain(_voice) : 0;
    }
    else
    {
        return _voiceStruct.__gainLocal;
    }
}
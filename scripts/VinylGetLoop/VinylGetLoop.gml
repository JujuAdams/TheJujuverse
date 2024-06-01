// Feather disable all

/// Returns whether the target voice is set to loop.
/// 
/// @param voice

function VinylGetLoop(_voice)
{
    static _voiceToStructMap = __VinylSystem().__voiceToStructMap;
    
    var _voiceStruct = _voiceToStructMap[? _voice];
    if (_voiceStruct == undefined)
    {
        return (_voice != undefined)? audio_sound_get_loop(_voice) : false;
    }
    else
    {
        return _voiceStruct.__GetLoop();
    }
}
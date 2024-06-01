// Feather disable all

/// Sets the target queue's behaviour. Please see VinylQueueCreate() for more information.
/// 
/// @param voice
/// @param behaviour
/// @param [setForPlaying=true]

function VinylQueueSetBehaviour(_voice, _behaviour, _setForPlaying = true)
{
    static _voiceToStructMap = __VinylSystem().__voiceToStructMap;
    
    var _voiceStruct = _voiceToStructMap[? _voice];
    if (not is_instanceof(_voiceStruct, __VinylClassVoiceQueue)) return undefined;
    
    return _voiceStruct.__SetBehaviour(_behaviour, _setForPlaying);
}
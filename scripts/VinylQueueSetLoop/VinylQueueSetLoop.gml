// Feather disable all

/// Sets whether the queue itself should loop. If you'd like to alter the loop state of the
/// currently playing sound then use VinylGetLoop().
/// 
/// @param voice
/// @param state

function VinylQueueSetLoop(_voice, _state)
{
    static _voiceToStructMap = __VinylSystem().__voiceToStructMap;
    
    var _voiceStruct = _voiceToStructMap[? _voice];
    if (not is_instanceof(_voiceStruct, __VinylClassVoiceQueue)) return undefined;
    
    _voiceStruct.__loopQueue = _state;
}
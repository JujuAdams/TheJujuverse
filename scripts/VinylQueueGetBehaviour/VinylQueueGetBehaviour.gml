// Feather disable all

/// Returns the target queue's behaviour.
/// 
/// @param voice

function VinylQueueGetBehaviour(_voice)
{
    static _voiceToStructMap = __VinylSystem().__voiceToStructMap;
    
    var _voiceStruct = _voiceToStructMap[? _voice];
    if (not is_instanceof(_voiceStruct, __VinylClassVoiceQueue)) return undefined;
    
    return _voiceStruct.__behaviour;
}
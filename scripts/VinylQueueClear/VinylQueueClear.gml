// Feather disable all

/// Clears all sounds in a queue's array of sounds. This won't stop the currently playing
/// sound, however.
/// 
/// @param voice

function VinylQueueClear(_voice)
{
    static _voiceToStructMap = __VinylSystem().__voiceToStructMap;
    
    var _voiceStruct = _voiceToStructMap[? _voice];
    if (not is_instanceof(_voiceStruct, __VinylClassVoiceQueue)) return undefined;
    
    array_resize(_voiceStruct.__soundArray, 0);
}
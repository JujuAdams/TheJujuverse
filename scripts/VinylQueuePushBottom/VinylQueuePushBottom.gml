// Feather disable all

/// Pushes a sound to the bottom of a queue's array of sounds. If the queue is empty then the next
/// sound will be played at the start of the next frame.
/// 
/// @param voice
/// @param sound

function VinylQueuePushBottom(_voice, _sound)
{
    static _voiceToStructMap = __VinylSystem().__voiceToStructMap;
    
    var _voiceStruct = _voiceToStructMap[? _voice];
    if (not is_instanceof(_voiceStruct, __VinylClassVoiceQueue)) return undefined;
    
    array_push(_voiceStruct.__soundArray, _sound);
}
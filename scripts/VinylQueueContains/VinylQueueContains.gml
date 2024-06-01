// Feather disable all

/// Returns whether a queue's array of sounds contains the specified target sound. This function
/// will return <true> if the currently playing sound also matches the target sound.
/// 
/// @param voice
/// @param sound

function VinylQueueContains(_voice, _sound)
{
    static _voiceToStructMap = __VinylSystem().__voiceToStructMap;
    
    var _voiceStruct = _voiceToStructMap[? _voice];
    if (not is_instanceof(_voiceStruct, __VinylClassVoiceQueue)) return undefined;
    
    return ((_voiceStruct.__soundCurrent == _sound) || array_contains(_voiceStruct.__soundArray, _sound));
}
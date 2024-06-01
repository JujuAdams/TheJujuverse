// Feather disable all

/// Sets the blend factor for a blend voice. The blend factor should be a value between 0 and 1.
/// How the blend factor interacts with the blend voice depends on whether the blend voice is set
/// to use an animation curve to determine gains, or whether the blend voice is not using an
/// animation curve. If the target voice is not a blend voice then this function will do nothing.
/// 
/// @param voice
/// @param factor

function VinylSetBlendFactor(_voice, _factor)
{
    static _voiceToStructMap = __VinylSystem().__voiceToStructMap;
    
    var _voiceStruct = _voiceToStructMap[? _voice];
    if (not is_instanceof(_voiceStruct, __VinylClassVoiceBlend)) return undefined;
    
    return _voiceStruct.__SetBlend(_factor);
}
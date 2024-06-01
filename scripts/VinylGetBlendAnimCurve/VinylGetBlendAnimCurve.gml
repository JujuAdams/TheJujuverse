// Feather disable all

/// Returns the animation curve set for a blend voice. If no animation curve has been set then this
/// function will return <undefined>. If the target voice is not a blend voice then this function
/// will return <undefined>.
/// 
/// @param voice

function VinylGetBlendAnimCurve(_voice)
{
    static _voiceToStructMap = __VinylSystem().__voiceToStructMap;
    
    var _voiceStruct = _voiceToStructMap[? _voice];
    if (not is_instanceof(_voiceStruct, __VinylClassVoiceBlend)) return undefined;
    
    return _voiceStruct.__blendAnimCurve;
}
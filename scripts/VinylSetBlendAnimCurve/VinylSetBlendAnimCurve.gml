// Feather disable all

/// Sets the animation curve for a blend voice. This animation curve will be used to derive gains
/// for each of the blend voice's sounds. If the target voice is not a blend voice then this
/// function does nothing.
/// 
/// @param voice
/// @param animCurve
/// @param [factor]

function VinylSetBlendAnimCurve(_voice, _animCurve, _factor = undefined)
{
    static _voiceToStructMap = __VinylSystem().__voiceToStructMap;
    
    var _voiceStruct = _voiceToStructMap[? _voice];
    if (not is_instanceof(_voiceStruct, __VinylClassVoiceBlend)) return undefined;
    
    return _voiceStruct.__SetBlendAnimCurve(_animCurve, _factor);
}
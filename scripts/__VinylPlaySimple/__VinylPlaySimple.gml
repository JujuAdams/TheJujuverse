/// @param sound
/// @param gain
/// @param pitchLo
/// @param pitchHi
/// @param labelArray
/// @param effectChainName

function __VinylPlaySimple(_sound, _gain, _pitchLo, _pitchHi, _labelArray, _effectChainName)
{
    static _effectChainDict = __VinylGlobalData().__effectChainDict;
    
    var _randomPitchParam = __VinylRandom(1);
    var _pitch = lerp(_pitchLo, _pitchHi, _randomPitchParam);
    
    var _i = 0;
    repeat(array_length(_labelArray))
    {
        var _label = _labelArray[_i];
        
        _gain *= _label.__gainOutput;
        var _labelPitch = lerp(_label.__configPitchLo, _label.__configPitchHi, _randomPitchParam);
        _pitch *= _labelPitch*_label.__pitchOutput;
        
        ++_i;
    }
    
    //Determine the emitter we should play this sound on
    var _effectChainStruct = _effectChainDict[$ _effectChainName];
    var _effectChainEmitter = (_effectChainStruct == undefined)? undefined : _effectChainStruct.__emitter;
    
    if (_effectChainEmitter == undefined)
    {
        var _instance = audio_play_sound(_sound, 1, false, __VinylCurveAmplitude(_gain), 0, _pitch);
    }
    else
    {
        var _instance = audio_play_sound_on(_effectChainEmitter, _sound, false, 1, __VinylCurveAmplitude(_gain), 0, _pitch);
    }
    
    if (VINYL_DEBUG_LEVEL >= 1)
    {
        __VinylTrace("Playing ", audio_get_name(_sound), ", gain=", _gain, ", pitch=", _pitch, ", effect chain=", _effectChainName, ", label=", __VinylDebugLabelNames(__labelArray), " (GMinst=", _instance, ")");
    }
    
    return _instance;
}
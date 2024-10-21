// Feather disable all

/// @param voice

function __VinylEnsureSoundVoice(_voice)
{
    static _voiceToStructMap = __VinylSystem().__voiceToStructMap;
    static _mixDict          = __VinylSystem().__mixDict;
    static _nullVoice        = __VinylSystem().__nullVoice;
    
    var _voiceStruct = _voiceToStructMap[? _voice];
    if (_voiceStruct == undefined)
    {
        if ((_voice <= 0xFFFFFFFF) && (not audio_is_playing(_voice)))
        {
            return _nullVoice;
        }
        
        var _sound = audio_sound_get_asset(_voice);
        if (not audio_exists(_sound))
        {
            __VinylError("Could not find sound for ", _voice, "\nPlease report this error");
            return;
        }
        
        var _pattern = __VinylEnsurePatternSound(_sound);
        var _mixStruct = _mixDict[$ _pattern.__mixName];
        
        var _gainSound = _pattern.__gain;
        var _gainMix   = (_mixStruct == undefined)? 1 : _mixStruct.__gainFinal;
        var _gainLocal = ((_gainSound*_gainMix) == 0)? 1 : (audio_sound_get_gain(_voice) / (_gainSound*_gainMix));
        
        var _pitchSound = _pattern.__pitch;
        var _pitchMix   = (_mixStruct == undefined)? 1 : _mixStruct.__pitchLocal;
        var _pitchLocal = ((_pitchSound*_pitchMix) == 0)? 1 : (audio_sound_get_pitch(_voice) / (_pitchSound*_pitchMix));
        
        _voiceStruct = new __VinylClassVoiceSound(_voice,
                                                  audio_sound_get_loop(_voice),
                                                  _gainSound, _gainLocal, _gainMix, 1,
                                                  _pitchSound, _pitchLocal, _pitchMix,
                                                  undefined, undefined, 0, _pattern);
    }
    
    return _voiceStruct;
}
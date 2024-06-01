// Feather disable all

/// @param voice

function __VinylEnsureSoundVoice(_voice)
{
    static _voiceToStructMap = __VinylSystem().__voiceToStructMap;
    static _voiceToSoundMap  = __VinylSystem().__voiceToSoundMap;
    static _soundDict        = __VinylSystem().__soundDict;
    static _mixDict          = __VinylSystem().__mixDict;
    static _nullVoice        = __VinylSystem().__nullVoice;
    
    var _voiceStruct = _voiceToStructMap[? _voice];
    if (_voiceStruct == undefined)
    {
        if ((_voice <= 0xFFFFFFFF) && (not audio_is_playing(_voice)))
        {
            return _nullVoice;
        }
        
        var _sound = _voiceToSoundMap[? _voice];
        if (_sound == undefined)
        {
            __VinylError("Could not find sound for ", _voice, "\nPlease report this error");
            return;
        }
        
        var _pattern = struct_get_from_hash(_soundDict, _sound);
        var _mixStruct = _mixDict[$ _pattern.__mixName];
        
        var _gainSound = _pattern.__gain;
        var _gainMix   = (_mixStruct == undefined)? 1 : _mixStruct.__gainFinal;
        var _pitchLocal = ((_pitchSound*_gainMix) == 0)? 1 : (audio_sound_get_gain(_voice) / (_pitchSound*_gainMix));
        
        var _pitchSound = _pattern.__pitch;
        var _pitchLocal = (_pitchSound == 0)? 1 : (audio_sound_get_pitch(_voice) / _pitchSound);
        
        _voiceStruct = new __VinylClassVoiceSound(_voice,
                                                  audio_sound_get_loop(_voice),
                                                  _gainSound, _pitchLocal, _gainMix, 1,
                                                  _pitchSound, _pitchLocal,
                                                  undefined, 0, _pattern);
    }
    
    return _voiceStruct;
}
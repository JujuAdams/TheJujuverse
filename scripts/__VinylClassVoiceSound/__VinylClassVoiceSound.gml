// Feather disable all

/// @param voice
/// @param loopLocal
/// @param gainSound
/// @param gainLocal
/// @param gainMix
/// @param gainDuck
/// @param pitchSound
/// @param pitchLocal
/// @param duckerNameLocal
/// @param duckPrioLocal
/// @param pattern

function __VinylClassVoiceSound(_voice, _loopLocal, _gainSound, _gainLocal, _gainMix, _gainDuck, _pitchSound, _pitchLocal, _duckerNameLocal, _duckPrioLocal, _pattern) constructor
{
    static _soundDict        = __VinylSystem().__soundDict;
    static _voiceToStructMap = __VinylSystem().__voiceToStructMap;
    static _voiceUpdateArray = __VinylSystem().__voiceUpdateArray;
    static _toUpdateArray    = __VinylSystem().__toUpdateArray;
    
    __inUpdateArray = false;
    
    __voiceReference  = _voice;
    __gainSound       = _gainSound;
    __gainLocal       = _gainLocal;
    __gainMix         = _gainMix;
    __gainDuck        = _gainDuck;
    __pitchSound      = _pitchSound;
    __pitchLocal      = _pitchLocal;
    __duckerNameLocal = _duckerNameLocal;
    __duckPrioLocal   = _duckPrioLocal;
    
    if (VINYL_LIVE_EDIT)
    {
        __pattern = _pattern;
        
        __loopLocal = _loopLocal;
        __sound     = _pattern.__sound;
        __mixName   = _pattern.__mixName;
    }
    
    __gainLocalTarget  = _gainLocal;
    __gainLocalSpeed   = infinity;
    
    __gainDuckTarget    = _gainDuck;
    __gainDuckSpeed     = undefined;
    __gainDuckBehaviour = __VINYL_DUCK.__DO_NOTHING;
    
    _voiceToStructMap[? _voice] = self;
    
    
    
    
    
    static __IsPlaying = function()
    {
        return audio_is_playing(__voiceReference);
    }
    
    static __Stop = function()
    {
        audio_stop_sound(__voiceReference);
    }
    
    static __SetPause = function(_state)
    {
        if (_state)
        {
            audio_pause_sound(__voiceReference);
        }
        else
        {
            audio_resume_sound(__voiceReference);
        }
    }
    
    static __IsPaused = function()
    {
        return audio_is_paused(__voiceReference);
    }
    
    static __Update = function(_delta)
    {
        var _changed = false;
        
        if (__gainDuckSpeed != undefined)
        {
            _changed = true;
            __gainDuck += clamp(__gainDuckTarget - __gainDuck, -_delta*__gainDuckSpeed, _delta*__gainDuckSpeed);
            
            if ((__gainDuckBehaviour == __VINYL_DUCK.__STOP) && (__gainDuck <= 0))
            {
                __Stop();
                return false;
            }
        }
        
        if (__gainLocal != __gainLocalTarget)
        {
            _changed = true;
            __gainLocal += _delta*clamp(__gainLocalTarget - __gainLocal, -__gainLocalSpeed, __gainLocalSpeed);
        }
        
        if (_changed)
        {
            audio_sound_gain(__voiceReference, __VINYL_VOICE_GAIN_SxLxMxD/VINYL_MAX_VOICE_GAIN, VINYL_STEP_DURATION);
        }
        
        return true;
    }
    
    static __FadeOut = function(_rateOfChange)
    {
        if (not __inUpdateArray)
        {
            __inUpdateArray = true;
            array_push(_voiceUpdateArray, self);
        }
        
        __gainDuckSpeed     = _rateOfChange;
        __gainDuckTarget    = 0;
        __gainDuckBehaviour = __VINYL_DUCK.__STOP;
    }
    
    static __Duck = function(_targetGain, _rateOfChange, _behaviour)
    {
        if ((__gainDuckBehaviour != __VINYL_DUCK.__STOP) && (_targetGain != __gainDuckTarget))
        {
            if (not __inUpdateArray)
            {
                __inUpdateArray = true;
                array_push(_voiceUpdateArray, self);
            }
            
            __gainDuckSpeed     = _rateOfChange;
            __gainDuckTarget    = _targetGain;
            __gainDuckBehaviour = _behaviour;
        }
    }
    
    static __SetLoop = function(_state)
    {
        audio_sound_loop(__voiceReference, _state);
    }
    
    static __GetLoop = function()
    {
        return audio_sound_get_loop(__voiceReference);
    }
    
    static __SetLocalGain = function(_gain, _rateOfChange)
    {
        __gainLocalTarget = _gain;
        __gainLocalSpeed  = _rateOfChange;
        
        if (_rateOfChange > 100)
        {
            __gainLocal = _gain;
            audio_sound_gain(__voiceReference, __VINYL_VOICE_GAIN_SxLxMxD/VINYL_MAX_VOICE_GAIN, VINYL_STEP_DURATION);
        }
        else
        {
            if (not __inUpdateArray)
            {
                __inUpdateArray = true;
                array_push(_voiceUpdateArray, self);
            }
        }
    }
    
    static __SetMixGain = function(_gain)
    {
        __gainMix = _gain;
        audio_sound_gain(__voiceReference, __VINYL_VOICE_GAIN_SxLxMxD/VINYL_MAX_VOICE_GAIN, VINYL_STEP_DURATION);
    }
    
    static __QueueUpdateForSound = function(_sound)
    {
        if (__sound == _sound) array_push(_toUpdateArray, self);
    }
    
    static __UpdateFromPattern = function()
    {
        var _pattern = struct_get_from_hash(_soundDict, int64(__sound));
        
        __gainSound  = _pattern.__gain;
        __pitchSound = _pattern.__pitch;
        
        var _mixStruct = __VinylVoiceMoveMix(__voiceReference, _pattern.__mixName);
        var _loopMix = (_mixStruct == undefined)? undefined : _mixStruct.__membersLoop;
        
        __VinylVoiceUpdateDucker(_mixStruct);
        
        audio_sound_loop( __voiceReference, __loopLocal ?? (_pattern.__loop ?? (_loopMix ?? false)));
        audio_sound_gain( __voiceReference, __VINYL_VOICE_GAIN_SxLxMxD/VINYL_MAX_VOICE_GAIN, VINYL_STEP_DURATION);
        audio_sound_pitch(__voiceReference, __VINYL_VOICE_PITCH_SxL);
    }
}
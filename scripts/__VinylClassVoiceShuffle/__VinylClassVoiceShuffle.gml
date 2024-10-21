// Feather disable all

/// @param sound
/// @param voice
/// @param loopLocal
/// @param gainPattern
/// @param gainLocal
/// @param gainMix
/// @param gainDuck
/// @param pitchPattern
/// @param pitchLocal
/// @param pitchMix
/// @param duckerNameFinal
/// @param duckerNameLocal
/// @param duckPrioLocal
/// @param pattern
/// @param gainFactor
/// @param pitchFactor

function __VinylClassVoiceShuffle(_sound, _voice, _loopLocal, _gainPattern, _gainLocal, _gainMix, _gainDuck, _pitchPattern, _pitchLocal, _pitchMix, _duckerNameFinal, _duckerNameLocal, _duckPrioLocal, _pattern, _gainFactor, _pitchFactor) constructor
{
    static _voiceToStructMap = __VinylSystem().__voiceToStructMap;
    static _voiceUpdateArray = __VinylSystem().__voiceUpdateArray;
    static _toUpdateArray    = __VinylSystem().__toUpdateArray;
    
    __inUpdateArray = false;
    
    __sound          = _sound;
    __voiceReference = _voice;
    __loopLocal      = _loopLocal;
    
    __gainSound   = __VinylSoundGetGain(_sound);
    __gainPattern = _gainPattern;
    __gainLocal   = _gainLocal;
    __gainMix     = _gainMix;
    __gainDuck    = _gainDuck;
    
    __pitchSound   = __VinylSoundGetPitch(_sound);
    __pitchPattern = _pitchPattern;
    __pitchLocal   = _pitchLocal;
    __pitchMix     = _pitchMix;
    
    __duckerNameFinal = _duckerNameFinal;
    __duckerNameLocal = _duckerNameLocal;
    __duckPrioLocal   = _duckPrioLocal;
    
    __pattern      = _pattern;
    __mixName      = (_pattern != undefined)? _pattern.__mixName : undefined;
    __gainFactor   = _gainFactor;
    __pitchFactor  = _pitchFactor;
    
    __gainLocalTarget = _gainLocal;
    __gainLocalSpeed  = infinity;
    
    __gainDuckTarget = _gainDuck;
    __gainDuckSpeed  = undefined;
    
    __gainFadeOut      = 1;
    __gainFadeOutSpeed = undefined;
    __gainFadeOutStop  = false;
    
    __pitchLocalTarget = _pitchLocal;
    __pitchLocalSpeed  = infinity;
    
    _voiceToStructMap[? _voice] = self;
    
    
    
    
    
    static __GetAsset = function()
    {
        return audio_sound_get_asset(__voiceReference);
    }
    
    static __GetGameMakerVoice = function()
    {
        return __voiceReference;
    }
    
    static __IsPlaying = function()
    {
        return audio_is_playing(__voiceReference);
    }
    
    static __WillStop = function()
    {
        return __VinylWillStop(__voiceReference);
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
        
        if (__gainLocal != __gainLocalTarget)
        {
            __gainLocal += clamp(__gainLocalTarget - __gainLocal, -_delta*__gainLocalSpeed, _delta*__gainLocalSpeed);
            _changed = true;
        }
        
        if (__gainDuckSpeed != undefined)
        {
            __gainDuck += clamp(__gainDuckTarget - __gainDuck, -_delta*__gainDuckSpeed, _delta*__gainDuckSpeed);
            _changed = true;
        }
        
        if (__gainFadeOutSpeed != undefined)
        {
            __gainFadeOut -= _delta*__gainFadeOutSpeed;
            _changed = true;
            
            if (__gainFadeOut <= 0)
            {
                if (__gainFadeOutStop)
                {
                    __Stop();
                    return;
                }
                else
                {
                    __gainFadeOut      = 1;
                    __gainFadeOutSpeed = undefined;
                    __SetPause(true);
                }
            }
        }
        
        if (_changed)
        {
            audio_sound_gain(__voiceReference, __VINYL_VOICE_GAIN_SxPxLxMxDxF/VINYL_MAX_VOICE_GAIN, VINYL_STEP_DURATION);
        }
        
        if (__pitchLocal != __pitchLocalTarget)
        {
            __pitchLocal += clamp(__pitchLocalTarget - __pitchLocal, -_delta*__pitchLocalSpeed, _delta*__pitchLocalSpeed);
            audio_sound_pitch(__voiceReference, __VINYL_VOICE_PITCH_SxPxLxM);
        }
        
        return true;
    }
    
    static __FadeOut = function(_rateOfChange, _pause)
    {
        if (__gainFadeOutStop != true)
        {
            if (not __inUpdateArray)
            {
                __inUpdateArray = true;
                array_push(_voiceUpdateArray, self);
            }
            
            __gainFadeOutSpeed = _rateOfChange;
            __gainFadeOutStop  = not _pause;
        }
    }
    
    static __Duck = function(_targetGain, _rateOfChange)
    {
        if (_targetGain != __gainDuckTarget)
        {
            if (not __inUpdateArray)
            {
                __inUpdateArray = true;
                array_push(_voiceUpdateArray, self);
            }
            
            __gainDuckSpeed  = _rateOfChange;
            __gainDuckTarget = _targetGain;
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
            audio_sound_gain(__voiceReference, __VINYL_VOICE_GAIN_SxPxLxMxDxF/VINYL_MAX_VOICE_GAIN, VINYL_STEP_DURATION);
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
        audio_sound_gain(__voiceReference, __VINYL_VOICE_GAIN_SxPxLxMxDxF/VINYL_MAX_VOICE_GAIN, VINYL_STEP_DURATION);
    }
    
    static __SetLocalPitch = function(_pitch, _rateOfChange)
    {
        __pitchLocalTarget = _pitch;
        __pitchLocalSpeed  = _rateOfChange;
        
        if (_rateOfChange > 100)
        {
            __pitchLocal = _pitch;
            audio_sound_pitch(__voiceReference, __VINYL_VOICE_PITCH_SxPxLxM);
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
    
    static __SetMixPitch = function(_pitch)
    {
        __pitchMix = _pitch;
        audio_sound_pitch(__voiceReference, __VINYL_VOICE_PITCH_SxPxLxM);
    }
    
    static __QueueUpdateForSound = function(_sound)
    {
        if (__sound == _sound) array_push(_toUpdateArray, self);
    }
    
    static __UpdateFromPattern = function()
    {
        var _pattern = __pattern;
        
        __gainSound  = __VinylSoundGetGain(__sound);
        __pitchSound = __VinylSoundGetPitch(__sound);
        
        __gainPattern  = lerp(_pattern.__gainMin,  _pattern.__gainMax,  __gainFactor);
        __pitchPattern = lerp(_pattern.__pitchMin, _pattern.__pitchMax, __pitchFactor);
        
        var _mixStruct = __VinylVoiceMoveMix(__voiceReference, _pattern.__mixName);
        var _loopMix = (_mixStruct == undefined)? undefined : _mixStruct.__membersLoop;
        
        __VinylVoiceUpdateDucker(_mixStruct);
        
        audio_sound_loop( __voiceReference, __loopLocal ?? (_pattern.__loop ?? (_loopMix ?? false)));
        audio_sound_gain( __voiceReference, __VINYL_VOICE_GAIN_SxPxLxMxDxF/VINYL_MAX_VOICE_GAIN, VINYL_STEP_DURATION);
        audio_sound_pitch(__voiceReference, __VINYL_VOICE_PITCH_SxPxLxM);
    }
}
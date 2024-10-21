// Feather disable all

/// @param emitter
/// @param pattern
/// @param gainLocal
/// @param pitchLocal
/// @param duckerNameLocal
/// @param duckPrioLocal

function __VinylClassVoiceHLT(_emitter, _pattern, _gainLocal, _pitchLocal, _duckerNameLocal, _duckPrioLocal) constructor
{
    static _mixDict          = __VinylSystem().__mixDict;
    static _voiceToStructMap = __VinylSystem().__voiceToStructMap;
    static _voiceUpdateArray = __VinylSystem().__voiceUpdateArray;
    static _duckerDict       = __VinylSystem().__duckerDict;
    static _toUpdateArray    = __VinylSystem().__toUpdateArray;
    static _emitterMap       = __VinylSystem().__emitterMap;
    
    __emitter         = _emitter;
    __pattern         = _pattern;
    __gainLocal       = _gainLocal;
    __pitchLocal      = _pitchLocal;
    __duckerNameLocal = _duckerNameLocal;
    __duckPrio        = _duckPrioLocal;
    
    __gainLocalTarget = _gainLocal;
    __gainLocalSpeed  = infinity;
    
    __pitchLocalTarget = _pitchLocal;
    __pitchLocalSpeed  = infinity;
    
    __gainPattern = _pattern.__gain;
    
    if (VINYL_LIVE_EDIT)
    {
        __mixName = _pattern.__mixName;
    }
    
    if (_pattern.__mixName == undefined)
    {
        var _mixStruct = undefined;
        __gainMix  = 1;
        __pitchMix = 1;
        
        __duckerNameFinal = _duckerNameLocal ?? _pattern.__duckerName;
        
        if (__emitter == undefined)
        {
            __emitter = _emitterMap[? _pattern.__emitterAlias];
        }
    }
    else
    {
        var _mixStruct = _mixDict[$ _pattern.__mixName];
        if (_mixStruct == undefined)
        {
            __VinylError("Mix \"", _pattern.__mixName, "\" not recognised");
            return;
        }
        
        __gainMix  = _mixStruct.__gainFinal;
        __pitchMix = _mixStruct.__pitchLocal;
        
        __duckerNameFinal = _duckerNameLocal ?? (_pattern.__duckerName ?? _mixStruct.__membersDuckOn);
        
        if (__emitter == undefined)
        {
            __emitter = _emitterMap[? _pattern.__emitterAlias ?? _mixStruct.__membersEmitterAlias];
        }
    }
    
    if (__duckerNameFinal != undefined)
    {
        var _duckerStruct = _duckerDict[$ __duckerNameFinal];
        if (_duckerStruct == undefined)
        {
            __VinylError("Ducker \"", __duckerNameFinal, "\" not recognised");
            return;
        }
        
        var _duckPrioFinal = _duckPrioLocal ?? (_pattern.__duckPrio ?? 0);
        __gainDuck = (_duckerStruct.__maxPriority <= _duckPrioFinal)? 1 : _duckerStruct.__duckedGain;
    }
    else
    {
        var _duckerStruct = undefined;
        __gainDuck = 1;
    }
    
    __gainDuckTarget = __gainDuck;
    __gainDuckSpeed  = undefined;
    
    __gainFadeOut      = 1;
    __gainFadeOutSpeed = undefined;
    __gainFadeOutStop  = false;
    
    //Manage which sound to play to begin with
    var _soundHead = _pattern.__soundHead;
    if (_soundHead != undefined)
    {
        __gainSound  = __VinylSoundGetGain(_soundHead);
        __pitchSound = __VinylSoundGetPitch(_soundHead);
        
        __voiceCurrent = __PlaySound(_soundHead, false, __VINYL_VOICE_GAIN_SxPxLxMxDxF/VINYL_MAX_VOICE_GAIN, __VINYL_VOICE_PITCH_SxLxM);
        __state = __VINYL_HLT_STATE.__HEAD;
    }
    else
    {
        var _soundLoop = _pattern.__soundLoop;
        if (_soundLoop != undefined)
        {
            __gainSound  = __VinylSoundGetGain(_soundLoop);
            __pitchSound = __VinylSoundGetPitch(_soundLoop);
            
            __voiceCurrent = __PlaySound(_soundLoop, true, __VINYL_VOICE_GAIN_SxPxLxMxDxF/VINYL_MAX_VOICE_GAIN, __VINYL_VOICE_PITCH_SxLxM);
            __state = __VINYL_HLT_STATE.__LOOP;
        }
        else
        {
            __state = __VINYL_HLT_STATE.__TAIL;
            
            var _soundTail = _pattern.__soundTail;
            if (_soundTail != undefined)
            {
                __gainSound  = __VinylSoundGetGain(_soundTail);
                __pitchSound = __VinylSoundGetPitch(_soundTail);
                
                __voiceCurrent = __PlaySound(_soundTail, false, __VINYL_VOICE_GAIN_SxPxLxMxDxF/VINYL_MAX_VOICE_GAIN, __VINYL_VOICE_PITCH_SxLxM);
            }
            else
            {
                __gainSound  = 1;
                __pitchSound = 1;
                
                __voiceCurrent = -1;
            }
        }
    }
    
    __voiceReference = __voiceCurrent;
    
    //Add the generated voice to the mix's array of voices
    if (__voiceReference >= 0)
    {
        array_push(_voiceUpdateArray, self);
        
        _voiceToStructMap[? __voiceReference] = self;
        
        if (_duckerStruct != undefined) _duckerStruct.__Push(self, _duckPrioFinal, false);
        if (_mixStruct != undefined) _mixStruct.__Add(__voiceReference);
    }
    
    __doLoop = true;
    
    
    
    
    
    static __PlaySound = function(_sound, _loop, _gain, _pitch)
    {
        if (__emitter == undefined)
        {
            return audio_play_sound(_sound, 0, _loop, _gain, 0, _pitch);
        }
        else
        {
            return audio_play_sound_on(__emitter, _sound, _loop, 0, _gain, 0, _pitch);
        }
    }
    
    static __Update = function(_delta)
    {
        var _changed = false;
        
        if (__gainLocal != __gainLocalTarget)
        {
            _changed = true;
            __gainLocal += clamp(__gainLocalTarget - __gainLocal, -_delta*__gainLocalSpeed, _delta*__gainLocalSpeed);
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
        
        if (__pitchLocal != __pitchLocalTarget)
        {
            __pitchLocal += clamp(__pitchLocalTarget - __pitchLocal, -_delta*__pitchLocalSpeed, _delta*__pitchLocalSpeed);
            audio_sound_pitch(__voiceCurrent, __VINYL_VOICE_PITCH_SxLxM);
        }
        
        if (__VinylWillStop(__voiceCurrent))
        {
            var _pattern = __pattern;
            
            switch(__state)
            {
                case __VINYL_HLT_STATE.__HEAD:
                    if (__doLoop && (_pattern.__soundLoop != undefined))
                    {
                        __gainSound  = __VinylSoundGetGain(_pattern.__soundLoop);
                        __pitchSound = __VinylSoundGetPitch(_pattern.__soundLoop);
                        
                        __voiceCurrent = __PlaySound(_pattern.__soundLoop, true, __VINYL_VOICE_GAIN_SxPxLxMxDxF/VINYL_MAX_VOICE_GAIN, __VINYL_VOICE_PITCH_SxLxM);
                        __state = __VINYL_HLT_STATE.__LOOP;
                    }
                    else
                    {
                        __state = __VINYL_HLT_STATE.__TAIL;
                        
                        if (_pattern.__soundTail != undefined)
                        {
                            __gainSound  = __VinylSoundGetGain(_pattern.__soundTail);
                            __pitchSound = __VinylSoundGetPitch(_pattern.__soundTail);
                            
                            __voiceCurrent = __PlaySound(_pattern.__soundTail, false, __VINYL_VOICE_GAIN_SxPxLxMxDxF/VINYL_MAX_VOICE_GAIN, __VINYL_VOICE_PITCH_SxLxM);
                        }
                        else
                        {
                            __voiceCurrent = -1;
                            return false;
                        }
                    }
                break;
                
                case __VINYL_HLT_STATE.__LOOP:
                    __state = __VINYL_HLT_STATE.__TAIL;
                    
                    if (_pattern.__soundTail != undefined)
                    {
                        __gainSound  = __VinylSoundGetGain(_pattern.__soundTail);
                        __pitchSound = __VinylSoundGetPitch(_pattern.__soundTail);
                        
                        __voiceCurrent = __PlaySound(_pattern.__soundTail, false, __VINYL_VOICE_GAIN_SxPxLxMxDxF/VINYL_MAX_VOICE_GAIN, __VINYL_VOICE_PITCH_SxLxM);
                    }
                    else
                    {
                        __voiceCurrent = -1;
                        return false;
                    }
                break;
                
                case __VINYL_HLT_STATE.__TAIL:
                    ds_map_delete(_voiceToStructMap, __voiceReference);
                    
                    __voiceCurrent = -1;
                    return false;
                break;
            }
        }
        else
        {
            if (_changed)
            {
                audio_sound_gain(__voiceCurrent, __VINYL_VOICE_GAIN_SxPxLxMxDxF/VINYL_MAX_VOICE_GAIN, VINYL_STEP_DURATION);
            }
        }
        
        return true;
    }
    
    static __GetAsset = function()
    {
        return audio_sound_get_asset(__voiceCurrent);
    }
    
    static __GetGameMakerVoice = function()
    {
        return __voiceCurrent;
    }
    
    static __IsPlaying = function()
    {
        return ((__state != __VINYL_HLT_STATE.__TAIL) || audio_is_playing(__voiceCurrent));
    }
    
    static __WillStop = function()
    {
        return ((__state == __VINYL_HLT_STATE.__TAIL) && __VinylWillStop(__voiceCurrent));
    }
    
    static __Stop = function()
    {
        if (__voiceCurrent >= 0)
        {
            audio_stop_sound(__voiceCurrent);
            __state = __VINYL_HLT_STATE.__TAIL;
        }
    }
    
    static __SetPause = function(_state)
    {
        if (_state)
        {
            audio_pause_sound(__voiceCurrent);
        }
        else
        {
            audio_resume_sound(__voiceCurrent);
        }
    }
    
    static __IsPaused = function()
    {
        return audio_is_paused(__voiceCurrent);
    }
    
    static __FadeOut = function(_rateOfChange, _pause)
    {
        if (__gainFadeOutStop != true)
        {
            __gainFadeOutSpeed = _rateOfChange;
            __gainFadeOutStop  = not _pause;
        }
    }
    
    static __Duck = function(_targetGain, _rateOfChange)
    {
        __gainDuckSpeed  = _rateOfChange;
        __gainDuckTarget = _targetGain;
    }
    
    static __SetLocalGain = function(_gain, _rateOfChange)
    {
        __gainLocalTarget = _gain;
        __gainLocalSpeed  = _rateOfChange;
        
        if (_rateOfChange > 100)
        {
            __gainLocal = _gain;
            audio_sound_gain(__voiceCurrent, __VINYL_VOICE_GAIN_SxPxLxMxDxF/VINYL_MAX_VOICE_GAIN, VINYL_STEP_DURATION);
        }
    }
    
    static __SetMixGain = function(_gain)
    {
        __gainMix = max(0, _gain);
        audio_sound_gain(__voiceCurrent, __VINYL_VOICE_GAIN_SxPxLxMxDxF/VINYL_MAX_VOICE_GAIN, VINYL_STEP_DURATION);
    }
    
    static __SetLocalPitch = function(_pitch, _rateOfChange)
    {
        __pitchLocalTarget = _pitch;
        __pitchLocalSpeed  = _rateOfChange;
        
        if (_rateOfChange > 100)
        {
            __pitchLocal = _pitch;
            audio_sound_pitch(__voiceCurrent, __VINYL_VOICE_PITCH_SxLxM);
        }
    }
    
    static __SetMixPitch = function(_pitch)
    {
        __pitchMix = max(0, _pitch);
        audio_sound_pitch(__voiceCurrent, __VINYL_VOICE_PITCH_SxLxM);
    }
    
    static __SetLoop = function(_state)
    {
        __doLoop = _state;
        if (__state == __VINYL_HLT_STATE.__LOOP) audio_sound_loop(__voiceCurrent, _state);
    }
    
    static __GetLoop = function()
    {
        return audio_sound_get_loop(__voiceCurrent);
    }
    
    static __QueueUpdateForSound = function(_sound)
    {
        if (__pattern.__UsesSound(_sound)) array_push(_toUpdateArray, self);
    }
    
    static __UpdateFromPattern = function()
    {
        var _pattern = __pattern;
        
        var _mixStruct = __VinylVoiceMoveMix(__voiceReference, _pattern.__mixName);
        __VinylVoiceUpdateDucker(_mixStruct);
        
        __gainPattern = _pattern.__gain;
        
        switch(__state)
        {
            case __VINYL_HLT_STATE.__HEAD:
                __gainSound  = __VinylSoundGetGain( _pattern.__soundHead);
                __pitchSound = __VinylSoundGetPitch(_pattern.__soundHead);
                
                if (_pattern.__changedHead)
                {
                    audio_stop_sound(__voiceCurrent);
                    __voiceCurrent = __PlaySound(_pattern.__soundHead, false, __VINYL_VOICE_GAIN_SxPxLxMxDxF/VINYL_MAX_VOICE_GAIN, __VINYL_VOICE_PITCH_SxLxM);
                }
                else
                {
                    audio_sound_gain( __voiceCurrent, __VINYL_VOICE_GAIN_SxPxLxMxDxF/VINYL_MAX_VOICE_GAIN, VINYL_STEP_DURATION);
                    audio_sound_pitch(__voiceCurrent, __VINYL_VOICE_PITCH_SxLxM);
                }
            break;
            
            case __VINYL_HLT_STATE.__LOOP:
                __gainSound  = __VinylSoundGetGain( _pattern.__soundLoop);
                __pitchSound = __VinylSoundGetPitch(_pattern.__soundLoop);
                
                if (_pattern.__changedLoop)
                {
                    var _loop = audio_sound_get_loop(__voiceCurrent);
                    audio_stop_sound(__voiceCurrent);
                    __voiceCurrent = __PlaySound(_pattern.__soundLoop, _loop, __VINYL_VOICE_GAIN_SxPxLxMxDxF/VINYL_MAX_VOICE_GAIN, __VINYL_VOICE_PITCH_SxLxM);
                }
                else
                {
                    audio_sound_gain( __voiceCurrent, __VINYL_VOICE_GAIN_SxPxLxMxDxF/VINYL_MAX_VOICE_GAIN, VINYL_STEP_DURATION);
                    audio_sound_pitch(__voiceCurrent, __VINYL_VOICE_PITCH_SxLxM);
                }
            break;
            
            case __VINYL_HLT_STATE.__TAIL:
                __gainSound  = __VinylSoundGetGain( _pattern.__soundTail);
                __pitchSound = __VinylSoundGetPitch(_pattern.__soundTail);
                
                if (_pattern.__changedTail)
                {
                    audio_stop_sound(__voiceCurrent);
                    __voiceCurrent = __PlaySound(_pattern.__soundTail, false, __VINYL_VOICE_GAIN_SxPxLxMxDxF/VINYL_MAX_VOICE_GAIN, __VINYL_VOICE_PITCH_SxLxM);
                }
                else
                {
                    audio_sound_gain( __voiceCurrent, __VINYL_VOICE_GAIN_SxPxLxMxDxF/VINYL_MAX_VOICE_GAIN, VINYL_STEP_DURATION);
                    audio_sound_pitch(__voiceCurrent, __VINYL_VOICE_PITCH_SxLxM);
                }
            break;
        }
    }
}
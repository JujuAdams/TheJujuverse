// Feather disable all

/// @param pattern
/// @param gainLocal
/// @param pitchLocal
/// @param duckerNameLocal
/// @param duckPrioLocal

function __VinylClassVoiceHLT(_pattern, _gainLocal, _pitchLocal, _duckerNameLocal, _duckPrioLocal) constructor
{
    static _mixDict          = __VinylSystem().__mixDict;
    static _voiceToStructMap = __VinylSystem().__voiceToStructMap;
    static _voiceUpdateArray = __VinylSystem().__voiceUpdateArray;
    static _toUpdateArray    = __VinylSystem().__toUpdateArray;
    
    __pattern    = _pattern;
    __gainLocal  = _gainLocal;
    __pitchLocal = _pitchLocal;
    __duckerName = _duckerNameLocal;
    __duckPrio   = _duckPrioLocal;
    
    __gainLocalTarget = _gainLocal;
    __gainLocalSpeed  = infinity;
    
    __gainPattern = _pattern.__gain;
    
    if (VINYL_LIVE_EDIT)
    {
        __mixName = _pattern.__mixName;
    }
    
    if (_pattern.__mixName == undefined)
    {
        var _mixStruct = undefined;
        __gainMix = 1;
        
        var _duckerNameFinal = _duckerNameLocal ?? _pattern.__duckerName;
    }
    else
    {
        var _mixStruct = _mixDict[$ _pattern.__mixName];
        if (_mixStruct == undefined)
        {
            __VinylError("Mix \"", _pattern.__mixName, "\" not recognised");
            return;
        }
        
        __gainMix = _mixStruct.__gainFinal;
        
        var _duckerNameFinal = _duckerNameLocal ?? (_pattern.__duckerName ?? _mixStruct.__membersDuckOn);
    }
    
    if (_duckerNameFinal != undefined)
    {
        var _duckerStruct = _duckerDict[$ _duckerNameFinal];
        if (_duckerStruct == undefined)
        {
            __VinylError("Ducker \"", _duckerNameFinal, "\" not recognised");
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
    
    __gainDuckTarget    = __gainDuck;
    __gainDuckSpeed     = undefined;
    __gainDuckBehaviour = __VINYL_DUCK.__DO_NOTHING;
    
    //Manage which sound to play to begin with
    var _soundHead = _pattern.__soundHead;
    if (_soundHead != undefined)
    {
        __gainSound  = __VinylSoundGetGain(_soundHead);
        __pitchSound = __VinylSoundGetPitch(_soundHead);
        
        __voiceCurrent = audio_play_sound(_soundHead, 0, false, __VINYL_VOICE_GAIN_SxPxLxMxD/VINYL_MAX_VOICE_GAIN, 0, __VINYL_VOICE_PITCH_SxL);
        __state = __VINYL_HLT_STATE.__HEAD;
    }
    else
    {
        var _soundLoop = _pattern.__soundLoop;
        if (_soundLoop != undefined)
        {
            __gainSound  = __VinylSoundGetGain(_soundLoop);
            __pitchSound = __VinylSoundGetPitch(_soundLoop);
            
            __voiceCurrent = audio_play_sound(_soundLoop, 0, true, __VINYL_VOICE_GAIN_SxPxLxMxD/VINYL_MAX_VOICE_GAIN, 0, __VINYL_VOICE_PITCH_SxL);
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
                
                __voiceCurrent = audio_play_sound(_soundTail, 0, false, __VINYL_VOICE_GAIN_SxPxLxMxD/VINYL_MAX_VOICE_GAIN, 0, __VINYL_VOICE_PITCH_SxL);
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
        
        if (_mixStruct != undefined) _mixStruct.__Add(__voiceReference);
    }
    
    __doLoop = true;
    
    
    
    
    
    static __Update = function(_delta)
    {
        var _changed = false;
        
        if (__gainDuckSpeed != undefined)
        {
            __gainDuck += clamp(__gainDuckTarget - __gainDuck, -_delta*__gainDuckSpeed, _delta*__gainDuckSpeed);
            
            if ((__gainDuckBehaviour == __VINYL_DUCK.__STOP) && (__gainDuck <= 0))
            {
                __Stop();
                return false;
            }
            
            _changed = true;
        }
        
        if (__gainLocal != __gainLocalTarget)
        {
            _changed = true;
            __gainLocal += _delta*clamp(__gainLocalTarget - __gainLocal, -__gainLocalSpeed, __gainLocalSpeed);
        }
        
        if (VinylWillStop(__voiceCurrent))
        {
            var _pattern = __pattern;
            
            switch(__state)
            {
                case __VINYL_HLT_STATE.__HEAD:
                    if (__doLoop && (_pattern.__soundLoop != undefined))
                    {
                        __gainSound  = __VinylSoundGetGain(_pattern.__soundLoop);
                        __pitchSound = __VinylSoundGetPitch(_pattern.__soundLoop);
                        
                        __voiceCurrent = audio_play_sound(_pattern.__soundLoop, 0, true, __VINYL_VOICE_GAIN_SxPxLxMxD/VINYL_MAX_VOICE_GAIN, 0, __VINYL_VOICE_PITCH_SxL);
                        __state = __VINYL_HLT_STATE.__LOOP;
                    }
                    else
                    {
                        __state = __VINYL_HLT_STATE.__TAIL;
                        
                        if (_pattern.__soundTail != undefined)
                        {
                            __gainSound  = __VinylSoundGetGain(_pattern.__soundTail);
                            __pitchSound = __VinylSoundGetPitch(_pattern.__soundTail);
                            
                            __voiceCurrent = audio_play_sound(_pattern.__soundTail, 0, false, __VINYL_VOICE_GAIN_SxPxLxMxD/VINYL_MAX_VOICE_GAIN, 0, __VINYL_VOICE_PITCH_SxL);
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
                        
                        __voiceCurrent = audio_play_sound(_pattern.__soundTail, 0, false, __VINYL_VOICE_GAIN_SxPxLxMxD/VINYL_MAX_VOICE_GAIN, 0, __VINYL_VOICE_PITCH_SxL);
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
                audio_sound_gain(__voiceCurrent, __VINYL_VOICE_GAIN_SxPxLxMxD/VINYL_MAX_VOICE_GAIN, VINYL_STEP_DURATION);
            }
        }
        
        return true;
    }
    
    static __IsPlaying = function()
    {
        return (__voiceCurrent >= 0);
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
    
    static __FadeOut = function(_rateOfChange)
    {
        __gainDuckSpeed     = _rateOfChange;
        __gainDuckTarget    = 0;
        __gainDuckBehaviour = __VINYL_DUCK.__STOP;
    }
    
    static __Duck = function(_targetGain, _rateOfChange, _behaviour)
    {
        if (__gainDuckBehaviour != __VINYL_DUCK.__STOP)
        {
            __gainDuckSpeed     = _rateOfChange;
            __gainDuckTarget    = _targetGain;
            __gainDuckBehaviour = _behaviour;
        }
    }
    
    static __SetLocalGain = function(_gain, _rateOfChange)
    {
        __gainLocalTarget = _gain;
        __gainLocalSpeed  = _rateOfChange;
        
        if (_rateOfChange > 100)
        {
            __gainLocal = _gain;
            audio_sound_gain(__voiceCurrent, __VINYL_VOICE_GAIN_SxPxLxMxD/VINYL_MAX_VOICE_GAIN, VINYL_STEP_DURATION);
        }
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
    
    static __SetMixGain = function(_gain)
    {
        __gainMix = max(0, _gain);
        audio_sound_gain(__voiceCurrent, __VINYL_VOICE_GAIN_SxPxLxMxD/VINYL_MAX_VOICE_GAIN, VINYL_STEP_DURATION);
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
                    __voiceCurrent = audio_play_sound(_pattern.__soundHead, 0, false, __VINYL_VOICE_GAIN_SxPxLxMxD/VINYL_MAX_VOICE_GAIN, 0, __VINYL_VOICE_PITCH_SxL);
                }
                else
                {
                    audio_sound_gain( __voiceCurrent, __VINYL_VOICE_GAIN_SxPxLxMxD/VINYL_MAX_VOICE_GAIN, VINYL_STEP_DURATION);
                    audio_sound_pitch(__voiceCurrent, __VINYL_VOICE_PITCH_SxL);
                }
            break;
            
            case __VINYL_HLT_STATE.__LOOP:
                __gainSound  = __VinylSoundGetGain( _pattern.__soundLoop);
                __pitchSound = __VinylSoundGetPitch(_pattern.__soundLoop);
                
                if (_pattern.__changedLoop)
                {
                    var _loop = audio_sound_get_loop(__voiceCurrent);
                    audio_stop_sound(__voiceCurrent);
                    __voiceCurrent = audio_play_sound(_pattern.__soundLoop, 0, _loop, __VINYL_VOICE_GAIN_SxPxLxMxD/VINYL_MAX_VOICE_GAIN, 0, __VINYL_VOICE_PITCH_SxL);
                }
                else
                {
                    audio_sound_gain( __voiceCurrent, __VINYL_VOICE_GAIN_SxPxLxMxD/VINYL_MAX_VOICE_GAIN, VINYL_STEP_DURATION);
                    audio_sound_pitch(__voiceCurrent, __VINYL_VOICE_PITCH_SxL);
                }
            break;
            
            case __VINYL_HLT_STATE.__TAIL:
                __gainSound  = __VinylSoundGetGain( _pattern.__soundTail);
                __pitchSound = __VinylSoundGetPitch(_pattern.__soundTail);
                
                if (_pattern.__changedTail)
                {
                    audio_stop_sound(__voiceCurrent);
                    __voiceCurrent = audio_play_sound(_pattern.__soundTail, 0, false, __VINYL_VOICE_GAIN_SxPxLxMxD/VINYL_MAX_VOICE_GAIN, 0, __VINYL_VOICE_PITCH_SxL);
                }
                else
                {
                    audio_sound_gain( __voiceCurrent, __VINYL_VOICE_GAIN_SxPxLxMxD/VINYL_MAX_VOICE_GAIN, VINYL_STEP_DURATION);
                    audio_sound_pitch(__voiceCurrent, __VINYL_VOICE_PITCH_SxL);
                }
            break;
        }
    }
}
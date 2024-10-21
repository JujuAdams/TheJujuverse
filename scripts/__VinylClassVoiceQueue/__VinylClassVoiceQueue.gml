// Feather disable all

/// @param templateName
/// @param behaviour
/// @param loopQueue
/// @param localGain
/// @param emitter

function __VinylClassVoiceQueue(_templateName, _behaviour, _loopQueue, _gainLocal, _emitter) constructor
{
    static _queueCount = 0;
    
    static _duckerDict        = __VinylSystem().__duckerDict;
    static _voiceToStructMap  = __VinylSystem().__voiceToStructMap;
    static _voiceUpdateArray  = __VinylSystem().__voiceUpdateArray;
    static _queueTemplateDict = __VinylSystem().__queueTemplateDict;
    static _toUpdateArray     = __VinylSystem().__toUpdateArray;
    
    __templateName = _templateName;
    
    __gainSound   = 1;
    __gainLocal   = _gainLocal;
    __gainMix     = 1;
    
    __mixName = undefined;
    
    __gainLocalTarget = _gainLocal;
    __gainLocalSpeed  = infinity;
    
    __pitchSound = 1;
    __pitchLocal = 1;
    __pitchMix   = 1;
    
    __duckerName = undefined;
    
    __gainDuck       = 1;
    __gainDuckTarget = 1;
    __gainDuckSpeed  = undefined;
    
    __gainFadeOut      = 1;
    __gainFadeOutSpeed = undefined;
    __gainFadeOutStop  = false;
    
    __pitchLocalTarget = 1;
    __pitchLocalSpeed  = infinity;
    
    __destroyed = false;
    
    __voiceCurrent = -1;
    __soundCurrent = undefined;
    __soundArray   = [];
    __behaviour    = _behaviour;
    __loopQueue    = _loopQueue;
    __emitter      = _emitter;
    
    __voiceReference = 0x66606660_00000000 | _queueCount;
    ++_queueCount;
    
    //Add the generated voice to the mix's array of voices
    array_push(_voiceUpdateArray, self);
    _voiceToStructMap[? __voiceReference] = self;
    
    
    
    
    
    static __GetAsset = function()
    {
        return __soundCurrent;
    }
    
    static __GetGameMakerVoice = function()
    {
        return __voiceCurrent;
    }
    
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
    
    static __Destroy = function()
    {
        __Stop();
        __destroyed = true;
    }
    
    static __Update = function(_delta)
    {
        if (__destroyed) return false;
        
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
            if (array_length(__soundArray) > 0)
            {
                var _sound = array_shift(__soundArray);
                
                switch(__behaviour)
                {
                    case VINYL_QUEUE.DONT_LOOP:
                        var _loop = false;
                    break;
                    
                    case VINYL_QUEUE.LOOP_ON_LAST:
                        var _loop = (array_length(__soundArray) <= 0);
                    break;
                    
                    case VINYL_QUEUE.LOOP_EACH:
                        var _loop = true;
                    break;
                }
                
                if (__loopQueue && (__soundCurrent != undefined)) array_push(__soundArray, __soundCurrent);
                
                var _pattern = __VinylEnsurePatternSound(_sound);
                var _mixStruct = __VinylVoiceMoveMix(__voiceReference, _pattern.__mixName);
                
                //Remove this voice from the old ducker
                if (__duckerName != undefined)
                {
                    var _duckerStruct = _duckerDict[$ __duckerName];
                    if (_duckerStruct != undefined) _duckerStruct.__Remove(self);
                }
                
                //Figure out what we're doing with the ducker
                var _duckerNameFinal = (_mixStruct == undefined)? _pattern.__duckerName : (_pattern.__duckerName ?? _mixStruct.__membersDuckOn);
                if (_duckerNameFinal != undefined)
                {
                    var _duckerStruct = _duckerDict[$ _duckerNameFinal];
                    if (_duckerStruct == undefined)
                    {
                        __VinylError("Ducker \"", _duckerNameFinal, "\" not recognised");
                        return;
                    }
                    
                    __duckerName = _duckerNameFinal;
                    
                    var _duckPrioFinal = _pattern.__duckPrio ?? 0;
                    __gainDuck = (_duckerStruct.__maxPriority <= _duckPrioFinal)? 1 : _duckerStruct.__duckedGain;
                }
                else
                {
                    __duckerName = undefined;
                    __gainDuck = 1;
                }
                
                //Reset ducker variables
                __gainDuckTarget = __gainDuck;
                __gainDuckSpeed  = undefined;
                
                __gainSound  = _pattern.__gain;
                __pitchSound = _pattern.__pitch;
                
                __soundCurrent = _sound;
                __voiceCurrent = __PlaySound(_sound, _loop, __VINYL_VOICE_GAIN_SxLxMxDxF/VINYL_MAX_VOICE_GAIN, __pitchLocal);
            }
            else
            {
                __soundCurrent = undefined;
                __voiceCurrent = -1;
            }
        }
        else
        {
            if (_changed)
            {
                audio_sound_gain(__voiceCurrent, __VINYL_VOICE_GAIN_SxLxMxDxF/VINYL_MAX_VOICE_GAIN, VINYL_STEP_DURATION);
            }
        }
        
        return true;
    }
    
    static __IsPlaying = function()
    {
        return audio_is_playing(__voiceCurrent);
    }
    
    static __WillStop = function()
    {
        return ((__voiceCurrent < 0) || ((not __loopQueue) && (__behaviour == VINYL_QUEUE.DONT_LOOP) && __VinylWillStop(__voiceCurrent)));
    }
    
    static __Stop = function()
    {
        audio_stop_sound(__voiceCurrent);
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
    
    static __SetLoop = function(_state)
    {
        audio_sound_loop(__voiceCurrent, _state);
    }
    
    static __GetLoop = function()
    {
        return audio_sound_get_loop(__voiceCurrent);
    }
    
    static __SetLocalGain = function(_gain, _rateOfChange)
    {
        __gainLocalTarget = _gain;
        __gainLocalSpeed  = _rateOfChange;
        
        if (_rateOfChange > 100)
        {
            __gainLocal = _gain;
            audio_sound_gain(__voiceCurrent, __VINYL_VOICE_GAIN_SxLxMxDxF/VINYL_MAX_VOICE_GAIN, VINYL_STEP_DURATION);
        }
    }
    
    static __SetMixGain = function(_gain)
    {
        __gainMix = max(0, _gain);
        audio_sound_gain(__voiceCurrent, __VINYL_VOICE_GAIN_SxLxMxDxF/VINYL_MAX_VOICE_GAIN, VINYL_STEP_DURATION);
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
    
    static __SetBehaviour = function(_behaviour, _setForPlaying)
    {
        __behaviour = _behaviour;
        
        if (_setForPlaying)
        {
            switch(_behaviour)
            {
                case VINYL_QUEUE.DONT_LOOP:
                    audio_sound_loop(__voiceCurrent, false);
                break;
                
                case VINYL_QUEUE.LOOP_ON_LAST:
                    audio_sound_loop(__voiceCurrent, (array_length(__soundArray) <= 0));
                break;
                
                case VINYL_QUEUE.LOOP_EACH:
                    audio_sound_loop(__voiceCurrent, true);
                break;
            }
        }
    }
    
    static __QueueUpdateForSound = function(_sound)
    {
        if (__soundCurrent == _sound) array_push(_toUpdateArray, self);
    }
    
    static __UpdateFromPattern = function()
    {
        if (__soundCurrent == undefined) return;
        
        if (__templateName != undefined)
        {
            var _queueTemplate = _queueTemplateDict[$ __templateName];
            if (_queueTemplate != undefined)
            {
                if (__behaviour == _queueTemplate.__prevBehaviour)
                {
                    __behaviour = _queueTemplate.__behaviour;
                }
                
                if (__loopQueue == _queueTemplate.__prevLoopQueue)
                {
                    __loopQueue = _queueTemplate.__loopQueue;
                }
                
                if (_queueTemplate.__loopQueue)
                {
                    __soundArray = variable_clone(_queueTemplate.__soundArray);
                    
                    var _i = array_get_index(__soundArray, __soundCurrent);
                    if (_i >= 0)
                    {
                        //We found the currently playing sound in the array
                        //We reorganise the array so that we respect the sound ordering
                        array_copy(__soundArray, array_length(__soundArray), __soundArray, 0, _i+1);
                        array_delete(__soundArray, 0, _i+1);
                    }
                    else
                    {
                        //Pretend like this voice never happened at all
                        audio_stop_sound(__voiceCurrent);
                        
                        __voiceCurrent = -1;
                        __soundCurrent = undefined;
                        
                        __Update(0);
                    }
                }
            }
        }
        
        var _pattern = __VinylEnsurePatternSound(__soundCurrent);
        __gainSound  = _pattern.__gain;
        __pitchSound = _pattern.__pitch;
        
        var _mixStruct = __VinylVoiceMoveMix(__voiceReference, _pattern.__mixName);
        //Loop behaviour is determined by the queue's behaviour so we don't want to tamper with it here
        
        //Remove this voice from the old ducker
        //We do this even if the old ducker if the same as the new ducker
        if (__duckerName != undefined)
        {
            var _duckerStruct = _duckerDict[$ __duckerName];
            if (_duckerStruct != undefined) _duckerStruct.__Remove(self);
        }
        
        __duckerName = (_mixStruct == undefined)? _pattern.__duckerName : (_pattern.__duckerName ?? _mixStruct.__membersDuckOn);
        
        if (__duckerName != undefined)
        {
            //Add this voice to the new ducker
            var _duckerStruct = _duckerDict[$ __duckerName];
            if (_duckerStruct == undefined)
            {
                __VinylWarning("Ducker \"", __duckerName, "\" not recognised");
                __Duck(1, __VINYL_DEFAULT_DUCK_RATE_OF_GAIN);
                return;
            }
            
            _duckerStruct.__Push(self, _pattern.__duckPrio ?? 0, true);
        }
        else
        {
            //No ducker, no ducking
            __Duck(1, __VINYL_DEFAULT_DUCK_RATE_OF_GAIN);
        }
        
        audio_sound_gain( __voiceCurrent, __VINYL_VOICE_GAIN_SxLxMxDxF/VINYL_MAX_VOICE_GAIN, VINYL_STEP_DURATION);
        audio_sound_pitch(__voiceCurrent, __VINYL_VOICE_PITCH_SxLxM);
    }
}
// Feather disable all

/// @param behaviour
/// @param loopQueue
/// @param localGain

function __VinylClassVoiceQueue(_behaviour, _loopQueue, _gainLocal) constructor
{
    static _queueCount = 0;
    
    static _duckerDict       = __VinylSystem().__duckerDict;
    static _soundDict        = __VinylSystem().__soundDict;
    static _voiceToStructMap = __VinylSystem().__voiceToStructMap;
    static _voiceUpdateArray = __VinylSystem().__voiceUpdateArray;
    static _toUpdateArray    = __VinylSystem().__toUpdateArray;
    
    __gainSound = 1;
    __gainLocal = _gainLocal;
    __gainMix   = 1;
    
    __mixName = undefined;
    
    __gainLocalTarget = _gainLocal;
    __gainLocalSpeed  = infinity;
    
    __duckerName = undefined;
    
    __gainDuck          = 1;
    __gainDuckTarget    = 1;
    __gainDuckSpeed     = undefined;
    __gainDuckBehaviour = __VINYL_DUCK.__DO_NOTHING;
    
    __destroyed = false;
    
    __pitchSound = 1;
    __pitchLocal = 1;
    
    __voiceCurrent = -1;
    __soundCurrent = undefined;
    __soundArray   = [];
    __behaviour    = _behaviour;
    __loopQueue    = _loopQueue;
    
    __voiceReference = 0x66606660_00000000 | _queueCount;
    ++_queueCount;
    
    //Add the generated voice to the mix's array of voices
    array_push(_voiceUpdateArray, self);
    _voiceToStructMap[? __voiceReference] = self;
    
    
    
    
    
    static __Destroy = function()
    {
        __Stop();
        __destroyed = true;
    }
    
    static __Update = function(_delta)
    {
        if (__destroyed) return false;
        
        var _changed = false;
        
        if (__gainDuckSpeed != undefined)
        {
            __gainDuck += clamp(__gainDuckTarget - __gainDuck, -_delta*__gainDuckSpeed, _delta*__gainDuckSpeed);
            
            if ((__gainDuckBehaviour == __VINYL_DUCK.__STOP) && (__gainDuck <= 0))
            {
                __Destroy();
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
            if (array_length(__soundArray) > 0)
            {
                var _sound = array_pop(__soundArray);
                
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
                
                var _pattern = struct_get_from_hash(_soundDict, int64(_sound));
                var _mixStruct = __VinylVoiceMoveMix(__voiceReference, _pattern.__mixName);
                
                //Remove this voice from the old ducker
                if (__duckerName != undefined)
                {
                    var _duckerStruct = _duckerDict[$ _duckerNameFinal];
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
                __gainDuckTarget    = __gainDuck;
                __gainDuckSpeed     = undefined;
                __gainDuckBehaviour = __VINYL_DUCK.__DO_NOTHING;
                
                __gainSound  = _pattern.__gain;
                __pitchSound = _pattern.__pitch;
                
                __soundCurrent = _sound;
                __voiceCurrent = audio_play_sound(_sound, 0, _loop, __VINYL_VOICE_GAIN_SxLxMxD/VINYL_MAX_VOICE_GAIN, 0, __pitchLocal);
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
                audio_sound_gain(__voiceCurrent, __VINYL_VOICE_GAIN_SxLxMxD/VINYL_MAX_VOICE_GAIN, VINYL_STEP_DURATION);
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
            audio_sound_gain(__voiceCurrent, __VINYL_VOICE_GAIN_SxLxMxD/VINYL_MAX_VOICE_GAIN, VINYL_STEP_DURATION);
        }
    }
    
    static __SetMixGain = function(_gain)
    {
        __gainMix = max(0, _gain);
        audio_sound_gain(__voiceCurrent, __VINYL_VOICE_GAIN_SxLxMxD/VINYL_MAX_VOICE_GAIN, VINYL_STEP_DURATION);
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
        
        var _pattern = struct_get_from_hash(_soundDict, int64(__soundCurrent));
        
        __gainSound  = _pattern.__gain;
        __pitchSound = _pattern.__pitch;
        
        var _mixStruct = __VinylVoiceMoveMix(__voiceReference, _pattern.__mixName);
        //Loop behaviour is determined by the queue's behaviour so we don't want to tamper with it here
        
        var _duckerNameFinal = (_mixStruct == undefined)? _pattern.__duckerName : (_pattern.__duckerName ?? _mixStruct.__membersDuckOn);
        if (_duckerNameFinal != undefined)
        {
            var _duckerStruct = _duckerDict[$ _duckerNameFinal];
            if (_duckerStruct == undefined)
            {
                __VinylWarning("Ducker \"", _duckerNameFinal, "\" not recognised");
                __Duck(1, __VINYL_DEFAULT_DUCK_RATE_OF_GAIN, __VINYL_DUCK.__DO_NOTHING);
                return;
            }
        
            _duckerStruct.__Push(self, _pattern.__duckPrio ?? 0, true);
        }
        else
        {
            __Duck(1, __VINYL_DEFAULT_DUCK_RATE_OF_GAIN, __VINYL_DUCK.__DO_NOTHING);
        }
        
        audio_sound_gain( __voiceCurrent, __VINYL_VOICE_GAIN_SxLxMxD/VINYL_MAX_VOICE_GAIN, VINYL_STEP_DURATION);
        audio_sound_pitch(__voiceCurrent, __VINYL_VOICE_PITCH_SxPxL);
    }
}
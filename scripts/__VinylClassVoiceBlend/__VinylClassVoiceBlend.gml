// Feather disable all

/// @param pattern
/// @param loopLocal
/// @param gainLocal
/// @param pitchLocal
/// @param duckerNameLocal
/// @param duckPrioLocal
/// @param mixName

function __VinylClassVoiceBlend(_pattern, _loopLocal, _gainLocal, _pitchLocal, _duckerNameLocal, _duckPrioLocal, _mixName) constructor
{
    static _soundDict        = __VinylSystem().__soundDict;
    static _mixDict          = __VinylSystem().__mixDict;
    static _duckerDict       = __VinylSystem().__duckerDict;
    static _voiceToStructMap = __VinylSystem().__voiceToStructMap;
    static _voiceUpdateArray = __VinylSystem().__voiceUpdateArray;
    static _toUpdateArray    = __VinylSystem().__toUpdateArray;
    
    __inUpdateArray = false;
    
    __pattern         = _pattern;
    __gainLocal       = _gainLocal;
    __pitchLocal      = _pitchLocal;
    __loopLocal       = _loopLocal;
    __duckerNameLocal = _duckerNameLocal;
    __duckPrioLocal   = _duckPrioLocal;
    
    __gainLocalTarget  = _gainLocal;
    __gainLocalSpeed   = infinity;
    
    __gainPattern = _pattern.__gain;
    
    if (VINYL_LIVE_EDIT)
    {
        __mixName = _pattern.__mixName;
    }
    
    if (_mixName == undefined)
    {
        var _mixStruct = undefined;
        var _mixLoop   = undefined;
        __gainMix = 1;
        
        var _duckerNameFinal = _duckerNameLocal ?? _pattern.__duckerName;
    }
    else
    {
        var _mixStruct = _mixDict[$ _mixName];
        if (_mixStruct == undefined)
        {
            __VinylError("Mix \"", _mixName, "\" not recognised");
            return;
        }
        
        var _mixLoop = _mixStruct.__membersLoop;
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
    
    __blendFactor    = 0;
    __blendAnimCurve = _pattern.__animCurve;
    __blendAnimCurveOverride = false;
    
    var _soundArray = _pattern.__soundArray;
    __voiceCount = array_length(_soundArray);
    __voiceArray = array_create(__voiceCount, -1);
    __gainArray  = array_create(__voiceCount,  1);
    __pitchArray = array_create(__voiceCount,  1);
    
    __SetMemberGains();
    __SetMemberPitches();
    
    if (__voiceCount > 0)
    {
        var _loopFinal   = _loopLocal ?? (_pattern.__loop ?? (_mixLoop ?? false));
        var _gainShared  = __VINYL_VOICE_GAIN_PxLxMxD/VINYL_MAX_VOICE_GAIN;
        var _pitchShared = __pitchLocal;
        
        var _i = 0;
        repeat(__voiceCount)
        {
            __voiceArray[_i] = audio_play_sound(_soundArray[_i], 0, _loopFinal, __gainArray[_i]*_gainShared, 0, __pitchArray[_i]*_pitchShared);
            ++_i;
        }
        
        __voiceTop = __voiceArray[0];
    }
    else
    {
        __voiceTop = -1;
    }
    
    __voiceReference = __voiceTop;
    
    if (__voiceTop >= 0)
    {
        _voiceToStructMap[? __voiceReference] = self;
        
        if (_duckerStruct != undefined) _duckerStruct.__Push(self, _duckPrioFinal, false);
        if (_mixStruct != undefined) _mixStruct.__Add(__voiceReference);
    }
    
    
    
    
    
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
        
        if (_changed)
        {
            __UpdateVoiceGains();
        }
        
        return true;
    }
    
    static __UpdateVoiceGains = function()
    {
        var _voiceArray = __voiceArray;
        var _gainArray  = __gainArray;
        var _gainShared = __VINYL_VOICE_GAIN_PxLxMxD;
        
        var _i = 0;
        repeat(__voiceCount)
        {
            audio_sound_gain(_voiceArray[_i], _gainArray[_i]*_gainShared/VINYL_MAX_VOICE_GAIN, VINYL_STEP_DURATION);
            ++_i;
        }
    }
    
    static __UpdateVoicePitches = function()
    {
        var _voiceArray  = __voiceArray;
        var _pitchArray  = __pitchArray;
        var _pitchShared = __pitchLocal;
        
        var _i = 0;
        repeat(__voiceCount)
        {
            audio_sound_pitch(_voiceArray[_i], _pitchArray[_i]*_pitchShared);
            ++_i;
        }
    }
    
    static __IsPlaying = function()
    {
        return audio_is_playing(__voiceTop);
    }
    
    static __Stop = function()
    {
        if (__voiceTop >= 0)
        {
            __voiceTop = -1;
            
            var _i = 0;
            repeat(array_length(__voiceArray))
            {
                audio_stop_sound(__voiceArray[_i]);
                ++_i;
            }
        }
    }
    
    static __SetPause = function(_state)
    {
        if (_state)
        {
            var _i = 0;
            repeat(array_length(__voiceArray))
            {
                audio_pause_sound(__voiceArray[_i]);
                ++_i;
            }
        }
        else
        {
            var _i = 0;
            repeat(array_length(__voiceArray))
            {
                audio_resume_sound(__voiceArray[_i]);
                ++_i;
            }
        }
    }
    
    static __IsPaused = function()
    {
        if (__voiceTop < 0) return false;
        return audio_is_paused(__voiceTop);
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
        var _i = 0;
        repeat(__voiceCount)
        {
            audio_sound_loop(__voiceArray[_i], _state);
            ++_i;
        }
    }
    
    static __GetLoop = function()
    {
        return audio_sound_get_loop(__voiceTop);
    }
    
    static __SetLocalGain = function(_gain, _rateOfChange)
    {
        __gainLocalTarget = _gain;
        __gainLocalSpeed  = _rateOfChange;
        
        if (_rateOfChange > 100)
        {
            __gainLocal = _gain;
            __UpdateVoiceGains();
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
        __UpdateVoiceGains();
    }
    
    static __SetBlend = function(_factor)
    {
        _factor = clamp(_factor, 0, 1);
        
        if (_factor != __blendFactor)
        {
            __blendFactor = _factor;
            __SetMemberGains();
            __UpdateVoiceGains();
        }
    }
    
    static __SetBlendAnimCurve = function(_animCurve, _factor)
    {
        if ((_animCurve != __blendAnimCurve) || (not __blendAnimCurveOverride))
        {
            if (_factor != undefined) __blendFactor = clamp(_factor, 0, 1);
            
            __blendAnimCurve = _animCurve;
            __blendAnimCurveOverride = true;
            
            __SetMemberGains();
            __UpdateVoiceGains();
        }
        else
        {
            __SetBlend(_factor);
        }
    }
    
    static __SetMemberGains = function()
    {
        var _soundArray = __pattern.__soundArray;
        
        var _gainArray   = __gainArray;
        var _blendFactor = __blendFactor;
        
        if (__blendAnimCurve == undefined)
        {
            //Scale up the blend factor to match the number of channels we have
            var _factor = clamp(__blendFactor, 0, 1)*(__voiceCount - 1);
            
            //Set channels using linear crossfades
            var _i = 0;
            repeat(__voiceCount)
            {
                _gainArray[_i] = __VinylSoundGetGain(_soundArray[_i])*max(0, 1 - abs(_i - _factor));
                ++_i;
            }
        }
        else
        {
            var _animCurve = __blendAnimCurve;
            
            //Set channels from the animation curve
            var _channelCount = array_length(animcurve_get(_animCurve).channels);
            var _i = 0;
            repeat(min(_channelCount, __voiceCount))
            {
                _gainArray[_i] = __VinylSoundGetGain(_soundArray[_i])*max(0, animcurve_channel_evaluate(animcurve_get_channel(_animCurve, _i), _blendFactor));
                ++_i;
            }
            
            //Set remaining channels to 0
            repeat(__voiceCount - _i)
            {
                _gainArray[_i] = 0;
                ++_i;
            }
        }
    }
    
    static __SetMemberPitches = function()
    {
        var _soundArray = __pattern.__soundArray;
        var _pitchArray = __pitchArray;
        
        var _i = 0;
        repeat(__voiceCount)
        {
            _pitchArray[_i] = __VinylSoundGetPitch(_soundArray[_i]);
            ++_i;
        }
    }
    
    static __QueueUpdateForSound = function(_sound)
    {
        if (__pattern.__UsesSound(_sound)) array_push(_toUpdateArray, self);
    }
    
    static __UpdateFromPattern = function()
    {
        var _pattern = __pattern;
        
        __gainPattern = _pattern.__gain;
        
        //If we haven't manually set the blend curve then update that from the pattern
        if (not __blendAnimCurveOverride) __blendAnimCurve = _pattern.__animCurve;
        
        var _mixStruct = __VinylVoiceMoveMix(__voiceReference, _pattern.__mixName);
        var _loopMix = (_mixStruct == undefined)? undefined : _mixStruct.__membersLoop;
        
        __VinylVoiceUpdateDucker(_mixStruct);
        
        var _loop = __loopLocal ?? (_pattern.__loop ?? (_loopMix ?? false));
        
        if (_pattern.__changedSoundArray)
        {
            var _soundArray = _pattern.__soundArray;
            __voiceCount = array_length(_soundArray);
            
            __Stop();
            
            __voiceTop   = -1;
            __voiceArray = [];
            __gainArray  = [];
            __pitchArray = [];
            
            if (__voiceCount > 0)
            {
                __SetMemberGains();
                __SetMemberPitches();
                
                var _gainShared  = __VINYL_VOICE_GAIN_PxLxMxD;
                var _pitchShared = __pitchLocal;
                
                var _i = 0;
                repeat(__voiceCount)
                {
                    __voiceArray[_i] = audio_play_sound(_soundArray[_i], 0, _loop, _gainShared*__gainArray[_i]/VINYL_MAX_VOICE_GAIN, 0, _pitchShared*__pitchArray[_i]);
                    ++_i;
                }
                
                __voiceTop = __voiceArray[0];
            }
        }
        else
        {
            var _i = 0;
            repeat(__voiceCount)
            {
                audio_sound_loop(__voiceArray[_i], _loop);
                ++_i;
            }
            
            __SetMemberGains();
            __SetMemberPitches();
            
            __UpdateVoiceGains();
            __UpdateVoicePitches();
        }
    }
}
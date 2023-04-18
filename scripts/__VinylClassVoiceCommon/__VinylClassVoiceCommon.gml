function __VinylClassVoiceCommon() constructor
{
    static __patternType = "???";
    
    static __globalData      = __VinylGlobalData();
    static __idToVoiceDict   = __globalData.__idToVoiceDict;
    static __effectChainDict = __globalData.__effectChainDict;
    
    __id   = undefined;
    __pool = undefined;
    
    
    
    static toString = function()
    {
        return "<inst " + string(__id) + ">";
    }
    
    static __PatternTopGet = function()
    {
        return __patternTop;
    }
    
    static __StateResetCommon = function()
    {
        __patternTop  = undefined;
        __pattern     = undefined;
        __parentVoice = undefined;
        __child       = undefined;
        
        __labelArray = [];
        
        __loopLocal  = undefined;
        __loopConfig = false;
        __loopOutput = false;
        
        __pan  = undefined;
        
        __persistent       = false;
        __shutdown         = false;
        __stopCallback     = undefined;
        __stopCallbackData = undefined;
        
        __gainLocal          = 1;
        __gainTarget         = 1;
        __gainRate           = VINYL_DEFAULT_GAIN_RATE;
        __gainPattern        = 1;
        __gainParent         = 1;
        __gainLabels         = 1;
        __gainOutputNoLabels = 1;
        __gainOutput         = 1;
        
        __gainDuck        = 1;
        __gainDuckTarget  = 1;
        __gainDuckRate    = VINYL_DEFAULT_DUCK_GAIN_RATE;
        __duckPauseOnFade = false;
        __duckStopOnFade  = false;
        
        __transposeLocal          = undefined;
        __transposePattern        = undefined;
        __transposeParent         = undefined;
        __transposeLabels         = undefined;
        __transposeOutputNoLabels = undefined;
        
        __pitchLocal          = 1;
        __pitchTarget         = 1;
        __pitchRate           = VINYL_DEFAULT_PITCH_RATE;
        __pitchRandomParam    = 0.5;
        __pitchPattern        = 1;
        __pitchParent         = 1;
        __pitchLabels         = 1;
        __pitchOutputNoLabels = 1;
        __pitchOutput         = 1;
        
        __vinylEmitter    = undefined;
        __usingPanEmitter = false;
    }
    
    static __StateSetCommon = function(_patternTop, _pattern, _parentVoice, _emitter, _loop, _gain, _pitch, _pan)
    {
        static _globalTopLevelArray = __globalData.__topLevelArray;
        
        __patternTop   = _patternTop;
        __pattern        = _pattern;
        __parentVoice    = _parentVoice;
        __initialEmitter = _emitter;
        __loopLocal      = _loop;
        __gainLocal      = _gain;
        __pitchLocal     = _pitch;
        __pan            = _pan;
        
        __LabelArrayResolve();
        __LabelAdd();
        __StackPush();
        __CalculateGainPitchTranspose(0);
        
        __PersistenceResolve();
        __LoopResolve();
        __EffectChainResolve();
        __EmitterResolve();
        
        __gainTarget  = __gainLocal;
        __pitchTarget = __pitchLocal;
        
        __pitchRandomParam = __VinylRandom(1);
        
        if (__parentVoice == undefined) array_push(_globalTopLevelArray, self);
    }
    
    
    
    #region Gain
    
    static __GainSet = function(_gain)
    {
        if (__shutdown)
        {
            __VinylTrace("Cannot set gain for ", self, ", it is set to shut down");
            return;
        }
        
        if ((__gainLocal != _gain) && (VINYL_DEBUG_LEVEL >= 2))
        {
            __VinylTrace(self, " gain=", _gain);
        }
        
        __gainTarget = _gain;
        __gainRate   = infinity;
        
        if (__child != undefined)
        {
            //We're setting the gain instantly so propagate the new gain value
            __child.__GainTargetSet(_gain, infinity, __shutdown);
        }
    }
    
    static __GainGet = function()
    {
        return __gainLocal;
    }
    
    static __GainTargetSet = function(_targetGain, _rate, _stopAtSilence = false)
    {
        if (__shutdown)
        {
            __VinylTrace("Cannot set gain target for ", self, ", it is set to shut down");
            return;
        }
        
        if (VINYL_DEBUG_LEVEL >= 1)
        {
            __VinylTrace(self, " gain target=", _targetGain, ", rate=", _rate, "/s, stop at silence=", _stopAtSilence? "true" : "false");
        }
        
        __gainTarget = _targetGain;
        __gainRate   = _rate;
        __shutdown   = _stopAtSilence;
        
        if (__child != undefined)
        {
            //If we're setting the gain instantly then propagate the new gain value
            if (is_infinity(_rate)) __child.__GainTargetSet(_targetGain, _rate, _stopAtSilence);
        }
    }
    
    static __GainTargetGet = function()
    {
        return __gainTarget;
    }
    
    static __GainOutputGet = function()
    {
        return __gainOutput;
    }
    
    static __GainDuckSet = function(_targetGain, _rate, _pauseOnDuck, _stopOnDuck)
    {
        __gainDuckTarget  = _targetGain;
        __gainDuckRate    = _rate;
        __duckPauseOnFade = _pauseOnDuck;
        __duckStopOnFade  = _stopOnDuck;
    }
    
    #endregion
    
    
    
    #region Pitch
    
    static __PitchSet = function(_pitch)
    {
        if ((__pitchLocal != _pitch) && (VINYL_DEBUG_LEVEL >= 2))
        {
            __VinylTrace(self, " pitch=", _pitch);
        }
        
        __pitchTarget = _pitch;
        __pitchRate   = infinity;
        
        if (__child != undefined)
        {
            //We're setting the pitch instantly so propagate the new pitch value
            __child.__PitchTargetSet(_pitch, infinity);
        }
    }
    
    static __PitchGet = function()
    {
        return __pitchLocal;
    }
    
    static __PitchTargetSet = function(_targetPitch, _rate)
    {
        if (VINYL_DEBUG_LEVEL >= 1)
        {
            __VinylTrace(self, " pitch target=", _targetPitch, ", rate=", _rate, "/s");
        }
        
        __pitchTarget = _targetPitch;
        __pitchRate   = _rate;
        
        if (__child != undefined)
        {
            //If we're setting the pitch instantly then propagate the new pitch value
            if (is_infinity(_rate)) __child.__PitchTargetSet(_targetPitch, _rate);
        }
    }
    
    static __PitchTargetGet = function()
    {
        return __pitchTarget;
    }
    
    static __PitchOutputGet = function()
    {
        return __pitchOutput;
    }
    
    #endregion
    
    
    
    #region BPM
    
    static __BPMGet = function()
    {
        if (__child == undefined) return;
        return __child.__BPMGet();
    }
    
    static __BPMPulseGet = function()
    {
        if (__child == undefined) return;
        return __child.__BPMPulseGet();
    }
    
    static __BPMBeatCountGet = function()
    {
        if (__child == undefined) return;
        return __child.__BPMBeatCountGet();
    }
    
    #endregion
    
    
    
    #region Semitones
    
    static __TransposeSet = function(_semitones)
    {
        if (__transposeLocal != _semitones)
        {
            if (VINYL_DEBUG_LEVEL >= 1) __VinylTrace(self, " transpose=", _semitones);
            __transposeLocal = _semitones;
        }
    }
    
    static __TransposeGet = function()
    {
        return __transposeLocal;
    }
    
    #endregion
    
    
    
    #region Loop
    
    static __LoopSet = function(_state)
    {
        __loopLocal = _state;
        if (__child != undefined) __child.__LoopSet(_state);
    }
    
    static __LoopGet = function()
    {
        return __loopOutput;
    }
    
    static __LoopPointsSet = function()
    {
        if (__child != undefined) __child.__LoopPointsSet();
    }
    
    #endregion
    
    
    
    #region Persistence
    
    static __PersistentSet = function(_state)
    {
        __persistent = _state;
        
        //If the state is <undefined> then re-evaluate the inherited persistence of the voice
        if (_state == undefined) __PersistenceResolve();
    }
    
    static __PersistentGet = function()
    {
        return __persistent ?? false;
    }
    
    #endregion
    
    
    
    #region Playback
    
    static __IsPlaying = function()
    {
        return (__child != undefined);
    }
    
    static __Pause = function()
    {
        if (__child == undefined) return;
        __child.__Pause();
    }
    
    static __PauseGet = function()
    {
        if (__child == undefined) return;
        return __child.__PauseGet();
    }
    
    static __Resume = function()
    {
        if (__child == undefined) return;
        __child.__Resume();
    }
    
    static __PauseDuck = function()
    {
        if (__child == undefined) return;
        __child.__PauseDuck();
    }
    
    static __ResumeDuck = function()
    {
        if (__child == undefined) return;
        __child.__ResumeDuck();
    }
    
    static __FadeOut = function(_rate)
    {
        __GainTargetSet(0, _rate, true);
    }
    
    static __Stop = function()
    {
        if (__child == undefined) return;
        
        __StopCallbackExecute();
        
        __child.__Stop();
        __child = undefined;
        
        __VINYL_RETURN_SELF_TO_POOL
    }
    
    static __LengthGet = function()
    {
        if (__child == undefined) return 0;
        return __child.__LengthGet();
    }
    
    static __RawPositionSet = function(_position)
    {
        if (__child == undefined) return;
        return __child.__RawPositionSet(_position);
    }
    
    static __PositionSet = function(_position)
    {
        if (__child == undefined) return;
        return __child.__PositionSet(_position);
    }
    
    static __RawPositionGet = function()
    {
        if (__child == undefined) return 0;
        return __child.__RawPositionGet();
    }
    
    static __PositionGet = function()
    {
        if (__child == undefined) return 0;
        return __child.__PositionGet();
    }
    
    static __WillStop = function()
    {
        return (__child == undefined)? false : __child.__WillStop();
    }
    
    #endregion
    
    
    
    #region Stop Callback
    
    static __StopCallbackSet = function(_callback, _data)
    {
        if (!is_method(_callback) && not (is_numeric(_callback) && script_exists(_callback)))
        {
            __VinylError("Callback not a method or a script (datatype=", typeof(_callback), ")");
        }
        
        __stopCallback     = _callback;
        __stopCallbackData = _data;
    }
    
    static __StopCallbackGet = function()
    {
        static _result = {};
        _result.callback = __stopCallback;
        _result.data     = __stopCallbackData;
        return _result;
    }
    
    static __StopCallbackExecute = function()
    {
        if (is_method(__stopCallback))
        {
            __stopCallback(__stopCallbackData, __id);
        }
        else if (is_numeric(__stopCallback) && script_exists(__stopCallback))
        {
            script_execute(__stopCallback, __stopCallbackData, __id);
        }
    }
    
    #endregion
    
    
    
    #region Queue
    
    static __QueuePush = function(_asset, _dontRepeatLast)
    {
        __VinylError("Cannot use VinylQueuePush() on a ", __patternType, " voice");
    }
    
    static __QueueBehaviorSet = function(_behavior)
    {
        __VinylError("Cannot use VinylQueueBehaviorSet() on a ", __patternType, " voice");
    }
    
    static __QueueBehaviorGet = function()
    {
        __VinylError("Cannot use VinylQueueBehaviorGet() on a ", __patternType, " voice");
    }
    
    #endregion
    
    
    
    #region Multi
    
    static __MultiChannelCountGet = function(_asset)
    {
        __VinylError("Cannot use VinylMultiChannelCountGet() on a ", __patternType, " voice");
    }
    
    static __MultiGainSet = function(_index, _gain)
    {
        __VinylError("Cannot use VinylMultiGainSet() on a ", __patternType, " voice");
    }
    
    static __MultiGainGet = function(_index)
    {
        __VinylError("Cannot use VinylMultiGainGet() on a ", __patternType, " voice");
    }
    
    static __MultiBlendSet = function(_blendFactor)
    {
        __VinylError("Cannot use VinylMultiBlendSet() on a ", __patternType, " voice");
    }
    
    static __MultiBlendGet = function()
    {
        __VinylError("Cannot use VinylMultiBlendGet() on a ", __patternType, " voice");
    }
    
    static __MultiSyncSet = function(_state)
    {
        __VinylError("Cannot use VinylMultiSyncSet() on a ", __patternType, " voice");
    }
    
    static __MultiSyncGet = function()
    {
        __VinylError("Cannot use VinylMultiSyncGet() on a ", __patternType, " voice");
    }
    
    static __ApplyBlendFactorRecursive = function()
    {
        if (__child == undefined) return;
        __child.__ApplyBlendFactorRecursive();
    }
    
    #endregion
    
    
    
    static __MigrateCommon = function()
    {
        __LabelRemove();
        
        __LabelArrayResolve();
        __LabelAdd();
        __StackPush();
        __CalculateGainPitchTranspose(0);
        
        __PersistenceResolve();
        __LoopResolve();
        __EffectChainResolve();
        __EmitterResolve();
        
        __LoopPointsSet();
    }
    
    static __PersistenceResolve = function()
    {
        //Inherit the top level pattern's persistence first
        __persistent = __ParentTopLevelGet().__pattern.__persistent;
        
        if (__persistent == undefined)
        {
            //If we still don't know if we're persistent or not, check the labels
            var _i = 0;
            repeat(array_length(__labelArray))
            {
                var _persistent = __labelArray[_i].__configPersistent;
                if (_persistent != undefined)
                {
                    __persistent = _persistent;
                    break;
                }
                
                ++_i;
            }
        }
    }
    
    static __LoopResolve = function(_loop)
    {
        __loopConfig = __ParentTopLevelGet().__pattern.__LoopGet();
        
        if (__loopConfig == undefined)
        {
            var _i = 0;
            repeat(array_length(__labelArray))
            {
                if (__labelArray[_i].__configLoop == true)
                {
                    __loopConfig = true;
                    break;
                }
                
                ++_i;
            }
        }
        
        __loopOutput = __loopLocal ?? (__loopConfig ?? false);
    }
    
    static __LabelArrayResolve = function()
    {
        if (__parentVoice == undefined)
        {
            __labelArray = __pattern.__labelArray;
        }
        else
        {
            __labelArray = array_union(__parentVoice.__labelArray, __pattern.__labelArray);
        }
    }
    
    static __EffectChainResolve = function()
    {
        //Search up the tree until we hit a parent with a defined effect chain
        if (__parentVoice != undefined)
        {
            if (__parentVoice.__effectChainName != undefined)
            {
                __effectChainName = __parentVoice.__effectChainName;
                return;
            }
        }
        
        //If none could be found, return our own
        __effectChainName = __pattern.__effectChainName;
    }
    
    static __EmitterResolve = function()
    {
        static _poolPanEmitter = __globalData.__poolPanEmitter;
        
        //Determine which emitter to use given the input arguments
        if (__initialEmitter != undefined)
        {
            if (__vinylEmitter != __initialEmitter)
            {
                __EmitterRemove();
                __vinylEmitter = __initialEmitter;
                __vinylEmitter.__VoiceAdd(__id);
            }
        }
        else
        {
            if (__pan != undefined)
            {
                //We're not already using a pan emitter, we need to use a new one
                if (!__usingPanEmitter)
                {
                    __EmitterRemove();
                    __vinylEmitter = _poolPanEmitter.__Depool();
                    __usingPanEmitter = true;
                }
                
                //Update the pan emitter
                __vinylEmitter.__Pan(__pan);
                __vinylEmitter.__Bus(__effectChainName);
            }
            else
            {
                //Only use an emitter if the effect chain demands it
                var _newVinylEmitter = __effectChainDict[$ __effectChainName];
                if (_newVinylEmitter != __vinylEmitter)
                {
                    __EmitterRemove();
                    __vinylEmitter = _newVinylEmitter;
                }
            }
        }
    }
    
    static __EmitterRemove = function()
    {
        if (__vinylEmitter != undefined)
        {
            if (__usingPanEmitter)
            {
                with(__vinylEmitter)
                {
                    __VINYL_RETURN_SELF_TO_POOL
                }
            }
            else
            {
                __vinylEmitter.__VoiceRemove(__id);
            }
            
            __vinylEmitter    = undefined;
            __usingPanEmitter = false;
        }
    }
    
    static __LabelAdd = function()
    {
        //Only add top-level voices to labels
        if (__parentVoice == undefined)
        {
            var _i = 0;
            repeat(array_length(__labelArray))
            {
                __labelArray[_i].__VoiceAdd(__id);
                ++_i;
            }
        }
    }
    
    static __LabelRemove = function()
    {
        //Only top-level voices can be assigned to labels
        if (__parentVoice == undefined)
        {
            var _i = 0;
            repeat(array_length(__labelArray))
            {
                __labelArray[_i].__VoiceRemove(__id);
                ++_i;
            }
        }
    }
    
    static __StackPush = function()
    {
        static __stackDict = __VinylGlobalData().__stackDict;
        
        //Only top-level voices can be pushed to a stack
        if (__parentVoice == undefined)
        {
            var _stackName     = __pattern.__stackName;
            var _stackPriority = __pattern.__stackPriority;
            
            //If we still don't know if we're persistent or not, check the labels
            var _i = 0;
            repeat(array_length(__labelArray))
            {
                var _label              = __labelArray[_i];
                var _labelStackName     = _label.__stackName;
                var _labelStackPriority = _label.__stackPriority;
                
                if (_stackName == undefined) _stackName = _labelStackName;
                _stackPriority = max(_labelStackPriority, _stackPriority);
                
                ++_i;
            }
            
            if (_stackName != undefined)
            {
                var _stack = __stackDict[$ _stackName];
                if (_stack != undefined)
                {
                    _stack.__Push(_stackPriority, self, true);
                }
                else
                {
                    __VinylError(self, " stack \"", _stackName, "\" doesn't exist");
                }
            }
        }
    }
    
    static __LabelGainPitchTransposeGet = function()
    {
        //Update the output values based on the asset and labels
        __gainLabels      = 1;
        __pitchLabels     = 1;
        __transposeLabels = undefined;
        
        var _i = 0;
        repeat(array_length(__labelArray))
        {
            var _label = __labelArray[_i];
            __gainLabels  *= _label.__gainOutput;
            __pitchLabels *= _label.__pitchOutput*lerp(_label.__configPitchLo, _label.__configPitchHi, __pitchRandomParam);
            
            if (_label.__configTranspose != undefined) __transposeLabels = (__transposeLabels ?? 0) + _label.__configTranspose;
            
            ++_i;
        }
    }
    
    static __ParentTopLevelGet = function()
    {
        return (__parentVoice == undefined)? self : __parentVoice.__ParentTopLevelGet();
    }
    
    static __DepoolCallback = function()
    {
        __idToVoiceDict[? __id] = self;
    }
    
    static __PoolCallback = function()
    {
        ds_map_delete(__idToVoiceDict, __id);
        
        __EmitterRemove();
        __LabelRemove();
        __Stop();
        __StateReset();
    }
    
    static __CalculateGainPitchTranspose = function(_deltaTimeFactor)
    {
        __LabelGainPitchTransposeGet();
        
        __loopOutput = (__loopLocal ?? __loopConfig) ?? false;
        
        __gainLocal          += clamp(__gainTarget - __gainLocal, -_deltaTimeFactor*__gainRate, _deltaTimeFactor*__gainRate);
        __gainPattern         = __pattern.__gain;
        __gainParent          = (__parentVoice == undefined)? 1 : __parentVoice.__gainOutputNoLabels;
        __gainDuck           += clamp(__gainDuckTarget - __gainDuck, -_deltaTimeFactor*__gainDuckRate, _deltaTimeFactor*__gainDuckRate);
        __gainOutputNoLabels  = __gainLocal*__gainPattern*__gainParent*__gainDuck;
        __gainOutput          = __gainOutputNoLabels*__gainLabels;
        
        __pitchLocal          += clamp(__pitchTarget - __pitchLocal, -_deltaTimeFactor*__pitchRate, _deltaTimeFactor*__pitchRate);
        __pitchPattern         = lerp(__pattern.__pitchLo, __pattern.__pitchHi, __pitchRandomParam);
        __pitchParent          = (__parentVoice == undefined)? 1 : __parentVoice.__pitchOutputNoLabels;
        __pitchOutputNoLabels  = __pitchLocal*__pitchPattern*__pitchParent;
        __pitchOutput          = __pitchOutputNoLabels*__pitchLabels;
        
        __transposePattern = __pattern.__transpose;
        __transposeParent  = (__parentVoice == undefined)? undefined : __parentVoice.__transposeOutputNoLabels;
        
        if ((__transposeLocal != undefined) || (__transposePattern != undefined) || (__transposeParent != undefined))
        {
            __transposeOutputNoLabels = (__transposeLocal ?? 0) + (__transposePattern ?? 0) + (__transposeParent ?? 0);
        }
        else
        {
            __transposeOutputNoLabels = undefined;
        }
        
        if ((__transposeOutputNoLabels != undefined) || (__transposeLabels != undefined))
        {
            __pitchOutput *= __VinylSemitoneToPitch((__transposeOutputNoLabels ?? 0) + (__transposeLabels ?? 0) + __globalData.__transpose);
        }
        
        if (__usingPanEmitter && (__vinylEmitter != undefined)) __vinylEmitter.__UpdatePosition();
    }
    
    static __TickCommon = function(_deltaTimeFactor)
    {
        var _canFinishDuck = (__gainDuck != __gainDuckTarget);
        var _canShutdown   = (__gainTarget <= __gainLocal);
        
        __CalculateGainPitchTranspose(_deltaTimeFactor);
        
        if (_canFinishDuck && (__gainDuck == __gainDuckTarget))
        {
            if (__duckStopOnFade)
            {
                __Stop();
                return false;
            }
            else if (__duckPauseOnFade)
            {
                __PauseDuck();
            }
        }
        
        if (_canShutdown && __shutdown && ((__gainLocal <= 0) || (__gainOutput <= 0)))
        {
            __Stop();
            return false;
        }
        
        return true;
    }
}
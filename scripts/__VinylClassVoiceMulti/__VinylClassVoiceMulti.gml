function __VinylClassVoiceMulti() : __VinylClassVoiceCommon() constructor
{
    __StateReset();
    
    static __patternType = "multi";
    
    static toString = function()
    {
        if (__pattern == undefined)
        {
            return "<multi " + string(__id) + ">";
        }
        else
        {
            return "<multi " + string(__id) + " " + string(__pattern.__name) + ">";
        }
    }
    
    static __StateReset = function()
    {
        if ((VINYL_DEBUG_LEVEL >= 2) && (__id != undefined)) __VinylTrace("Resetting state for ", self);
        
        __StateResetCommon();
        
        __blendFactorLocal  = undefined;
        __blendFactorOutput = undefined;
        
        __sync        = false;
        __childArray  = [];
        __gainArray   = [];
        
        __shortestIndex        = 0;
        __shortestPrevPosition = 0;
    }
    
    static __WillStop = function()
    {
        if (array_length(__childArray) <= 0) return false;
        var _child = __childArray[__shortestIndex];
        return (_child == undefined)? false : _child.__WillStop();
    }
    
    
    
    #region BPM
    
    static __BPMGet = function()
    {
        if (array_length(__childArray) <= 0) return false;
        return __childArray[__shortestIndex].__BPMGet();
    }
    
    static __BPMPulseGet = function()
    {
        if (array_length(__childArray) <= 0) return false;
        return __childArray[__shortestIndex].__BPMPulseGet();
    }
    
    static __BPMBeatCountGet = function()
    {
        if (array_length(__childArray) <= 0) return 0;
        return __childArray[__shortestIndex].__BPMBeatCountGet();
    }
    
    #endregion
    
    
    
    #region Loop
    
    static __LoopSet = function(_state)
    {
        if (__loopLocal != _state)
        {
            __loopLocal = _state;
            
            var _i = 0;
            repeat(array_length(__childArray))
            {
                __childArray[_i].__LoopSet(_state);
                ++_i;
            }
        }
    }
    
    static __LoopPointsSet = function()
    {
        var _i = 0;
        repeat(array_length(__childArray))
        {
            __childArray[_i].__LoopPointsSet();
            ++_i;
        }
    }
    
    #endregion
    
    
    
    #region Playback
    
    static __IsPlaying = function()
    {
        if (array_length(__childArray) <= 0) return false;
        return __childArray[__shortestIndex].__IsPlaying();
    }
    
    static __Pause = function()
    {
        var _i = 0;
        repeat(array_length(__childArray))
        {
            __childArray[_i].__Pause();
            ++_i;
        }
    }
    
    static __PauseGet = function()
    {
        if (array_length(__childArray) <= 0) return false;
        return __childArray[__shortestIndex].__PauseGet();
    }
    
    static __Resume = function()
    {
        var _i = 0;
        repeat(array_length(__childArray))
        {
            __childArray[_i].__Resume();
            ++_i;
        }
    }
    
    static __PauseDuck = function()
    {
        var _i = 0;
        repeat(array_length(__childArray))
        {
            __childArray[_i].__PauseDuck();
            ++_i;
        }
    }
    
    static __ResumeDuck = function()
    {
        var _i = 0;
        repeat(array_length(__childArray))
        {
            __childArray[_i].__ResumeDuck();
            ++_i;
        }
    }
    
    static __Stop = function()
    {
        if (array_length(__childArray) <= 0) return;
        
        __StopCallbackExecute();
        
        var _i = 0;
        repeat(array_length(__childArray))
        {
            __childArray[_i].__Stop();
            ++_i;
        }
        
        array_resize(__childArray, 0);
        
        __VINYL_RETURN_SELF_TO_POOL
    }
    
    static __LengthGet = function()
    {
        if (array_length(__childArray) <= 0) return 0;
        return __childArray[__shortestIndex].__LengthGet();
    }
    
    static __RawPositionSet = function(_position)
    {
        var _i = 0;
        repeat(array_length(__childArray))
        {
            __childArray[_i].__RawPositionSet(_position);
            ++_i;
        }
    }
    
    static __PositionSet = function(_position)
    {
        var _i = 0;
        repeat(array_length(__childArray))
        {
            __childArray[_i].__PositionSet(_position);
            ++_i;
        }
    }
    
    static __RawPositionGet = function()
    {
        if (array_length(__childArray) <= 0) return 0;
        return __childArray[__shortestIndex].__RawPositionGet();
    }
    
    static __PositionGet = function()
    {
        if (array_length(__childArray) <= 0) return 0;
        return __childArray[__shortestIndex].__PositionGet();
    }
    
    #endregion
    
    
    
    #region Multi
    
    static __MultiChannelCountGet = function(_asset)
    {
        return array_length(__childArray);
    }
    
    static __MultiGainSet = function(_index, _gain)
    {
        __blendFactorLocal = undefined;
        if (_gain != __gainArray[_index]) __gainArray[@ _index] = _gain;
    }
    
    static __MultiGainGet = function(_index)
    {
        return __gainArray[_index];
    }
    
    static __MultiBlendSet = function(_blendFactor)
    {
        if (_blendFactor != __blendFactorLocal)
        {
            __blendFactorLocal = _blendFactor;
            
            __ApplyBlendFactor();
            
            //Immediately update the gain too in case the blend was immediately after creation
            var _i = 0;
            repeat(array_length(__gainArray))
            {
                __childArray[_i].__GainSet(__gainArray[_i]);
                ++_i;
            }
        }
    }
    
    static __MultiBlendGet = function()
    {
        return __blendFactorOutput;
    }
    
    static __MultiSyncSet = function(_state)
    {
        __sync = _state;
    }
    
    static __MultiSyncGet = function()
    {
        return __sync;
    }
    
    static __ApplyBlendFactorRecursive = function()
    {
        __ApplyBlendFactor(true);
        
        var _i = 0;
        repeat(array_length(__gainArray))
        {
            __childArray[_i].__ApplyBlendFactorRecursive();
            ++_i;
        }
    }
    
    static __ApplyBlendFactor = function(_force = false)
    {
        var _newBlend = __blendFactorLocal ?? __pattern.__blendFactorLocal;
        if ((_newBlend != __blendFactorOutput) || _force)
        {
            __blendFactorOutput = _newBlend;
            
            if (__blendFactorOutput == undefined)
            {
                //Reset all channels to unity gain
                var _i = 0;
                repeat(array_length(__gainArray))
                {
                    __gainArray[@ _i] = 1;
                    ++_i;
                }
            }
            else
            {
                if (__blendCurve == undefined) //No blend curve, use linear crossfades
                {
                    //Scale up the blend factor to match the number of channels we have
                    var _factor = clamp(__blendFactorOutput, 0, 1)*(array_length(__gainArray) - 1);
                    
                    //Set channels using linear crossfades
                    var _i = 0;
                    repeat(array_length(__gainArray))
                    {
                        __gainArray[@ _i] = max(0, 1 - abs(_i - _factor));
                        ++_i;
                    }
                }
                else
                {
                    var _gmCurve = __blendCurve.__Get();
                    var _factor = clamp(__blendFactorOutput, 0, 1);
                    
                    //Set channels from the animation curve
                    var _i = 0;
                    repeat(min(__blendCurve.__ChannelCountGet(), array_length(__gainArray)))
                    {
                        __gainArray[@ _i] = max(0, animcurve_channel_evaluate(animcurve_get_channel(_gmCurve, _i), _factor));
                        ++_i;
                    }
                    
                    //Set remaining channels to 0
                    repeat(array_length(__gainArray) - _i)
                    {
                        __gainArray[@ _i] = 0;
                        ++_i;
                    }
                }
            }
        }
    }
    
    #endregion
    
    
    
    static __Instantiate = function(_patternTop, _pattern, _parentVoice, _vinylEmitter, _assetArray, _loop, _gain, _pitch, _pan)
    {
        __StateSetCommon(_patternTop, _pattern, _parentVoice, _vinylEmitter, _loop, _gain, _pitch, _pan);
        
        __blendFactorLocal  = undefined;
        __blendFactorOutput = undefined;
        __sync              = __pattern.__sync;
        __blendCurve        = __pattern.__blendCurve;
        
        //Make a local copy of the input asset array
        __assetArray = array_create(array_length(_assetArray), undefined);
        array_copy(__assetArray, 0, _assetArray, 0, array_length(_assetArray));
        __gainArray = array_create(array_length(_assetArray), 1);
        
        __ApplyBlendFactor();
        
        var _shortestLength = infinity;
        var _i = 0;
        repeat(array_length(_assetArray))
        {
            //Start a voice for this track
            var _asset = _assetArray[_i];
            var _voice = __VinylPatternGet(_asset).__Play(_patternTop, self, __initialEmitter, _asset, __loopLocal, __gainArray[_i], 1, __pan);
            __childArray[@ _i] = _voice;
            
            //And then find the shortest voice and use that for syncing purposes
            var _length = _voice.__LengthGet();
            if (_length < _shortestLength)
            {
                _shortestLength = _length;
                
                __shortestIndex        = _i;
                __shortestPrevPosition = _voice.__PositionGet();
            }
            
            ++_i;
        }
    }
    
    static __Migrate = function()
    {
        var _pattern = __VinylPatternGetUnsafe(__pattern.__name);
        if (_pattern == undefined)
        {
            __VinylTrace("Warning! Pattern \"", __pattern.__name, "\" no longer exists in configuration file. ", self, " now in limbo");
            return;
        }
        
        __pattern = _pattern;
        
        __MigrateCommon();
        
        //Force an update of the blend weights
        __ApplyBlendFactor(true);
        
        var _i = 0;
        repeat(array_length(__childArray))
        {
            __childArray[_i].__Migrate();
            ++_i;
        }
    }
    
    static __Tick = function(_deltaTimeFactor)
    {
        if ((__shortestIndex >= array_length(__childArray)) || !__childArray[__shortestIndex].__IsPlaying())
        {
            if (VINYL_DEBUG_LEVEL >= 1) __VinylTrace("Shortest voice for ", self, " is no longer playing, returning to pool");
            __VINYL_RETURN_SELF_TO_POOL
        }
        else
        {
            if (__sync)
            {
                var _shortestPosition = __childArray[__shortestIndex].__PositionGet();
                if (_shortestPosition != __shortestPrevPosition)
                {
                    if (_shortestPosition < __shortestPrevPosition)
                    {
                        //We've looped!
                        if (VINYL_DEBUG_LEVEL >= 2) __VinylTrace(self, " shortest voice ", __childArray[__shortestIndex], " has looped, setting position for all other voices");
                        
                        var _i = 0;
                        repeat(array_length(__childArray))
                        {
                            var _voice = __childArray[_i];
                            _voice.__PositionSet(_shortestPosition);
                            ++_i;
                        }
                    }
                    
                    __shortestPrevPosition = _shortestPosition;
                }
            }
            
            __TickCommon(_deltaTimeFactor);
            
            if (__IsPlaying())
            {
                __ApplyBlendFactor();
                
                var _i = 0;
                repeat(array_length(__childArray))
                {
                    with(__childArray[_i])
                    {
                        __GainSet(other.__gainArray[_i]);
                        __Tick(_deltaTimeFactor);
                    }
                    
                    ++_i;
                }
            }
        }
    }
}
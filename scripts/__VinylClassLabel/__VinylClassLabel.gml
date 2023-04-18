/// @param name
/// @param parent
/// @param adHoc

function __VinylClassLabel(_name, _parent, _adHoc) constructor
{
    static __idToVoiceDict = __VinylGlobalData().__idToVoiceDict;
    
    __name   = _name;
    __parent = _parent;
    __adHoc  = _adHoc;
    
    
    
    static toString = function()
    {
        return "<label " + __name + ">";
    }
    
    #region Initialize
    
    static __Initialize = function(_labelData = {})
    {
        if (!is_struct(_labelData)) __VinylError("Error in ", self, "\nLabel data must be a struct");
        if (VINYL_CONFIG_VALIDATE_PROPERTIES) __VinylValidateStruct(_labelData, ["gain", "pitch", "transpose", "loop", "tag", "effect chain", "stack", "stack priority", "children"]);
        
        static _stackDict = __VinylGlobalData().__stackDict;
        
        //Unpack the definition data
        var _gain            = _labelData[$ "gain"          ] ?? (VINYL_CONFIG_DECIBEL_GAIN? 0 : 1);
        var _pitch           = _labelData[$ "pitch"         ] ?? (VINYL_CONFIG_PERCENTAGE_PITCH? 100 : 1);
        var _transpose       = _labelData[$ "transpose"     ];
        var _loop            = _labelData[$ "loop"          ] ?? undefined;
        var _persistent      = _labelData[$ "persistent"    ];
        var _stack           = _labelData[$ "stack"         ];
        var _stackPriority   = _labelData[$ "stack priority"] ?? 0;
        var _tagArray        = _labelData[$ "tag"           ] ?? _labelData[$ "tags"];
        var _effectChainName = _labelData[$ "effect chain"  ];
        
        if (VINYL_CONFIG_DECIBEL_GAIN) _gain = __VinylGainToAmplitude(_gain);
        if (VINYL_CONFIG_PERCENTAGE_PITCH) _pitch /= 100;
        
        //Sort out the gain
        var _knobGain = __VinylParseKnob(_gain, "gain", false, self);
        __configGainKnob = (_knobGain != undefined);
        __configGain     = _knobGain ?? _gain;
        if (!is_numeric(__configGain)) __VinylError("Error in ", self, "\n\"gain\" property must be a number or a knob");
        
        //Sort out the pitch
        var _knobPitch = __VinylParseKnob(_pitch, "pitch", true, self);
        __configPitchKnob = (_knobPitch != undefined);
        _pitch            = _knobPitch ?? _pitch;
        
        if (is_numeric(_pitch) && (_pitch > 0))
        {
            __configPitchLo = _pitch;
            __configPitchHi = _pitch;
        }
        else if (is_array(_pitch))
        {
            if (array_length(_pitch) != 2) __VinylError("Error in ", self, "\n\"pitch\" property array must have exactly two elements (length=", array_length(_pitch), ")");
            
            __configPitchLo = _pitch[0];
            __configPitchHi = _pitch[1];
            
            if (__configPitchLo > __configPitchHi)
            {
                __VinylTrace("Warning! Error in ", self, " \"pitch\" property. Low pitch (", __configPitchLo, ") is greater than high pitch (", __configPitchHi, ")");
                var _temp = __configPitchLo;
                __configPitchLo = __configPitchHi;
                __configPitchHi = _temp;
            }
        }
        else
        {
            __VinylError("Error in ", self, "\n\"pitch\" property must be either a number greater than zero, a two-element array, or a knob");
        }
        
        //Sort out the transposition
        var _knobTranspose = __VinylParseKnob(_transpose, "transpose", false, self);
        __configTranspose = _knobTranspose ?? _transpose;
        if (!is_numeric(__configTranspose) && !is_undefined(__configTranspose)) __VinylError("Error in ", self, "\n\"transpose\" property must be a number or a knob");
        
        //Sort out the stack
        if (is_undefined(_stack))
        {
            __stackName = _stack;
        }
        else if (is_string(_stack))
        {
            if (variable_struct_exists(_stackDict, _stack))
            {
                __stackName = _stack;
            }
            else
            {
                __VinylError("Error in ", self, "\nStack \"", _stack, "\" not found in config file");
            }
        }
        else
        {
            __VinylError("Error in ", self, "\n\"stack\" property must be a string");
        }
        
        if (is_numeric(_stackPriority))
        {
            __stackPriority = _stackPriority;
        }
        else
        {
            __VinylError("Error in ", self, "\n\"stack priority\" property must be a number");
        }
        
        //Sort out the loop state
        __configLoop = _loop;
        if (!is_bool(__configLoop) && !is_undefined(__configLoop)) __VinylError("Error in ", self, "\n\"loop\" property must be a boolean (<true> or <false>)");
        
        //Sort out the persistent state
        __configPersistent = _persistent;
        if (!is_bool(__configPersistent) && !is_undefined(__configPersistent)) __VinylError("Error in ", self, "\n\"persistent\" property must be a boolean (<true> or <false>)");
        
        //Convert the tag array into an array if necessary
        if (is_string(_tagArray)) _tagArray = [_tagArray];
        __tagArray = _tagArray;
        
        //Sort out the effect chain name
        __effectChainName = _effectChainName ?? ((__parent != undefined)? __parent.__effectChainName : undefined);
        
        //Set remainder of the state
        __topLevelArray = [];
        
        __gainLocal  = 1;
        __pitchLocal = 1;
        
        __gainTarget  = __gainLocal;
        __gainRate    = VINYL_DEFAULT_GAIN_RATE;
        __pitchTarget = __pitchLocal;
        __pitchRate   = VINYL_DEFAULT_PITCH_RATE;
        
        __gainOutput  = __gainLocal;
        __pitchOutput = __pitchLocal;
        
        if (VINYL_DEBUG_READ_CONFIG) __VinylTrace("Creating definition for ", self, ", gain=", __gainOutput, ", pitch=", __pitchOutput*__configPitchLo, " -> ", __pitchOutput*__configPitchHi);
    }
    
    static __Store = function()
    {
        var _labelDict  = __VinylGlobalData().__labelDict;
        var _labelArray = __VinylGlobalData().__labelArray;
        
        _labelDict[$ __name] = self;
        array_push(_labelArray, self);
    }
    
    #endregion
    
    
    
    #region Gain
    
    static __GainSet = function(_gain, _force = false)
    {
        if (VINYL_DEBUG_LEVEL >= 1)
        {
            __VinylTrace(self, " gain=", _gain);
        }
        
        if (!_force && __configGainKnob)
        {
            __VinylTrace(self, " gain is attached to a knob, cannot change gain manually");
            return;
        }
        
        __gainLocal  = _gain;
        __gainTarget = _gain;
    }
    
    static __GainGet = function()
    {
        return __gainLocal;
    }
    
    static __GainTargetSet = function(_targetGain, _rate)
    {
        if (VINYL_DEBUG_LEVEL >= 1)
        {
            __VinylTrace("Warning! ", self, " gain target=", _targetGain, ", rate=", _rate, "/s");
        }
        
        if (__configGainKnob)
        {
            __VinylTrace("Warning! ", self, " gain is attached to a knob, cannot set a target gain");
            return;
        }
        
        __gainTarget = _targetGain;
        __gainRate   = _rate;
    }
    
    static __GainTargetGet = function()
    {
        return __gainTarget;
    }
    
    static __GainOutputGet = function()
    {
        return __gainOutput;
    }
    
    #endregion
    
    
    
    #region Pitch
    
    static __PitchSet = function(_pitch, _force = false)
    {
        if (VINYL_DEBUG_LEVEL >= 1)
        {
            __VinylTrace(self, " pitch=", _pitch);
        }
        
        if (!_force && __configPitchKnob)
        {
            __VinylTrace("Warning! ", self, " pitch is attached to a knob, cannot change pitch manually");
            return;
        }
        
        __pitchLocal  = _pitch;
        __pitchTarget = _pitch;
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
        
        if (__configPitchKnob)
        {
            __VinylTrace("Warning! ", self, " pitch is attached to a knob, cannot set a target pitch");
            return;
        }
        
        __pitchTarget = _targetPitch;
        __pitchRate   = _rate;
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
    
    
    
    #region Playback
    
    static __Stop = function()
    {
        if (VINYL_DEBUG_LEVEL >= 1) __VinylTrace("Stopping ", array_length(__topLevelArray), " voices playing (", self, ")");
        
        //Go backwards because each Stop() command removes the voice from the array
        var _i = array_length(__topLevelArray)-1;
        repeat(array_length(__topLevelArray))
        {
            VinylStop(__topLevelArray[_i]);
            --_i;
        }
        
        array_resize(__topLevelArray, 0);
    }
    
    static __Pause = function()
    {
        if (VINYL_DEBUG_LEVEL >= 1) __VinylTrace("Pausing ", array_length(__topLevelArray), " voices playing (", self, ")");
        
        var _i = 0;
        repeat(array_length(__topLevelArray))
        {
            VinylPause(__topLevelArray[_i]);
            ++_i;
        }
    }
    
    static __Resume = function()
    {
        if (VINYL_DEBUG_LEVEL >= 1) __VinylTrace("Resuming ", array_length(__topLevelArray), " voices playing (", self, ")");
        
        var _i = 0;
        repeat(array_length(__topLevelArray))
        {
            VinylResume(__topLevelArray[_i]);
            ++_i;
        }
    }
    
    static __FadeOut = function(_rate)
    {
        if (VINYL_DEBUG_LEVEL >= 1) __VinylTrace("Fading out ", array_length(__topLevelArray), " voices (", self, ")");
        
        var _i = 0;
        repeat(array_length(__topLevelArray))
        {
            VinylFadeOut(__topLevelArray[_i], _rate);
            ++_i;
        }
    }
    
    #endregion
    
    
    
    #region Stop Callback
    
    static __StopCallbackSet = function(_callback, _data)
    {
        var _i = 0;
        repeat(array_length(__topLevelArray))
        {
            VinylStopCallbackSet(__topLevelArray[_i], _callback, _data);
            ++_i;
        }
    }
    
    #endregion
    
    
    
    #region Queue
    
    static __QueuePush = function(_asset, _dontRepeatLast)
    {
        var _i = 0;
        repeat(array_length(__topLevelArray))
        {
            if (VinylTypeGet(__topLevelArray[_i]) == "queue") VinylQueuePush(__topLevelArray[_i], _asset, _dontRepeatLast);
            ++_i;
        }
    }
    
    static __QueueBehaviorSet = function(_behavior)
    {
        var _i = 0;
        repeat(array_length(__topLevelArray))
        {
            if (VinylTypeGet(__topLevelArray[_i]) == "queue") VinylQueueBehaviorSet(__topLevelArray[_i], _behavior);
            ++_i;
        }
    }
    
    #endregion
    
    
    
    #region Multi
    
    static __MultiGainSet = function(_index, _gain)
    {
        var _i = 0;
        repeat(array_length(__topLevelArray))
        {
            if (VinylTypeGet(__topLevelArray[_i]) == "multi") VinylMultiGainSet(__topLevelArray[_i], _index, _gain);
            ++_i;
        }
    }
    
    static __MultiBlendSet = function(_blendFactor)
    {
        var _i = 0;
        repeat(array_length(__topLevelArray))
        {
            if (VinylTypeGet(__topLevelArray[_i]) == "multi") VinylMultiBlendSet(__topLevelArray[_i], _blendFactor);
            ++_i;
        }
    }
    
    static __MultiSyncSet = function(_state)
    {
        var _i = 0;
        repeat(array_length(__topLevelArray))
        {
            if (VinylTypeGet(__topLevelArray[_i]) == "multi") VinylMultiSyncSet(__topLevelArray[_i], _state);
            ++_i;
        }
    }
    
    #endregion
    
    
    
    static __CopyOldState = function(_oldLabel)
    {
        __gainLocal  = _oldLabel.__gainLocal;
        __pitchLocal = _oldLabel.__pitchLocal;
        
        __gainTarget  = _oldLabel.__gainTarget;
        __gainRate    = _oldLabel.__gainRate;
        __pitchTarget = _oldLabel.__pitchTarget;
        __pitchRate   = _oldLabel.__pitchRate;
        
        if (VINYL_DEBUG_READ_CONFIG)
        {
            __VinylTrace("Copying state to ", self, ":");
            __VinylTrace("    gain in=", __gainLocal, "/out=", __gainOutput, ", pitch in=", __pitchLocal, "/out=", __pitchOutput);
            __VinylTrace("    gain target=", __gainTarget, ", rate=", __gainRate, "/s");
            __VinylTrace("    pitch target=", __pitchTarget, ", rate=", __pitchRate, "/s");
        }
    }
    
    static __VoiceAdd = function(_id)
    {
        //Add this voice to each label's playing array
        //Playing voices are removed from labels inside the label's __Tick() method
        //  N.B. This has no protection for duplicate entries!
        array_push(__topLevelArray, _id);
    }
              
    static __VoiceRemove = function(_id)
    {
        static _closure = {
            __value: undefined,
        };
        
        static _function = method(_closure, function(_value)
        {
            return (__value != _value);
        });
        
        _closure.__value = _id;
        array_resize(__topLevelArray, array_filter_ext(__topLevelArray, _function));
    }
    
    static __LabelArrayAppend = function(_labelArray)
    {
        if (!array_contains(_labelArray, self)) array_push(_labelArray, self);
        if (__parent != undefined) __parent.__LabelArrayAppend(_labelArray);
    }
    
    static __Tick = function(_deltaTimeFactor)
    {
        //Update input values based on gain/pitch target
        __gainLocal  += clamp(__gainTarget  - __gainLocal,  -_deltaTimeFactor*__gainRate,  _deltaTimeFactor*__gainRate );
        __pitchLocal += clamp(__pitchTarget - __pitchLocal, -_deltaTimeFactor*__pitchRate, _deltaTimeFactor*__pitchRate);
        
        __gainOutput  = __gainLocal*__configGain;
        __pitchOutput = __pitchLocal;
    }
}
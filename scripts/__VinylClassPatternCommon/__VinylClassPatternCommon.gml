function __VinylClassPatternCommon()
{
    static __effectChainDict = __VinylGlobalData().__effectChainDict;
    
    static __Store = function()
    {
        var _patternDict  = __VinylGlobalData().__patternDict;
        var _patternArray = __VinylGlobalData().__patternArray;
        
        _patternDict[$ __name] = self;
        array_push(_patternArray, self);
    }
    
    static __Migrate = function()
    {
        if (__effectChainName == undefined)
        {
            var _j = 0;
            repeat(array_length(__labelArray))
            {
                var _labelStruct = __labelArray[_j];
                
                if (_labelStruct.__effectChainName != undefined)
                {
                    if (__effectChainName == undefined)
                    {
                        __effectChainName = _labelStruct.__effectChainName;
                    }
                    else if (_labelStruct.__effectChainName != __effectChainName)
                    {
                        __VinylTrace("Warning! ", self, " has conflicting effect chains (chosen = \"", __effectChainName, "\", conflict = \"", _labelStruct.__effectChainName, "\" from ", _labelStruct, ")");
                    }
                }
                
                ++_j;
            }
        
            if ((__effectChainName != undefined) && !variable_struct_exists(__effectChainDict, __effectChainName))
            {
                __VinylError("Effect chain \"", __effectChainName, "\" for ", self, " doesn't exist");
            }
        }
    }
    
    static __GainSet = function(_gain)
    {
        __gain = _gain;
    }
    
    static __PitchSet = function(_pitch)
    {
        __pitchLo = _pitch;
        __pitchHi = _pitch;
    }
    
    static __LoopGet = function()
    {
        if (__loop == undefined)
        {
            var _i = 0;
            repeat(array_length(__labelArray))
            {
                var _labelStruct = __labelArray[_i];
                if (_labelStruct.__configLoop == true) return true;
                ++_i;
            }
            
            return false;
        }
        
        return __loop;
    }
    
    static __InitializeAssetArray = function(_assetArray)
    {
        if (array_length(_assetArray) <= 0) __VinylError("Error in ", self, "\n", __patternType, "-type patterns must have at least one asset");
        
        __assetArray = _assetArray;
        
        //Convert any basic patterns into audio asset indexes
        var _i = 0;
        repeat(array_length(__assetArray))
        {
            var _asset = __assetArray[_i];
            
            if (is_struct(_asset))
            {
                //Generate an anonymous pattern
                var _patternName = __name + " > " + string(_i);
                __VInylPatternCreate(_patternName, _asset, false, true);
                _assetArray[@ _i] = _patternName;
            }
            else
            {
                if (is_string(_asset))
                {
                    if (asset_get_index(_asset) < 0) __VinylError("Error in ", self, " for \"assets\" property\nAsset \"", _asset, "\" not found in the project");
                    if (asset_get_type(_asset) != asset_sound) __VinylError("Error in ", self, " for \"assets\" property\nAsset \"", _asset, "\" not a sound asset");
                    _asset = asset_get_index(_asset);
                }
                
                if (!is_numeric(_asset)) __VinylError("Error in ", self, " for \"assets\" property\nAssets should be specified as an audio asset index or audio asset name (datatype=", typeof(_asset), ")");
                if (!audio_exists(_asset)) __VinylError("Error in ", self, " for \"assets\" property\nAudio asset with index ", _asset, " not found");
                
                __assetArray[@ _i] = _asset;
            }
            
            ++_i;
        }
    }
    
    static __InitializeGain = function(_gain)
    {
        var _knobValue = __VinylParseKnob(_gain, "gain", false, self);
        __gain = _knobValue ?? _gain;
        if (!is_numeric(__gain)) __VinylError("Error in ", self, "\n\"gain\" property must be a number or a knob");
    }
    
    static __InitializePitch = function(_pitch)
    {
        var _knobValue = __VinylParseKnob(_pitch, "pitch", true, self);
        _pitch = _knobValue ?? _pitch;
        
        if (is_numeric(_pitch) && (_pitch >= 0))
        {
            __pitchLo = _pitch;
            __pitchHi = _pitch;
        }
        else if (is_array(_pitch))
        {
            if (array_length(_pitch) != 2) __VinylError("Error in ", self, "\n\"pitch\" property array must have exactly two elements (length=", array_length(_pitch), ")");
            
            __pitchLo = _pitch[0];
            __pitchHi = _pitch[1];
            
            if (__pitchLo > __pitchHi)
            {
                __VinylTrace("Warning! Error in ", self, " \"pitch\" property. Low pitch (", __pitchLo, ") is greater than high pitch (", __pitchHi, ")");
                var _temp = __pitchLo;
                __pitchLo = __pitchHi;
                __pitchHi = _temp;
            }
        }
        else
        {
            __VinylError("Error in ", self, "\n\"pitch\" property must be a number greater than zero, a two-element array, or a knob");
        }
    }
    
    static __InitializeTranspose = function(_transpose)
    {
        var _knobValue = __VinylParseKnob(_transpose, "transpose", false, self);
        __transpose = _knobValue ?? _transpose;
        if (!is_numeric(__transpose) && !is_undefined(__transpose)) __VinylError("Error in ", self, "\n\"transpose\" property must be a number or a knob");
    }
    
    static __InitializeLoop = function(_loop)
    {
        __loop = _loop;
        if (!is_bool(__loop) && !is_undefined(__loop))__VinylError("Error in ", self, "\n\"loop\" property must be either <true> or <false>");
    }
    
    static __InitializePersistent = function(_persistent)
    {
        __persistent = _persistent;
        if (!is_bool(__persistent) && !is_undefined(__persistent))__VinylError("Error in ", self, "\n\"persistent\" property must be either <true> or <false>");
    }
    
    static __InitializeStack = function(_stack, _stackPriority)
    {
        static _stackDict = __VinylGlobalData().__stackDict;
        
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
    }
    
    static __InitializeEffectChain = function(_effectChainName)
    {
        if (is_string(_effectChainName) || is_undefined(_effectChainName))
        {
            __effectChainName = _effectChainName;
        }
        else
        {
            __VinylError("Error in ", self, "\n\"effect chain\" property must be a name (as a string)");
        }
    }
    
    static __InitializeLoopPoints = function(_loopPoints)
    {
        if (is_array(_loopPoints))
        {
             if (array_length(_loopPoints) != 2) __VinylError("Error in audio asset ", self, "\nLoop point array must have exactly two elements (length=", array_length(_loopPoints), ")");
             if (!is_numeric(_loopPoints[0])) __VinylError("Error in ", self, "\nLoop point array elements must be numbers (index 0 datatype=", typeof(_loopPoints[0]), ")");
             if (!is_numeric(_loopPoints[1])) __VinylError("Error in ", self, "\nLoop point array elements must be numbers (index 1 datatype=", typeof(_loopPoints[1]), ")");
            
             __loopPoints = _loopPoints;
        }
        else if (is_undefined(_loopPoints))
        {
            __loopPoints = _loopPoints;
        }
        else
        {
            __VinylError("Error in ", self, "\nLoop points must be a two-element array");
        }
    }
    
    static __InitializeLabelArray = function(_labelNameArray)
    {
        var _labelDict = __VinylGlobalData().__labelDict;
        
        __labelArray = [];
        
        //Process label string to extract each label name
        if (is_string(_labelNameArray)) _labelNameArray = [_labelNameArray];
        
        if (is_array(_labelNameArray))
        {
            var _i = 0;
            repeat(array_length(_labelNameArray))
            {
                var _labelName =_labelNameArray[_i];
                
                var _labelData = _labelDict[$ _labelName];
                if (_labelData == undefined)
                {
                    __VinylTrace("Warning! Label \"", _labelName, "\" could not be found (", self, ")");
                }
                else
                {
                    _labelData.__LabelArrayAppend(__labelArray);
                }
                
                ++_i;
            }
        }
    }
}
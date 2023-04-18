/// @param name
/// @param adHoc
/// @param child

function __VinylClassPatternShuffle(_name, _adHoc, _child) : __VinylClassPatternCommon() constructor
{
    static __patternType = "shuffle";
    
    __name  = _name;
    __adHoc = _adHoc;
    __child = _child;
    
    static toString = function()
    {
        return "<shuffle " + string(__name) + ">";
    }
    
    static __Initialize = function(_patternData = {})
    {
        if (!is_struct(_patternData)) __VinylError("Error in ", self, "\nPattern data must be a struct");
        if (VINYL_CONFIG_VALIDATE_PROPERTIES) __VinylValidateStruct(_patternData, ["type", "asset", "assets", "gain", "pitch", "transpose", "loop", "stack", "stack priority", "persistent", "effect chain", "label", "labels"]);
        
        //Set the gain/pitch state from the provided struct
        var _assetArray      = _patternData[$ "assets"        ] ?? (_patternData[$ "asset"] ?? []);
        var _gain            = _patternData[$ "gain"          ] ?? (VINYL_CONFIG_DECIBEL_GAIN? 0 : 1);
        var _pitch           = _patternData[$ "pitch"         ] ?? (VINYL_CONFIG_PERCENTAGE_PITCH? 100 : 1);
        var _transpose       = _patternData[$ "transpose"     ];
        var _loop            = _patternData[$ "loop"          ];
        var _persistent      = _patternData[$ "persistent"    ];
        var _stack           = _patternData[$ "stack"         ];
        var _stackPriority   = _patternData[$ "stack priority"] ?? 0;
        var _effectChainName = _patternData[$ "effect chain"  ] ?? _patternData[$ "effect"];
        var _labelNameArray  = _patternData[$ "label"         ] ?? _patternData[$ "labels"];
        
        if (VINYL_CONFIG_DECIBEL_GAIN) _gain = __VinylGainToAmplitude(_gain);
        if (VINYL_CONFIG_PERCENTAGE_PITCH) _pitch /= 100;
        
        __InitializeAssetArray(_assetArray);
        __InitializeGain(_gain);
        __InitializePitch(_pitch);
        __InitializeTranspose(_transpose);
        __InitializeLoop(_loop);
        __InitializePersistent(_persistent);
        __InitializeStack(_stack, _stackPriority);
        __InitializeEffectChain(_effectChainName);
        __InitializeLabelArray(_labelNameArray);
        
        //Set up tracking for shuffle pattern
        __currentIndex = 0;
        __currentSize  = ceil(array_length(__assetArray)/3);
        __currentArray = array_create(__currentSize);
        
        //Initialize the currently-playing array with a random sample from the overall pattern array
        __VinylArrayShuffle(__assetArray);
        array_copy(__currentArray, 0, __assetArray, 0, __currentSize);
        array_delete(__assetArray, 0, __currentSize);
        
        if (VINYL_DEBUG_READ_CONFIG) __VinylTrace("Created ", self, ", gain=", __gain, ", pitch=", __pitchLo, " -> ", __pitchHi, ", effect chain=", __effectChainName, ", label=", __VinylDebugLabelNames(__labelArray), ", persistent=", __persistent);
    }
    
    static __PopPattern = function()
    {
        if (__currentIndex >= __currentSize)
        {
            //Copy the currently playing array back to the main pattern array
            array_copy(__assetArray, array_length(__assetArray), __currentArray, 0, __currentSize);
            
            //Copy the next set of random patterns over to the current array, then remove them from the pattern array
            array_copy(__currentArray, 0, __assetArray, 0, __currentSize);
            array_delete(__assetArray, 0, __currentSize);
            
            //Reshuffle
            __VinylArrayShuffle(__assetArray);
            
            __currentIndex = 0;
        }
        
        var _pattern = __currentArray[__currentIndex];
        ++__currentIndex;
        return _pattern;
    }
    
    static __Play = function(_patternTop, _parentVoice, _vinylEmitter, _sound_UNUSED, _loop = undefined, _gain = 1, _pitch = 1, _pan = undefined)
    {
        var _pattern = __PopPattern();
        return __VinylPatternGet(_pattern).__Play(_patternTop, _parentVoice, _vinylEmitter, _pattern, _loop, _gain, _pitch, _pan);
    }
    
    static __PlaySimple = function(_sound_UNUSED, _gain = 1, _pitch = 1)
    {
        var _pattern = __PopPattern();
        return __VinylPatternGet(_pattern).__PlaySimple(_pattern, _gain, _pitch); //TODO - Inherit properly
    }
}
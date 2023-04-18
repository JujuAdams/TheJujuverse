/// @param name
/// @param adHoc
/// @param child

function __VinylClassPatternQueue(_name, _adHoc, _child) : __VinylClassPatternCommon() constructor
{
    static __patternType = "queue";
    static __pool = __VinylGlobalData().__poolQueue;
    
    __name  = _name;
    __adHoc = _adHoc;
    __child = _child;
    
    static toString = function()
    {
        return "<queue " + string(__name) + ">";
    }
    
    static __Initialize = function(_patternData = {})
    {
        if (!is_struct(_patternData)) __VinylError("Error in ", self, "\nPattern data must be a struct");
        if (VINYL_CONFIG_VALIDATE_PROPERTIES) __VinylValidateStruct(_patternData, ["type", "asset", "assets", "gain", "pitch", "transpose", "loop", "effect chain", "stack", "stack priority", "persistent", "label", "labels", "behavior", "behaviour"]);
        
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
        var _behavior        = _patternData[$ "behavior"      ] ?? (_patternData[$ "behavior"] ?? VINYL_DEFAULT_QUEUE_BEHAVIOR);
        
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
        
        //Set the pattern's behavior
        if (!is_numeric(_behavior) || ((_behavior != 0) && (_behavior != 1) && (_behavior != 2)))
        {
            __VinylError("Error in pattern ", self, "\nBehavior must be a number equal to 0, 1, or 2\nSee VinylQueueBehaviorSet() for more information");
        }
        
        __behavior = _behavior;
        
        if (VINYL_DEBUG_READ_CONFIG) __VinylTrace("Created ", self, ", gain=", __gain, ", pitch=", __pitchLo, " -> ", __pitchHi, ", effect chain=", __effectChainName, ", label=", __VinylDebugLabelNames(__labelArray), ", persistent=", __persistent);
    }
    
    static __Play = function(_patternTop, _parentVoice, _vinylEmitter, _sound_UNUSED, _loop = undefined, _gain = 1, _pitch = 1, _pan = undefined)
    {
        var _voice = __pool.__Depool();
        _voice.__Instantiate(_patternTop, self, _parentVoice, _vinylEmitter, __assetArray, _loop, _gain, _pitch, _pan);
        return _voice;
    }
    
    static __PlaySimple = function(_sound, _gain = 1, _pitch = 1)
    {
        __VinylError("Cannot use VinylPlaySimple() with a queue pattern");
    }
}
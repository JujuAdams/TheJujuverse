/// @param name
/// @param adHoc
/// @param child

function __VinylClassPatternMulti(_name, _adHoc, _child) : __VinylClassPatternCommon() constructor
{
    static __patternType   = "multi";
    static __pool          = __VinylGlobalData().__poolMulti;
    static __animCurveDict = __VinylGlobalData().__animCurveDict;
    
    __name  = _name;
    __adHoc = _adHoc;
    __child = _child;
    
    static toString = function()
    {
        return "<multi " + string(__name) + ">";
    }
    
    static __Initialize = function(_patternData = {})
    {
        if (!is_struct(_patternData)) __VinylError("Error in ", self, "\nPattern data must be a struct");
        if (VINYL_CONFIG_VALIDATE_PROPERTIES) __VinylValidateStruct(_patternData, ["type", "asset", "assets", "gain", "pitch", "transpose", "loop", "stack", "stack priority", "persistent", "effect chain", "label", "labels", "blend curve", "blend", "blend normalise", "sync"]);
        
        //Set the gain/pitch state from the provided struct
        var _assetArray      = _patternData[$ "assets"         ] ?? (_patternData[$ "asset"] ?? []);
        var _gain            = _patternData[$ "gain"           ] ?? (VINYL_CONFIG_DECIBEL_GAIN? 0 : 1);
        var _pitch           = _patternData[$ "pitch"          ] ?? (VINYL_CONFIG_PERCENTAGE_PITCH? 100 : 1);
        var _transpose       = _patternData[$ "transpose"      ];
        var _loop            = _patternData[$ "loop"           ];
        var _persistent      = _patternData[$ "persistent"     ];
        var _stack           = _patternData[$ "stack"          ];
        var _stackPriority   = _patternData[$ "stack priority" ] ?? 0;
        var _effectChainName = _patternData[$ "effect chain"   ] ?? _patternData[$ "effect"];
        var _labelNameArray  = _patternData[$ "label"          ] ?? _patternData[$ "labels"];
        var _blend           = _patternData[$ "blend"          ] ?? VINYL_DEFAULT_MULTI_BLEND;
        var _blendCurveName  = _patternData[$ "blend curve"    ];
        var _sync            = _patternData[$ "sync"           ] ?? VINYL_DEFAULT_MULTI_SYNC;
        
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
        
        //Find a blend curve to track
        __blendCurve = undefined;
        if (is_string(_blendCurveName))
        {
            if ((asset_get_index(_blendCurveName) >= 0) && (asset_get_type(_blendCurveName) == asset_animationcurve))
            {
                __blendCurve = __VinylAnimCurveEnsure(_blendCurveName);
            }
            else
            {
                __VinylError("Error in ", self, "\n\Animation curve \"", _blendCurveName, "\" not recognised");
            }
        }
        else if (_blendCurveName != undefined)
        {
            __VinylError("Error in ", self, "\n\"blend curve\" property must be the name of an animation curve as a string");
        }
        
        //Set the blend state
        var _knobBlend = __VinylParseKnob(_blend, "blend", false, self);
        __blendFactorLocal = _knobBlend ?? _blend;
        if (!is_numeric(__blendFactorLocal) && !is_undefined(__blendFactorLocal)) __VinylError("Error in ", self, "\n\"blend\" property must be a number or a knob");
        
        //Set the sync state
        __sync = _sync;
        if (!is_bool(__sync)) __VinylError("Error in pattern ", self, "\n\"sync\" must be a boolean (<true> or <false>)");
        
        if (VINYL_DEBUG_READ_CONFIG) __VinylTrace("Created ", self, ", gain=", __gain, ", pitch=", __pitchLo, " -> ", __pitchHi, ", effect chain=", __effectChainName, ", label=", __VinylDebugLabelNames(__labelArray), ", persistent=", __persistent);
    }
    
    static __MultiBlendSet = function(_blend)
    {
        __blendFactorLocal = _blend;
    }
    
    static __Play = function(_patternTop, _parentVoice, _vinylEmitter, _sound, _loop = undefined, _gain = 1, _pitch = 1, _pan = undefined)
    {
        var _voice = __pool.__Depool();
        _voice.__Instantiate(_patternTop, self, _parentVoice, _vinylEmitter, __assetArray, _loop, _gain, _pitch, _pan);
        return _voice;
    }
    
    static __PlaySimple = function(_sound, _gain = 1, _pitch = 1)
    {
        __VinylError("Cannot use VinylPlaySimple() with a multi pattern");
    }
}

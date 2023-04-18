/// @param name
/// @param adHoc
/// @param child

function __VinylClassPatternBasic(_name, _adHoc, _child) : __VinylClassPatternCommon() constructor
{
    static __patternType = "basic";
    static __pool = __VinylGlobalData().__poolBasic;
    
    __name  = _name;
    __adHoc = _adHoc;
    __child = _child;
    __asset = undefined;
    
    static toString = function()
    {
        return (__asset == undefined)? "<basic ???>" : "<basic " + audio_get_name(__asset) + ">";
    }
    
    static __Initialize = function(_patternData = {})
    {
        if (!is_struct(_patternData)) __VinylError("Error in ", self, "\nPattern data must be a struct");
        if (VINYL_CONFIG_VALIDATE_PROPERTIES) __VinylValidateStruct(_patternData, ["type", "asset", "assets", "gain", "pitch", "transpose", "loop", "effect chain", "stack", "stack priority", "persistent", "label", "labels"]);
        
        var _asset           = _patternData[$ "asset"         ] ?? _patternData[$ "assets"];
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
        
        
        
        //Sort out the asset
        if (is_string(_asset))
        {
            if (asset_get_index(_asset) < 0) __VinylError("Error in ", self, " for \"asset\" property\nAsset \"", _asset, "\" not found in the project");
            if (asset_get_type(_asset) != asset_sound) __VinylError("Error in ", self, " for \"asset\" property\nAsset \"", _asset, "\" not a sound asset");
            _asset = asset_get_index(_asset);
        }
        
        if (!is_numeric(_asset)) __VinylError("Error in ", self, " for \"asset\" property\nAsset should be specified as an audio asset index or audio asset name (datatype=", typeof(_asset), ")");
        if (!audio_exists(_asset)) __VinylError("Error in ", self, " for \"asset\" property\nAudio asset with index ", _asset, " not found");
        
        __asset = _asset;
        
        
        
        __InitializeGain(_gain);
        __InitializePitch(_pitch);
        __InitializeTranspose(_transpose);
        __InitializeLoop(_loop);
        __InitializePersistent(_persistent);
        __InitializeStack(_stack, _stackPriority);
        __InitializeEffectChain(_effectChainName);
        __InitializeLabelArray(_labelNameArray);
        
        if (VINYL_DEBUG_READ_CONFIG) __VinylTrace("Created ", self, ", gain=", __gain, ", pitch=", __pitchLo, " -> ", __pitchHi, ", effect chain=", __effectChainName, ", label=", __VinylDebugLabelNames(__labelArray), ", persistent=", __persistent);
    }
    
    static __Play = function(_patternTop, _parentVoice, _vinylEmitter, _sound_UNUSED, _loop = undefined, _gain = 1, _pitch = 1, _pan = undefined)
    {
        var _voice = __pool.__Depool();
        _voice.__Instantiate(_patternTop, self, _parentVoice, _vinylEmitter, __asset, _loop, _gain, _pitch, _pan);
        return _voice;
    }
    
    static __PlaySimple = function(_sound_UNUSED, _gain = 1, _pitch = 1)
    {
        return __VinylPatternGet(__asset).__PlaySimple(__asset, _gain*__gain, _pitch*mean(__pitchLo, __pitchHi)); //TODO - Inherit properly
    }
}
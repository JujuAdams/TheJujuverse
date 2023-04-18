/// @param name
/// @param adHoc
/// @param child
/// @param asset

function __VinylClassPatternAsset(_name, _adHoc, _child, _asset) : __VinylClassPatternCommon() constructor
{
    static __patternType = "asset";
    static __pool = __VinylGlobalData().__poolAsset;
    
    __name  = _name;
    __adHoc = _adHoc;
    __child = _child;
    __asset = _asset;
    
    static toString = function()
    {
        return "<asset " + audio_get_name(__asset) + ">";
    }
    
    static __StoreAsset = function()
    {
        //Special case to add assets by name as well as by index (if VINYL_ALLOW_ASSET_REFERENCE_BY_STRING is <true>)
        
        var _patternDict  = __VinylGlobalData().__patternDict;
        var _patternArray = __VinylGlobalData().__patternArray;
        
        _patternDict[$ __name] = self;
        if (VINYL_ALLOW_ASSET_REFERENCE_BY_STRING) _patternDict[$ audio_get_name(__asset)] = self;
        array_push(_patternArray, self);
    }
    
    static __Initialize = function(_patternData = {})
    {
        if (!is_struct(_patternData)) __VinylError("Error in ", self, "\nPattern data must be a struct");
        if (VINYL_CONFIG_VALIDATE_PROPERTIES) __VinylValidateStruct(_patternData, ["gain", "pitch", "transpose", "bpm", "loop", "effect chain", "stack", "stack priority", "persistent", "label", "labels", "loop point", "loop points"]);
        
        var _gain            = _patternData[$ "gain"          ] ?? (VINYL_CONFIG_DECIBEL_GAIN? 0 : 1);
        var _pitch           = _patternData[$ "pitch"         ] ?? (VINYL_CONFIG_PERCENTAGE_PITCH? 100 : 1);
        var _transpose       = _patternData[$ "transpose"     ];
        var _bpm             = _patternData[$ "bpm"           ] ?? VINYL_DEFAULT_BPM;
        var _loop            = _patternData[$ "loop"          ];
        var _persistent      = _patternData[$ "persistent"    ];
        var _stack           = _patternData[$ "stack"         ];
        var _stackPriority   = _patternData[$ "stack priority"] ?? 0;
        var _effectChainName = _patternData[$ "effect chain"  ] ?? _patternData[$ "effect"];
        var _loopPoints      = _patternData[$ "loop points"   ] ?? _patternData[$ "loop point"];
        var _labelNameArray  = _patternData[$ "label"         ] ?? _patternData[$ "labels"];
        
        if (VINYL_CONFIG_DECIBEL_GAIN) _gain = __VinylGainToAmplitude(_gain);
        if (VINYL_CONFIG_PERCENTAGE_PITCH) _pitch /= 100;
        
        
        
        //Sort out the BPM
        if (!is_numeric(_bpm) || (_bpm <= 0)) __VinylError("Error in ", self, "\n\"bpm\" property should be a number greater than 0 (datatype=", typeof(_bpm), ")");
        __bpm = _bpm;
        
        
        
        __InitializeGain(_gain);
        __InitializePitch(_pitch);
        __InitializeTranspose(_transpose);
        __InitializeLoop(_loop);
        __InitializePersistent(_persistent);
        __InitializeStack(_stack, _stackPriority);
        __InitializeEffectChain(_effectChainName);
        __InitializeLoopPoints(_loopPoints);
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
        return __VinylPlaySimple(__asset, _gain*__gain, _pitch*__pitchLo, _pitch*__pitchHi, __labelArray, __effectChainName);
    }
}

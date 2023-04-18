function __VinylClassPanEmitter() constructor
{
    static __globalData = __VinylGlobalData();
    static __effectChainDict = __globalData.__effectChainDict;
    
    
    
    __id   = undefined;
    __pool = undefined;
    
    audio_falloff_set_model(audio_falloff_none);
    __emitter = audio_emitter_create();
    audio_emitter_falloff(__emitter, 1, 1, 1);
    audio_falloff_set_model(__VINYL_FALLOFF_MODEL);
    
    __StateReset();
    
    
    
    static toString = function()
    {
        return "<pan emitter " + string(__id) + ">";
    }
    
    static __StateReset = function()
    {
        if ((VINYL_DEBUG_LEVEL >= 2) && (__id != undefined)) __VinylTrace("Resetting state for ", self);
        
        __pan = 0;
        
        audio_emitter_bus(__emitter, audio_bus_main);
        
        __UpdatePosition();
    }
    
    static __GetEmitter = function()
    {
        return __emitter;
    }
    
    static __Pan = function(_pan)
    {
        _pan = clamp(_pan, -1, 1);
        
        if (_pan != __pan)
        {
            __pan = _pan;
            __UpdatePosition();
        }
    }
    
    static __Bus = function(_effectChainName)
    {
        var _effectChainStruct = __effectChainDict[$ _effectChainName];
        audio_emitter_bus(__emitter, (_effectChainStruct == undefined)? audio_bus_main : _effectChainStruct.__bus);
    }
    
    static __VoiceAdd = function(_id)
    {
        //Do nothing!
    }
    
    static __VoiceRemove = function(_id)
    {
        //Do nothing!
    }
    
    static __DepoolCallback = function()
    {
        if (VINYL_DEBUG_LEVEL >= 1) __VinylTrace(self, " hosting emitter ", __emitter);
    }
    
    static __PoolCallback = function()
    {
        __StateReset();
    }
    
    static __UpdatePosition = function()
    {
        audio_emitter_position(__emitter, __globalData.__listenerX + __pan, __globalData.__listenerY, 0);
    }
}
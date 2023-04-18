function __VinylClassVoiceQueue() : __VinylClassVoiceCommon() constructor
{
    __StateReset();
    
    static __patternType = "queue";
    
    static toString = function()
    {
        if (__pattern == undefined)
        {
            return "<queue " + string(__id) + ">";
        }
        else
        {
            return "<queue " + string(__id) + " " + string(__pattern.__name) + ">";
        }
    }
    
    static __StateReset = function()
    {
        if ((VINYL_DEBUG_LEVEL >= 2) && (__id != undefined)) __VinylTrace("Resetting state for ", self);
        
        __StateResetCommon();
        
        __index      = 0;
        __assetArray = [];
        __behavior   = 0;
    }
    
    
    
    #region Queue
    
    static __QueuePush = function(_asset, _dontRepeatLast)
    {
        if (_dontRepeatLast && (array_length(__assetArray) > 0) && (__assetArray[array_length(__assetArray)-1] == _asset)) return;
        array_push(__assetArray, _asset);
    }
    
    static __QueueBehaviorSet = function(_behavior)
    {
        __behavior = _behavior;
    }
    
    static __QueueBehaviorGet = function()
    {
        return __behavior;
    }
    
    #endregion
    
    
    
    static __Instantiate = function(_patternTop, _pattern, _parentVoice, _vinylEmitter, _assetArray, _loop, _gain, _pitch, _pan)
    {
        __index = 0;
        
        __StateSetCommon(_patternTop, _pattern, _parentVoice, _vinylEmitter, _loop, _gain, _pitch, _pan);
        __behavior = __pattern.__behavior;
        
        //Make a local copy of the input asset array
        __assetArray = array_create(array_length(_assetArray), undefined);
        array_copy(__assetArray, 0, _assetArray, 0, array_length(_assetArray));
        
        if (array_length(__assetArray) > 0)
        {
            var _asset = __assetArray[__index];
            __child = __VinylPatternGet(_asset).__Play(_patternTop, self, __initialEmitter, _asset, __loopLocal, 1, 1, __pan);
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
        
        if (__child != undefined) __child.__Migrate();
    }
    
    static __Tick = function(_deltaTimeFactor)
    {
        if ((__child == undefined) || __child.__WillStop() || !__child.__IsPlaying())
        {
            //Ensure that the child has depooled
            if (__child != undefined)
            {
                if (__child.__WillStop()) __child.__Stop();
                __child.__Tick(0);
            }
            
            if (__behavior == 0) //Play the queue in its entirety once, popping assets off the queue as they finish
            {
                array_delete(__assetArray, __index, 1);
                
                if (array_length(__assetArray) <= 0)
                {
                    if (VINYL_DEBUG_LEVEL >= 1) __VinylTrace(self, " asset queue is empty, returning to pool");
                    __VINYL_RETURN_SELF_TO_POOL
                    return;
                }
                
                __index = __index mod array_length(__assetArray);
            }
            else if (__behavior == 1) //Repeat the queue from the start once complete
            {
                if (array_length(__assetArray) <= 0)
                {
                    if (VINYL_DEBUG_LEVEL >= 1) __VinylTrace(self, " asset queue is empty, returning to pool");
                    __VINYL_RETURN_SELF_TO_POOL
                    return;
                }
                
                __index = (__index + 1) mod array_length(__assetArray);
            }
            else if (__behavior == 2) //Repeat the last asset in the queue (popping assets once finished)
            {
                if (array_length(__assetArray) > 1)
                {
                    array_delete(__assetArray, __index, 1);
                    __index = __index mod array_length(__assetArray);
                }
            }
            
            var _asset = __assetArray[__index];
            __child = __VinylPatternGet(_asset).__Play(__patternTop, self, __initialEmitter, _asset, __loopLocal, 1, 1, __pan);
        }
        else
        {
            __TickCommon(_deltaTimeFactor);
            
            if (__child != undefined) //Child voice can be destroyed in __TickCommon()
            {
                __child.__Tick(_deltaTimeFactor);
            }
        }
    }
}
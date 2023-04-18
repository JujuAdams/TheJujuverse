function __VinylClassEmitterRef() constructor
{
    static __emitterRefArray = __VinylGlobalData().__emitterRefArray;
    static __pool            = __VinylGlobalData().__poolEmitter;
    
    array_push(__emitterRefArray, weak_ref_create(self));
    
    __emitter = __pool.__Depool();
    
    //We check against this when ticking emitters to determine if an emitter reference has been lost
    __emitter.__reference = weak_ref_create(self);
    
    static __VoiceAdd = function(_id)
    {
        if (__emitter != undefined) __emitter.__VoiceAdd(_id);
        return self;
    }
    
    static __VoiceRemove = function(_id)
    {
        if (__emitter != undefined) __emitter.__VoiceRemove(_id);
        return self;
    }
    
    static __GetEmitter = function()
    {
        return (__emitter == undefined)? undefined : __emitter.__emitter;
    }
    
    static __FalloffSet = function(_min, _max, _factor = 1)
    {
        if (__emitter != undefined) __emitter.__FalloffSet(_min, _max, _factor);
        return self;
    }
    
    static __Point = function(_x, _y)
    {
        if (__emitter != undefined) __emitter.__Point(_x, _y);
        return self;
    }
    
    static __Circle = function(_x, _y, _radius)
    {
        if (__emitter != undefined) __emitter.__Circle(_x, _y, _radius);
        return self;
    }
    
    static __Rectangle = function(_left, _top, _right, _bottom)
    {
        if (__emitter != undefined) __emitter.__Rectangle(_left, _top, _right, _bottom);
        return self;
    }
    
    static __Polyline = function(_radius, _pointArray)
    {
        if (__emitter != undefined) __emitter.__Polyline(_radius, _pointArray);
        return self;
    }
    
    static __Polygon = function(_radius, _pointArray)
    {
        if (__emitter != undefined) __emitter.__Polygon(_radius, _pointArray);
        return self;
    }
    
    static __PositionSet = function(_x, _y)
    {
        if (__emitter != undefined) __emitter.__PositionSet(_x, _y);
        return self;
    }
    
    static __PositionGet = function()
    {
        return (__emitter == undefined)? undefined : __emitter.__PositionGet();
    }
    
    static __Destroy = function()
    {
        //If we're being deliberately destroyed, return our emitter to the pool immediately
        if (__emitter != undefined)
        {
            with(__emitter)
            {
                if (VINYL_DEBUG_LEVEL >= 1) __VinylTrace(self, " destroyed");
                __VINYL_RETURN_SELF_TO_POOL
            }
            
            __emitter = undefined;
        }
    }
    
    static __DebugDraw = function()
    {
        if (__emitter != undefined) __emitter.__DebugDraw();
    }
    
    static __ManagePosition = function()
    {
        if (__emitter != undefined) __emitter.__ManagePosition();
    }
    
    static __Tick = function(_deltaTimeFactor)
    {
        if (__emitter != undefined) __emitter.__Tick(_deltaTimeFactor);
    }
    
    static toString = function()
    {
        return string(__emitter);
    }
}
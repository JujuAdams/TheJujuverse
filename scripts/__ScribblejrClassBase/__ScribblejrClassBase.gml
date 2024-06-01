function __ScribblejrClassBase() constructor
{
    static toString = function()
    {
        return __key;
    }
    
    static __Bake = function()
    {
        if (__fontIsDynamic) return; //Don't bake dynamic fonts
        while(not __BakeVertexBuffer()) __BakeVertexBuffer();
    }
    
    static __BakeVertexBufferTimed = function()
    {
        if (__fontIsDynamic) return; //Don't bake dynamic fonts
        if (_system.__budgetUsed >= _system.__budget) return; //Don't exceed the baking budget
        
        var _timer = get_timer();
        __BakeVertexBuffer();
        _system.__budgetUsed += get_timer() - _timer;
    }
    
    static __BakeVertexBuffer = function()
    {
        if (__fontIsDynamic) return true; //Don't bake dynamic fonts
        if (__vertexBaker == undefined) return true;
        
        if (__vertexBaker.__tickMethod())
        {
            if (SCRIBBLEJR_VERBOSE) __ScribblejrTrace("Compiled ", self);
            __vertexBuffer = __vertexBaker.__vertexBuffer;
            Draw = ScribblejrCacheFontInfo(__font).sdfEnabled? __DrawVertexBufferSDF : __DrawVertexBuffer;
            __vertexBaker = undefined;
            
            return true;
        }
        
        return false;
    }
    
    static __Destroy = function()
    {
        if (__vertexBaker != undefined)
        {
            __vertexBaker.__Destroy();
            __vertexBaker = undefined;
        }
        
        if (__vertexBuffer != undefined)
        {
            vertex_delete_buffer(__vertexBuffer);
            __vertexBuffer = undefined;
        }
    }
}
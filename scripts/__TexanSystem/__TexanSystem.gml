// Feather disable all

#macro __TEXAN_VERSION  "4.0.0"
#macro __TEXAN_DATE     "2024-05-06"

__TexanInitialize();

function __TexanInitialize()
{
    static _global = undefined;
    if (_global != undefined) return _global;
    
    _global = {};
    if (GM_build_type == "run") global.Texan = _global;
    
    __TexanTrace("Welcome to Texan by Juju Adams! This is version ", __TEXAN_VERSION, ", ", __TEXAN_DATE);
    
    with(_global)
    {
        __complete                = false;
        __flushArray              = [];
        __fetchArray              = [];
        __fetchedArray            = [];
        __alwaysFetchArray        = [];
        __textureGroupArray       = texturegroup_get_names();
        __textureGroupDynamicDict = {};
        
        texture_debug_messages(TEXAN_GM_DEBUG_LEVEL);
        
        //Add texture groups to our internal array
        var _array = __textureGroupArray;
        var _i = 0;
        repeat(array_length(_array))
        {
            var _textureGroup = _array[_i];
            if (texturegroup_get_status(_textureGroup) == texturegroup_status_unloaded)
            {
                if (TEXAN_DEBUG_LEVEL >= 2) __TexanTrace("\"", _textureGroup, "\" is unloaded on boot, presuming it is a dynamic texture group");
                __textureGroupDynamicDict[$ _textureGroup] = true;
            }
            
            ++_i;
        }
        
        //Add always-fetch textures to our internal array
        var _dict = {};
        var _array = TEXAN_ALWAYS_FETCH;
        var _i = 0;
        repeat(array_length(_array))
        {
            var _textureGroup = _array[_i];
            if (not variable_struct_exists(_dict, _textureGroup))
            {
                if (TEXAN_DEBUG_LEVEL >= 2) __TexanTrace("Texan: Always fetching \"", _textureGroup, "\"");
                array_push(__alwaysFetchArray, _textureGroup);
                TexanFetch(_textureGroup);
            }
            
            ++_i;
        }
    }
    
    if (TEXAN_COMMIT_ON_BOOT) TexanYeehaw();
    
    return _global;
}
// Feather disable all

/// Flushes all queued texture groups, and then fetches texture groups one at a time (as directed by calling TexanFlush() / TexanFetch() etc.)
/// This function allows for Texan to fetch/flush texture groups over the span of multiple frames to prevent the game from locking up
/// This function returns <true> when the fetch/flush queues have been fully processed, and <false> otherwise

function TexanCommit()
{
    static _global = __TexanInitialize();
    with(_global)
    {
        if ((array_length(__flushArray) <= 0) && (array_length(__fetchArray) <= 0))
        {
            if (TEXAN_DEBUG_LEVEL >= 1) __TexanTrace("No changes detected");
            return;
        }
        
        if (TEXAN_DEBUG_LEVEL >= 1) __TexanTrace("Committing changes");
        
        if (array_length(__flushArray) > 0)
        {
            var _i = 0;
            repeat(array_length(__flushArray))
            {
                var _textureGroup = __flushArray[_i];
                
                if (__textureGroupDynamicDict[$ string_lower(_textureGroup)])
                {
                    texturegroup_unload(_textureGroup);
                }
                else
                {
                    var _textureArray = texturegroup_get_textures(_textureGroup);
                    var _j = 0;
                    repeat(array_length(_textureArray))
                    {
                        texture_flush(_textureArray[_j]);
                        ++_j;
                    }
                }
                
                if (TEXAN_DEBUG_LEVEL >= 1) __TexanTrace("Flushed \"", _textureGroup, "\"");
                
                var _index = array_get_index(__fetchedArray, _textureGroup);
                if (_index >= 0) array_delete(__fetchedArray, _index, 1);
            
                ++_i;
            }
            
            array_resize(__flushArray, 0);
        }
        
        var _i = 0;
        repeat(array_length(__fetchArray))
        {
            var _textureGroup = __fetchArray[_i];
            var _status = texturegroup_get_status(_textureGroup);
            
            if (__textureGroupDynamicDict[$ string_lower(_textureGroup)] && (_status == texturegroup_status_unloaded))
            {
                __complete = false;
                texturegroup_load(_textureGroup, true);
                
                if ((TEXAN_DEBUG_LEVEL >= 1) && (texturegroup_get_status(_textureGroup) == texturegroup_status_loading))
                {
                    __TexanTrace("Loading \"", _textureGroup, "\"");
                }
            }
            else
            {
                if (_status != texturegroup_status_fetched)
                {
                    __complete = false;
                    texture_prefetch(_textureGroup);
                    
                    if ((TEXAN_DEBUG_LEVEL >= 1) && (texturegroup_get_status(_textureGroup) == texturegroup_status_fetched))
                    {
                        __TexanTrace("Fetched \"", _textureGroup, "\"");
                    }
                }
            }
            
            array_push(__fetchedArray, _textureGroup);
            ++_i;
        }
        
        array_resize(__fetchArray, 0);
        
        if (__complete)
        {
            if (TEXAN_DEBUG_LEVEL >= 1) __TexanTrace("No new fetches, retaining completed status");
        }
    }
}

function TexanYeehaw()
{
    return TexanCommit();
}
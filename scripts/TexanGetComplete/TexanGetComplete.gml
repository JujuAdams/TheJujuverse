// Feather disable all

/// Returns whether Texan has finished processing all of its queued operations

function TexanGetComplete()
{
    static _global = __TexanInitialize();
    
    with(_global)
    {
        if (__complete) return true;
        
        var _i = 0;
        repeat(array_length(__fetchedArray))
        {
            if (texturegroup_get_status(__fetchedArray[_i]) != texturegroup_status_fetched)
            {
                return false;
            }
            
            ++_i;
        }
        
        if (TEXAN_DEBUG_LEVEL >= 1) __TexanTrace("Fetches complete, marking as complete");
        __complete = true;
        return true;
    }
}
// Feather disable all

/// Queues texture groups to be fetched the next time TexanCommit() is called. If a texture group
/// is queued to be both fetched and flushed then the flush command is ignored.
///
/// @param textureGroup
/// @param [textureGroup...]

function TexanFetch()
{
    static _global = __TexanInitialize();
    with(_global)
    {
        //Copy across the always fetch array
        if ((array_length(__fetchArray) <= 0) && (array_length(__alwaysFetchArray) >= 1))
        {
            array_copy(__fetchArray, 0, __alwaysFetchArray, 0, array_length(__alwaysFetchArray));
        }
        
        var _i = 0;
        repeat(argument_count)
        {
            var _textureGroup = argument[_i];
            
            if (TEXAN_DEBUG_LEVEL >= 2) __TexanTrace("Trying to queue fetch \"", _textureGroup, "\"          ", debug_get_callstack());
            
            var _index = array_get_index(__flushArray, _textureGroup);
            if (_index >= 0)
            {
                if (TEXAN_DEBUG_LEVEL >= 2) __TexanTrace("Fetch collides with flush for \"", _textureGroup, "\", removing flush");
                array_delete(__flushArray, _index, 1);
            }
            
            if (array_get_index(__fetchArray, _textureGroup) < 0)
            {
                if (TEXAN_DEBUG_LEVEL >= 2) __TexanTrace("Queued fetch for \"", _textureGroup, "\"");
                array_push(__fetchArray, _textureGroup);
            }
            
            ++_i;
        }
    }
}
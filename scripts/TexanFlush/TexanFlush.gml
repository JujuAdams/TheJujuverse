// Feather disable all

/// Queues texture groups to be flushed the next time TexanCommit() is called. (If a texture group
/// is queued to be both fetched and flushed then the flush command is ignored.
///
/// @param textureGroup
/// @param [textureGroup...]

function TexanFlush()
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
            
            if (TEXAN_DEBUG_LEVEL >= 2) __TexanTrace("Trying to queue flush \"", _textureGroup, "\"          ", debug_get_callstack());
            
            if ((array_get_index(__fetchArray, _textureGroup) < 0) && (array_get_index(__flushArray, _textureGroup) < 0))
            {
                if (TEXAN_DEBUG_LEVEL >= 2) __TexanTrace("Queued flush for \"", _textureGroup, "\"");
                array_push(__flushArray, argument[_i]);
            }
            else
            {
                if (TEXAN_DEBUG_LEVEL >= 2) __TexanTrace("\"", _textureGroup, "\" is being fetched, ignoring flush");
            }
            
            ++_i;
        }
    }
}
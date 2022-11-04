/// Flushes all queued texture groups, and then fetches texture groups one at a time (as directed by calling texan_flush() / texan_fetch() etc.)
/// This function allows for Texan to fetch/flush texture groups over the span of multiple frames to prevent the game from locking up
/// This function returns <true> when the fetch/flush queues have been fully processed, and <false> otherwise

function TexanCommitStep()
{
    if (TEXAN_DEBUG_LEVEL >= 1) __TexanTrace("Performing a flush/fetch step");
    
    if (!ds_list_empty(global.__texanFlush))
    {
        var _i = 0;
        repeat(ds_list_size(global.__texanFlush))
        {
            var _texture_group = global.__texanFlush[| _i];
            texture_flush(_texture_group);
            if (TEXAN_DEBUG_LEVEL >= 1) __TexanTrace("Flushed \"", _texture_group, "\"");
            ++_i;
        }
        
        ds_list_clear(global.__texanFlush);
    }
    
    var _t_outer = get_timer();
    while(!ds_list_empty(global.__texanFetch) && (get_timer() - _t_outer < 1000))
    {
        var _texture_group = global.__texanFetch[| 0];
        ds_list_delete(global.__texanFetch, 0);
        
        var _t = get_timer();
        texture_prefetch(_texture_group);
            
        if ((TEXAN_DEBUG_LEVEL >= 1) && (get_timer() - _t > 1000))
        {
            __TexanTrace("Fetched \"", _texture_group, "\"");
        }
        else if (TEXAN_DEBUG_LEVEL >= 2)
        {
            __TexanTrace("Fetched \"", _texture_group, "\" (but it was probably already loaded)");
        }
    }
    
    if (ds_list_empty(global.__texanFlush) && ds_list_empty(global.__texanFetch))
    {
        ds_list_copy(global.__texanFetch, global.__texanAlwaysFetch);
        return true;
    }
    else
    {
        return false;
    }
}
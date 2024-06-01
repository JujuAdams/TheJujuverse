// Feather disable all

/// Queues *all* texture groups to be fetched the next time TexanCommit() is called. If a texture
/// group is queued to be both fetched and flushed then the flush command is ignored.

function TexanFetchAll()
{
    static _global = __TexanInitialize();
    
    var _array = _global.__textureGroupArray;
    var _i = 0;
    repeat(array_length(_array))
    {
        TexanFetch(_array[_i]);
        ++_i;
    }
}
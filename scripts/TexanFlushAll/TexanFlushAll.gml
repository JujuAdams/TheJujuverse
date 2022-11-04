/// Queues *all* texture groups to be flushed the next time texan_commit() is called
/// (If a texture group is queued to be both fetched and flushed then the flush command is ignored)

function TexanFlushAll()
{
    var _i = 0;
    repeat(ds_list_size(global.__texanTextureGroups))
    {
        TexanFetch(global.__texanTextureGroups[| _i]);
        ++_i;
    }
}
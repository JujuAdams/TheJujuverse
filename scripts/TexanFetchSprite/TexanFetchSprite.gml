/// Queues the texture group associated with the given sprite to be fetched the next time texan_commit() is called
/// (If a texture group is queued to be both fetched and flushed then the flush command is ignored)
///
/// @param sprite
/// @param [sprite...]

function TexanFetchSprite()
{
    var _i = 0;
    repeat(argument_count)
    {
        var _sprite = argument[_i];
        
        var _texture_group = global.__texanSpriteToTextureGroup[? _sprite];
        if (_texture_group != undefined) TexanFetch(_texture_group);
        
        ++_i;
    }
}
// Feather disable all

/// Unfortunately, due to limitations in GameMaker's font_get_info() it is not possible to
/// automatically retrieve the "proportional" and "separation" values for a spritefont after that
/// spritefont has been created. Scribble Jr. needs that information to bake vertex buffers. To
/// bridge the gap, you must call this function to add the necessary context for each spritefont
/// you intend to use with Scribble Jr.  The values passed to this function should be the same
/// values you pass to GameMaker's native font_add_sprite_ext() and it is recommended that you
/// call ScribblejrAttachSpritefont() immediately after font_add_sprite_ext().
/// 
/// @param font
/// @param proportional
/// @param separation

function ScribblejrAttachSpritefont(_font, _proportional, _separation)
{
    static _system = __ScribblejrSystem();
    _system.__spriteFontData[$ font_get_name(_font)] = {
        __proportional: _proportional,
        __separation:   _separation,
    };
}
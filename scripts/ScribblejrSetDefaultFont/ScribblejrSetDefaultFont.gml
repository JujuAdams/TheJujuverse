// Feather disable all

/// Sets the default font for Scribble Jr.  This default font will be used in cases where a font
/// has not been specified. If a negative number is specified then Scribble Jr. will fall back on
/// its own default font (Droid Sans Mono which is close to GameMaker's native default font).
/// 
/// N.B. Unlike Scribble Deluxe, you will need to provide the font as a reference and not a string.
/// 
/// @param font

function ScribblejrSetDefaultFont(_font)
{
    static _system = __ScribblejrSystem();
    _system.__defaultFont = (_font < 0)? ScribblejrDefaultFont : _font;
}
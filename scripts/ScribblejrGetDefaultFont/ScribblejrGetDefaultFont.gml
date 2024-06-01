// Feather disable all

/// Returns the default font. If ScribblejrSetDefaultFont() has never been called, this function
/// will return Scribble Jr.'s fallback font <ScribblejrDefaultFont>.
/// 
/// @param name

function ScribblejrGetDefaultFont()
{
    static _system = __ScribblejrSystem();
    return _system.__defaultFont;
}
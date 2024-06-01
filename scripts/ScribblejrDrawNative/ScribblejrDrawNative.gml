// Feather disable all

/// Draws plain text without formatting or layout. This is a convenience function that wraps around
/// GameMaker's native text drawing. Nothing special!
/// 
/// N.B. This function should only be used for extremely fast changing text such as a stopwatch.
///      You should use Scribblejr() instead if you plan for the drawn text to persist for
///      around a second or more.
/// 
/// @param x
/// @param y
/// @param string
/// @param [colour=white]
/// @param [alpha=1]
/// @param [hAlign=left]
/// @param [vAlign=top]
/// @param [font=default]
/// @param [fontScale=1]
/// @param [sdfEffects]

function ScribblejrDrawNative(_x, _y, _string, _colour = c_white, _alpha = 1, _hAlign = fa_left, _vAlign = fa_top, _font = undefined, _fontScale = 1, _sdfEffects = undefined)
{
    static _system = __ScribblejrSystem();
    
    if (_font == undefined) _font = _system.__defaultFont;
    _fontScale *= SCRIBBLEJR_GLOBAL_FONT_SCALE;
    
    draw_set_font(_font);
    draw_set_colour(_colour);
    draw_set_alpha(_alpha);
    draw_set_halign(_hAlign);
    draw_set_valign(_vAlign);
    
    if (_sdfEffects != undefined)
    {
        font_enable_effects(_font, true, _sdfEffects);
        draw_text_transformed(_x, _y, _string, _fontScale, _fontScale, 0);
        if (SCRIBBLEJR_AUTO_RESET_DRAW_STATE) font_enable_effects(_font, false);
    }
    else
    {
        draw_text_transformed(_x, _y, _string, _fontScale, _fontScale, 0);
    }
    
    if (SCRIBBLEJR_AUTO_RESET_DRAW_STATE) ScribblejrResetDrawState();
}
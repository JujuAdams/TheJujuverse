// Feather disable all

/// Convenience function to reset GameMaker's native draw state. This is called regularly if the
/// SCRIBBLEJR_RESET_DRAW_STATE macro is set to <true>.

function ScribblejrResetDrawState()
{
    draw_set_font(-1);
    draw_set_colour(c_white);
    draw_set_alpha(1);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}
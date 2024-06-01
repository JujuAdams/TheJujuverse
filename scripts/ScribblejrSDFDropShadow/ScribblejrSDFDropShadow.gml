// Feather disable all

/// @param [xOffset=0]
/// @param [yOffset=0]
/// @param [softness=5]
/// @param [color=black]
/// @param [alpha=0.33]

function ScribblejrSDFDropShadow(_xOffset = 0, _yOffset = 0, _softness = 5, _color = c_black, _alpha = 0.33)
{
    return { //See font_enable_effects()
        dropShadowEnable:   true,
        dropShadowSoftness: _softness,
        dropShadowOffsetX:  _xOffset,
        dropShadowOffsetY:  _yOffset,
        dropShadowColour:   _color,
        dropShadowAlpha:    _alpha,
    };
}
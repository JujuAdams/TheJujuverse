// Feather disable all

/// Sets whether per-character wrapping is enabled for ScribblejrFit() and ScribblejrFitExt().
/// Per-character text wrapping is useful for Chinese, Japanese and Korean text where splitting
/// on spaces is impractical.
/// 
/// @param state

function ScribblejrSetCharacterWrap(_state)
{
    static _system = __ScribblejrSystem();
    _system.__perCharacterWrap = _state;
}
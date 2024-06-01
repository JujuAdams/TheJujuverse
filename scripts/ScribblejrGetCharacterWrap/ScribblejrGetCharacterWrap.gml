// Feather disable all

/// Returns whether per-character wrapping is enabled or not.

function ScribblejrGetCharacterWrap()
{
    static _system = __ScribblejrSystem();
    return _system.__perCharacterWrap;
}
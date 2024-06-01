// Feather disable all

/// Returns the Scribble Jr. baking time budget, measured in microseconds.

function ScribblejrGetBudget()
{
    static _system = __ScribblejrSystem();
    return _system.__budget;
}
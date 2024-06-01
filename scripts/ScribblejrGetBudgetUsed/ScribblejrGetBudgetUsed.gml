// Feather disable all

/// Returns how much time Scribble Jr. used to bake vertex buffers in the previous Step, measured
/// in microseconds. This value will sometimes be a little more than the time budget set by
/// ScribblejrGetBudget().

function ScribblejrGetBudgetUsed()
{
    static _system = __ScribblejrSystem();
    return _system.__budgetUsedPrev;
}
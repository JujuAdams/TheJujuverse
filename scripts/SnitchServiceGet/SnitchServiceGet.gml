// Feather disable all
/// Returns whether services are enabled
/// This function will always return <false> if SNITCH_SERVICE_MODE is set to 0

function SnitchServiceGet()
{
    if (SNITCH_SERVICE_MODE <= 0) return false;
    
    return __SnitchState().__ServiceEnabled;
}

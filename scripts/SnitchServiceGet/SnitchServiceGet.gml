/// Returns whether services are enabled
/// This function will always return <false> if SNITCH_SERVICE_MODE is set to 0

function SnitchServiceGet()
{
    __SnitchInit();
    
    if (SNITCH_SERVICE_MODE <= 0) return false;
    
    return global.__snitchServiceEnabled;
}
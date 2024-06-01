// Feather disable all
/// Returns whether log-to-file is enabled
/// This function will always return <false> is SNITCH_LOG_PERMITTED is set to <false>

function SnitchLogGet()
{
    if (!SNITCH_LOG_PERMITTED) return false;
    return __SnitchState().__LogToFileEnabled;
}

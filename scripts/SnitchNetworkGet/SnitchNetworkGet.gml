// Feather disable all
/// Returns whether networking transmission is enabled
/// This function will always return <false> is SNITCH_NETWORK_MODE is set to 0

function SnitchNetworkGet()
{
    if (SNITCH_NETWORK_MODE <= 0) return false;
    return __SnitchState().__NetworkEnabled;
}

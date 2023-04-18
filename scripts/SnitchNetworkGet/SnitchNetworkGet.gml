/// Returns whether networking transmission is enabled
/// This function will always return <false> is SNITCH_NETWORK_MODE is set to 0

function SnitchNetworkGet()
{
    __SnitchInit();
    
    if (SNITCH_NETWORK_MODE <= 0) return false;
    
    return global.__snitchNetworkEnabled;
}
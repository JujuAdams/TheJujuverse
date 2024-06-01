// Feather disable all
function __SnitchAttemptTCPConnection()
{
    static _snitchState = __SnitchState();
    
    if ((_snitchState.__NetworkSocket != undefined) && (_snitchState.__NetworkSocket >= 0) && (SNITCH_NETWORK_MODE == 2))
    {
        network_connect_raw_async(_snitchState.__NetworkSocket, _snitchState.__NetworkTargetIP ?? "127.0.0.1", _snitchState.__NetworkTargetPort);
        _snitchState.__NetworkConnected = false;
    }
    else if (SNITCH_NETWORK_MODE == 1)
    {
        //UDP is always connected cos we're sending packets blind
        _snitchState.__NetworkConnected = true;
    }
    else
    {
        _snitchState.__NetworkConnected = false;
    }
}

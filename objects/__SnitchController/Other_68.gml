var _snitchState = __SnitchState();

switch(async_load[? "type"])
{
    case network_type_disconnect:
        __SnitchTrace("TCP connection lost, retrying");
        _snitchState.__NetworkConnectionAttempts = 0;
        _snitchState.__NetworkConnected = false;
        _snitchState.__NetworkAbandoned = false;
        __SnitchAttemptTCPConnection();
    break;
    
    case network_type_non_blocking_connect:
        if (async_load[? "succeeded"])
        {
            __SnitchTrace("TCP connection established");
            _snitchState.__NetworkConnected = true;
            _snitchState.__NetworkAbandoned = false;
        }
        else
        {
            _snitchState.__NetworkConnectionAttempts++;
            if (_snitchState.__NetworkConnectionAttempts >= SNITCH_NETWORK_CONNECTION_ATTEMPTS)
            {
                __SnitchTrace("TCP connection failed to establish despite ", _snitchState.__NetworkConnectionAttempts, " attempts, giving up");
                _snitchState.__NetworkConnected = false;
                _snitchState.__NetworkAbandoned = true;
            }
            else
            {
                __SnitchTrace("TCP connection failed to establish, retrying");
                __SnitchAttemptTCPConnection();
            }
        }
    break;
}
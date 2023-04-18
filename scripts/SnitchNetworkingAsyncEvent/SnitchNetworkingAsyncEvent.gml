function SnitchNetworkingAsyncEvent()
{
    __SnitchInit();
    
    if (!global.__snitchNetworkTested) global.__snitchNetworkTested = true;
    
    if ((event_type == ev_other) && (event_number == ev_async_web_networking))
    {
        switch(async_load[? "type"])
        {
            case network_type_disconnect:
                __SnitchTrace("TCP connection lost, retrying");
                global.__snitchNetworkConnectionAttempts = 0;
                global.__snitchNetworkConnected = false;
                global.__snitchNetworkAbandoned = false;
                __SnitchAttemptTCPConnection();
            break;
            
            case network_type_non_blocking_connect:
                if (async_load[? "succeeded"])
                {
                    __SnitchTrace("TCP connection established");
                    global.__snitchNetworkConnected = true;
                    global.__snitchNetworkAbandoned = false;
                }
                else
                {
                    global.__snitchNetworkConnectionAttempts++;
                    if (global.__snitchNetworkConnectionAttempts >= SNITCH_NETWORK_CONNECTION_ATTEMPTS)
                    {
                        __SnitchTrace("TCP connection failed to establish despite ", global.__snitchNetworkConnectionAttempts, " attempts, giving up");
                        global.__snitchNetworkConnected = false;
                        global.__snitchNetworkAbandoned = true;
                    }
                    else
                    {
                        __SnitchTrace("TCP connection failed to establish, retrying");
                        __SnitchAttemptTCPConnection();
                    }
                }
            break;
        }
    }
    else
    {
        __SnitchError("SnitchNetworkingAsyncEvent() should only be placed in a Networking Async event");
    }
}
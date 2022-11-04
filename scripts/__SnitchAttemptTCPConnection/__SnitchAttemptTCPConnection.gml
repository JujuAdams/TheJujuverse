function __SnitchAttemptTCPConnection()
{
    if ((global.__snitchNetworkSocket != undefined) && (global.__snitchNetworkSocket >= 0) && (SNITCH_NETWORK_MODE == 2))
    {
        if (!global.__snitchNetworkTested) global.__snitchNetworkTestTime = SNITCH_FOCUS_TIME;
        network_connect_raw_async(global.__snitchNetworkSocket, global.__snitchNetworkTargetIP ?? "127.0.0.1", global.__snitchNetworkTargetPort);
        
        global.__snitchNetworkConnected = false;
    }
    else if (SNITCH_NETWORK_MODE == 1)
    {
        //UDP is always connected cos we're sending packets blind
        global.__snitchNetworkConnected = true;
    }
    else
    {
        global.__snitchNetworkConnected = false;
    }
}
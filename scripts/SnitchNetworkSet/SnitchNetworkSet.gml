/// Sets whether Snitch should enable network transmission
///   N.B. Network transmission cannot be enabled unless the relevant macros in __SnitchConfigNetwork() are set to <true>
/// 
/// @param state
/// @param [outgoingPort]
/// @param [targetPort]
/// @paarm [targetIP]

function SnitchNetworkSet(_state, _outgoingPort = SNITCH_NETWORK_DEFAULT_OUTGOING_PORT, _receiverPort = SNITCH_NETWORK_DEFAULT_RECEIVER_PORT, _receiverIP = SNITCH_NETWORK_DEFAULT_RECEIVER_IP)
{
    __SnitchInit();
    
    if (SnitchNetworkGet() != _state)
    {
        var _funcCloseSocket = function()
        {
            if (global.__snitchNetworkSocket != undefined)
            {
                __SnitchTrace("Destroying socket ", global.__snitchNetworkSocket);
                network_destroy(global.__snitchNetworkSocket);
                global.__snitchNetworkSocket = undefined;
                global.__snitchNetworkTestTime = undefined;
                global.__snitchNetworkConnected = false;
            }
        }
        
        var _funcOpenSocket = function()
        {
            if (global.__snitchNetworkSocket == undefined)
            {
                var _type = (SNITCH_NETWORK_MODE == 1)? network_socket_udp : network_socket_tcp;
                if (global.__snitchNetworkOutgoingPort == undefined)
                {
                    global.__snitchNetworkSocket = network_create_socket(_type);
                }
                else
                {
                    global.__snitchNetworkSocket = network_create_socket_ext(_type, global.__snitchNetworkOutgoingPort);
                }
                
                if (global.__snitchNetworkSocket >= 0)
                {
                    __SnitchTrace("Created socket ", global.__snitchNetworkSocket, " for ", (SNITCH_NETWORK_MODE == 1)? "UDP" : "TCP", " traffic");
                    __SnitchTrace("Attempting TCP connection");
                    __SnitchAttemptTCPConnection();
                }
                else
                {
                    __SnitchTrace("Failed to create socket");
                    global.__snitchNetworkConnected = false;
                }
            }
        }
        
        if (_state)
        {
            if (SNITCH_NETWORK_MODE > 0)
            {
                global.__snitchNetworkEnabled      = true;
                global.__snitchNetworkOutgoingPort = _outgoingPort;
                global.__snitchNetworkTargetPort   = _receiverPort;
                global.__snitchNetworkTargetIP     = _receiverIP;
                
                _funcCloseSocket();
                _funcOpenSocket();
                
                __SnitchTrace("Network transmission turned on, using ", (SNITCH_NETWORK_MODE == 1)? "UDP" : "TCP", ", outgoing port ", _outgoingPort, ", target port ", _receiverPort, ", target IP ", _receiverIP);
            }
            else
            {
                __SnitchTrace("Network transmission cannot be toggled as it has not been enabled (see SNITCH_NETWORK_MODE)");
            }
        }
        else
        {
            _funcCloseSocket();
            
            global.__snitchNetworkEnabled = false;
            __SnitchTrace("Network transmission turned off");
        }
    }
    else if (_state)
    {
        if ((_receiverPort != global.__snitchNetworkOutgoingPort) || (_receiverPort != global.__snitchNetworkTargetPort) || (_receiverIP != global.__snitchNetworkTargetIP))
        {
            _funcCloseSocket();
            _funcOpenSocket();
            
            global.__snitchNetworkOutgoingPort = _outgoingPort;
            global.__snitchNetworkTargetPort   = _receiverPort;
            global.__snitchNetworkTargetIP     = _receiverIP;
            
            __SnitchTrace("Networking details changed, using ", (SNITCH_NETWORK_MODE == 1)? "UDP" : "TCP", ", outgoing port ", _outgoingPort, ", target port ", _receiverPort, ", target IP ", _receiverIP);
        }
    }
}
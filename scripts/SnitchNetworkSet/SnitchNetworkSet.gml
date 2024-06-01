// Feather disable all
/// Sets whether Snitch should enable network transmission
///   N.B. Network transmission cannot be enabled unless the relevant macros in __SnitchConfigNetwork() are set to <true>
/// 
/// @param state
/// @param [outgoingPort]
/// @param [targetPort]
/// @paarm [targetIP]

function SnitchNetworkSet(_state, _outgoingPort = SNITCH_NETWORK_DEFAULT_OUTGOING_PORT, _receiverPort = SNITCH_NETWORK_DEFAULT_RECEIVER_PORT, _receiverIP = SNITCH_NETWORK_DEFAULT_RECEIVER_IP)
{
    static _snitchState = __SnitchState();
    
    if (SnitchNetworkGet() != _state)
    {
        var _funcCloseSocket = function()
        {
            if (_snitchState.__NetworkSocket != undefined)
            {
                __SnitchTrace("Destroying socket ", _snitchState.__NetworkSocket);
                network_destroy(_snitchState.__NetworkSocket);
                _snitchState.__NetworkSocket = undefined;
                _snitchState.__NetworkConnected = false;
            }
        }
        
        var _funcOpenSocket = function()
        {
            if (_snitchState.__NetworkSocket == undefined)
            {
                var _type = (SNITCH_NETWORK_MODE == 1)? network_socket_udp : network_socket_tcp;
                if (_snitchState.__NetworkOutgoingPort == undefined)
                {
                    _snitchState.__NetworkSocket = network_create_socket(_type);
                }
                else
                {
                    _snitchState.__NetworkSocket = network_create_socket_ext(_type, _snitchState.__NetworkOutgoingPort);
                }
                
                if (_snitchState.__NetworkSocket >= 0)
                {
                    __SnitchTrace("Created socket ", _snitchState.__NetworkSocket, " for ", (SNITCH_NETWORK_MODE == 1)? "UDP" : "TCP", " traffic");
                    __SnitchTrace("Attempting TCP connection");
                    __SnitchAttemptTCPConnection();
                }
                else
                {
                    __SnitchTrace("Failed to create socket");
                    _snitchState.__NetworkConnected = false;
                }
            }
        }
        
        if (_state)
        {
            if (SNITCH_NETWORK_MODE > 0)
            {
                _snitchState.__NetworkEnabled      = true;
                _snitchState.__NetworkOutgoingPort = _outgoingPort;
                _snitchState.__NetworkTargetPort   = _receiverPort;
                _snitchState.__NetworkTargetIP     = _receiverIP;
                
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
            
            _snitchState.__NetworkEnabled = false;
            __SnitchTrace("Network transmission turned off");
        }
    }
    else if (_state)
    {
        if ((_receiverPort != _snitchState.__NetworkOutgoingPort) || (_receiverPort != _snitchState.__NetworkTargetPort) || (_receiverIP != _snitchState.__NetworkTargetIP))
        {
            _funcCloseSocket();
            _funcOpenSocket();
            
            _snitchState.__NetworkOutgoingPort = _outgoingPort;
            _snitchState.__NetworkTargetPort   = _receiverPort;
            _snitchState.__NetworkTargetIP     = _receiverIP;
            
            __SnitchTrace("Networking details changed, using ", (SNITCH_NETWORK_MODE == 1)? "UDP" : "TCP", ", outgoing port ", _outgoingPort, ", target port ", _receiverPort, ", target IP ", _receiverIP);
        }
    }
}

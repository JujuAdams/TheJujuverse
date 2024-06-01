// Feather disable all
/// Transmits a string over a network connection, either UDP or TCP. Useful for transmitting packets manually
/// 
/// @param string  String to transmit

function SnitchSendStringToNetwork(_string)
{
    static _snitchState = __SnitchState();
    
    if (SnitchNetworkGet())
    {
        if ((SNITCH_NETWORK_MODE == 2) && (!_snitchState.__NetworkConnected || (array_length(_snitchState.__NetworkPendingMessages) > 0)))
        {
            if (!_snitchState.__NetworkAbandoned)
            {
                array_push(_snitchState.__NetworkPendingMessages, _string);
                array_delete(_snitchState.__NetworkPendingMessages, 0, max(0, array_length(_snitchState.__NetworkPendingMessages) - SNITCH_NETWORK_PENDING_MESSAGE_LIMIT));
            }
        }
        else
        {
            __SnitchSendStringToNetwork(_string);
        }
    }
}

function __SnitchSendStringToNetwork(_string)
{
    static _snitchState = __SnitchState();
    
    //https://logging.apache.org/log4j/2.x/manual/layouts.html
    //https://logging.apache.org/log4j/2.x/log4j-1.2-api/apidocs/src-html/org/apache/log4j/layout/Log4j1XmlLayout.html
    
    static _buffer = buffer_create(1024, buffer_grow, 1);
    buffer_seek(_buffer, buffer_seek_start, 0);
    buffer_write(_buffer, buffer_string, _string);
    
    switch(SNITCH_NETWORK_MODE)
    {
        case 0:
            //Disabled
        break;
        
        case 1:
            if (_snitchState.__NetworkTargetIP == undefined)
            {
                network_send_broadcast(_snitchState.__NetworkSocket, _snitchState.__NetworkTargetPort, _buffer, buffer_tell(_buffer));
            }
            else
            {
                network_send_udp_raw(_snitchState.__NetworkSocket, _snitchState.__NetworkTargetIP, _snitchState.__NetworkTargetPort, _buffer, buffer_tell(_buffer));
            }
        break;
        
        case 2:
            network_send_raw(_snitchState.__NetworkSocket, _buffer, buffer_tell(_buffer));
        break;
    }
}

/// Transmits a string over a network connection, either UDP or TCP. Useful for transmitting packets manually
/// 
/// @param string  String to transmit

function SnitchSendStringToNetwork(_string)
{
    __SnitchInit();
    
    if (SnitchNetworkGet())
    {
        if ((SNITCH_NETWORK_MODE == 2) && (!global.__snitchNetworkConnected || (array_length(global.__snitchNetworkPendingMessages) > 0)))
        {
            if (!global.__snitchNetworkAbandoned)
            {
                array_push(global.__snitchNetworkPendingMessages, _string);
                array_delete(global.__snitchNetworkPendingMessages, 0, max(0, array_length(global.__snitchNetworkPendingMessages) - SNITCH_NETWORK_PENDING_MESSAGE_LIMIT));
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
            if (global.__snitchNetworkTargetIP == undefined)
            {
            	network_send_broadcast(global.__snitchNetworkSocket, global.__snitchNetworkTargetPort, _buffer, buffer_tell(_buffer));
            }
            else
            {
            	network_send_udp_raw(global.__snitchNetworkSocket, global.__snitchNetworkTargetIP, global.__snitchNetworkTargetPort, _buffer, buffer_tell(_buffer));
            }
        break;
        
        case 2:
            network_send_raw(global.__snitchNetworkSocket, _buffer, buffer_tell(_buffer));
        break;
    }
}
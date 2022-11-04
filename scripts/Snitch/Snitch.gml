/// Concatenates a series of values into a single string and outputs it
///
/// The final string is outputted to three destinations:
///   1. The console output (show_debug_message())
///   2. Save to the log file, if logging is turned on, see SnitchLogSet()
///   3. Broadcast over the network, if UDP/TCP is turned on, see SnitchNetworkSet()
/// 
/// @param value
/// @param [value]...

function Snitch()
{
    var _string = "";
    
    var _i = 0;
    repeat(argument_count)
    {
        _string += string(argument[_i]);
        ++_i;
    }
    
    show_debug_message(_string);
    SnitchSendStringToLogFile(_string);
    SnitchSendStringToNetwork(_string); //TODO - Format this string for consumption (LogCat?)
}
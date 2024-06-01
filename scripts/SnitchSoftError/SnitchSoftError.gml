// Feather disable all
/// Concatenates a series of values into a single string and outputs it as a serious (but not fatal) error
///
/// The error message is outputted to four destinations:
///   1. The console output (show_debug_message())
///   2. Save to the log file, if logging is turned on, see SnitchLogSet()
///   3. Broadcast over the network, if UDP/TCP is turned on, see SnitchNetworkSet()
///   4. Submitted to a bug tracking service, if turned on, see SnitchServiceSet()
/// 
/// @param value
/// @param [value]...

function SnitchSoftError()
{
    var _string = "";
    var _i = 0;
    repeat(argument_count)
    {
        _string += string(argument[_i]);
        ++_i;
    }
    
    var _event = new __SnitchClassSoftError();
    _event.__SetMessage(_string);
}

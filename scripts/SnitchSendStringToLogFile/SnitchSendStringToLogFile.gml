// Feather disable all
/// Writes a string to Snitch's log file. Useful for managing the log file manually
/// 
/// @param data  Value to write to the log file

function SnitchSendStringToLogFile(_data)
{
    static _snitchState = __SnitchState();
    var _buffer = _snitchState.__LogFileBuffer;
    
    if (SnitchLogGet())
    {
        buffer_write(_buffer, buffer_text, string(_data));
        buffer_write(_buffer, buffer_u8, 10);
        buffer_save_ext(_buffer, _snitchState.__ZerothLogFile, 0, buffer_tell(_buffer));
    }
}

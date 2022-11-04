/// Writes a string to Snitch's log file. Useful for managing the log file manually
/// 
/// @param data  Value to write to the log file

function SnitchSendStringToLogFile(_data)
{
    __SnitchInit();
    
    if (SnitchLogGet())
    {
        buffer_write(global.__snitchLogFileBuffer, buffer_text, string(_data));
        buffer_write(global.__snitchLogFileBuffer, buffer_u8, 10);
        buffer_save_ext(global.__snitchLogFileBuffer, global.__snitchZerothLogFile, 0, buffer_tell(global.__snitchLogFileBuffer));
    }
}
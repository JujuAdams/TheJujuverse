/// Checks whether a crash dump exists on disk and returns it if so
/// 
/// If a crash dump exists, this function returns the exception struct that was generated
/// If the crash dump couldn't be parsed or no crash dump exists, this function returns <undefined>

function SnitchCrashDumpCollect()
{
    __SnitchInit();
    
    var _struct = undefined;
    
    if ((SNITCH_CRASH_DUMP_FILENAME != "") && file_exists(SNITCH_CRASH_DUMP_FILENAME))
    {
        try
        {
            var _buffer = buffer_load(SNITCH_CRASH_DUMP_FILENAME);
            var _string = buffer_read(_buffer, buffer_string);
            buffer_delete(_buffer);
            var _struct = json_parse(_string);
        }
        catch(_error)
        {
            __SnitchTrace("Could not parse crash dump, error was \"", _error.message, "\"");
        }
    }
    
    return _struct;
}
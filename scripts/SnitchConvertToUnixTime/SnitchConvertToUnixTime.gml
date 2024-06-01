// Feather disable all
function SnitchConvertToUnixTime(_inTime)
{
    var _oldTimezone = date_get_timezone();
    date_set_timezone(timezone_utc);
    
    var _outTime = 86400*(_inTime - 25569);
    
    date_set_timezone(_oldTimezone);
    return _outTime;
}

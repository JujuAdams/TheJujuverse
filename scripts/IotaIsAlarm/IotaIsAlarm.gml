/// Returns <true> if the given value is an iota alarm, as returned by .AddAlarm() or .AddAlarmCycles()
/// 
/// @param value   The value to check

function IotaIsAlarm(_value)
{
    if (!is_struct(_value)) return false;
    return (instanceof(_value) == "__IotaClassAlarm");
}
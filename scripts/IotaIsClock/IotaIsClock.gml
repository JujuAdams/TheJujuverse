/// Returns <true> if the given value is an iota clock, as created by IotaClock()
/// 
/// @param value   The value to check

function IotaIsClock(_value)
{
    if (!is_struct(_value)) return false;
    return (instanceof(_value) == "IotaClock");
}

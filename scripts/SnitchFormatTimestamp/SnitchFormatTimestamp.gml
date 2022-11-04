/// @param time

function SnitchFormatTimestamp(_time)
{
    var _oldTimezone = date_get_timezone();
    date_set_timezone(timezone_utc);

    var _string = string_format(date_get_year(  _time), 4, 0) + "-" +
                  string_format(date_get_month( _time), 2, 0) + "-" +
                  string_format(date_get_day(   _time), 2, 0) + "T" +
                  string_format(date_get_hour(  _time), 2, 0) + ":" +
                  string_format(date_get_minute(_time), 2, 0) + ":" +
                  string_format(date_get_second(_time), 2, 0);
    _string = string_replace_all(_string, " ", "0");

    date_set_timezone(_oldTimezone);

    return _string;
}
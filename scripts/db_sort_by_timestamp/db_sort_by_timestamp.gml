/// @param arrayOfDatabases
/// @param mostRecent

function db_sort_by_timestamp(_array, _most_recent)
{
    if (_most_recent)
    {
        array_sort(_array, function(_a, _b)
        {
            return _a.__timestamp - _b.__timestamp;
        });
    }
    else
    {
        array_sort(_array, function(_a, _b)
        {
            return _b.__timestamp - _a.__timestamp;
        });
    }
}
/// @param database

function db_clear(_database)
{
    with(_database)
    {
        if (__data != undefined)
        {
            __data = undefined;
            __changed = true;
        }
    }
}
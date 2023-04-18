/// @param value

function is_db(_value)
{
    return (is_struct(_value) && (instanceof(_value) == "__db_class"));
}
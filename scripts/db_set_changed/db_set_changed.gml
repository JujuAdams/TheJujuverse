/// @param database
/// @param state

function db_set_changed(_database, _state)
{
    _database.__changed = _state;
    if (_state) _database.__timestamp = date_current_datetime();
}
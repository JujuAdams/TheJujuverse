function db_duplicate(_database)
{
    var _new = new __db_class();
    _new.__metadata = __db_deep_copy(_database.__metadata);
    _new.__data     = __db_deep_copy(_database.__data    );
    _new.__changed  = _database.__changed;
    return _new;
}
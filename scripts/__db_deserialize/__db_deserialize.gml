function __db_deserialize(_string)
{
    var _database = undefined;
    
    var _json = json_parse(_string);
    switch(_json.version)
    {
        case 1:
            _database = db_create();
            db_set_metadata(_database, _json.metadata);
            db_set_raw_data(_database, _json.data, false);
            db_set_timestamp(_database, _json.timestamp);
        break;
            
        default:
            __db_error("Unsupported version ", _json.version);
        break;
    }
    
    return _database;
}
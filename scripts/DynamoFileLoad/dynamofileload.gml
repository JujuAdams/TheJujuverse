// Feather disable all
/// Forces an Included File to be loaded, executing the callback defined for the file via DynamoFile().
/// 
/// @param path

function DynamoFileLoad(_path)
{
    static _fileStruct = __DynamoState().__fileStruct;
    
    var _tracker = _fileStruct[$ _path];
    if (_tracker == undefined) __DynamoError("\"", _path, "\" hasn't been added with DynamoFile()");
    
    _tracker.__Load();
}

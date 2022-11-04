/// Returns a struct that contains three arrays. These arrays will contain which assets have changed,
/// be it names of scripts, notes, or Included File paths, as appropriate.

function DynamoGetChangedAssets()
{
    static _scriptArray = [];
    static _fileArray   = [];
    static _noteArray   = [];
    
    static _return = {
        scripts:         _scriptArray,
        files:           _fileArray,
        notes:           _noteArray,
    };
    
    array_resize(_scriptArray, 0);
    array_resize(_fileArray, 0);
    
    var _i = 0;
    repeat(array_length(global.__dynamoScriptArray))
    {
        if (global.__dynamoScriptArray[_i].__HasChanged()) array_push(_scriptArray, string(global.__dynamoScriptArray[_i]));
        ++_i;
    }
    
    var _i = 0;
    repeat(array_length(global.__dynamoFileArray))
    {
        if (global.__dynamoFileArray[_i].__HasChanged()) array_push(_fileArray, string(global.__dynamoFileArray[_i]));
        ++_i;
    }
    
    var _i = 0;
    repeat(array_length(global.__dynamoNoteArray))
    {
        if (global.__dynamoNoteArray[_i].__HasChanged()) array_push(_noteArray, string(global.__dynamoNoteArray[_i]));
        ++_i;
    }
    
    return _return;
}

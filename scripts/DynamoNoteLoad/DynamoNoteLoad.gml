/// Forces a Note file to be loaded, executing the callback defined for the file via DynamoNote().
/// 
/// @param note

function DynamoNoteLoad(_note)
{
    __DynamoInitialize();
    
    if (!global.__dynamoNoteDataExists)
    {
        __DynamoError("Note data not found, this may indicate a compilation error\nPlease reload your project in the GameMaker IDE\nIf the issue persists, please report this crash");
    }
    
    if (!variable_struct_exists(global.__dynamoNoteAddedStruct, _note))
    {
        __DynamoError("\"", _note, "\" hasn't been added with DynamoNote()");
    }
    
    global.__dynamoNoteStruct[$ _note].__Load();
}
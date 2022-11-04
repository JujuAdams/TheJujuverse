/// Returns whether the Note asset on disk has changed since the last time Dynamo loaded it. If
/// your game isn't running from the IDE or DYNAMO_ENABLED is set to <false> this function will
/// always return <false>.
/// 
/// @param note

function DynamoNoteChanged(_note)
{
    __DynamoInitialize();
    
    if (!__DYNAMO_DEV_MODE) return false;
    
    if (!global.__dynamoNoteDataExists)
    {
        __DynamoError("Note data not found, this may indicate a compilation error\nPlease reload your project in the GameMaker IDE\nIf the issue persists, please report this crash");
    }
    
    if (!variable_struct_exists(global.__dynamoNoteAddedStruct, _note))
    {
        __DynamoError("\"", _note, "\" hasn't been added with DynamoNote()");
    }
    
    return global.__dynamoNoteStruct[$ _note].__HasChanged();
}
/// Forces Dynamo to scan all watched assets (scripts, Notes, and Included Files). Any assets
/// that have changed will be reloaded. If DYNAMO_AUTO_SCAN is set to <true> then you don't
/// need to call this function as Dynamo will constantly scan assets for you.

function DynamoForceScan()
{
    if (!__DYNAMO_DEV_MODE) return undefined;
    
    var _i = 0;
    repeat(array_length(global.__dynamoScriptArray))
    {
        if (global.__dynamoScriptArray[_i].__HasChanged()) global.__dynamoScriptArray[_i].__Load();
        ++_i;
    }
    
    var _i = 0;
    repeat(array_length(global.__dynamoFileArray))
    {
        if (global.__dynamoFileArray[_i].__HasChanged()) global.__dynamoFileArray[_i].__Load();
        ++_i;
    }
    
    var _i = 0;
    repeat(array_length(global.__dynamoNoteArray))
    {
        if (global.__dynamoNoteArray[_i].__HasChanged()) global.__dynamoNoteArray[_i].__Load();
        ++_i;
    }
}
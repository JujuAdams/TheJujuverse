// Feather disable all
/// Returns the project directory, or <undefined> if Dynamo is disabled (e.g. the game is running
/// outside of the GameMaker IDE).

function DynamoProjectDirectory()
{
    static _result = __DYNAMO_DEV_MODE? __DynamoState().__projectDirectory : undefined;
    return _result;
}

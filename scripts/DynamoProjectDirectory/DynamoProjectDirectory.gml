/// Returns the project directory, or <undefined> if Dynamo is disabled (e.g. the game is running
/// outside of the GameMaker IDE).

function DynamoProjectDirectory()
{
    return __DYNAMO_DEV_MODE? global.__dynamoProjectDirectory : undefined;
}
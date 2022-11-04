/// Returns whether Dynamo's live update features are enabled.

function DynamoLiveUpdateEnabled()
{
    return __DYNAMO_DEV_MODE;
}
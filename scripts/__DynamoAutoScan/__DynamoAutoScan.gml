function __DynamoAutoScan()
{
    if (!__DYNAMO_DEV_MODE || !DYNAMO_AUTO_SCAN) return;
    
    if (!DYNAMO_AUTO_PROGRESSIVE_SCAN && (os_type == os_windows))
    {
        //Track whether the window focus has changed
        var _focus = window_has_focus();
        
        if (global.__dynamoInFocus != _focus)
        {
            global.__dynamoInFocus = _focus;
        
            //If the focus *has* changed and we're now in focus then check for changes
            if (_focus) DynamoForceScan();
        }
    }
    else if (DYNAMO_AUTO_PROGRESSIVE_SCAN || (os_type == os_macosx))
    {
        //We have to use progressive scanning on Mac because YoYoGames are idiots and can't make a simple function like window_has_focus() work
        var _count = array_length(global.__dynamoTrackingArray);
        if (_count <= 0) return;
        global.__dynamoCheckIndex = (global.__dynamoCheckIndex + 1) mod _count;
        
        if (global.__dynamoTrackingArray[global.__dynamoCheckIndex].__HasChanged())
        {
            if (DYNAMO_VERBOSE) __DynamoTrace("Change found in \"", global.__dynamoTrackingArray[global.__dynamoCheckIndex].__name, "\" during progressive scan");
            DynamoForceScan();
        }
    }
}
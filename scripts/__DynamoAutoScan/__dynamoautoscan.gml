function __DynamoAutoScan()
{
    if (!__DYNAMO_DEV_MODE || !DYNAMO_AUTO_SCAN) return;
    
    static _trackingArray = __DynamoState().__trackingArray;
    static _prevFocus  = true;
    static _checkIndex = 0;
    
    if (!DYNAMO_AUTO_SCAN_PROGRESSIVE && (os_type == os_windows))
    {
        //Track whether the window focus has changed
        if (_prevFocus != window_has_focus())
        {
            _prevFocus = window_has_focus();
            //If the focus *has* changed and we're now in focus then check for changes
            if (_prevFocus) DynamoForceScan();
        }
    }
    else if (DYNAMO_AUTO_SCAN_PROGRESSIVE || (os_type == os_macosx))
    {
        //We have to use progressive scanning on Mac because YoYoGames are idiots and can't make a simple function like window_has_focus() work
        var _count = array_length(_trackingArray);
        if (_count <= 0) return;
        _checkIndex = (_checkIndex + 1) mod _count;
        
        if (_trackingArray[_checkIndex].__TestHashDifferent())
        {
            if (DYNAMO_VERBOSE) __DynamoTrace("Change found in \"", _trackingArray[_checkIndex].__name, "\" during progressive scan");
            DynamoForceScan();
        }
    }
}
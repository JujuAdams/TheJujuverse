/// Returns the callback for execution when a data update occurs

function VinylUpdateCallbackGet()
{
    static _globalData = __VinylGlobalData();
    return _globalData.__updateCallback;
}
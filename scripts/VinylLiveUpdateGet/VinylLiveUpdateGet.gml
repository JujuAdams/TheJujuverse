/// Returns whether live update is enabled

function VinylLiveUpdateGet()
{
    static _globalData = __VinylGlobalData();
    if (!__VinylGetLiveUpdateEnabled()) return false;
    return _globalData.__liveUpdate;
}
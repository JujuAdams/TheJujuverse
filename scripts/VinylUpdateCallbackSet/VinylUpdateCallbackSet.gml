/// Sets a callback for execution when a data update occurs
/// 
///    N.B. The callback will be automatically executed once on boot when Vinyl initializes
///         The callback will be automatically executed for any subsequent successful live updates
///         The callback will *not* be executed by VinylSystemReadConfig()
/// 
/// @param function

function VinylUpdateCallbackSet(_function)
{
    static _globalData = __VinylGlobalData();
    _globalData.__updateCallback = _function;
}
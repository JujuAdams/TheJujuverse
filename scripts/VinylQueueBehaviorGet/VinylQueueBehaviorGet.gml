/// Returns the current behaviour for a Queue voice
/// 
/// The value returned can be one of the following:
/// 
///   0 = Play the queue once. Assets will be removed from the queue once they finish playing
///   1 = Repeat the queue once it’s finished. No assets are removed from the queue, and the queue
///       will replay from the start
///   2 = Repeat the last asset in the queue. Assets will be removed from the queue once they
///       finish playing (apart from the last asset)
/// 
/// @param vinylID
/// @param behavior

function VinylQueueBehaviorGet(_id)
{
    static _globalData = __VinylGlobalData();
    static _idToVoiceDict = _globalData.__idToVoiceDict;
    
    var _voice = _idToVoiceDict[? _id];
    if (is_struct(_voice)) return _voice.__QueueBehaviorGet();
}
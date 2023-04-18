/// Returns the number of voice IDs being played for a given label
/// 
/// @param labelName

function VinylLabelVoiceCountGet(_id)
{
    static _globalData = __VinylGlobalData();
    
    if (_id == undefined) return 0;
    
    var _label = _globalData.__labelDict[$ _id];
    return is_struct(_label)? array_length(_label.__topLevelArray) : 0;
}
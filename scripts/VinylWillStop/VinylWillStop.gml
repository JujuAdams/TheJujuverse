// Feather disable all

/// Returns whether the target voice will stop playing imminently. The tolerance for this test is
/// set by the VINYL_WILL_STOP_TOLERANCE macro (see __VinylConfigMacros()).
/// 
/// @param voice

function VinylWillStop(_voice)
{
    static _voiceToStructMap = __VinylSystem().__voiceToStructMap;
    
    var _voiceStruct = _voiceToStructMap[? _voice];
    if (_voiceStruct == undefined)
    {
        return __VinylWillStop(_voice);
    }
    else
    {
        return _voiceStruct.__WillStop();
    }
}
// Feather disable all

/// Adds a callback to a voice such that when the voice is stopped (or faded out) then the callback
/// is executed. You can optionally provide some metadata - this is passed into the method as the
/// first argument. If no metadata is provided then <undefined> is passed to the function. Calling
/// this function twice will replace the old callback with the new one. You can detach a callback
/// from a voice by using <undefined> as the method.
/// 
/// @param voice
/// @param method
/// @param [metadata]

function VinylCallbackOnStop(_voice, _method, _metadata)
{
    static _callbackArray = __VinylSystem().__callbackArray;
    static _nullVoice     = __VinylSystem().__nullVoice;
    
    if (_voice == undefined) return;
    
    //Ensure we have a struct for this voice
    var _voiceStruct = __VinylEnsureSoundVoice(_voice);
    if (_voiceStruct == _nullVoice) return;
    
    if (_method == undefined)
    {
        //Find any mention of this voice and delete it
        var _i = 0;
        repeat(array_length(_callbackArray))
        {
            var _callbackData = _callbackArray[_i];
            if (_callbackData.__voiceStruct == _voiceStruct)
            {
                array_delete(_callbackArray, _i, 1);
                return;
            }
            else
            {
                ++_i;
            }
        }
    }
    else
    {
        //Try to find the voice first and replace the method
        var _i = 0;
        repeat(array_length(_callbackArray))
        {
            var _callbackData = _callbackArray[_i];
            if (_callbackData.__voiceStruct == _voiceStruct)
            {
                _callbackData.__method   = _method;
                _callbackData.__metadata = _metadata;
                return;
            }
            
            ++_i;
        }
        
        //If we can't find the voice then push a new struct for it
        array_push(_callbackArray, {
            __voiceStruct: _voiceStruct,
            __method:      _method,
            __metadata:    _metadata,
        });
    }
}
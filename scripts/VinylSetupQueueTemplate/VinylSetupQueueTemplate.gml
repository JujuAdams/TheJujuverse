// Feather disable all

/// @param queueTemplateName
/// @param soundArray
/// @param behaviour
/// @param loopQueue
/// @param [emitterAlias]

function VinylSetupQueueTemplate(_queueTemplateName, _soundArray, _behaviour, _loopQueue, _emitterAlias = undefined)
{
    static _system = __VinylSystem();
    static _queueTemplateDict = _system.__queueTemplateDict;
    
    //Update an existing pattern if possible, otherwise make a new pattern
    var _existingPattern = _queueTemplateDict[$ _queueTemplateName];
    if (_existingPattern != undefined)
    {
        _existingPattern.__UpdateSetup(_soundArray, _behaviour, _loopQueue, _emitterAlias);
    }
    else
    {
        _queueTemplateDict[$ _queueTemplateName] = new __VinylClassQueueTemplate(_queueTemplateName, _soundArray, _behaviour, _loopQueue, _emitterAlias);
    }
    
    if (VINYL_LIVE_EDIT && (not _system.__importingJSON))
    {
        __VinylResolveChanges(false);
    }
}
function __VinylGlobalData()
{
    static _struct = {
        __frame: 0,
        
        __liveUpdate: (VINYL_LIVE_UPDATE_PERIOD > 0),
        __updateCallback: undefined,
        
        __listenerX: 0,
        __listenerY: 0,
        
        __idToVoiceDict: ds_map_create(),
        
        __transpose: 0,
        
        __poolAsset:      new __VinylClassPool(91000000, __VinylClassVoiceAsset),
        __poolBasic:      new __VinylClassPool(92000000, __VinylClassVoiceBasic),
        __poolQueue:      new __VinylClassPool(93000000, __VinylClassVoiceQueue),
        __poolMulti:      new __VinylClassPool(94000000, __VinylClassVoiceMulti),
        __poolEmitter:    new __VinylClassPool(95000000, __VinylClassEmitter),
        __poolPanEmitter: new __VinylClassPool(96000000, __VinylClassPanEmitter),
        
        __topLevelArray: [],
        __emitterRefArray: [],
        
        __patternDict:  {},
        __patternArray: [],
        
        __labelDict:  {},
        __labelArray: [],
        
        __effectChainDict:  {},
        __effectChainArray: [],
        
        __knobDict:  {},
        __knobArray: [],
        
        __stackDict:  {},
        __stackArray: [],
        
        __animCurveDict: {},
        __animCurveArray: [],
    };
    
    return _struct;
}
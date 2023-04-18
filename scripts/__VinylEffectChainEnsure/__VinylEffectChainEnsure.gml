/// @param name

function __VinylEffectChainEnsure(_name)
{
    static _globalData       = __VinylGlobalData();
    static _effectChainDict  = _globalData.__effectChainDict;
    static _effectChainArray = _globalData.__effectChainArray;
    
    var _effectChain = _effectChainDict[$ _name];
    if (!is_struct(_effectChain))
    {
        _effectChain = new __VinylClassEffectChain(_name);
        _effectChainDict[$ _name] = _effectChain;
        array_push(_effectChainArray, _effectChain);
    }
    
    return _effectChain;
}
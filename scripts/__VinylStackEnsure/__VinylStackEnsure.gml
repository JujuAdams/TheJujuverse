/// @param name

function __VinylStackEnsure(_name)
{
    static _globalData = __VinylGlobalData();
    static _stackDict  = _globalData.__stackDict;
    static _stackArray = _globalData.__stackArray;
    
    var _stack = _stackDict[$ _name];
    if (!is_struct(_stack))
    {
        _stack = new __VinylClassStack(_name);
        _stackDict[$ _name] = _stack;
        array_push(_stackArray, _stack);
    }
    
    return _stack;
}
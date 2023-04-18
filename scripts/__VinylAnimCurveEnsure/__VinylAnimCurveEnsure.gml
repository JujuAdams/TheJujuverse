/// @param animCurveName

function __VinylAnimCurveEnsure(_animCurveName)
{
    static _globalData = __VinylGlobalData();
    static _dict       = _globalData.__animCurveDict;
    static _array      = _globalData.__animCurveArray;
    
    var _animCurve = _dict[$ _animCurveName];
    if (!is_struct(_animCurve))
    {
        _animCurve = new __VinylClassAnimCurve(_animCurveName);
        _dict[$ _animCurveName] = _animCurve;
        array_push(_array, _animCurve);
    }
    
    return _animCurve;
}
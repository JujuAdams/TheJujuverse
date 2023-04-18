/// @param name
/// @param data
/// @param adHoc
/// @param child

function __VInylPatternCreate(_patternName, _patternData, _adHoc, _child)
{
    var _constructor = __VinylConvertPatternNameToConstructor(_patternName, _patternData[$ "type"]);
    var _newPattern = new _constructor(_patternName, _adHoc, _child);
    _newPattern.__Initialize(_patternData);
    _newPattern.__Store();
    
    return _newPattern;
}
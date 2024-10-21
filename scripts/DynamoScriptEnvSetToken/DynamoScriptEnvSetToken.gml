// Feather disable all

/// @param token
/// @param value

function DynamoScriptEnvSetToken(_token, _value)
{
    static _globalTokenStruct = __DynamoState().__globalTokenStruct;
    
    _globalTokenStruct[$ _token] = method(
    {
        __value: _value,
    },
    function()
    {
        return __value;
    });
}
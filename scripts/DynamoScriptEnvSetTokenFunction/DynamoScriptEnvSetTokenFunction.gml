// Feather disable all

/// @param token
/// @param function
/// @param [metadata=undefined]

function DynamoScriptEnvSetTokenFunction(_token, _function, _metadata = undefined)
{
    static _globalTokenStruct = __DynamoState().__globalTokenStruct;
    
    _globalTokenStruct[$ _token] = method(
    {
        __function: _function,
        __metadata: _metadata,
    },
    function()
    {
        return __function(__metadata);
    });
}
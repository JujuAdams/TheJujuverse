/// Returns whether the Steam API has been initialized...
/// ...without crashing the game if the Steam API isn't in use to begin with

function SnitchSteamInitializedSafe()
{
    static _state = undefined;
    if (_state == undefined)
    {
        try
        {
            var _initialized = steam_initialised();
            _state = true;
            return _initialized;
        }
        catch(_error)
        {
           _state = false;
            return false;
        }
    }
    else if (_state)
    {
        return steam_initialised();
    }
    else
    {
        return false;
    }
}
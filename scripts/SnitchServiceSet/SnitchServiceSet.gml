/// Sets whether Snitch should enable services
///   N.B. Services cannot be enabled unless the relevant macros in __SnitchConfigServices() are set to <true>
/// 
/// @param state

function SnitchServiceSet(_state)
{
    __SnitchInit();
    
    if (SnitchServiceGet() != _state)
    {
        if (_state)
        {
            if (SNITCH_SERVICE_MODE > 0)
            {
                global.__snitchServiceEnabled = _state;
                __SnitchTrace(__SnitchServiceName(), " service turned ", global.__snitchServiceEnabled? "on" : "off");
            }
        }
        else
        {
            __SnitchTrace("Service cannot be toggled as no service has been enabled (see SNITCH_SERVICE_MODE)");
        }
    }
}
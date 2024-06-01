// Feather disable all
/// Sets whether Snitch should enable services
///   N.B. Services cannot be enabled unless the relevant macros in __SnitchConfigServices() are set to <true>
/// 
/// @param state

function SnitchServiceSet(_state)
{
    static _snitchState = __SnitchState();
    
    if (SnitchServiceGet() != _state)
    {
        if (_state)
        {
            if (SNITCH_SERVICE_MODE > 0)
            {
                _snitchState.__ServiceEnabled = _state;
                __SnitchTrace(__SnitchServiceName(), " service turned ", _snitchState.__ServiceEnabled? "on" : "off");
            }
            else
            {
                __SnitchTrace("Service cannot be toggled as no service has been enabled (see SNITCH_SERVICE_MODE)");
            }
        }
    }
}

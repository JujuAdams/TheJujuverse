// Feather disable all
/// @desc    Sets the target gamepad index for the binding. This is only relevant in the MULTIDEVICE source mode
/// @param   binding
/// @param   gamepadIndex

function input_binding_gamepad_set(_binding, _gamepad_index)
{
    __INPUT_GLOBAL_STATIC_LOCAL  //Set static _global
    
    if (!input_value_is_binding(_binding))
    {
        __input_error("Parameter is not a binding (typeof=", typeof(_binding), ")");
        return;
    }
    
    _binding.__gamepad_set(_gamepad_index);
}

// Feather disable all

function __ScribblejrClearCache()
{
    static _system = __ScribblejrSystem();
    with(_system)
    {
        var _i = 0;
        repeat(array_length(__elementsArray))
        {
            var _element = __elementsArray[_i];
            
            variable_struct_remove(__wrappersCache, _element.__key);
            _element.__Destroy();
            
            ++_i;
        }
        
        array_resize(__elementsArray, 0);
    }
}
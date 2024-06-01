// Feather disable all

function __ScribblejrClassWrapper(_element) constructor
{
    __element = _element;
    
    static Draw = function(_x, _y, _colour, _alpha, _sdfEffects)
    {
        __element.Draw(_x, _y, _colour, _alpha, _sdfEffects);
        __element.__lastDraw = current_time;
    }
    
    static Bake = function()
    {
        __element.__Bake();
    }
    
    static GetWidth = function(_x, _y, _colour, _alpha)
    {
        return __element.GetWidth();
    }
    
    static GetHeight = function(_x, _y, _colour, _alpha)
    {
        return __element.GetHeight();
    }
}
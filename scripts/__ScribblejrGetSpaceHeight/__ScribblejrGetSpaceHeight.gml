function __ScribblejrGetSpaceHeight(_font)
{
    static _system = __ScribblejrSystem();
    static _cache  = _system.__cacheSpaceHeight;
    
    var _name = font_get_name(_font);
    
    var _spaceWidth = _cache[$ _name];
    if (_spaceWidth == undefined)
    {
        var _oldFont = draw_get_font();
        draw_set_font(_font);
        //I'd love to pull this out of the glyph data but the values we get are inaccurate
        _spaceWidth = string_height(" ");
        draw_set_font(_oldFont);
        
        _cache[$ _name] = _spaceWidth;
    }
    
    return _spaceWidth;
}
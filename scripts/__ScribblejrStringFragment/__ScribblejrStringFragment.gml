function __ScribblejrStringFragment(_string, _lineHeight, _spriteScale, _startColour, _fragmentArray, _spriteArray)
{
    static _colourDict = __ScribblejrSystem().__colourDict;
            
    var _colour = _startColour;
    var _substringArray = string_split(_string, "[");
            
    //Handle the first text fragment
    var _textString = _substringArray[0];
    if (_textString != "")
    {
        var _width = string_width(_textString);
                
        array_push(_fragmentArray, {
            __colour: _colour,
            __string: _textString,
            __x:      0,
            __y:      0,
            __width:  _width,
        });
                
        var _x = _width;
    }
    else
    {
        var _x = 0;
    }
            
    //Then iterate other command tag + text fragment combos, splitting as necessary
    var _i = 1;
    repeat(array_length(_substringArray)-1)
    {
        var _tagSplitArray = string_split(_substringArray[_i], "]", false, 1);
        if (array_length(_tagSplitArray) == 2)
        {
            //Handle the contents of the tag
            var _tagString = _tagSplitArray[0];
                    
            //First we try to find the colour state
            var _foundColour = _colourDict[$ _tagString];
            if (_foundColour != undefined)
            {
                _colour = _foundColour;
            }
            else
            {
                var _spriteSplitArray = string_split(_tagString, ",");
                        
                //Then we try to find a sprite using the command tag
                var _sprite = asset_get_index(_spriteSplitArray[0]);
                if (sprite_exists(_sprite))
                {
                    //Decode sprite arguments
                    switch(array_length(_spriteSplitArray))
                    {
                        case 1:
                            var _spriteImage = 0;
                            var _spriteX     = 0;
                            var _spriteY     = 0;
                        break;
                                
                        case 2:
                            var _spriteImage = real(_spriteSplitArray[1]);
                            var _spriteX     = 0;
                            var _spriteY     = 0;
                        break;
                                
                        case 3:
                            var _spriteImage = real(_spriteSplitArray[1]);
                            var _spriteX     = real(_spriteSplitArray[2]);
                            var _spriteY     = 0;
                        break;
                                
                        case 4:
                            var _spriteImage = real(_spriteSplitArray[1]);
                            var _spriteX     = real(_spriteSplitArray[2]);
                            var _spriteY     = real(_spriteSplitArray[3]);
                        break;
                    }
                            
                    var _width = _spriteScale*sprite_get_width(_sprite);
                            
                    array_push(_spriteArray, {
                        __sprite: _sprite,
                        __image:  _spriteImage,
                        __x:      _spriteX + _x + _spriteScale*sprite_get_xoffset(_sprite),
                        __y:      _spriteY + 0.5*(_lineHeight - _spriteScale*sprite_get_height(_sprite)) + _spriteScale*sprite_get_yoffset(_sprite),
                        __width:  _width,
                    });
                            
                    _x += _width;
                }
                else
                {
                    __ScribblejrTrace("Command tag \"", _tagString, "\" not recognised");
                }
            }
                    
            //Then we handle the next text fragment
            var _textString = _tagSplitArray[1];
            if (_textString != "")
            {
                var _width = string_width(_textString);
                        
                array_push(_fragmentArray, {
                    __colour: _colour,
                    __string: _tagSplitArray[1],
                    __x:      _x,
                    __y:      0,
                    __width:  _width,
                });
                        
                _x += _width;
            }
        }
                
        ++_i;
    }
            
    return _x;
}
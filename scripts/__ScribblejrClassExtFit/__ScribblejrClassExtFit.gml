/// @param key
/// @param string
/// @param hAlign
/// @param vAlign
/// @param font
/// @param fontScale
/// @param maxWidth
/// @param maxHeight

function __ScribblejrClassExtFit(_key, _string, _hAlign, _vAlign, _font, _fontScale, _maxWidth, _maxHeight) : __ScribblejrClassBase() constructor
{
    static _system     = __ScribblejrSystem();
    static _colourDict = _system.__colourDict;
    
    static _dropShadowEnableHash = variable_get_hash("dropShadowEnable");
    
    __wrapper = undefined;
    __lastDraw = current_time;
    
    __key       = _key;
    __string    = _string;
    __hAlign    = _hAlign;
    __vAlign    = _vAlign;
    __font      = _font;
    __scale     = _fontScale;
    __fontScale = _fontScale;
    
    __fontIsDynamic = ScribblejrCacheFontInfo(_font).__isDynamic;
    __fontIsSDF     = ScribblejrCacheFontInfo(_font).sdfEnabled;
    __fontSDFSpread = ScribblejrCacheFontInfo(_font).sdfSpread;
    
    __fragmentArray = [];
    __spriteArray   = [];
    
    __vertexBuffer = undefined;
    __vertexBaker  = new __ScribblejrClassBakerExt(__fragmentArray, _font);
    __fontTexture  = ScribblejrCacheFontInfo(_font).__forcedTexturePointer;
    
    var _layoutArray = [];
    
    __width  = undefined;
    __height = undefined;
    
    Draw = __DrawNative;
        
    var _spriteScale = (SCRIBBLEJR_SCALE_SPRITES? 1 : (1/_fontScale)) / SCRIBBLEJR_GLOBAL_FONT_SCALE;
    var _referenceSpaceWidth  = __ScribblejrGetSpaceWidth(_font);
    var _lineHeight  = __ScribblejrGetSpaceHeight(_font);
    
    if (SCRIBBLEJR_AUTO_RESET_DRAW_STATE) var _oldFont = draw_get_font();
    draw_set_font(_font);
    
    if (_system.__perCharacterWrap)
    {
        #region Per-Character Wrap
        
        var _newlineLayoutCountArray = [];
        
        var _inTag    = false;
        var _tagStart = undefined;
        
        var _fastGlyphs = ScribblejrCacheFontInfo(_font).fastGlyphs;
        var _colour = -1;
        
        var _tagConcatArray = [];
        var _tagArgumentArray = [];
        var _unicodeArray = __ScribblejrStringDecompose(_string);
        array_push(_unicodeArray, 0x20); //End in a space
        
        //Add a dummy layout fragment to simply some of the logic during parsing
        array_push(_layoutArray, {
            __whitespace: true,
            __joinsRight: false,
        });
        
        var _cursorX = 0;
        var _i = 0;
        repeat(array_length(_unicodeArray)-1) //Don't include the final space
        {
            var _char = ord(_unicodeArray[_i]);
            
            if (_char == 0x0A)
            {
                array_push(_newlineLayoutCountArray, array_length(_layoutArray)-1); //Off by one to compensate for dummy layout
            }
            else if (_char == 0x5B) // [
            {
                if ((_i == 0) || (ord(_unicodeArray[_i-1]) != 0x5B))
                {
                    _inTag = true;
                    _tagStart = _i+1;
                    array_resize(_tagArgumentArray, 0);
                }
                else
                {
                    _inTag = false;
                    _tagStart = undefined;
                    
                    var _glyphInfo = struct_get_from_hash(_fastGlyphs, 0x5B);
                    var _fragment = {
                        __colour: _colour,
                        __string: "[",
                        __x: undefined,
                        __y: undefined,
                        __xOffset: 0,
                        __yOffset: 0,
                        __width: _glyphInfo.w,
                        __shift: _glyphInfo.shift,
                        __whitespace: false,
                    };
                }
            }
            else if (_inTag)
            {
                if (_char == 0x5D) // ]
                {
                    array_resize(_tagConcatArray, _i - _tagStart);
                    array_copy(_tagConcatArray, 0, _unicodeArray, _tagStart, _i - _tagStart);
                    array_push(_tagArgumentArray, string_concat_ext(_tagConcatArray));
                    
                    _inTag = false;
                    _tagStart = undefined;
                    
                    var _firstArg = _tagArgumentArray[0];
                    
                    //First we try to find the colour state
                    var _foundColour = _colourDict[$ _firstArg];
                    if (_foundColour != undefined)
                    {
                        _colour = _foundColour;
                    }
                    else
                    {
                        //Then we try to find a sprite using the command tag
                        var _sprite = asset_get_index(_firstArg);
                        if (sprite_exists(_sprite))
                        {
                            //Decode sprite arguments
                            switch(array_length(_tagArgumentArray))
                            {
                                case 1:
                                    var _spriteImage = 0;
                                    var _spriteX     = 0;
                                    var _spriteY     = 0;
                                break;
                                
                                case 2:
                                    var _spriteImage = real(_tagArgumentArray[1]);
                                    var _spriteX     = 0;
                                    var _spriteY     = 0;
                                break;
                                
                                case 3:
                                    var _spriteImage = real(_tagArgumentArray[1]);
                                    var _spriteX     = real(_tagArgumentArray[2]);
                                    var _spriteY     = 0;
                                break;
                                
                                case 4:
                                    var _spriteImage = real(_tagArgumentArray[1]);
                                    var _spriteX     = real(_tagArgumentArray[2]);
                                    var _spriteY     = real(_tagArgumentArray[3]);
                                break;
                            }
                            
                            var _fragment = {
                                __sprite: _sprite,
                                __image: _spriteImage,
                                __x: undefined,
                                __y: undefined,
                                __xOffset: _spriteX + _spriteScale*sprite_get_xoffset(_sprite),
                                __yOffset: _spriteY + 0.5*(_lineHeight - _spriteScale*sprite_get_height(_sprite)) + _spriteScale*sprite_get_yoffset(_sprite),
                                __width: _spriteScale*sprite_get_width(_sprite),
                                __shift: _spriteScale*sprite_get_width(_sprite),
                                __whitespace: false,
                                __joinsRight: true,
                            };
                            
                            array_push(_layoutArray, _fragment);
                            array_push(__spriteArray, _fragment);
                        }
                        else
                        {
                            __ScribblejrTrace("Command tag ", _tagArgumentArray, " not recognised");
                        }
                    }
                }
                else if (_char == 0x2C) // ,
                {
                    array_resize(_tagConcatArray, _i - _tagStart);
                    array_copy(_tagConcatArray, 0, _unicodeArray, _tagStart, _i - _tagStart);
                    array_push(_tagArgumentArray, string_concat_ext(_tagConcatArray));
                    
                    _tagStart = _i+1;
                }
            }
            else if (_char <= 0x20)
            {
                var _fragment = {
                    __x: 0,
                    __y: 0,
                    __xOffset: 0,
                    __yOffset: 0,
                    __width: _referenceSpaceWidth,
                    __shift: _referenceSpaceWidth,
                    __whitespace: true,
                };
                
                var _layoutCount = array_length(_layoutArray);
                _layoutArray[_layoutCount-1].__joinsRight = false;
                
                array_push(_layoutArray, _fragment);
            }
            else if (_char > 0x20)
            {
                var _glyphInfo = struct_get_from_hash(_fastGlyphs, _char);
                var _fragment = {
                    __colour: _colour,
                    __string: chr(_char),
                    __x: undefined,
                    __y: undefined,
                    __xOffset: 0,
                    __yOffset: 0,
                    __width: _glyphInfo.w,
                    __shift: _glyphInfo.shift,
                    __whitespace: false,
                    __joinsRight: false,
                };
                
                array_push(_layoutArray, _fragment);
                array_push(__fragmentArray, _fragment);
            }
            
            ++_i;
        }
        
        array_push(_newlineLayoutCountArray, infinity);
        
        //Delete the dummy layout fragment
        array_delete(_layoutArray, 0, 1);
        
        //Ensure the final fragment terminates a stretch
        _layoutArray[array_length(_layoutArray)-1].__joinsRight = false;
        
        var _overallWidth = 0;
    
        var _tryScale   = _fontScale;
        var _upperScale = _fontScale;
        var _lowerScale = 0.1;
    
        var _iterations = 0;
        while(_iterations < SCRIBBLEJR_FIT_ITERATIONS)
        {
            //TODO - Set up special "last iteration" loop
            var _lastIteration = (_iterations >= SCRIBBLEJR_FIT_ITERATIONS-1);
            
            var _adjustedWidth  = _maxWidth/_tryScale;
            var _adjustedHeight = _maxHeight/_tryScale;
            
            var _cursorX = 0;
            var _cursorY = 0;
            
            var _lineStart = 0;
            var _longWord = false;
            
            var _stretchStart = 0;
            var _stretchWidth = 0;
            
            var _newlineIndex = 0;
            var _nextNewlineLayoutIndex = _newlineLayoutCountArray[_newlineIndex];
            
            var _i = 0;
            repeat(array_length(_layoutArray))
            {
                while(_i == _nextNewlineLayoutIndex)
                {
                    _cursorX       = 0;
                    _cursorY      += _lineHeight;
                    _stretchWidth  = 0;
                    _stretchStart  = _i;
                    
                    ++_newlineIndex;
                    _nextNewlineLayoutIndex = _newlineLayoutCountArray[_newlineIndex];
                }
                
                var _fragment = _layoutArray[_i];
                if (_fragment.__whitespace)
                {
                    _cursorX += _fragment.__shift;
                }
                else
                {
                    if (_lastIteration)
                    {
                        _fragment.__x = _stretchWidth + _fragment.__xOffset;
                    }
                    
                    if (_fragment.__joinsRight)
                    {
                        _stretchWidth += _fragment.__shift;
                    }
                    else
                    {
                        _stretchWidth += _fragment.__width;
                        
                        if (_cursorX + _stretchWidth > _adjustedWidth)
                        {
                            if (_cursorX == 0)
                            {
                                //Single word is bigger than the width
                                _longWord = true;
                                
                                if (_lastIteration)
                                {
                                    _overallWidth = max(_overallWidth, _stretchWidth);
                                    
                                    var _j = _stretchStart;
                                    repeat(1 + _i - _stretchStart)
                                    {
                                        with(_layoutArray[_j])
                                        {
                                            __x += _cursorX;
                                            __y  = _cursorY + __yOffset;
                                        }
                                        
                                        ++_j;
                                    }
                                }
                            }
                            else
                            {
                                if (_lastIteration)
                                {
                                    _overallWidth = max(_overallWidth, _cursorX);
                                    
                                    //Sort out the horizontal alignment for the current line
                                    if (_hAlign == fa_center)
                                    {
                                        var _j = _lineStart;
                                        repeat(_stretchStart - _lineStart)
                                        {
                                            with(_layoutArray[_j]) __x -= _cursorX/2;
                                            ++_j;
                                        }
                                    }
                                    else if (_hAlign == fa_right)
                                    {
                                        var _j = _lineStart;
                                        repeat(_stretchStart - _lineStart)
                                        {
                                            with(_layoutArray[_j]) __x -= _cursorX;
                                            ++_j;
                                        }
                                    }
                            
                                    _lineStart  = _stretchStart;
                                }
                                
                                _cursorX  = 0;
                                _cursorY += _lineHeight;
                                
                                if (_lastIteration)
                                {
                                    var _j = _stretchStart;
                                    repeat(1 + _i - _stretchStart)
                                    {
                                        with(_layoutArray[_j]) __y = _cursorY + __yOffset;
                                        ++_j;
                                    }
                                }
                            }
                        }
                        else
                        {
                            //Stretch fits on the same line
                            if (_lastIteration)
                            {
                                var _j = _stretchStart;
                                repeat(1 + _i - _stretchStart)
                                {
                                    with(_layoutArray[_j])
                                    {
                                        __x += _cursorX;
                                        __y  = _cursorY + __yOffset;
                                    }
                            
                                    ++_j;
                                }
                            }
                        }
                        
                        _cursorX      += _stretchWidth + (_fragment.__shift - _fragment.__width);
                        _stretchWidth  = 0;
                        _stretchStart  = _i+1;
                    }
                }
            
                ++_i;
            }
        
            if (_lastIteration)
            {
                _overallWidth = max(_overallWidth, _cursorX);
                
                //Sort out the horizontal alignment for the last line (only on the last iteration though)
                if ((_hAlign == fa_center) || (_hAlign == fa_right))
                {
                    var _offset = (_hAlign == fa_center)? (_overallWidth/2) : _overallWidth;
                    var _j = _lineStart;
                    repeat(_stretchStart - _lineStart)
                    {
                        with(_layoutArray[_j]) __x -= _offset;
                        ++_j;
                    }
                }
            }
            
            //Determine if this iteration should be the new upper or lower bound based on whether we
            //exceeded the height limit
            var _overallHeight = _cursorY + _lineHeight;
            if (_longWord || (_overallHeight > _adjustedHeight))
            {
                _upperScale = _tryScale;
            }
            else
            {
                _lowerScale = _tryScale;
                
                //We start at the base starting scale in the first (0th) iteration. If we already fit
                //into the bounding box then we can skip a lot of iterations
                if (_iterations == 0) _iterations = SCRIBBLEJR_FIT_ITERATIONS-2;
            }
            
            //Ensure the final iteration uses a valid scale
            if (_iterations >= SCRIBBLEJR_FIT_ITERATIONS-2)
            {
                _tryScale = _lowerScale;
            }
            else
            {
                //Bias scale search very slighty to be larger
                //This usually finds the global maxima rather than narrowing down on a local maxima
                _tryScale = lerp(_lowerScale, _upperScale, 0.51);
            }
            
            ++_iterations;
        }
        
        //Adjust for vertical alignment
        if ((_vAlign == fa_middle) || (_vAlign == fa_bottom))
        {
            var _offset = (_vAlign == fa_middle)? (_overallHeight/2) : _overallHeight;
            var _i = 0;
            repeat(array_length(_layoutArray))
            {
                with(_layoutArray[_i]) __y -= _offset;
                ++_i;
            }
        }
        
        #endregion
    }
    else
    {
        #region Per-Word Wrap
            
        var _colour = -1;
        
        var _manualLineArray = string_split(_string, "\n");
        var _newlineLayoutCountArray = array_create(array_length(_manualLineArray)+1, infinity);
        
        var _lineIndex = 0;
        repeat(array_length(_manualLineArray))
        {
            var _lineString = _manualLineArray[_lineIndex];
            
            var _substringArray = string_split(_lineString, "[");
            _substringArray[0] = "]" + _substringArray[0];
            
            //Then iterate other command tag + text fragment combos, splitting as necessary
            var _i = 0;
            repeat(array_length(_substringArray))
            {
                var _tagSplitArray = string_split(_substringArray[_i], "]", false, 1);
                if (array_length(_tagSplitArray) == 2)
                {
                    //Handle the contents of the tag
                    var _tagString  = _tagSplitArray[0];
                    var _textString = _tagSplitArray[1];
                    
                    if (_tagString != "")
                    {
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
                                
                                var _fragment = {
                                    __sprite:  _sprite,
                                    __image:   _spriteImage,
                                    __x:       0,
                                    __y:       0,
                                    __xOffset: _spriteX + _spriteScale*sprite_get_xoffset(_sprite),
                                    __yOffset: _spriteY + 0.5*(_lineHeight - _spriteScale*sprite_get_height(_sprite)) + _spriteScale*sprite_get_yoffset(_sprite),
                                    __width:   _spriteScale*sprite_get_width(_sprite),
                                    
                                    __whitespaceFollows: false,
                                };
                                
                                array_push(_layoutArray, _fragment);
                                array_push(__spriteArray, _fragment);
                            }
                            else
                            {
                                __ScribblejrTrace("Command tag \"", _tagString, "\" not recognised");
                            }
                        }
                    }
                    
                    //Then we handle the next text fragment
                    if (_textString != "")
                    {
                        var _splitArray = string_split(_textString, " ");
                        var _splitCount = array_length(_splitArray);
                        var _j = 0;
                        repeat(_splitCount)
                        {
                            var _substring = _splitArray[_j];
                            var _fragment = {
                                __colour:  _colour,
                                __string:  _substring,
                                __x:       0,
                                __y:       0,
                                __xOffset: 0,
                                __yOffset: 0,
                                __width:   string_width(_substring),
                                
                                __whitespaceFollows: (_j < _splitCount-1),
                            };
                            
                            array_push(_layoutArray, _fragment);
                            array_push(__fragmentArray, _fragment);
                            
                            ++_j;
                        }
                    }
                }
                
                ++_i;
            }
            
            _newlineLayoutCountArray[_lineIndex] = array_length(_layoutArray);
            
            array_last(_layoutArray).__whitespaceFollows = true;
            ++_lineIndex;
        }
        
        var _cursorX = 0;
        var _cursorY = 0;
        
        var _lineWidthArray       = []; //TODO - Make these arrays static
        var _lineLayoutStartArray = [];
        
        var _overallWidth = 0;
    
        var _tryScale   = _fontScale;
        var _upperScale = _fontScale;
        var _lowerScale = 0.1;
    
        var _iterations = 0;
        while(true)
        {
            var _adjustedWidth  = _maxWidth/_tryScale;
            var _adjustedHeight = _maxHeight/_tryScale;
            
            var _cursorX        = 0;
            var _cursorY        = 0;
            var _prevSpaceWidth = 0;
            
            var _lineStart = 0;
            var _longWord = false;
            
            var _stretchStart = 0;
            var _stretchWidth = 0;
            
            var _newlineIndex = 0;
            var _nextNewlineLayoutIndex = _newlineLayoutCountArray[_newlineIndex];
            
            if (_iterations >= SCRIBBLEJR_FIT_ITERATIONS-1)
            {
                array_push(_lineLayoutStartArray, 0);
                
                var _stretchStart = 0;
                var _layoutIndex = 0;
                repeat(array_length(_layoutArray))
                {
                    //Manual newlines
                    while(_layoutIndex == _nextNewlineLayoutIndex)
                    {
                        _overallWidth = max(_overallWidth, _cursorX - _prevSpaceWidth);
                        array_push(_lineWidthArray,        _cursorX - _prevSpaceWidth);
                        array_push(_lineLayoutStartArray,  _layoutIndex);
                        
                        _cursorX        = 0;
                        _stretchWidth   = 0;
                        _prevSpaceWidth = 0;
                        _stretchStart   = _layoutIndex;
                        
                        ++_newlineIndex;
                        _nextNewlineLayoutIndex = _newlineLayoutCountArray[_newlineIndex];
                    }
                    
                    var _fragment = _layoutArray[_layoutIndex];
                    _stretchWidth += _fragment.__width;
                    
                    if (_fragment.__whitespaceFollows)
                    {
                        if ((_cursorX > 0) && (_cursorX + _stretchWidth > _adjustedWidth))
                        {
                            _overallWidth = max(_overallWidth, _cursorX - _prevSpaceWidth);
                            array_push(_lineWidthArray,        _cursorX - _prevSpaceWidth);
                            array_push(_lineLayoutStartArray,  _stretchStart);
                            
                            _cursorX = 0;
                        }
                        
                        _cursorX       += _stretchWidth + _referenceSpaceWidth;
                        _prevSpaceWidth = _referenceSpaceWidth;
                        _stretchWidth   = 0;
                        _stretchStart   = _layoutIndex+1;
                    }
                    else
                    {
                        _prevSpaceWidth = 0;
                    }
                    
                    ++_layoutIndex;
                }
                
                if (_layoutIndex > array_last(_lineLayoutStartArray))
                {
                    _overallWidth = max(_overallWidth, _cursorX - _prevSpaceWidth);
                    array_push(_lineWidthArray,        _cursorX - _prevSpaceWidth);
                    array_push(_lineLayoutStartArray,  _layoutIndex);
                }
                
                break;
            }
            else
            {
                var _layoutIndex = 0;
                repeat(array_length(_layoutArray))
                {
                    //Manual newlines
                    while(_layoutIndex == _nextNewlineLayoutIndex)
                    {
                        _cursorX       = 0;
                        _cursorY      += _lineHeight;
                        _stretchWidth  = 0;
                        
                        ++_newlineIndex;
                        _nextNewlineLayoutIndex = _newlineLayoutCountArray[_newlineIndex];
                    }
                    
                    var _fragment = _layoutArray[_layoutIndex];
                    _stretchWidth += _fragment.__width;
                    
                    if (_fragment.__whitespaceFollows)
                    {
                        if (_cursorX + _stretchWidth > _adjustedWidth)
                        {
                            if (_cursorX == 0)
                            {
                                //Single word is bigger than the width
                                _longWord = true;
                            }
                            else
                            {
                                _cursorX  = 0;
                                _cursorY += _lineHeight;
                            }
                        }
                        
                        _cursorX      += _stretchWidth + _referenceSpaceWidth;
                        _stretchWidth  = 0;
                    }
                    
                    ++_layoutIndex;
                }
                
                if (_cursorX != 0) _cursorY += _lineHeight;
                
                //Determine if this iteration should be the new upper or lower bound based on whether we
                //exceeded the height limit
                var _overallHeight = _cursorY;
                if (_longWord || (_overallHeight > _adjustedHeight))
                {
                    _upperScale = _tryScale;
            
                }
                else
                {
                    _lowerScale = _tryScale;
                    
                    //We start at the base starting scale in the first (0th) iteration. If we already fit
                    //into the bounding box then we can skip a lot of iterations
                    if (_iterations == 0) _iterations = SCRIBBLEJR_FIT_ITERATIONS-2;
                }
                
                //Ensure the final iteration uses a valid scale
                if (_iterations >= SCRIBBLEJR_FIT_ITERATIONS-2)
                {
                    _tryScale = _lowerScale;
                }
                else
                {
                    //Bias scale search very slighty to be larger
                    //This usually finds the global maxima rather than narrowing down on a local maxima
                    _tryScale = lerp(_lowerScale, _upperScale, 0.51);
                }
                
                ++_iterations;
            }
        }
        
        var _lineCount     = array_length(_lineWidthArray);
        var _overallHeight = _lineHeight*_lineCount;
        
        if (__vAlign == fa_center)
        {
            var _yOffset = -0.5*_overallHeight;
        }
        else if (__vAlign == fa_right)
        {
            var _yOffset = -_overallHeight;
        }
        else
        {
            var _yOffset = 0;
        }
        
        var _lineIndex = 0;
        repeat(_lineCount)
        {
            var _layoutIndex = _lineLayoutStartArray[_lineIndex];
                
            if (__hAlign == fa_center)
            {
                var _xOffset = -0.5*_lineWidthArray[_lineIndex];
            }
            else if (__hAlign == fa_right)
            {
                var _xOffset = -_lineWidthArray[_lineIndex];
            }
            else
            {
                var _xOffset = 0;
            }
            
            var _layoutCount = _lineLayoutStartArray[_lineIndex+1] - _layoutIndex;
            repeat(_layoutCount)
            {
                var _layoutStruct = _layoutArray[_layoutIndex];
                _layoutStruct.__x = _xOffset + _layoutStruct.__xOffset;
                _layoutStruct.__y = _yOffset + _layoutStruct.__yOffset;
                
                if (_layoutStruct.__whitespaceFollows)
                {
                    _xOffset += _layoutStruct.__width + _referenceSpaceWidth;
                }
                else
                {
                    _xOffset += _layoutStruct.__width;
                }
                
                ++_layoutIndex;
            }
            
            _yOffset += _lineHeight;
            ++_lineIndex;
        }
        
        #endregion
    }
    
    __scale  = _lowerScale / _fontScale;
    __width  = __scale*__fontScale*_overallWidth;
    __height = __scale*__fontScale*_overallHeight;
    
    __xOffset = 0;
    __yOffset = 0;
    
    __vertexBuffer = undefined;
    __fontTexture  = ScribblejrCacheFontInfo(_font).__forcedTexturePointer;
    __vertexBaker  = new __ScribblejrClassBakerExt(__fragmentArray, _font);
    
    if (SCRIBBLEJR_AUTO_RESET_DRAW_STATE) draw_set_font(_oldFont);
    if (SCRIBBLEJR_VERBOSE) __ScribblejrTrace("Created ", self);
    
    
    
    
    
    static GetHAlign = function()
    {
        return __hAlign;
    }
    
    static GetVAlign = function()
    {
        return __vAlign;
    }
    
    static GetWidth = function()
    {
        return __width;
    }
    
    static GetHeight = function()
    {
        return __height;
    }
    
    
    
    
    
    static __DrawNative = function(_x, _y, _colour = c_white, _alpha = 1, _sdfEffects = undefined)
    {
        draw_set_font(__font);
        draw_set_alpha(_alpha);
        draw_set_halign(fa_left);
        draw_set_valign(fa_top);
        
        var _scale = __scale*__fontScale;
        
        if (_sdfEffects != undefined)
        {
            if (SCRIBBLEJR_SHADOW_SPRITES && __fontIsSDF && struct_get_from_hash(_sdfEffects, _dropShadowEnableHash))
            {
                gpu_set_fog(true, _sdfEffects.dropShadowColour, 0, 0);
                __DrawSprites(_x + _scale*_sdfEffects.dropShadowOffsetX,
                              _y + _scale*_sdfEffects.dropShadowOffsetY,
                              _sdfEffects.dropShadowAlpha*_alpha);
                gpu_set_fog(false, c_fuchsia, 0, 0);
            }
            
            font_enable_effects(__font, true, _sdfEffects);
            
            var _i = 0;
            repeat(array_length(__fragmentArray))
            {
                with(__fragmentArray[_i])
                {
                    draw_set_colour((__colour >= 0)? __colour : _colour);
                    draw_text_transformed(_x + _scale*__x, _y + _scale*__y, __string, _scale, _scale, 0);
                }
                
                ++_i;
            }
            
            if (SCRIBBLEJR_AUTO_RESET_DRAW_STATE) font_enable_effects(__font, false);
        }
        else
        {
            var _i = 0;
            repeat(array_length(__fragmentArray))
            {
                with(__fragmentArray[_i])
                {
                    draw_set_colour((__colour >= 0)? __colour : _colour);
                    draw_text_transformed(_x + _scale*__x, _y + _scale*__y, __string, _scale, _scale, 0);
                }
                
                ++_i;
            }
        }
        
        __DrawSprites(_x, _y, _alpha);
        
        if (SCRIBBLEJR_AUTO_BAKE) __BakeVertexBufferTimed();
        if (SCRIBBLEJR_AUTO_RESET_DRAW_STATE) ScribblejrResetDrawState();
    }
    
    static __DrawSprites = function(_x, _y, _alpha)
    {
        var _textScale   = __scale*__fontScale;
        var _spriteScale = (SCRIBBLEJR_SCALE_SPRITES? _textScale : __scale) / SCRIBBLEJR_GLOBAL_FONT_SCALE;
        
        var _i = 0;
        repeat(array_length(__spriteArray))
        {
            with(__spriteArray[_i])
            {
                draw_sprite_ext(__sprite, __image, _x + _textScale*__x, _y + _textScale*__y, _spriteScale, _spriteScale, 0, c_white, _alpha);
            }
            
            ++_i;
        }
    }
    
    
    
    
    
    static __DrawVertexBuffer = function(_x, _y, _colour = c_white, _alpha = 1)
    {
        static _shdScribblejrExt_u_vPositionAlphaScale = shader_get_uniform(__shdScribblejrColor, "u_vPositionAlphaScale");
        static _shdScribblejrExt_u_iColour = shader_get_uniform(__shdScribblejrColor, "u_iColour");
        
        __SCRIBBLEJR_SHADER_SET(__shdScribblejrColor);
        shader_set_uniform_f(_shdScribblejrExt_u_vPositionAlphaScale, _x, _y, _alpha, __scale*__fontScale);
        shader_set_uniform_i(_shdScribblejrExt_u_iColour, _colour);
        vertex_submit(__vertexBuffer, pr_trianglelist, __fontTexture);
        __SCRIBBLEJR_SHADER_RESET();
        
        //Lean into GameMaker's native renderer for sprites
        __DrawSprites(_x, _y, _alpha);
    }
    
    static __DrawVertexBufferSDF = function(_x, _y, _colour = c_white, _alpha = 1, _sdfEffects = undefined)
    {
        static _shdScribblejrExt_SDF_u_vPositionAlphaScale = shader_get_uniform(__shdScribblejrColorSDF, "u_vPositionAlphaScale");
        static _shdScribblejrExt_SDF_u_iColour = shader_get_uniform(__shdScribblejrColorSDF, "u_iColour");
        
        static _shdScribblejrColorSDFShadow_u_vPositionAlphaScale = shader_get_uniform(__shdScribblejrColorSDFShadow, "u_vPositionAlphaScale");
        static _shdScribblejrColorSDFShadow_u_vColorSoftness = shader_get_uniform(__shdScribblejrColorSDFShadow, "u_vColorSoftness");
        
        if (SCRIBBLEJR_FORCE_BILINEAR_FOR_SDF)
        {
            var _oldTexFilter = gpu_get_tex_filter();
            gpu_set_tex_filter(true);
        }
        
        _x += __xOffset;
        _y += __yOffset;
        var _scale = __scale*__fontScale;
        
        with(_sdfEffects)
        {
            if (struct_get_from_hash(_sdfEffects, other._dropShadowEnableHash))
            {
                var _xShadow = _x + _scale*dropShadowOffsetX;
                var _yShadow = _y + _scale*dropShadowOffsetY;
                
                if (SCRIBBLEJR_SHADOW_SPRITES)
                {
                    gpu_set_fog(true, dropShadowColour, 0, 0);
                    other.__DrawSprites(_xShadow, _yShadow, dropShadowAlpha*_alpha);
                    gpu_set_fog(false, c_fuchsia, 0, 0);
                }
                
                var _color = dropShadowColour;
                __SCRIBBLEJR_SHADER_SET(__shdScribblejrSDFShadow);
                shader_set_uniform_f(_shdScribblejrColorSDFShadow_u_vPositionAlphaScale, _xShadow, _yShadow, dropShadowAlpha*_alpha, _scale);
                
                shader_set_uniform_f(_shdScribblejrColorSDFShadow_u_vColorSoftness,
                                     color_get_red(_color)/255,
                                     color_get_green(_color)/255,
                                     color_get_blue(_color)/255,
                                     clamp(dropShadowSoftness / (4*other.__fontSDFSpread), 0, 0.5));
                vertex_submit(other.__vertexBuffer, pr_trianglelist, other.__fontTexture);
                __SCRIBBLEJR_SHADER_RESET();
            }
        }
        
        __SCRIBBLEJR_SHADER_SET(__shdScribblejrColorSDF);
        shader_set_uniform_f(_shdScribblejrExt_SDF_u_vPositionAlphaScale, _x, _y, _alpha, _scale);
        shader_set_uniform_i(_shdScribblejrExt_SDF_u_iColour, _colour);
        vertex_submit(__vertexBuffer, pr_trianglelist, __fontTexture);
        __SCRIBBLEJR_SHADER_RESET();
        
        if (SCRIBBLEJR_FORCE_BILINEAR_FOR_SDF) gpu_set_tex_filter(_oldTexFilter);
        
        //Lean into GameMaker's native renderer for sprites
        __DrawSprites(_x, _y, _alpha);
    }
}
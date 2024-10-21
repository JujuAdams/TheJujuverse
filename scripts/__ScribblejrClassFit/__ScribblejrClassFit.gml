/// @param key
/// @param string
/// @param hAlign
/// @param vAlign
/// @param font
/// @param fontScale
/// @param maxWidth
/// @param maxHeight

function __ScribblejrClassFit(_key, _string, _hAlign, _vAlign, _font, _fontScale, _maxWidth, _maxHeight) : __ScribblejrClassBase() constructor
{
    static _system = __ScribblejrSystem();
    
    __wrapper = undefined;
    __lastDraw = current_time;
    
    __key       = _key;
    __string    = _string;
    __hAlign    = _hAlign;
    __vAlign    = _vAlign;
    __font      = _font;
    __wrapWidth = undefined;
    
    __fontIsDynamic = ScribblejrCacheFontInfo(_font).__isDynamic;
    __fontSDFSpread = ScribblejrCacheFontInfo(_font).sdfSpread;
    
    Draw = __Draw;
    
    __wrapped = true;
    __width   = undefined;
    __height  = undefined;
    
    
    
    
    
    var _bakerFunc = __ScribblejrClassBakerFit;
    
    if (is_infinity(_maxWidth))
    {
        //No limits
        __wrapped = false;
        __scale = _fontScale;
        if (_fontScale != 1) Draw = __DrawScale;
    }
    else if (is_infinity(_maxHeight))
    {
        //No height limit, just draw wrapped as usual
        if (_fontScale == 1)
        {
            __scale      = 1;
            __wrapWidth  = _maxWidth;
            Draw = __DrawWrap;
        }
        else
        {
            __scale      = _fontScale;
            __wrapWidth  = _maxWidth/_fontScale;
            Draw = __DrawFit;
        }
    }
    else
    {
        if (SCRIBBLEJR_AUTO_RESET_DRAW_STATE) var _oldFont = draw_get_font();
        draw_set_font(__font);
        
        if (_system.__perCharacterWrap)
        {
            #region Per-character wrapping
            
            var _fitsAlready = true;
            var _height = _fontScale*string_height(_string);
            if (_height > _maxHeight)
            {
                _fitsAlready = false;
            }
            else // _height <= _maxHeight
            {
                var _width = _fontScale*string_width(_string);
                if (_width > _maxWidth) _fitsAlready = false;
            }
            
            if (_fitsAlready)
            {
                //Height limit is enough, just draw wrapped as usual
                if (_fontScale == 1)
                {
                    __scale      = 1;
                    __wrapWidth  = _maxWidth;
                    Draw = __DrawWrap;
                }
                else
                {
                    __scale      = _fontScale;
                    __wrapWidth  = _maxWidth/_fontScale;
                    Draw = __DrawFit;
                }
            }
            else //Doesn't fit, let's do some layout!
            {
                _bakerFunc = __ScribblejrClassBakerFitPerChar;
                var _charArray = __ScribblejrStringDecompose(_string);
                
                __stretchesArray = [];
                
                var _spaceWidth  = __ScribblejrGetSpaceWidth(_font);
                var _spaceHeight = __ScribblejrGetSpaceHeight(_font);
                
                var _tryScale   = _fontScale;
                var _upperScale = _fontScale;
                var _lowerScale = 0.1;
                
                var _overallWidth = 0;
                
                //Perform a binary search to find the best fit
                var _iteration = 0;
                repeat(SCRIBBLEJR_FIT_ITERATIONS)
                {
                    var _lastIteration = (_iteration >= SCRIBBLEJR_FIT_ITERATIONS-1);
                    
                    var _adjustedWidth  = _maxWidth/_tryScale;
                    var _adjustedHeight = _maxHeight/_tryScale;
                    
                    var _cursorX = 0;
                    var _cursorY = 0;
                    var _cursorSpace = 0;
                    
                    var _stretchStart = 0;
                    
                    var _i = 0;
                    repeat(array_length(_charArray))
                    {
                        var _char = _charArray[_i];
                        
                        if (_char == "\n")
                        {
                            if (_lastIteration)
                            {
                                _overallWidth = max(_overallWidth, _cursorX);
                                
                                array_push(__stretchesArray, {
                                    __width:  _cursorX - _cursorSpace,
                                    __x:      0,
                                    __y:      _cursorY,
                                    __string: string_copy(_string, _stretchStart+1, _i - _stretchStart),
                                });
                                
                                _stretchStart = _i+1;
                            }
                            
                            _cursorX      = 0;
                            _cursorY     += _spaceHeight;
                            _cursorSpace  = 0;
                        }
                        else if (_char == " ")
                        {
                        
                            if (_cursorX + _spaceWidth > _adjustedWidth)
                            {
                                if (_lastIteration)
                                {
                                    if (_stretchStart == _i) _stretchStart++;
                                    
                                    _overallWidth = max(_overallWidth, _cursorX);
                                    
                                    array_push(__stretchesArray, {
                                        __width:  _cursorX - _cursorSpace,
                                        __x:      0,
                                        __y:      _cursorY,
                                        __string: string_copy(_string, _stretchStart+1, _i - _stretchStart),
                                    });
                                    
                                    _stretchStart = _i+1;
                                }
                                
                                _cursorX      = 0;
                                _cursorY     += _spaceHeight;
                                _cursorSpace  = 0;
                            }
                            else
                            {
                                if (_lastIteration && (_stretchStart == _i)) _stretchStart++;
                                
                                _cursorX     += _spaceWidth;
                                _cursorSpace += _spaceWidth;
                            }
                        }
                        else
                        {
                            var _glyphWidth = string_width(_char);
                            if (_cursorX + _glyphWidth > _adjustedWidth)
                            {
                                if (_lastIteration)
                                {
                                    _overallWidth = max(_overallWidth, _cursorX);
                                    
                                    array_push(__stretchesArray, {
                                        __width:  _cursorX - _cursorSpace,
                                        __x:      0,
                                        __y:      _cursorY,
                                        __string: string_copy(_string, _stretchStart+1, _i - _stretchStart),
                                    });
                                    
                                    _stretchStart = _i;
                                }
                                
                                _cursorX      = _glyphWidth;
                                _cursorY     += _spaceHeight;
                                _cursorSpace  = 0;
                            }
                            else
                            {
                                _cursorX     += _glyphWidth;
                                _cursorSpace  = 0;
                            }
                        }
                        
                        ++_i;
                    }
                    
                    if (_lastIteration)
                    {
                        if (_stretchStart < array_length(_charArray))
                        {
                            _overallWidth = max(_overallWidth, _cursorX);
                            
                            array_push(__stretchesArray, {
                                __width:  _cursorX - _cursorSpace,
                                __x:      0,
                                __y:      _cursorY,
                                __string: string_copy(_string, _stretchStart+1, _i - _stretchStart),
                            });
                            
                            _cursorY += _spaceHeight;
                        }
                    }
            
                    //Determine if this iteration should be the new upper or lower bound based on whether we
                    //exceeded the height limit
                    var _height = _cursorY + _spaceHeight;
                    if (_height > _adjustedHeight)
                    {
                        _upperScale = _tryScale;
                    }
                    else
                    {
                        _lowerScale = _tryScale;
                        
                        //We start at the base starting scale in the first (0th) iteration. If we already fit
                        //into the bounding box then we can skip a lot of iterations
                        if (_iteration == 0) _iteration = SCRIBBLEJR_FIT_ITERATIONS-2;
                    }
                    
                    //Ensure the final iteration uses a valid scale
                    if (_iteration >= SCRIBBLEJR_FIT_ITERATIONS-2)
                    {
                        _tryScale = _lowerScale;
                    }
                    else
                    {
                        //Bias scale search very slighty to be larger
                        //This usually finds the global maxima rather than narrowing down on a local maxima
                        _tryScale = lerp(_lowerScale, _upperScale, 0.51);
                    }
                    
                    ++_iteration;
                }
                
                __scale  = _lowerScale;
                __width  = _overallWidth;
                __height = _cursorY;
                
                Draw = __DrawStretches;
                
                //Adjust for horizontal alignment
                if (_hAlign == fa_center)
                {
                    var _i = 0;
                    repeat(array_length(__stretchesArray))
                    {
                        with(__stretchesArray[_i]) __x -= __width/2;
                        ++_i;
                    }
                }
                else if (_hAlign == fa_right)
                {
                    var _i = 0;
                    repeat(array_length(__stretchesArray))
                    {
                        with(__stretchesArray[_i]) __x -= __width;
                        ++_i;
                    }
                }
                
                //Adjust for vertical alignment
                if ((_vAlign == fa_middle) || (_vAlign == fa_bottom))
                {
                    var _offset = (_vAlign == fa_middle)? (__height/2) : __height;
                    var _i = 0;
                    repeat(array_length(__stretchesArray))
                    {
                        with(__stretchesArray[_i]) __y -= _offset;
                        ++_i;
                    }
                }
            }
            
            #endregion
        }
        else
        {
            #region Per-word wrapping
            
            var _fitsAlready = true;
            var _height = _fontScale*string_height_ext(_string, -1, _maxWidth/_fontScale-1);
            if (_height > _maxHeight)
            {
                _fitsAlready = false;
            }
            else // _height <= _maxHeight
            {
                var _width = _fontScale*string_width(_string);
                if (_width > _maxWidth) _fitsAlready = false;
            }
            
            if (_fitsAlready)
            {
                //Height limit is enough, just draw wrapped as usual
                if (_fontScale == 1)
                {
                    __scale      = 1;
                    __wrapWidth  = _maxWidth;
                    Draw = __DrawWrap;
                }
                else
                {
                    __scale      = _fontScale;
                    __wrapWidth  = _maxWidth/_fontScale;
                    Draw = __DrawFit;
                }
            }
            else //Doesn't fit, let's do some layout!
            {
                var _upperScale = _fontScale;
                var _lowerScale = 0;
                
                //Perform a binary search to find the best fit
                repeat(SCRIBBLEJR_FIT_ITERATIONS)
                {
                    //Bias scale search very slighty to be larger
                    //This usually finds the global maxima rather than narrowing down on a local maxima
                    var _tryScale = lerp(_lowerScale, _upperScale, 0.51);
                    
                    var _adjustedWidth  = _maxWidth/_tryScale;
                    var _adjustedHeight = _maxHeight/_tryScale;
                    
                    var _width  = infinity;
                    var _height = string_height_ext(_string, -1, _adjustedWidth-1); //Subtract 1 here to fix on off-by-one in GameMaker's text layout
                    
                    if (_height > _adjustedHeight)
                    {
                        _upperScale = _tryScale;
                    }
                    else
                    {
                        var _width = string_width_ext(_string, -1, _adjustedWidth-1);
                        if (_width > _adjustedWidth)
                        {
                            _upperScale = _tryScale;
                        }
                        else
                        {
                            _lowerScale = _tryScale;
                        }
                    }
                }
                
                __scale     = _lowerScale;
                __wrapWidth = _maxWidth / _lowerScale;
                __width     = __scale*((_width  > _adjustedWidth)?  string_width_ext( _string, -1, __wrapWidth-1) : _width);
                __height    = __scale*((_height > _adjustedHeight)? string_height_ext(_string, -1, __wrapWidth-1) : _height);
                Draw = __DrawFit;
            }
            
            #endregion
        }
        
        if (SCRIBBLEJR_AUTO_RESET_DRAW_STATE) draw_set_font(_oldFont);
    }
    
    __vertexBuffer = undefined;
    __fontTexture  = ScribblejrCacheFontInfo(_font).__forcedTexturePointer;
    
    if (_bakerFunc == __ScribblejrClassBakerFit)
    {
        __vertexBaker = new _bakerFunc(__string, _font, __hAlign, __vAlign, __wrapWidth);
    }
    else if (_bakerFunc == __ScribblejrClassBakerFitPerChar)
    {
        __vertexBaker = new _bakerFunc(__stretchesArray, _font, __hAlign);
    }
    else
    {
        __ScribblejrError("Unhandled baker function");
    }
    
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
        if (__width == undefined)
        {
            var _oldFont = draw_get_font();
            draw_set_font(__font);
            
            if (__wrapped)
            {
                //Subtract 1 here to fix on off-by-one in GameMaker's text layout
                __width = __scale*string_width_ext(__string, -1, __wrapWidth);
            }
            else
            {
                __width = __scale*string_width(__string);
            }
            
            draw_set_font(_oldFont);
        }
       
        return __width;
    }
    
    static GetHeight = function()
    {
        if (__height == undefined)
        {
            var _oldFont = draw_get_font();
            draw_set_font(__font);
            
            if (__wrapped)
            {
                //Subtract 1 here to fix on off-by-one in GameMaker's text layout
                __height = __scale*string_height_ext(__string, -1, __wrapWidth);
            }
            else
            {
                __height = __scale*string_height(__string);
            }
            
            draw_set_font(_oldFont);
        }
       
        return __height;
    }
    
    
    
    
    
    static __Draw = function(_x, _y, _colour = c_white, _alpha = 1, _sdfEffects = undefined)
    {
        draw_set_font(__font);
        draw_set_colour(_colour);
        draw_set_alpha(_alpha);
        draw_set_halign(__hAlign);
        draw_set_valign(__vAlign);
        
        if (_sdfEffects != undefined)
        {
            font_enable_effects(__font, true, _sdfEffects);
            draw_text(_x, _y, __string);
            if (SCRIBBLEJR_AUTO_RESET_DRAW_STATE) font_enable_effects(__font, false);
        }
        else
        {
            draw_text(_x, _y, __string);
        }
        
        if (SCRIBBLEJR_AUTO_BAKE) __BakeVertexBufferTimed();
        if (SCRIBBLEJR_AUTO_RESET_DRAW_STATE) ScribblejrResetDrawState();
    }
    
    static __DrawScale = function(_x, _y, _colour = c_white, _alpha = 1, _sdfEffects = undefined)
    {
        draw_set_font(__font);
        draw_set_colour(_colour);
        draw_set_alpha(_alpha);
        draw_set_halign(__hAlign);
        draw_set_valign(__vAlign);
        
        if (_sdfEffects != undefined)
        {
            font_enable_effects(__font, true, _sdfEffects);
            draw_text_transformed(_x, _y, __string, __scale, __scale, 0);
            if (SCRIBBLEJR_AUTO_RESET_DRAW_STATE) font_enable_effects(__font, false);
        }
        else
        {
            draw_text_transformed(_x, _y, __string, __scale, __scale, 0);
        }
        
        if (SCRIBBLEJR_AUTO_BAKE) __BakeVertexBufferTimed();
        if (SCRIBBLEJR_AUTO_RESET_DRAW_STATE) ScribblejrResetDrawState();
    }
    
    static __DrawWrap = function(_x, _y, _colour = c_white, _alpha = 1, _sdfEffects = undefined)
    {
        draw_set_font(__font);
        draw_set_colour(_colour);
        draw_set_alpha(_alpha);
        draw_set_halign(__hAlign);
        draw_set_valign(__vAlign);
        
        if (_sdfEffects != undefined)
        {
            font_enable_effects(__font, true, _sdfEffects);
            draw_text_ext(_x, _y, __string, -1, __wrapWidth);
            if (SCRIBBLEJR_AUTO_RESET_DRAW_STATE) font_enable_effects(__font, false);
        }
        else
        {
            draw_text_ext(_x, _y, __string, -1, __wrapWidth);
        }
        
        if (SCRIBBLEJR_AUTO_BAKE) __BakeVertexBufferTimed();
        if (SCRIBBLEJR_AUTO_RESET_DRAW_STATE) ScribblejrResetDrawState();
    }
    
    static __DrawFit = function(_x, _y, _colour = c_white, _alpha = 1, _sdfEffects = undefined)
    {
        draw_set_font(__font);
        draw_set_colour(_colour);
        draw_set_alpha(_alpha);
        draw_set_halign(__hAlign);
        draw_set_valign(__vAlign);
        
        if (_sdfEffects != undefined)
        {
            font_enable_effects(__font, true, _sdfEffects);
            draw_text_ext_transformed(_x, _y, __string, -1, __wrapWidth, __scale, __scale, 0);
            if (SCRIBBLEJR_AUTO_RESET_DRAW_STATE) font_enable_effects(__font, false);
        }
        else
        {
            draw_text_ext_transformed(_x, _y, __string, -1, __wrapWidth, __scale, __scale, 0);
        }
        
        if (SCRIBBLEJR_AUTO_BAKE) __BakeVertexBufferTimed();
        if (SCRIBBLEJR_AUTO_RESET_DRAW_STATE) ScribblejrResetDrawState();
    }
    
    static __DrawStretches = function(_x, _y, _colour = c_white, _alpha = 1, _sdfEffects = undefined)
    {
        var _scale = __scale;
        
        draw_set_font(__font);
        draw_set_colour(_colour);
        draw_set_alpha(_alpha);
        draw_set_halign(fa_left);
        draw_set_valign(fa_top);
        
        if (_sdfEffects != undefined)
        {
            font_enable_effects(__font, true, _sdfEffects);
            
            var _i = 0;
            repeat(array_length(__stretchesArray))
            {
                with(__stretchesArray[_i])
                {
                    draw_text_transformed(_x + _scale*__x, _y + _scale*__y, __string, _scale, _scale, 0);
                }
                
                ++_i;
            }
            
            if (SCRIBBLEJR_AUTO_RESET_DRAW_STATE) font_enable_effects(__font, false);
        }
        else
        {
            var _i = 0;
            repeat(array_length(__stretchesArray))
            {
                with(__stretchesArray[_i])
                {
                    draw_text_transformed(_x + _scale*__x, _y + _scale*__y, __string, _scale, _scale, 0);
                }
                
                ++_i;
            }
        }
        
        if (SCRIBBLEJR_AUTO_BAKE) __BakeVertexBufferTimed();
        if (SCRIBBLEJR_AUTO_RESET_DRAW_STATE) ScribblejrResetDrawState();
    }
    
    
    
    
    
    static __DrawVertexBuffer = function(_x, _y, _colour = c_white, _alpha = 1)
    {
        static _shdScribblejr_u_vPositionAlphaScale = shader_get_uniform(__shdScribblejr, "u_vPositionAlphaScale");
        static _shdScribblejr_u_iColour = shader_get_uniform(__shdScribblejr, "u_iColour");
        
        __SCRIBBLEJR_SHADER_SET(__shdScribblejr);
        shader_set_uniform_f(_shdScribblejr_u_vPositionAlphaScale, _x, _y, _alpha, __scale);
        shader_set_uniform_i(_shdScribblejr_u_iColour, _colour);
        vertex_submit(__vertexBuffer, pr_trianglelist, __fontTexture);
        __SCRIBBLEJR_SHADER_RESET();
    }
    
    static __DrawVertexBufferSDF = function(_x, _y, _colour = c_white, _alpha = 1, _sdfEffects = undefined)
    {
        static _dropShadowEnableHash = variable_get_hash("dropShadowEnable");
        
        static _shdScribblejrSDF_u_vPositionAlphaScale = shader_get_uniform(__shdScribblejrSDF, "u_vPositionAlphaScale");
        static _shdScribblejrSDF_u_iColour = shader_get_uniform(__shdScribblejrSDF, "u_iColour");
        
        static _shdScribblejrSDFShadow_u_vPositionAlphaScale = shader_get_uniform(__shdScribblejrSDFShadow, "u_vPositionAlphaScale");
        static _shdScribblejrSDFShadow_u_vColorSoftness = shader_get_uniform(__shdScribblejrSDFShadow, "u_vColorSoftness");
        
        if (SCRIBBLEJR_FORCE_BILINEAR_FOR_SDF)
        {
            var _oldTexFilter = gpu_get_tex_filter();
            gpu_set_tex_filter(true);
        }
        
        with(_sdfEffects)
        {
            if (struct_get_from_hash(_sdfEffects, _dropShadowEnableHash))
            {
                var _scale = other.__scale;
                var _color = dropShadowColour;
                __SCRIBBLEJR_SHADER_SET(__shdScribblejrSDFShadow);
                shader_set_uniform_f(_shdScribblejrSDFShadow_u_vPositionAlphaScale, _x + _scale*dropShadowOffsetX, _y + _scale*dropShadowOffsetY, dropShadowAlpha*_alpha, _scale);
                shader_set_uniform_f(_shdScribblejrSDFShadow_u_vColorSoftness, color_get_red(_color)/255, color_get_green(_color)/255, color_get_blue(_color)/255, clamp(dropShadowSoftness / (4*other.__fontSDFSpread), 0, 0.5));
                vertex_submit(other.__vertexBuffer, pr_trianglelist, other.__fontTexture);
                __SCRIBBLEJR_SHADER_RESET();
            }
        }
        
        __SCRIBBLEJR_SHADER_SET(__shdScribblejrSDF);
        shader_set_uniform_f(_shdScribblejrSDF_u_vPositionAlphaScale, _x, _y, _alpha, __scale);
        shader_set_uniform_i(_shdScribblejrSDF_u_iColour, _colour);
        vertex_submit(__vertexBuffer, pr_trianglelist, __fontTexture);
        __SCRIBBLEJR_SHADER_RESET();
        
        if (SCRIBBLEJR_FORCE_BILINEAR_FOR_SDF) gpu_set_tex_filter(_oldTexFilter);
    }
}
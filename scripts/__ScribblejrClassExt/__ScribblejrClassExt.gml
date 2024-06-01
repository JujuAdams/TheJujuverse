/// @param key
/// @param string
/// @param hAlign
/// @param vAlign
/// @param font
/// @param fontScale

function __ScribblejrClassExt(_key, _string, _hAlign, _vAlign, _font, _fontScale) : __ScribblejrClassBase() constructor
{
    static _system     = __ScribblejrSystem();
    static _colourDict = _system.__colourDict;
    
    static _dropShadowEnableHash = variable_get_hash("dropShadowEnable");
    
    __wrapper = undefined;
    __lastDraw = current_time;
    
    __key    = _key;
    __string = _string;
    __hAlign = _hAlign;
    __vAlign = _vAlign;
    __font   = _font;
    __scale  = _fontScale;
    
    __fontIsDynamic = ScribblejrCacheFontInfo(_font).__isDynamic;
    __fontIsSDF     = ScribblejrCacheFontInfo(_font).sdfEnabled;
    __fontSDFSpread = ScribblejrCacheFontInfo(_font).sdfSpread;
    
    Draw = __DrawNative;
        
    __spriteArray   = [];
    __fragmentArray = [];
    __vertexBuffer  = undefined;
    __vertexBaker = new __ScribblejrClassBakerExt(__fragmentArray, _font);
    __fontTexture   = ScribblejrCacheFontInfo(_font).__forcedTexturePointer;
    
    __simple = false;
    __width  = undefined;
    __height = undefined;
    
    if (SCRIBBLEJR_AUTO_RESET_DRAW_STATE) var _oldFont = draw_get_font();
    draw_set_font(__font);
    
    var _substringArray = string_split(__string, "[");
    if (array_length(_substringArray) <= 1)
    {
        //No square brackets, fall back on simple rendering
        __simple = true;
        
        switch(__hAlign)
        {
            case fa_left:
                __xOffset = 0;
            break;
            
            case fa_center:
                __width = __scale*string_width(_string);
                __xOffset = -__width/2;
            break;
            
            case fa_right:
                __width = __scale*string_width(_string);
                __xOffset = -__width;
            break;
        }
        
        switch(__vAlign)
        {
            case fa_top:
                __yOffset = 0;
            break;
            
            case fa_middle:
                __height = __scale*string_height(_string);
                __yOffset = -__height/2;
            break;
            
            case fa_bottom:
                __height = __scale*string_height(_string);
                __yOffset = -__height;
            break;
        }
        
        Draw = (__scale == 1)? __DrawSimple : __DrawSimpleScaled;
        
        //Add a spoofed fragment so the vertex buffer baker has something to work on
        array_push(__fragmentArray, {
            __colour: -1,
            __string: __string,
            __x: 0,
        });
    }
    else
    {
        var _spriteScale = (SCRIBBLEJR_SCALE_SPRITES? 1 : (1/_fontScale)) / SCRIBBLEJR_GLOBAL_FONT_SCALE;
        var _lineHeight  = __ScribblejrGetSpaceHeight(_font);
        
        //Handle the first text fragment
        var _textString = _substringArray[0];
        if (_textString != "")
        {
            array_push(__fragmentArray, {
                __colour: -1,
                __string: _textString,
                __x: 0,
            });
            
            var _x = string_width(_textString);
        }
        else
        {
            var _x = 0;
        }
        
        var _colour = -1;
        
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
                        
                        array_push(__spriteArray, {
                            __sprite: _sprite,
                            __image: _spriteImage,
                            __x: _spriteX + _x + _spriteScale*sprite_get_xoffset(_sprite),
                            __y: _spriteY + 0.5*(_lineHeight - _spriteScale*sprite_get_height(_sprite)) + _spriteScale*sprite_get_yoffset(_sprite),
                        });
                        
                        _x += _spriteScale*sprite_get_width(_sprite);
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
                    array_push(__fragmentArray, {
                        __colour: _colour,
                        __string: _tagSplitArray[1],
                        __x: _x,
                    });
                    
                    _x += string_width(_textString);
                }
            }
            
            ++_i;
        }
        
        __width  = __scale*_x;
        __height = __scale*_lineHeight;
        
        switch(__hAlign)
        {
            case fa_left:   __xOffset = 0;          break;
            case fa_center: __xOffset = -__width/2; break;
            case fa_right:  __xOffset = -__width;   break;
        }
        
        switch(__vAlign)
        {
            case fa_top:    __yOffset = 0;           break;
            case fa_middle: __yOffset = -__height/2; break;
            case fa_bottom: __yOffset = -__height;   break;
        }
    }
    
    if (SCRIBBLEJR_AUTO_RESET_DRAW_STATE) draw_set_font(_oldFont);
    if (SCRIBBLEJR_VERBOSE) __ScribblejrTrace("Created ", self);
    
    
    
    
    
    static GetWidth = function()
    {
        if (__width == undefined)
        {
            if (not __simple)
            {
                //This should never happen!
            }
            
            var _oldFont = draw_get_font();
            draw_set_font(__font);
            __width = __scale*string_width(__string);
            draw_set_font(_oldFont);
        }
       
        return __width;
    }
    
    static GetHeight = function()
    {
        if (__height == undefined)
        {
            if (not __simple)
            {
                //This should never happen!
            }
            
            var _oldFont = draw_get_font();
            draw_set_font(__font);
            __height = __scale*string_height(__string);
            draw_set_font(_oldFont);
        }
       
        return __height;
    }
    
    
    
    
    
    static __DrawSimple = function(_x, _y, _colour = c_white, _alpha = 1, _sdfEffects = undefined)
    {
        draw_set_font(__font);
        draw_set_colour(_colour);
        draw_set_alpha(_alpha);
        draw_set_halign(__hAlign);
        draw_set_valign(__vAlign);
        
        if (_sdfEffects != undefined)
        {
            if (SCRIBBLEJR_SHADOW_SPRITES && __fontIsSDF && struct_get_from_hash(_sdfEffects, _dropShadowEnableHash))
            {
                gpu_set_fog(true, _sdfEffects.dropShadowColour, 0, 0);
                __DrawSprites(_x + _sdfEffects.dropShadowOffsetX,
                              _y + _sdfEffects.dropShadowOffsetY,
                              _sdfEffects.dropShadowAlpha*_alpha);
                gpu_set_fog(false, c_fuchsia, 0, 0);
            }
            
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
    
    static __DrawSimpleScaled = function(_x, _y, _colour = c_white, _alpha = 1, _sdfEffects = undefined)
    {
        draw_set_font(__font);
        draw_set_colour(_colour);
        draw_set_alpha(_alpha);
        draw_set_halign(__hAlign);
        draw_set_valign(__vAlign);
        
        if (_sdfEffects != undefined)
        {
            if (SCRIBBLEJR_SHADOW_SPRITES && __fontIsSDF && struct_get_from_hash(_sdfEffects, _dropShadowEnableHash))
            {
                gpu_set_fog(true, _sdfEffects.dropShadowColour, 0, 0);
                __DrawSprites(_x + __scale*_sdfEffects.dropShadowOffsetX,
                              _y + __scale*_sdfEffects.dropShadowOffsetY,
                              _sdfEffects.dropShadowAlpha*_alpha);
                gpu_set_fog(false, c_fuchsia, 0, 0);
            }
            
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
    
    static __DrawNative = function(_x, _y, _colour = c_white, _alpha = 1, _sdfEffects = undefined)
    {
        draw_set_font(__font);
        draw_set_alpha(_alpha);
        draw_set_halign(fa_left);
        draw_set_valign(fa_top);
        
        var _scale = __scale;
        _x += __xOffset;
        _y += __yOffset;
        
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
                    draw_text_transformed(_x + _scale*__x, _y, __string, _scale, _scale, 0);
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
                    draw_text_transformed(_x + _scale*__x, _y, __string, _scale, _scale, 0);
                }
                
                ++_i;
            }
        }
        
        __DrawSprites(_x, _y, _alpha);
        
        if (SCRIBBLEJR_AUTO_BAKE) __BakeVertexBuffer();
        if (SCRIBBLEJR_AUTO_RESET_DRAW_STATE) ScribblejrResetDrawState();
    }
    
    static __DrawSprites = function(_x, _y, _alpha)
    {
        var _textScale   = __scale;
        var _spriteScale = (SCRIBBLEJR_SCALE_SPRITES? _textScale : 1) / SCRIBBLEJR_GLOBAL_FONT_SCALE;
        
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
        
        _x += __xOffset;
        _y += __yOffset;
        
        __SCRIBBLEJR_SHADER_SET(__shdScribblejrColor);
        shader_set_uniform_f(_shdScribblejrExt_u_vPositionAlphaScale, _x, _y, _alpha, __scale);
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
        var _scale = __scale;
        
        with(_sdfEffects)
        {
            if (struct_get_from_hash(_sdfEffects, other._dropShadowEnableHash))
            {
                var _color = dropShadowColour;
                
                var _xShadow = _x + _scale*dropShadowOffsetX;
                var _yShadow = _y + _scale*dropShadowOffsetY;
                
                if (SCRIBBLEJR_SHADOW_SPRITES)
                {
                    gpu_set_fog(true, dropShadowColour, 0, 0);
                    other.__DrawSprites(_xShadow, _yShadow, dropShadowAlpha*_alpha);
                    gpu_set_fog(false, c_fuchsia, 0, 0);
                }
                
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
/// @param key
/// @param string
/// @param hAlign
/// @param vAlign
/// @param font
/// @param fontScale

function __ScribblejrClass(_key, _string, _hAlign, _vAlign, _font, _fontScale) : __ScribblejrClassBase() constructor
{
    static _system = __ScribblejrSystem();
    
    __wrapper = undefined;
    __lastDraw = current_time;
    
    __key    = _key;
    __string = _string;
    __hAlign = _hAlign;
    __vAlign = _vAlign;
    __font   = _font;
    __scale  = _fontScale;
    
    __fontIsDynamic = ScribblejrCacheFontInfo(_font).__isDynamic;
    __fontSDFSpread = ScribblejrCacheFontInfo(_font).sdfSpread;
    
    Draw = (_fontScale == 1)? __Draw : __DrawScale;
    
    __vertexBuffer = undefined;
    __fontTexture  = ScribblejrCacheFontInfo(_font).__forcedTexturePointer;
    
    __width  = undefined;
    __height = undefined;
    
    
    
    if (SCRIBBLEJR_AUTO_RESET_DRAW_STATE) var _oldFont = draw_get_font();
    draw_set_font(__font);
    
    //Cache string width/height to handle alignment positioning
    switch(_hAlign)
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
    
    switch(_vAlign)
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
    
    __vertexBaker = new __ScribblejrClassBaker(__string, _font, _hAlign);
    
    if (SCRIBBLEJR_AUTO_RESET_DRAW_STATE) draw_set_font(_oldFont);
    if (SCRIBBLEJR_VERBOSE) __ScribblejrTrace("Created ", self);
    
    
    
    
    
    static GetWidth = function()
    {
        if (__width == undefined)
        {
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
            var _oldFont = draw_get_font();
            draw_set_font(__font);
            __height = __scale*string_height(__string);
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
    
    
    
    
    
    static __DrawVertexBuffer = function(_x, _y, _colour = c_white, _alpha = 1)
    {
        static _shdScribblejr_u_vPositionAlphaScale = shader_get_uniform(__shdScribblejr, "u_vPositionAlphaScale");
        static _shdScribblejr_u_iColour = shader_get_uniform(__shdScribblejr, "u_iColour");
        
        __SCRIBBLEJR_SHADER_SET(__shdScribblejr);
        shader_set_uniform_f(_shdScribblejr_u_vPositionAlphaScale, _x, _y + __yOffset, _alpha, __scale);
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
        
        _y += __yOffset;
        
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
/// @param string
/// @param font
/// @param hAlign

function __ScribblejrClassBaker(_string, _font, _hAlign) constructor
{
    static _system       = __ScribblejrSystem();
    static _vertexFormat = _system.__vertexFormat;
    
    __string = _string;
    __font   = _font;
    __hAlign = _hAlign;
    
    __tickMethod = __SplitLines;
    
    var _fontInfo = ScribblejrCacheFontInfo(_font);
    __fontGlyphStruct = _fontInfo.glyphs;
    
    __spaceWidth  = undefined;
    __spaceHeight = undefined;
    
    var _fontTexture = _fontInfo.__forcedTexturePointer;
    __texTexelW = texture_get_texel_width(_fontTexture);
    __texTexelH = texture_get_texel_height(_fontTexture);
        
    __vertexBuffer = vertex_create_buffer();
    vertex_begin(__vertexBuffer, _vertexFormat);
    vertex_float2(__vertexBuffer, 0, 0); vertex_texcoord(__vertexBuffer, 0, 0);
    vertex_float2(__vertexBuffer, 0, 0); vertex_texcoord(__vertexBuffer, 0, 0);
    vertex_float2(__vertexBuffer, 0, 0); vertex_texcoord(__vertexBuffer, 0, 0);
    
    __line   = 0;
    __glyph  = 0;
    __glyphX = 0;
    __glyphY = 0;
    
    
    
    
    
    static __Destroy = function()
    {
        if (__vertexBuffer != undefined)
        {
            vertex_delete_buffer(__vertexBuffer);
            __vertexBuffer = undefined;
        }
    }
    
    static __SplitLines = function()
    {
        //I'd love to pull this out of the glyph data but the values we get are inaccurate
        __spaceWidth  = __ScribblejrGetSpaceWidth(__font);
        __spaceHeight = __ScribblejrGetSpaceHeight(__font);
        
        __lineStringArray = string_split(__string, "\n");
        __tickMethod = __DecomposeLine;
        return false;
    }
    
    static __DecomposeLine = function()
    {
        var _string = __lineStringArray[__line];
        __stringArray = __ScribblejrStringDecompose(_string);
        __glyphCount = array_length(__stringArray);
        
        if (SCRIBBLEJR_AUTO_RESET_DRAW_STATE) var _oldFont = draw_get_font();
        draw_set_font(__font);
        
        if (__hAlign == fa_center)
        {
            __glyphX = -(string_width(_string) div 2);
        }
        else if (__hAlign == fa_right)
        {
            __glyphX = -string_width(_string);
        }
        else
        {
            __glyphX = 0;
        }
        
        __tickMethod = __TickLine;
        if (SCRIBBLEJR_AUTO_RESET_DRAW_STATE) draw_set_font(_oldFont);
        return false;
    }
    
    static __TickLine = function()
    {
        repeat(SCRIBBLEJR_BAKE_GLYPH_COUNT)
        {
            var _char = __stringArray[__glyph];
            if (_char == " ")
            {
                __glyphX += __spaceWidth;
            }
            else
            {
                var _glyphData = __fontGlyphStruct[$ _char];
                if (_glyphData == undefined)
                {
                    //Oh dear
                }
                else
                {
                    var _texL = _glyphData.x*__texTexelW;
                    var _texT = _glyphData.y*__texTexelH;
                    var _texR = _texL + _glyphData.w*__texTexelW;
                    var _texB = _texT + _glyphData.h*__texTexelH;
                    
                    var _glyphL = __glyphX + _glyphData.offset-1;
                    var _glyphT = __glyphY + _glyphData.yOffset-1;
                    var _glyphR = _glyphL + _glyphData.w;
                    var _glyphB = _glyphT + _glyphData.h;
                    
                    __SCRIBBLEJR_WRITE
                    
                    __glyphX += _glyphData.shift;
                }
            }
            
            __glyph++;
            if (__glyph >= __glyphCount)
            {
                __line++;
                if (__line < array_length(__lineStringArray))
                {
                    __glyph = 0;
                    __glyphY += __spaceHeight;
                    __tickMethod = __DecomposeLine;
                }
                else
                {
                    vertex_end(__vertexBuffer);
                    __tickMethod = __Freeze;
                }
                
                return false;
            }
        }
        
        return false;
    }
    
    static __Freeze = function()
    {
        if ((_system.__budget - _system.__budgetUsed > 500) || (_system.__budgetUsed == 0))
        {
            vertex_freeze(__vertexBuffer);
            __tickMethod = __Finished;
            return true;
        }
        else
        {
            return false;
        }
    }
    
    static __Finished = function()
    {
        return true;
    }
}
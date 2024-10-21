/// @param fragArray
/// @param font

function __ScribblejrClassBakerExt(_fragArray, _font) constructor
{
    static _system       = __ScribblejrSystem();
    static _vertexFormat = _system.__vertexFormatColor;
    
    __fragmentArray = _fragArray;
    __font = _font;
    
    __tickMethod = __DecomposeFragment;
    
    var _fontInfo = ScribblejrCacheFontInfo(_font);
    __fontGlyphStruct = _fontInfo.glyphs;
    
    __spaceWidth  = __ScribblejrGetSpaceWidth(_font);
    __spaceHeight = __ScribblejrGetSpaceHeight(_font);
    
    var _fontTexture = _fontInfo.__forcedTexturePointer;
    __texTexelW = texture_get_texel_width(_fontTexture);
    __texTexelH = texture_get_texel_height(_fontTexture);
        
    __vertexBuffer = vertex_create_buffer();
    vertex_begin(__vertexBuffer, _vertexFormat);
    vertex_float2(__vertexBuffer, 0, 0); vertex_colour(__vertexBuffer, c_black, 0); vertex_texcoord(__vertexBuffer, 0, 0);
    vertex_float2(__vertexBuffer, 0, 0); vertex_colour(__vertexBuffer, c_black, 0); vertex_texcoord(__vertexBuffer, 0, 0);
    vertex_float2(__vertexBuffer, 0, 0); vertex_colour(__vertexBuffer, c_black, 0); vertex_texcoord(__vertexBuffer, 0, 0);
    
    __fragment    = 0;
    __stringArray = undefined;
    __glyphX      = 0;
    __glyphY      = 0;
    
    
    
    
    
    static __Destroy = function()
    {
        if (__vertexBuffer != undefined)
        {
            vertex_delete_buffer(__vertexBuffer);
            __vertexBuffer = undefined;
        }
    }
    
    
    
    
    
    static __DecomposeFragment = function()
    {
        var _fragmentData   = __fragmentArray[__fragment];
        var _fragmentString = _fragmentData.__string;
        
        __glyph       = 0;
        __glyphCount  = string_length(_fragmentString);
        __glyphX      = _fragmentData.__x;
        __glyphY      = _fragmentData.__y;
        __glyphColour = _fragmentData.__colour;
        
        __stringArray = __ScribblejrStringDecompose(_fragmentString, __glyphCount);
        __tickMethod = __Tick;
        return false;
    }
    
    static __Tick = function()
    {
        var _glyphColour = __glyphColour;
        var _glyphAlpha  = (__glyphColour >= 0);
        
        repeat(SCRIBBLEJR_BAKE_GLYPH_COUNT)
        {
            if (__glyph >= __glyphCount)
            {
                __fragment++;
                if (__fragment < array_length(__fragmentArray))
                {
                    __tickMethod = __DecomposeFragment;
                    break;
                }
                else
                {
                    vertex_end(__vertexBuffer);
                    __tickMethod = __Freeze;
                    return false;
                }
            }
            
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
                    
                    __SCRIBBLEJR_WRITE_EXT
                    
                    __glyphX += _glyphData.shift;
                }
            }
            
            __glyph++;
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
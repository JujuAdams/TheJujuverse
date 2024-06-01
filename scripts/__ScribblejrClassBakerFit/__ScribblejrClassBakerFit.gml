/// @param string
/// @param font
/// @param hAlign
/// @param vAlign
/// @param wrapWidth

function __ScribblejrClassBakerFit(_string, _font, _hAlign, _vAlign, _wrapWidth) constructor
{
    static _system       = __ScribblejrSystem();
    static _vertexFormat = _system.__vertexFormat;
    static __tempArray    = [];
    
    __string    = _string;
    __hAlign    = _hAlign;
    __vAlign    = _vAlign;
    __font      = _font;
    __wrapWidth = _wrapWidth;
    
    __stringArray    = undefined;
    __nextLineBreak  = infinity;
    __lineBreakIndex = 0;
    __lineWidthArray = undefined;
    __lineBreakArray = undefined;
    __tickMethod     = __Decompose;
    
    var _fontInfo = ScribblejrCacheFontInfo(_font);
    __fontGlyphStruct = _fontInfo.glyphs;
    __spaceWidth      = undefined;
    __spaceHeight     = undefined;
    
    var _fontTexture = _fontInfo.__forcedTexturePointer;
    __texTexelW = texture_get_texel_width(_fontTexture);
    __texTexelH = texture_get_texel_height(_fontTexture);
        
    __vertexBuffer = vertex_create_buffer();
    vertex_begin(__vertexBuffer, _vertexFormat);
    vertex_float2(__vertexBuffer, 0, 0); vertex_texcoord(__vertexBuffer, 0, 0);
    vertex_float2(__vertexBuffer, 0, 0); vertex_texcoord(__vertexBuffer, 0, 0);
    vertex_float2(__vertexBuffer, 0, 0); vertex_texcoord(__vertexBuffer, 0, 0);
    
    __lineStringArray = [];
    __line = 0;
    __glyph = 0;
    __glyphCount = string_length(__string);
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
    
    
    
    
    
    static __Decompose = function()
    {
        __stringArray = __ScribblejrStringDecompose(__string, __glyphCount);
        __tickMethod = __Layout;
        return false;
    }
    
    static __Layout = function()
    {
        var _tempArray = __tempArray;
        var _wrapWidth = __wrapWidth;
        
        if (SCRIBBLEJR_AUTO_RESET_DRAW_STATE) var _oldFont = draw_get_font();
        draw_set_font(__font);
        
        //I'd love to pull this out of the glyph data but the values we get are inaccurate
        var _spaceWidth  = __ScribblejrGetSpaceWidth(__font);
        var _spaceHeight = __ScribblejrGetSpaceHeight(__font);
        __spaceWidth  = _spaceWidth;
        __spaceHeight = _spaceHeight;
        
        
        var _lineArray = string_split(__string, "\n");
        var _i = 0;
        repeat(array_length(_lineArray))
        {
            var _lineString = _lineArray[_i];
            
            var _wordArray = string_split(_lineString, " ");
            var _wordCount = array_length(_wordArray);
        
            //Remove trailing whitespace
            var _j = _wordCount-1;
            repeat(_wordCount)
            {
                if (_wordArray[_j] == "")
                {
                    array_delete(_wordArray, _j, 1);
                }
                else
                {
                    break;
                }
            
                --_j;
            }
        
            var _x = 0;
            var _y = 0;
            var _startIndex = 0;
            var _j = 0;
            repeat(array_length(_wordArray))
            {
                var _word = _wordArray[_j];
                if (_word != "")
                {
                    var _width = string_width(_word);
                    if ((_x + _width > _wrapWidth) && (_x != 0))
                    {
                        if (_j > _startIndex)
                        {
                            array_resize(_tempArray, _j - _startIndex);
                            array_copy(_tempArray, 0, _wordArray, _startIndex, _j - _startIndex);
                            array_push(__lineStringArray, string_join_ext(" ", _tempArray));
                        }
                        
                        _startIndex = _j;
                        _x = 0;
                        _y += _spaceHeight;
                    }
                }
                else
                {
                    var _width = 0;
                }
            
                _x += _width + _spaceWidth;
                ++_j;
            }
            
            array_resize(_tempArray, _j - _startIndex);
            array_copy(_tempArray, 0, _wordArray, _startIndex, _j - _startIndex);
            array_push(__lineStringArray, string_join_ext(" ", _tempArray));
            
            ++_i;
        }
        
        var _height = _y + _spaceHeight;
        switch(__vAlign)
        {
            case fa_top:    __glyphY = 0;          break;
            case fa_middle: __glyphY = -_height/2; break;
            case fa_bottom: __glyphY = -_height;   break;
        }
        
        __tickMethod = __DecomposeLine;
        if (SCRIBBLEJR_AUTO_RESET_DRAW_STATE) draw_set_font(_oldFont);
    }
    
    static __DecomposeLine = function()
    {
        var _string = __lineStringArray[__line];
        __stringArray = __ScribblejrStringDecompose(_string);
        __glyphCount = array_length(__stringArray);
        
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
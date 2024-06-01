// Feather disable all

/// When drawing fonts that have a lot of glyphs defined (Chinese, Japanese, and Korean fonts are
/// common examples) then you'll notice that Scribble Jr. pauses briefly the first time these
/// fonts are drawn. This is because Scribble Jr. is requesting font information from GameMaker
/// which is a very slow operation. This can be distracting for players so Scribble Jr. caches this
/// information as soon as possible so the font info only needs to be fetched once. Unfortunately,
/// that first fetch does still need to happen at some point.
/// 
/// This function is provided so that you can choose to trigger the slow font information fetch at
/// a moment of your choosing. You might want to call this function for every font at the start of
/// the game or maybe only call it when changing language.
/// 
/// @param font

function ScribblejrCacheFontInfo(_font)
{
    static _system         = __ScribblejrSystem();
    static _cache          = _system.__cacheFontInfo;
    static _spriteFontData = _system.__spriteFontData;
    
    var _name = font_get_name(_font);
    
    var _fontInfo = _cache[$ _name];
    if (_fontInfo == undefined)
    {
        _fontInfo = font_get_info(_font);
        _cache[$ _name] = _fontInfo;
        
        var _fontAscenderOffset = _fontInfo.ascenderOffset;
        var _fontGlyphStruct    = _fontInfo.glyphs;
        var _glyphNameArray     = variable_struct_get_names(_fontGlyphStruct);
        
        //Create a new struct that holds character codes by hash
        var _fastGlyphStruct = {};
        _fontInfo.fastGlyphs = _fastGlyphStruct;
        
        var _i = 0;
        repeat(array_length(_glyphNameArray))
        {
            var _name = _glyphNameArray[_i];
            var _glyphInfo = _fontGlyphStruct[$ _name];
            struct_set_from_hash(_fastGlyphStruct, ord(_name), _glyphInfo);
            ++_i;
        }
        
        //Check if this is a spritefont
        if ((_fontInfo.texture < 0) && (_fontInfo.spriteIndex >= 0))
        {
            var _sprite  = _fontInfo.spriteIndex;
            var _spriteInfo = sprite_get_info(_sprite);
            
            var _framesArray = _spriteInfo.frames;
            var _textureIndex = _framesArray[0].texture;
            var _texturePointer = sprite_get_texture(_sprite, 0);
            
            //Force the texture information for the font
            _fontInfo.__forcedTexturePointer = _texturePointer;
            _fontInfo.__isDynamic = false;
            
            var _texTexelW = texture_get_texel_width(_texturePointer);
            var _texTexelH = texture_get_texel_height(_texturePointer);
            
            //Check if all textures match. Scribblejr doesn't support split texture pages!
            if (GM_build_type == "run")
            {
                var _i = 0;
                repeat(array_length(_framesArray))
                {
                    var _frameInfo = _framesArray[_i];
                    if (_frameInfo.texture != _textureIndex)
                    {
                        __ScribblejrError("Spritefont ", sprite_get_name(_sprite), " is not on one texture");
                    }
                    
                    ++_i;
                }
            }
            
            var _extraData = _spriteFontData[$ font_get_name(_font)];
            if (_extraData == undefined)
            {
                __ScribblejrError("Spritefont ", _font, " (sprite=", sprite_get_name(_sprite), ") has not been attached with ScribblejrAddSpriteFont()");
            }
            
            var _proportional = _extraData.__proportional;
            var _separation   = _extraData.__separation;
            var _spriteWidth  = sprite_get_width(_sprite);
            
            var _i = 0;
            repeat(array_length(_glyphNameArray))
            {
                var _name = _glyphNameArray[_i];
                var _glyphInfo = _fontGlyphStruct[$ _name];
                var _image = _glyphInfo.char;
                var _imageInfo = _framesArray[_image];
                
                var _uvs  = sprite_get_uvs(_sprite, _image);
                var _left = round(_uvs[0] / _texTexelW);
                var _top  = round(_uvs[1] / _texTexelH);
                
                
                if (_proportional)
                {
                    var _xOffset = 0;
                    var _glyphSeparation = _imageInfo.crop_width + _separation;
                }
                else
                {            
                    var _xOffset = _imageInfo.x_offset;
                    var _glyphSeparation = _spriteWidth + _separation;
                }
                
                _glyphInfo.x       = _left;
                _glyphInfo.y       = _top;
                _glyphInfo.w       = _imageInfo.crop_width;
                _glyphInfo.h       = _imageInfo.crop_height;
                _glyphInfo.shift   = _glyphSeparation;
                _glyphInfo.offset  = _xOffset;
                _glyphInfo.yOffset = _imageInfo.y_offset;
                
                ++_i;
            }
        }
        else
        {
            //Force the texture information for the font
            _fontInfo.__forcedTexturePointer = font_get_texture(_font);
            _fontInfo.__isDynamic = _fontInfo.freetype;
            
            if (not _fontInfo.__isDynamic)
            {
                if (_fontInfo.sdfEnabled)
                {
                    var _offset = _fontInfo.sdfSpread;
                    var _i = 0;
                    repeat(array_length(_glyphNameArray))
                    {
                        var _name = _glyphNameArray[_i];
                        var _glyphInfo = _fontGlyphStruct[$ _name];
                        
                        _glyphInfo.x      -= 1;
                        _glyphInfo.y      -= 1;
                        _glyphInfo.w      += 2;
                        _glyphInfo.h      += 2;
                        _glyphInfo.offset -=  _offset;
                        _glyphInfo.yOffset = -(_offset + _fontAscenderOffset);
                        
                        ++_i;
                    }
                }
                else
                {
                    var _i = 0;
                    repeat(array_length(_glyphNameArray))
                    {
                        var _name = _glyphNameArray[_i];
                        var _glyphInfo = _fontGlyphStruct[$ _name];
                        
                        _glyphInfo.x      -= 1;
                        _glyphInfo.y      -= 1;
                        _glyphInfo.w      += 2;
                        _glyphInfo.h      += 2;
                        _glyphInfo.yOffset = -_fontAscenderOffset;
                        
                        ++_i;
                    }
                }
            }
        }
    }
    
    return _fontInfo;
}
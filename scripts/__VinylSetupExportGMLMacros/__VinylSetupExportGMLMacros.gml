// Feather disable all

/// Exports a string of GML code that can be copy-pasted into your codebase. This GML string
/// contains a series of macros that can be used to reference Vinyl mixes and patterns. This is
/// often useful to assist with autocomplete when writing playback hooks in your code. In effect,
/// the macros create "Vinyl assets" that can be used more easily than a bunch of strings.

function __VinylSetupExportGMLMacros()
{
    static _mixDict           = __VinylSystem().__mixDict;
    static _patternDict       = __VinylSystem().__patternDict;
    static _queueTemplateDict = __VinylSystem().__queueTemplateDict;
    
    var _buffer = buffer_create(1024, buffer_grow, 1);
    
    var _mixArray = struct_get_names(_mixDict);
    array_sort(_mixArray, true);
    
    var _patternArray = struct_get_names(_patternDict);
    array_sort(_patternArray, true);
    
    var _queueTemplateArray = struct_get_names(_queueTemplateDict);
    array_sort(_queueTemplateArray, true);
    
    
    
    if (array_length(_mixArray))
    {
        buffer_write(_buffer, buffer_text, "//Mix macros\n");
        
        var _maxLength = 0;
        var _i = 0;
        repeat(array_length(_mixArray))
        {
            _maxLength = max(_maxLength, string_length(_mixArray[_i]));
            ++_i;
        }
        
        var _i = 0;
        repeat(array_length(_mixArray))
        {
            var _mixName = _mixArray[_i];
            
            buffer_write(_buffer, buffer_text, "#macro ");
            buffer_write(_buffer, buffer_text, __VinylGetMixMacro(_mixName));
            
            repeat(2 + _maxLength - string_length(_mixName))
            {
                buffer_write(_buffer, buffer_u8, 0x20);
            }
            
            buffer_write(_buffer, buffer_text, "\"");
            buffer_write(_buffer, buffer_text, _mixName);
            buffer_write(_buffer, buffer_text, "\"\n");
        
            ++_i;
        }
    }
    else
    {
        buffer_write(_buffer, buffer_text, "//No mix macros\n");
    }
    
    buffer_write(_buffer, buffer_text, "\n");
    
    
    
    if (array_length(_patternArray))
    {
        buffer_write(_buffer, buffer_text, "//Pattern macros\n");
        
        var _maxLength = 0;
        var _i = 0;
        repeat(array_length(_patternArray))
        {
            _maxLength = max(_maxLength, string_length(_patternArray[_i]));
            ++_i;
        }
        
        var _i = 0;
        repeat(array_length(_patternArray))
        {
            var _patternName = _patternArray[_i];
            
            buffer_write(_buffer, buffer_text, "#macro ");
            buffer_write(_buffer, buffer_text, __VinylGetPatternMacro(_patternName));
            
            repeat(2 + _maxLength - string_length(_patternName))
            {
                buffer_write(_buffer, buffer_u8, 0x20);
            }
            
            buffer_write(_buffer, buffer_text, "\"");
            buffer_write(_buffer, buffer_text, _patternName);
            buffer_write(_buffer, buffer_text, "\"\n");
            
            ++_i;
        }
    }
    else
    {
        buffer_write(_buffer, buffer_text, "//No pattern macros\n");
    }
    
    buffer_write(_buffer, buffer_text, "\n");
    
    
    
    if (array_length(_queueTemplateArray))
    {
        buffer_write(_buffer, buffer_text, "//Queue template macros\n");
        
        var _maxLength = 0;
        var _i = 0;
        repeat(array_length(_queueTemplateArray))
        {
            _maxLength = max(_maxLength, string_length(_queueTemplateArray[_i]));
            ++_i;
        }
        
        var _i = 0;
        repeat(array_length(_queueTemplateArray))
        {
            var _templateName = _queueTemplateArray[_i];
            
            buffer_write(_buffer, buffer_text, "#macro ");
            buffer_write(_buffer, buffer_text, __VinylGetQueueTemplateMacro(_templateName));
            
            repeat(2 + _maxLength - string_length(_templateName))
            {
                buffer_write(_buffer, buffer_u8, 0x20);
            }
            
            buffer_write(_buffer, buffer_text, "\"");
            buffer_write(_buffer, buffer_text, _templateName);
            buffer_write(_buffer, buffer_text, "\"\n");
        
            ++_i;
        }
    }
    else
    {
        buffer_write(_buffer, buffer_text, "//No queue template macros\n");
    }
    
    
    
    buffer_seek(_buffer, buffer_seek_relative, -1);
    buffer_write(_buffer, buffer_u8, 0x00);
    
    var _string = buffer_peek(_buffer, 0, buffer_string);
    buffer_delete(_buffer);
    
    return _string;
}
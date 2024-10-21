// Feather disable all

/// Imports a JSON that contains definitions for mixes, sounds, and patterns. This is sometimes
/// more convenient than writing lines of code.
/// 
/// You can read more about the JSON format that Vinyl expects in the "Vinyl Setup JSON Format"
/// note asset included with the library code.
/// 
/// @param json
/// @param [replace=true]

function VinylSetupImportJSON(_json, _replace = true)
{
    static _system      = __VinylSystem();
    static _soundDict   = __VinylSystem().__soundDict;
    static _patternDict = __VinylSystem().__patternDict;
    
    if (VINYL_LIVE_EDIT)
    {
        _system.__importingJSON = true;
        
        var _oldSoundNameArray   = struct_get_names(_soundDict);
        var _oldPatternNameArray = struct_get_names(_patternDict);
    }
    
    var _result = __VinylSetupImportJSONInner(_json);
    
    if (VINYL_LIVE_EDIT)
    {
        _system.__importingJSON = false;
        __VinylResolveChanges(_replace, _oldSoundNameArray, _oldPatternNameArray);
    }
    
    return _result;
}

function __VinylSetupImportJSONInner(_json)
{
    if (is_array(_json))
    {
        var _i = 0;
        repeat(array_length(_json))
        {
            __VinylSetupImportJSONInner(_json[_i]);
            ++_i;
        }
    }
    else if (is_struct(_json))
    {
        if (struct_exists(_json, "shuffle"))
        {
            return __VinylImportShuffleJSON(_json);
        }
        else if (struct_exists(_json, "hlt"))
        {
            return __VinylImportHLTJSON(_json);
        }
        else if (struct_exists(_json, "blend"))
        {
            return __VinylImportBlendJSON(_json);
        }
        else if (struct_exists(_json, "sound"))
        {
            return __VinylImportSoundJSON(_json);
        }
        else if (struct_exists(_json, "mix"))
        {
            return __VinylImportMixGroupJSON(_json);
        }
        else if (struct_exists(_json, "ducker"))
        {
            return __VinylImportDuckerJSON(_json);
        }
        else if (struct_exists(_json, "queueTemplate"))
        {
            return __VinylImportQueueTemplateJSON(_json);
        }
        else if (struct_exists(_json, "metadata"))
        {
            return __VinylImportGlobalMetadataJSON(_json);
        }
        else
        {
            __VinylError("Struct could not be parsed, missing type information\nStruct should contain one of the following properties to indicate type:\n  .sound\n  .shuffle\n  .hlt\n  .blend\n  .mix\n  .ducker\n  .metadata\nPlease see \"Vinyl JSON Format\" for more information.");
        }
    }
    else
    {
        return __VinylImportSound(_json);
    }
    
    return undefined;
}
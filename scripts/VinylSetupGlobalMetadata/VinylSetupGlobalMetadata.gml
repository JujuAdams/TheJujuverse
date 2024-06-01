// Feather disable all

/// Sets a global metadata value inside Vinyl. This value isn't used by Vinyl but can be helpful to
/// add extra rules or behaviours to audio playback. Global metadata can be retrieved by calling the
/// VinylGetGlobalMetadata() function.
/// 
/// @param metadataName
/// @param data

function VinylSetupGlobalMetadata(_metadata, _data)
{
    static _metadataDict = __VinylSystem().__metadataDict;
    
    _metadataDict[$ _metadata] = _data;
}

function __VinylImportGlobalMetadataJSON(_json)
{
    if (VINYL_SAFE_JSON_IMPORT)
    {
        var _variableNames = struct_get_names(_json);
        var _i = 0;
        repeat(array_length(_variableNames))
        {
            switch(_variableNames[_i])
            {
                case "metadata":
                case "data":
                break;
                
                default:
                    __VinylError("Metadata property .", _variableNames[_i], " not supported");
                break;
            }
            
            ++_i;
        }
        
        if (not struct_exists(_json, "data")) __VinylError("Metadata pattern \"", _json.metadata, "\" property .data must be defined");
    }
    
    VinylSetupGlobalMetadata(_json.metadata, _json.data);
    
    return _json.metadata;
}
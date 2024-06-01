// Feather disable all

/// Returns the metadata with the given name. If that metadata is missing then the default value
/// is returned.
/// 
/// @param metadataName
/// @param [default=undefined]

function VinylGetGlobalMetadata(_metadata, _default = undefined)
{
    static _metadataDict = __VinylSystem().__metadataDict;
    
    return _metadataDict[$ _metadata] ?? _default;
}
// Feather disable all

/// Sets the mix for every sound with the given asset tag.
/// 
/// @param mixName
/// @param assetTag

function VinylSetMixForAssetTag(_mixName, _assetTag)
{
    static _system        = __VinylSystem();
    static _toUpdateArray = _system.__toUpdateArray;
    static _soundDict     = _system.__soundDict;
    
    if (_mixName == VINYL_NO_MIX) _mixName = undefined;
    
    var _assetArray = tag_get_asset_ids(_assetTag, asset_sound);
    var _i = 0;
    repeat(array_length(_assetArray))
    {
        var _pattern = struct_get_from_hash(_soundDict, int64(_assetArray[_i]));
        _pattern.__mixName = _mixName;
        
        if (VINYL_LIVE_EDIT) array_push(_toUpdateArray, _pattern);
        
        ++_i;
    }
    
    if (VINYL_LIVE_EDIT && (not _system.__importingJSON))
    {
        __VinylResolveChanges(false);
    }
}
// Feather disable all

/// Exports the current Vinyl setup as JSON. The root node of this JSON is always an array. JSON
/// can be used to communicate the Vinyl setup to other tools or can be saved to disk for reference
/// later.
/// 
/// You can read more about the JSON format that Vinyl exports in the "Vinyl Setup JSON Format"
/// note asset included with the library code.
/// 
/// @param [ignoreEmpty=true]

function VinylSetupExportJSON(_ignoreEmpty = true)
{
    static _duckerArray  = __VinylSystem().__duckerArray;
    static _mixDict      = __VinylSystem().__mixDict;
    static _patternDict  = __VinylSystem().__patternDict;
    static _soundDict    = __VinylSystem().__soundDict;
    static _metadataDict = __VinylSystem().__metadataDict;
    
    if (not VINYL_LIVE_EDIT)
    {
        __VinylError("VINYL_LIVE_EDIT must be set to <true>");
        return;
    }
    
    
    
    var _outArray            = [];
    var _patternExportedDict = {};
    var _soundExportedDict   = {};
    
    
    
    //Export ducker definitions
    var _i = 0;
    repeat(array_length(_duckerArray))
    {
        array_push(_outArray, _duckerArray[_i].__ExportJSON());
        ++_i;
    }
    
    
    
    //Export mix definitions
    var _namesArray = struct_get_names(_mixDict);
    array_sort(_namesArray, true);
    
    var _i = 0;
    repeat(array_length(_namesArray))
    {
        array_push(_outArray, _mixDict[$ _namesArray[_i]].__ExportJSON(_soundExportedDict, _patternExportedDict, _ignoreEmpty));
        ++_i;
    }
    
    
    
    //Export pattern definitions
    var _namesArray = struct_get_names(_patternDict);
    array_sort(_namesArray, true);
    
    var _i = 0;
    repeat(array_length(_namesArray))
    {
        var _name = _namesArray[_i];
        
        if (not struct_exists(_patternExportedDict, _name))
        {
            var _struct = _patternDict[$ _name].__ExportJSON();
            if (_struct != undefined) array_push(_outArray, _struct);
        }
        
        ++_i;
    }
    
    
    
    //Export sound definitions
    var _namesArray = struct_get_names(_soundDict);
    array_sort(_namesArray, true);
    
    var _i = 0;
    repeat(array_length(_namesArray))
    {
        var _name = _namesArray[_i];
        
        if (not struct_exists(_soundExportedDict, _name))
        {
            var _struct = _soundDict[$ _name].__ExportJSON(_ignoreEmpty);
            if (_struct != undefined) array_push(_outArray, _struct);
        }
        
        ++_i;
    }
    
    
    
    //Export metadata definitions
    var _namesArray = struct_get_names(_metadataDict);
    array_sort(_namesArray, true);
    
    var _i = 0;
    repeat(array_length(_namesArray))
    {
        var _name = _namesArray[_i];
        
        array_push(_outArray, {
            metadata: _name,
            data: _metadataDict[$ _name],
        });
        
        ++_i;
    }
    
    
    
    return _outArray;
}
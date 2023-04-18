/// @param animCurveName

function __VinylClassAnimCurve(_animCurveName) constructor
{
    __animCurveName = _animCurveName;
    
    __animCurve = asset_get_index(__animCurveName);
    __newCurve  = undefined;
    __hash      = undefined;
    
    __channelCount = array_length(animcurve_get(__animCurve).channels);
    
    static toString = function()
    {
        return "<curve " + __animCurveName + ">";
    }
    
    static __Get = function()
    {
        return __newCurve ?? __animCurve;
    }
    
    static __ChannelCountGet = function()
    {
        return __channelCount;
    }
    
    static __Reload = function()
    {
        if (!__VinylGetLiveUpdateEnabled()) return false;
        
        var _filename = filename_dir(GM_project_filename) + "\\animcurves\\" + __animCurveName + "\\" + __animCurveName + ".yy";
        
        var _newHash = md5_file(_filename);
        if (_newHash == __hash) return false;
        __hash = _newHash;
        
        var _buffer = buffer_load(_filename);
        if (_buffer < 0) __VinylError("Could not load " + _filename + "\nCheck that you have disabled the file system sandbox");
        
        var _jsonString = buffer_read(_buffer, buffer_text);
        buffer_delete(_buffer);
        
        var _json = json_parse(_jsonString);
        
        if (__newCurve != undefined) animcurve_destroy(__newCurve);
        __newCurve = animcurve_create();
        
        switch(_json[$ "function"])
        {
            case 0:
                var _jsonCurveType = animcurvetype_linear;
            break;
            
            case 1:
                var _jsonCurveType = animcurvetype_catmullrom;
            break;
            
            case 2:
                show_error("Bezier-type curves not supported due to GameMaker deficiencies", true);
            break;
            
            default:
                show_error("Unhandled curve type " + string(_json[$ "function"]), true);
            break;
        }
        
        var _jsonChannels = _json.channels;
        __channelCount = array_length(_jsonChannels);
        var _newChannels  = array_create(__channelCount, undefined);
        
        var _i = 0;
        repeat(__channelCount)
        {
            var _jsonChannel = _jsonChannels[_i];
            var _newChannel = animcurve_channel_new();
            _newChannels[@ _i] = _newChannel;
            
            _newChannel.type = _jsonCurveType;
            
            var _jsonPoints = _jsonChannel.points;
            var _newPoints = array_create(array_length(_jsonPoints), undefined);
            
            var _p = 0;
            repeat(array_length(_jsonPoints))
            {
                var _jsonPoint = _jsonPoints[_p];
                var _newPoint = animcurve_point_new();
                _newPoints[@ _p] = _newPoint;
                
                _newPoint.posx  = _jsonPoint.x;
                _newPoint.value = _jsonPoint.y;
                
                ++_p;
            }
            
            _newChannel.points = _newPoints;
            
            ++_i;
        }
        
        __newCurve.channels = _newChannels;
        
        if (VINYL_DEBUG_READ_CONFIG) __VinylTrace("Reloaded ", self, " from ", _filename);
        
        return true;
    }
}
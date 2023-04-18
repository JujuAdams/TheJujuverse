/// Creates a Vinyl linear emitter and returns a reference to it
/// 
/// @param radius
/// @param pointArray/path

function VinylEmitterPolyline(_radius, _pointArray)
{
    if (is_numeric(_pointArray))
    {
        var _path = _pointArray;
        if (!path_exists(_path)) __VinylError("Path ", _path, " doesn't exist");
        
        var _length = path_get_number(_path);
        _pointArray = array_create(2*_length);
        
        var _i = 0;
        var _j = 0;
        repeat(_length)
        {
            _pointArray[@ _j  ] = path_get_point_x(_path, _i);
            _pointArray[@ _j+1] = path_get_point_y(_path, _i);
            ++_i;
            _j += 2;
        }
    }
    
    var _emitterRef = new __VinylClassEmitterRef();
    _emitterRef.__Polyline(_radius, _pointArray);
    return _emitterRef;
}
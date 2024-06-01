// Feather disable all

/// @param animCurve
/// @param [strict=true]

function __VinylImportAnimCurve(_animCurve, _strict = true)
{
    if (is_string(_animCurve))
    {
        var _newAnimCurve = asset_get_index(_animCurve);
        if (_strict && (not animcurve_exists(_newAnimCurve))) __VinylError("Animation curve \"", _animCurve, "\" not found");
        return _newAnimCurve;
    }
    else if ((_animCurve == undefined) || (_animCurve == pointer_null))
    {
        return undefined;
    }
    else if (is_handle(_animCurve))
    {
        return _animCurve;
    }
    
    if (_strict) __VinylError("Datatype not supported (", typeof(_animCurve), ")");
}
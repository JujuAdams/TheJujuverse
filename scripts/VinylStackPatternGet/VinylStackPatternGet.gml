/// @param name
/// @param priority

function VinylStackPatternGet(_name, _priority)
{
    return VinylPatternGet(VinylStackGet(_name, _priority));
}
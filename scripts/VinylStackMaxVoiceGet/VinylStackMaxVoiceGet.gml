/// @param name

function VinylStackMaxVoiceGet(_name)
{
    return VinylStackGet(_name, VinylStackMaxPriorityGet(_name));
}
// Feather disable all

function __VinylSoundGetGain(_sound)
{
    static _soundDict = __VinylSystem().__soundDict;
    return struct_get_from_hash(_soundDict, int64(_sound)).__gain;
}
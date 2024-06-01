// Feather disable all

/// Returns the master (global) gain for Vinyl.

function VinylMasterGetGain()
{
    static _system = __VinylSystem();
    return _system.__masterGain;
}
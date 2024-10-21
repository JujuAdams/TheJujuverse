// Feather disable all

/// Registers an emitter for use with the "emitter" property on patterns. You should call this
/// function once, ideally on boot. This emitter should further exist for the lifetime of the game
/// and is intended for use with audio effect buses.
/// 
/// @param emitter
/// @param alias

function VinylRegisterEmitter(_emitter, _alias)
{
    static _emitterMap = __VinylSystem().__emitterMap;
    
    _emitterMap[? _alias] = _emitter;
}
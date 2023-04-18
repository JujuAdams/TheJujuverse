/// Returns the global transposition state

function VinylGlobalTransposeGet()
{
    static _globalData = __VinylGlobalData();
    return _globalData.__transpose;
}
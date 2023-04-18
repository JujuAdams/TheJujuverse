function __VinylArrayShuffle(_array)
{
    array_sort(_array, function()
    {
        return 2*__VinylRandomBool() - 1;
    });
}
/// Starts playing an untracked soumd and returns a native GameMaker voice ID
/// This function is a more performant way to play short audio clips
/// 
/// You cannot use Vinyl functions to later control/manipulate audio playback when using this function
/// This function should only be used for short sound effects such as collecting coins
/// 
/// VinylPlaySimple() cannot be used to play Queue or Multi patterns, and simple audio will not be
/// set to loop by Vinyl regardless of configuration settings
/// 
/// @param sound
/// @param [gain=1]
/// @param [pitch=1]

function VinylPlaySimple(_sound, _gain = 1, _pitch = 1)
{
    return __VinylPatternGet(_sound).__PlaySimple(_sound, _gain, _pitch);
}
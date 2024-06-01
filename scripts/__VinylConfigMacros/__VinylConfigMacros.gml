// Feather disable all

//The name to use to indicate no mix. This should be a unique string and cannot be used for the
//name of mixes when calling VinylSetupMix() or VinylSetupImportJSON().
#macro VINYL_NO_MIX  "no mix"

//The default mix to use for all sounds and patterns unless otherwise specified. If you set this
//macro to <VINYL_NO_MIX> then no mix will be set by default.
#macro VINYL_DEFAULT_MIX  VINYL_NO_MIX

//Maximum final gain for audio voices. Must be greater than or equal to zero. Setting this value
//higher will allow for higher gain values throughout Vinyl but may lead to degraded audio quality.
#macro VINYL_MAX_VOICE_GAIN  2

//Boost to global master gain. This is helpful to tame audio levels if they're too loud or to
//increase audio levels if they're too quiet.
#macro VINYL_MASTER_GAIN_BOOST  1

//The default rate for VinylPlayFadeIn(), VinylFadeOut(), and VinylMixVoicesFadeOut() operations.
//These two macros are measured in "gain units per second".
#macro VINYL_DEFAULT_FADE_IN_RATE   1
#macro VINYL_DEFAULT_FADE_OUT_RATE  1

//Whether to rigorously check imported JSON when calling VinylSetupImportJSON(). This is useful to
//catch errors in JSON but carries a performance penality. You may want to consider setting this
//macro to <false> for production builds after your JSON import has been thoroughly tested.
#macro VINYL_SAFE_JSON_IMPORT  true

//Whether live editing is enabled.
#macro VINYL_LIVE_EDIT  true

//Length of moment-to-moment gain adjustments, in milliseconds
//Choose lower values for tigher, quicker gain adjustment
//Choose higher values for smooth, less glitchy gain adjustment
#macro VINYL_STEP_DURATION  50

//How far from the end of an audio asset to determine the audio as finishing. This is used for
//audio scheduling for queue voices
#macro VINYL_WILL_STOP_TOLERANCE  20
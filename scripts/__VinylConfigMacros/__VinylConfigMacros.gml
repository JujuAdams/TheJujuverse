//Maximum output gain for audio voices. Must be greater than or equal to zero
//Choose lower values to get more resolution in perceived volume levels
#macro VINYL_MAX_GAIN  1

//Default rate of gain adjument when approaching a gain target
//Measured in units/second
#macro VINYL_DEFAULT_GAIN_RATE  0.3

//Default rate of pitch adjument when approaching a pitch target
//Measured in units/second
#macro VINYL_DEFAULT_PITCH_RATE  0.3

//Default rate of gain adjument when a stack ducks a voice
//Measured in units/second
#macro VINYL_DEFAULT_DUCK_GAIN_RATE  1.0

//Falloff values to use for emitters when first created
#macro VINYL_DEFAULT_FALLOFF_MIN      40 //Must be larger than 0
#macro VINYL_DEFAULT_FALLOFF_MAX     200
#macro VINYL_DEFAULT_FALLOFF_FACTOR    1

//Default values to set for queue and multi patterns when the <behavior>, <blend>, and <sync>
//properties are unsert. See VinylQueueBehaviorSet(), VinylMultiBlendSet(), and VinylMultiSyncSet()
//for more information
#macro VINYL_DEFAULT_QUEUE_BEHAVIOR  0
#macro VINYL_DEFAULT_MULTI_BLEND     undefined
#macro VINYL_DEFAULT_MULTI_SYNC      false

//Default beats-per-minute to use for assets
#macro VINYL_DEFAULT_BPM  120

//Simulates the "head" size of the listener. This applies an offset to all Vinyl emitter types,
//increasing their size to more realistically position emitter audio in the stereo field. This
//is particularly noticeable when using point emitters - setting an appropriate head size will
//prevent audio from quickly, and distractingly, moving from one ear to another as the listener
//position passes by the emitter
#macro VINYL_LISTENER_HEAD_SIZE  0



#region Advanced

//Whether to strictly filter config file properties to detect any incorrect or invalid names. This
//carries a performance penalty when loading.
#macro VINYL_CONFIG_VALIDATE_PROPERTIES  true

//Controls how the config file (__VinylConfig) is read regarding gain values
//Setting this macro to <true> will cause Vinyl to treat gain values as decibels (dbFS)
//A decibel value of 0 will be translated to an unchanged gain i.e. a GM amplitude value of 1
//Negative decibel values will be translated to an attenuation of audio amplitude
#macro VINYL_CONFIG_DECIBEL_GAIN  false

//Controls how the config file (__VinylConfig) is read regarding pitches
//Setting this macro to <true> will cause Vinyl to treat pitch values as percentages
//This means a value of 50 will be translated into 50%, or a halving of a sound's pitch
#macro VINYL_CONFIG_PERCENTAGE_PITCH  false

//Whether to allow VinylPlay() (and equivalent functions) to play audio assets by their asset name as a string
#macro VINYL_ALLOW_ASSET_REFERENCE_BY_STRING  false

//How often to scan the Vinyl config file for changes, in milliseconds
//Set this value to zero (or a negative number) to turn off live update
//Live update can further be toggled using VinylLiveUpdateGet()
//Live update only works when running from the IDE on Windows, Mac, or Linux
#macro VINYL_LIVE_UPDATE_PERIOD  250

//Length of moment-to-moment gain adjustments, in milliseconds
//Choose lower values for tigher, quicker gain adjustment
//Choose higher values for smooth, less glitchy gain adjustment
#macro VINYL_STEP_DURATION  50

//How far from the end of an audio asset to determine the audio as finishing. This is used for
//audio scheduling for queue voices
#macro VINYL_WILL_STOP_TOLERANCE  20

//Number of audio voices / emitters pre-created in the pool
#macro VINYL_POOL_START_SIZE  20

//Listener index to use for Vinyl functions
#macro VINYL_LISTENER_INDEX  0

#endregion
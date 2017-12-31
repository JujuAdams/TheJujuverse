/// @description Customisable audio-playing function, used to add variety to playback
/// @param sound
/// @param priority
/// @param loops

var _sound    = argument0;
var _priority = argument1;
var _loops    = argument2;

var _gain = 1;
var _pitch = 1;
/*
switch( _sound ) {
    case snd_points_get:
        _gain = 0.0;
    break;
    case snd_cameraPan_8secs:
        _gain = 0.05;
    break;
    case snd_slideLoop:
        _gain = 0.05;
    break;
    case snd_bad_donk:
        _gain = .6;
    break;
    case snd_good_donk:
        _gain = .55;
    break;
    case snd_hand:
        _gain = 0.38;
    break;
    case snd_wheel:
        _gain = 0.25;
    break;
    case snd_duck_0:
        _sound = choose( snd_duck_0, snd_duck_1 );
        _pitch = random_range( 0.95, 1.05 );
        _gain = 0.45;
    break;
    case snd_transition_forwards:
    case snd_transition_backwards:
        _gain = 0.4; 
    break;
    case snd_purr_0:
        _sound = choose( snd_purr_0, snd_purr_2, snd_purr_3 );
        _gain = 1.2;
    break;
    case snd_chill_mew_1:
        _sound = choose( snd_chill_mew_1, snd_chill_mew_4 );
        _pitch = random_range( 0.98, 1.02 );
        _gain = 0.28;
    break;
    case snd_scratch0:
        _sound = choose( snd_scratch0, snd_scratch1, snd_scratch2, snd_scratch3, snd_scratch4, snd_scratch5, snd_scratch6 );
        _gain = 0.2;
    break;
    case snd_hiss_0:
        _sound = choose( snd_hiss_0, snd_hiss_1, snd_hiss_2, snd_hiss_3, snd_hiss_4, snd_hiss_5 );
        _gain = .7;
    break;
}
*/
var _id = audio_play_sound( _sound, _priority, _loops );
audio_sound_pitch( _id, _pitch );
audio_sound_gain( _id, _gain, 0 );

return _id;
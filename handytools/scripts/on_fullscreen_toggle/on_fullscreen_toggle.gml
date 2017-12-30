/*
    This script is called whenever the window is successfully toggled to/from fullscreen mode.
*/

if ( !instance_exists( obj_menu ) ) {
    audio_play_sound( snd_flower, 1, false );
    tr_instance_create( 0, 0, obj_menu );
}
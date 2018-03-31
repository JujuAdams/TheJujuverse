/*
    This script is called whenever the window is successfully toggled to/from fullscreen mode.
*/

if ( !instance_exists( obj_menu ) ) {
    //phon_play( snd_flower );
    tr_instance_create( 0, 0, obj_menu );
}
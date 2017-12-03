event_inherited();

if ( mouse_clicked ) {
    audio_play_sound_at( snd_take_hammer, x, y, z, 100, 300, 1, false, 1 );
    global.game_got_hammer = true;
    tr_instance_destroy();
    with( obj_subtitle ) {
        alpha_animate = true;
        alpha_direction = -1;
    }
}
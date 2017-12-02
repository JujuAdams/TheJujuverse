event_inherited();

if ( global.game_got_scissors ) mouse_interactible = true;
if ( mouse_clicked ) and ( !outro_animate ) {
    audio_play_sound_at( snd_rope_cut, x, y, z, 100, 300, 1, false, 1 );
    outro_animate = true;
}

if ( outro_animate ) {
    outro_t = clamp( outro_t + outro_anim_speed, 0, 1 );
    if ( outro_t >= 1 ) {
        outro_animate = false;
        instance_destroy();
    }
}
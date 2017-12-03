event_inherited();

if ( outro_animate ) {
    outro_t = clamp( outro_t + outro_anim_speed, 0, 1 );
    if ( outro_t >= 1 ) {
        outro_animate = false;
        tr_instance_destroy();
    }
}
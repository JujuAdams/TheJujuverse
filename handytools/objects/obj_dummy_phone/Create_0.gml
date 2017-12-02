event_inherited();
mouse_interactible = true;

z = 40;

headset_t = 0;
headset_animate = false;
headset_anim_speed = 0.02;
headset_direction = 0;

phone_ring_do = true;
phone_ring_last_time = current_time + random_range( 1000, 4000 );
phone_ring_sound_instance = noone;
phone_ring_do_delay = true;
phone_ring_delay = random_range( 330, 1000 );
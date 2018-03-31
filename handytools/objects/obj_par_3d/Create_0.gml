event_inherited();

mouse_active_init();

emitter = audio_emitter_create();
audio_emitter_falloff( emitter, 100, 300, 1 );

z = 0;
x_scale = 1;
y_scale = 1;
z_scale = 1;
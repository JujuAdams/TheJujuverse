shader_reset();
gpu_set_ztestenable( false );
gpu_set_zwriteenable( false );
gpu_set_ztestenable( false );
gpu_set_cullmode( cull_noculling );
draw_set_lighting( false );
gpu_set_fog( false, background_colour, 0, 0 );
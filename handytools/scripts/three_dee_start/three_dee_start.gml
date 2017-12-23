gpu_set_ztestenable( true );
gpu_set_zwriteenable( true );
gpu_set_ztestenable( true );
gpu_set_cullmode( global.do_culling? cull_counterclockwise : cull_noculling );
draw_set_lighting( false );
shader_reset();
draw_clear( c_black );

gpu_set_ztestenable( true );
gpu_set_zwriteenable( true );
gpu_set_ztestenable( true );
gpu_set_cullmode( global.do_culling? cull_counterclockwise : cull_noculling );
draw_set_lighting( false );
shader_reset();

switch( grip_view_get_camera_name( view_current ) ) {
	
	case "pov": //What the player sees, using forward rendering for lights
		global.click_render = false;
		global.mirror_render = false;
		s_shader_begin( shd_per_texel_lighting );
	break;
	
	case "click": //A screenspace click detection render
		global.click_render = true;
		global.mirror_render = false;
	break;
	
	case "mirror0": //Render out mirrors
	case "mirror1":
	case "mirror2":
	case "mirror3":
		global.mirror_render = true;
		global.click_render = false;
		s_shader_begin( shd_per_texel_lighting );
	break;
	
	case "mirror click0": //Render out mirror click detection
	case "mirror click1":
		global.click_render = true;
		global.mirror_render = true;
	break;
	
}
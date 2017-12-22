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
		s_shader_uniform_f( "u_vForceColour", 1.0, 1.0, 1.0, 0.0 );
		if ( global.do_lighting ) s_shader_uniform_f( "u_vAmbientColour", 0.1, 0.1, 0.13, 0.0 );
		                     else s_shader_uniform_f( "u_vAmbientColour", 1.0, 1.0, 1.00, 1.0 );
		
		var _light = 0;
		with( obj_camera ) s_shader_set_light( _light++, x, y, z, 100, c_gray, 1 );
		with( obj_light ) if ( visible ) s_shader_set_light( _light++, x, y, z, range, colour, 1 );
		for( var _i = _light; _i < 8; _i++ ) s_shader_set_light( _light, 0, 0, 0, 1, c_black, 0 );
		
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
		s_shader_uniform_f( "u_vForceColour", 1.0, 1.0, 1.0, 0.0 );
		if ( global.do_lighting ) s_shader_uniform_f( "u_vAmbientColour", 0.1, 0.1, 0.13, 0.0 );
		                     else s_shader_uniform_f( "u_vAmbientColour", 1.0, 1.0, 1.00, 1.0 );
		
		var _light = 0;
		with( obj_camera ) s_shader_set_light( _light++, x, y, z, 100, c_gray, 1 );
		with( obj_light ) if ( visible ) s_shader_set_light( _light++, x, y, z, range, colour, 1 );
		for( var _i = _light; _i < 8; _i++ ) s_shader_set_light( _light, 0, 0, 0, 1, c_black, 0 );
	break;
	
	case "mirror click0": //Render out mirrors
	case "mirror click1":
		global.click_render = true;
		global.mirror_render = true;
	break;
	
}
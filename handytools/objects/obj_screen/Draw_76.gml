if ( FPS_ON ) frame_start_time = get_timer();

s_shader_end();
draw_set_colour( c_white );
draw_set_alpha( 1 );

if ( SCREEN_3D ) {
	
	//Assign all instances a "click index" for click detection rendering
	global.click_array = undefined;
	global.click_array[ instance_count-1 ] = noone;
	global.click_array[ 0                ] = noone;
	global.click_index = 1;
	with( all ) {
		my_click_index = global.click_index++;
		global.click_array[ my_click_index ] = id;
	}
	
	//Set up uniforms for the lighting shader
	s_shader_begin( SCREEN_3D_SHADER );
	var _light = 0;
	if ( ALLOW_LIGHTING && global.screen_do_lighting ) {
		s_shader_colour( "u_vAmbientColour", C_AMBIENT, 0 );
		with( obj_camera ) s_shader_set_light( _light++, x, y, z, 100, c_gray, 1 );
		with( obj_light ) if ( visible ) s_shader_set_light( _light++, x, y, z, range, colour, 1 );
	} else {
		s_shader_colour( "u_vAmbientColour", c_white, 1 );
	}
	for( var _i = _light; _i < SCREEN_MAX_LIGHTS; _i++ ) s_shader_set_light( _light, 0, 0, 0, 1, c_black, 0 );
	s_shader_colour( "u_vForceColour", c_white, 0 );
	s_shader_end();
	
} else {
	
	//2D stuff idk
	
}

//Render out manual grips
grip_handle_predraw();
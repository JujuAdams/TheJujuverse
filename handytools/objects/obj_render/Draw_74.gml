draw_clear( c_black );

switch( instance_exists( obj_camera ) ) {
	
	case false:
		draw_surface( application_surface, 0, 0 );
	break;
	
	default:
		
		var _view_x = camera_get_view_x( obj_camera.camera );
		var _view_y = camera_get_view_y( obj_camera.camera );
		var _camera_zoom = obj_camera.camera_zoom;
		
		//--------------------
		//Dynamic Distortion
		//--------------------
		srf_displacement = tr_surface_check( srf_displacement, APP_SURF, APP_SURF, "srf_displacement" );
		surface_set_target( srf_displacement );
			draw_wipe( $007F7F );
			
			/*
			var _matrix = matrix_get( matrix_world );
			_matrix = matrix_multiply( _matrix, matrix_build( -_view_x, -_view_y,0,   0,0,0,   1,1,1 ) );
			_matrix = matrix_multiply( _matrix, matrix_build( 0,0,0,   0,0,0,   _camera_zoom*scaling_x,_camera_zoom*scaling_y,1 ) );
			matrix_set( matrix_world, _matrix );
			*/
			matrix_stack_set_world();
			matrix_stack_push_build( -_view_x, -_view_y,0,   0,0,0,   1,1,1 );
			matrix_stack_push_build( 0,0,0,   0,0,0,   _camera_zoom*scaling_x,_camera_zoom*scaling_y,1 );
			matrix_stack_top_world();
				
				s_shader_begin( shd_displacement_aoe );
				with( obj_parent_screen_distortion ) event_user( 0 );
				s_shader_end();
			
			matrix_stack_clear_world();
			
		surface_reset_target();
		
		//--------------------
		//Fisheye and Aberration
		//--------------------
		srf_postproc = tr_surface_check( srf_postproc, APP_SURF, APP_SURF, "srf_postproc" );
		surface_set_target( srf_postproc );
			s_shader_begin( shd_postproc );
			s_shader_uniform_f( "u_fAberration_min",  0.3 );
			s_shader_uniform_f( "u_fAberration_max", 40.0 );
			s_shader_surface_sampler( "u_sDisplacement", srf_displacement );
			draw_surface( application_surface, 0, 0 );
			s_shader_end();
		surface_reset_target();
		
		if ( options_get( "fxaa" ) ) {
			
			//--------------------
			//FXAA
			//--------------------
			s_shader_begin( shd_fxaa );
				s_shader_surface_texel_dims( "u_vTexel", srf_postproc );
				draw_surface( srf_postproc, 0, 0 );
			s_shader_end();
			
		} else {
			
			draw_surface( srf_postproc, 0, 0 );
			
		}
		
	break;
		
}
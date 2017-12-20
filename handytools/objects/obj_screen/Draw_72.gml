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
		click_array = undefined;
		click_array[0] = noone;
		click_index = 0;
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
		global.mirror_render = true;
		global.click_render = true;
		click_array = undefined;
		click_array[0] = noone;
		click_index = 0;
	break;
	
}

/*
//Render out mirror click detection
global.click_render = true;
global.mirror_render = true;

with( obj_mirror_frame ) {
    
    if ( !surface_exists( srf_mirror_click ) ) srf_mirror_click = tr_surface_create( 960, 720 );
    
    surface_set_target( srf_mirror_click );
        
		matrix_set( matrix_view, matrix_build_lookat( x, y, z+32,   lengthdir_x( 1, image_angle )+x, lengthdir_y( 1, image_angle )+y, z+32,   0, 0, 1 ) );
		matrix_set( matrix_projection, matrix_build_projection_perspective_fov( DEFAULT_FOV, 320/240, 1, 4000 ) );
        draw_clear( c_black );
        
        var _index = 0;
        with( obj_par_3d ) {
            _index += 5;
            other.click_array[_index] = id;
            if ( object_index == obj_door ) continue;
            gpu_set_fog( true, make_colour_rgb( _index mod 256, _index div 256, 128 ), 0, 0 );
            event_perform( ev_draw, 0 );
        }
        gpu_set_fog( false, c_white, 0, 0 );
        
    surface_reset_target();
    
}

global.mirror_render = false;
camera_set_projection();



//Render out click detection
click_array = undefined;
click_array[0] = noone;
if ( !surface_exists( srf_click ) ) srf_click = tr_surface_create( global.app_surf_w, global.app_surf_h );

surface_set_target( srf_click );
    
    camera_set_projection();
    draw_clear( c_black );
    
    var _index = 0;
    with( obj_par_3d ) {
        _index += 5;
        other.click_array[_index] = id;
        gpu_set_fog( true, make_colour_rgb( _index mod 256, _index div 256, 0 ), 0, 0 );
        event_perform( ev_draw, 0 );
    }
    gpu_set_fog( false, c_white, 0, 0 );
    
surface_reset_target();

camera_set_projection();
global.click_render = false;
*/

/*
//Render out mirrors
global.mirror_render = true;
with( obj_mirror_frame ) {
    
    if ( !surface_exists( srf_mirror ) ) srf_mirror = tr_surface_create( 960, 720 );
    
    surface_set_target( srf_mirror );
    draw_clear( background_colour );
	matrix_set( matrix_view, matrix_build_lookat( x, y, z+32,   lengthdir_x( 1, image_angle )+x, lengthdir_y( 1, image_angle )+y, z+32,   0, 0, 1 ) );
	matrix_set( matrix_projection, matrix_build_projection_perspective_fov( DEFAULT_FOV, 320/240, 1, 4000 ) );
    with( all ) if ( object_index != obj_mirror_frame ) and ( object_index != obj_dummy_mirror_frame ) event_perform( ev_draw, 0 );
    surface_reset_target();
    
}
with( obj_dummy_mirror_frame ) {
    
    if ( !surface_exists( srf_mirror ) ) srf_mirror = tr_surface_create( 960, 720 );
    
    surface_set_target( srf_mirror );
    draw_clear( background_colour );
	matrix_set( matrix_view, matrix_build_lookat( x, y, z+32,   lengthdir_x( 1, image_angle )+x, lengthdir_y( 1, image_angle )+y, z+32,   0, 0, 1 ) );
	matrix_set( matrix_projection, matrix_build_projection_perspective_fov( DEFAULT_FOV, 320/240, 1, 4000 ) );
    with( all ) if ( object_index != obj_mirror_frame ) and ( object_index != obj_dummy_mirror_frame ) event_perform( ev_draw, 0 );
    surface_reset_target();
    
}

global.mirror_render = false;
camera_set_projection();
*/
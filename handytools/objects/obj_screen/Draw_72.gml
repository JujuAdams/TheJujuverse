draw_clear( c_black );

gpu_set_ztestenable( true );
gpu_set_zwriteenable( true );
gpu_set_ztestenable( true );
gpu_set_cullmode( global.game_editing ? cull_counterclockwise : cull_noculling );
draw_set_lighting( false );
shader_reset(); 

switch( view_current ) {
	
	case 0: //What the player sees, using forward rendering for lights
		shader_set( shd_psx );
		if ( do_lighting ) {
			shader_set_uniform_f( shader_get_uniform( shd_psx, "u_vAmbientColour" ), 0.1, 0.1, 0.13, 0.0 );
		} else {
			shader_set_uniform_f( shader_get_uniform( shd_psx, "u_vAmbientColour" ), 1.0, 1.0, 1.0, 1.0 );
		}
		shader_set_uniform_f( shader_get_uniform( shd_psx, "u_vForceColour" ), 1.0, 1.0, 1.0, 0.0 );
		shader_set_uniform_f( shader_get_uniform( shd_psx, "u_fVibrate" ), 0.0 );
		shader_set_uniform_f( shader_get_uniform( shd_psx, "u_fGarbage" ), 0.0 );
	break;
	
	case 1: //A screenspace click detection render
		click_array = undefined;
		click_array[0] = noone;
		click_index = 0;
		global.click_render = true;
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
		matrix_set( matrix_projection, matrix_build_projection_perspective_fov( FOV, 320/240, 1, 4000 ) );
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
if ( !surface_exists( srf_click ) ) srf_click = tr_surface_create( DEFAULT_APP_SURF_W, DEFAULT_APP_SURF_H );

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

//camera_set_projection();

/*
//Render out mirrors
global.mirror_render = true;
with( obj_mirror_frame ) {
    
    if ( !surface_exists( srf_mirror ) ) srf_mirror = tr_surface_create( 960, 720 );
    
    surface_set_target( srf_mirror );
    draw_clear( background_colour );
	matrix_set( matrix_view, matrix_build_lookat( x, y, z+32,   lengthdir_x( 1, image_angle )+x, lengthdir_y( 1, image_angle )+y, z+32,   0, 0, 1 ) );
	matrix_set( matrix_projection, matrix_build_projection_perspective_fov( FOV, 320/240, 1, 4000 ) );
    with( all ) if ( object_index != obj_mirror_frame ) and ( object_index != obj_dummy_mirror_frame ) event_perform( ev_draw, 0 );
    surface_reset_target();
    
}
with( obj_dummy_mirror_frame ) {
    
    if ( !surface_exists( srf_mirror ) ) srf_mirror = tr_surface_create( 960, 720 );
    
    surface_set_target( srf_mirror );
    draw_clear( background_colour );
	matrix_set( matrix_view, matrix_build_lookat( x, y, z+32,   lengthdir_x( 1, image_angle )+x, lengthdir_y( 1, image_angle )+y, z+32,   0, 0, 1 ) );
	matrix_set( matrix_projection, matrix_build_projection_perspective_fov( FOV, 320/240, 1, 4000 ) );
    with( all ) if ( object_index != obj_mirror_frame ) and ( object_index != obj_dummy_mirror_frame ) event_perform( ev_draw, 0 );
    surface_reset_target();
    
}

global.mirror_render = false;
camera_set_projection();
*/
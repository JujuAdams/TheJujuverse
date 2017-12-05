shader_reset();
gpu_set_ztestenable( false );
gpu_set_zwriteenable( false );
gpu_set_ztestenable( false );
gpu_set_cullmode( cull_noculling );
draw_set_lighting( false );

gpu_set_fog( false, background_colour, 0, 0 );

switch( view_current ) {
	
	case 0: //What the player sees, using forward rendering for lights
		camera_apply( camera_2d );
		var _x = DEFAULT_APP_SURF_W/2;
		var _y = DEFAULT_APP_SURF_H/2;
		if ( global.game_room != 0 ) and ( global.game_room != 10 ) draw_sprite_ext( spr_white_pixel, 0, _x, _y, 2, 2, 0, c_white, 0.3 );
		if ( instance_exists( obj_menu ) ) draw_sprite( spr_title, 0, 0, 0 );
		if ( obj_gameflow.transition_do ) draw_sprite_ext( spr_white_pixel, 0, 0, 0,
		                                               DEFAULT_APP_SURF_W, DEFAULT_APP_SURF_H,
													   0, obj_gameflow.transition_colour, obj_gameflow.transition_t );
	break;
	
	case 1: //A screenspace click detection render
		global.click_render = false;
	break;
	
}
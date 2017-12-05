shader_reset();
gpu_set_ztestenable( false );
gpu_set_zwriteenable( false );
gpu_set_ztestenable( false );
gpu_set_cullmode( cull_noculling );
draw_set_lighting( false );

gpu_set_fog( false, background_colour, 0, 0 );

switch( view_current ) {
	case 0:
		var _x = APP_SURF_W/2;
		var _y = APP_SURF_H/2;
		if ( global.game_room != 0 ) and ( global.game_room != 10 ) draw_sprite_ext( spr_white_pixel, 0, _x, _y, 2, 2, 0, c_white, 0.3 );
		if ( instance_exists( obj_menu ) ) draw_sprite( spr_title, 0, 0, 0 );
		if ( obj_game.transition_do ) draw_sprite_ext( spr_white_pixel, 0, 0, 0, 320, 240, 0, obj_game.transition_colour, obj_game.transition_t );
	break;
	case 1:
		global.click_render = false;
	break;
}
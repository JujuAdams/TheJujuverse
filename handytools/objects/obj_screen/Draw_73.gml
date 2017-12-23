three_dee_end();

switch( grip_get_current_rendering() ) {
	
	case "pov":
		camera_apply( grip_get_camera( "2d" ) );
		var _x = global.app_surf_w/2;
		var _y = global.app_surf_h/2;
		if ( global.game_room != 0 ) && ( global.game_room != 10 ) draw_sprite_ext( spr_white_pixel, 0, _x, _y, 2, 2, 0, c_white, 0.3 );
		if ( instance_exists( obj_menu ) ) draw_sprite( spr_title, 0, 0, 0 );
		if ( obj_gameflow.transition_do ) draw_sprite_ext( spr_white_pixel, 0, 0, 0,
		                                                   global.app_surf_w, global.app_surf_h,
													       0, obj_gameflow.transition_colour, obj_gameflow.transition_t );
	break;
	
	case "click":
	case "mirror0":
	case "mirror1":
	case "mirror2":
	case "mirror3":
	case "mirror click0":
	case "mirror click1":
		global.mirror_render = false;
		global.click_render = false;
	break;
	
}
var _show_bar = false;
switch( global.gameflow_mode ) {
	case e_game_mode.local_: _show_bar = true; break;
	case e_game_mode.single:
}

if ( state == 1 ) and ( _show_bar ) and ( obj_camera.camera_state != e_camera_state.pan ) {
	
	if ( global.gameflow_player == 0 ) var _colour = PLAYER_A_COLOUR_LIGHT else var _colour = PLAYER_B_COLOUR_LIGHT;
	
	draw_sprite_ext( spr_space_indicator, floor( sin( current_time / 60 ) ) * -1,
		             display_get_gui_width() div 2, display_get_gui_height() div 2 - 100,
		             2, 2, 0,
					 _colour, 1 );
	
	if ( global.gameflow_player == 0 ) var _colour = PLAYER_A_COLOUR_DARK else var _colour = PLAYER_B_COLOUR_DARK;
	
	var _text = control_key_to_name( control_property( 0, "keyboard mapping", "fire" ) );
	draw_set_font( fnt_atari_30 );
	draw_set_colour( _colour );
	draw_set_halign( fa_center );
	draw_set_valign( fa_middle );
	draw_text( display_get_gui_width() div 2, display_get_gui_height() div 2 - 100, _text );
	draw_set_colour( c_white );
	draw_set_halign( fa_left );
	draw_set_valign( fa_top );
	draw_set_font( fnt_default );
	
} else if ( state == 3 ) {
	
	if (!surface_exists(wheel_surf)) {
		wheel_surf = surface_create(scale, scale);
		surface_set_target(wheel_surf);
		draw_clear_alpha(0, 0);
		surface_reset_target();
	}
	
	surface_set_target(wheel_surf);
	
	var _elapsed = current_time - meter_timer;
	
	var centre_x = display_get_gui_width() div 2;
	var centre_y = display_get_gui_height() div 2 - 100;
	
	var _centre_x = scale div 2;
	var _centre_y = scale div 2;
	
	var _scale = scale div 3;
	var _segment_scale = 150;
	var _rotation = _elapsed * rotation_factor;
	
	draw_set_colour( c_black );
	
	var inner_radius = (_scale * 1.04) - ring_width;
	var thickness = ring_width;
	var segments = 24;
	var jadd = 360/segments;
	draw_primitive_begin(pr_trianglestrip);
	for (var j = 0; j <= 360; j+=jadd)
	{
	    draw_vertex(_centre_x+lengthdir_x(inner_radius,j),_centre_y+lengthdir_y(inner_radius,j));
	    draw_vertex(_centre_x+lengthdir_x(inner_radius+thickness,j),_centre_y+lengthdir_y(inner_radius+thickness,j));
	}
	draw_primitive_end();
	
	gpu_set_blendmode_ext(bm_dest_alpha, bm_inv_src_alpha);
	
	for( var _i = 0; _i < wheel_segments; _i++ ) {
		
		if ( wheel_array[ _i ] <= 0.5 ) {
			var _q = 2*wheel_array[ _i ];
			if ( _q < 0.5 ) {
				//var _colour = merge_colour( c_red, c_yellow, _q*2 );
				var _colour = merge_colour( c_slow, c_slow_to_ideal, _q*2 );
			} else {
				//var _colour = merge_colour( c_yellow, c_lime, _q*2-1 );
				var _colour = merge_colour( c_slow_to_ideal, c_ideal, _q*2-1 );
			}
		} else {
			var _q = 2*wheel_array[ _i ]-1;
			if ( _q < 0.5 ) {
				//var _colour = merge_colour( c_lime, c_yellow, _q*2 );
				var _colour = merge_colour( c_ideal, c_ideal_to_fast, _q*2 );
			} else {
				//var _colour = merge_colour( c_yellow, c_red, _q*2-1 );
				var _colour = merge_colour( c_ideal_to_fast, c_fast, _q*2-1 );
			}
		}
		
		
		var _angle_a =  _i    * 360/wheel_segments + _rotation;
		var _angle_b = (_i+1) * 360/wheel_segments + _rotation;
		
		var _slice_scale = _scale*( 0.02 + lerp( 0.8, 1, wheel_array[ _i ] ) );
		_slice_scale = _segment_scale;
		var _ax = _centre_x;
		var _ay = _centre_y;
		var _bx = _centre_x+lengthdir_x( _slice_scale, _angle_a );
		var _by = _centre_y+lengthdir_y( _slice_scale, _angle_a );
		var _cx = _centre_x+lengthdir_x( _slice_scale, _angle_b );
		var _cy = _centre_y+lengthdir_y( _slice_scale, _angle_b );
		
		draw_set_colour( c_black );
		draw_triangle( _ax, _ay, _bx, _by, _cx, _cy, false );
		
		var _slice_scale = _scale*lerp( 0.8, 1, wheel_array[ _i ] );
		_slice_scale = _segment_scale;
		var _ax = _centre_x;
		var _ay = _centre_y;
		var _bx = _centre_x+lengthdir_x( _slice_scale, _angle_a );
		var _by = _centre_y+lengthdir_y( _slice_scale, _angle_a );
		var _cx = _centre_x+lengthdir_x( _slice_scale, _angle_b );
		var _cy = _centre_y+lengthdir_y( _slice_scale, _angle_b );
		
		draw_set_colour( _colour );
		draw_triangle_colour( _ax, _ay, _bx, _by, _cx, _cy, _colour, _colour, _colour, false );
		
	}
	
	gpu_set_blendmode(bm_normal);
	
	surface_reset_target();
	
	draw_set_alpha(0.5);
	
	draw_surface_ext(
		wheel_surf,
		centre_x - ((scale) div 2),
		centre_y - ((scale) div 2) - 5,
		1,
		1,
		0,
		c_black,
		0.5
	);
	
	draw_set_alpha(1);
	
	draw_surface(
		wheel_surf,
		centre_x - ((scale) div 2),
		centre_y - ((scale) div 2) - 10
	);
	
	draw_set_colour( c_white );
	draw_triangle( centre_x   , centre_y + _scale*0.9,
	               centre_x-20, centre_y + _scale*1.1,
	               centre_x+20, centre_y + _scale*1.1, false );
	draw_set_colour( c_black );
	draw_triangle( centre_x   , centre_y + _scale*0.9,
	               centre_x-20, centre_y + _scale*1.1,
	               centre_x+20, centre_y + _scale*1.1, true );
	
}
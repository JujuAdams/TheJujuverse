var _pressed_arrow = false;

if ( free ) {
	
	var _old_velocity_x = velocity_x;
	hand_t = clamp( ( current_time - start_time ) / lerp( 7000, 7000, push_power ), 0, 1 );
	hand_q = 1 - (1-hand_t)*exp( -1.3*hand_t );
	
	if ( y > obj_barrier_line.y ) {
		
		if ( !is_ai ) {
			#region Player control
		
			left_pressed_timer--;
			right_pressed_timer--;
			if ( control_ez_left(  PRESSED ) ) left_pressed_timer  = 3;
			if ( control_ez_right( PRESSED ) ) right_pressed_timer = 3;
			
			var _a = 0;
			_a += (1-hand_t) * acceleration*control_ez_right( PRESSED );
			_a -= (1-hand_t) * acceleration*control_ez_left(  PRESSED );
			velocity_x += _a;
			if ( _a != 0 ) sound_play( snd_hand, 1, false );
			_pressed_arrow = true;
			
			#endregion
		} else {
			#region AI control
			
			var _l_count = 0;
			var _r_count = 0;
			
			var _range = 200;
			var _skew = velocity_x*10;
			_l_count += collision_line( x-22+_skew, y, x-22+_skew, y-_range, obj_parent_obstacle, false, false ) > 0;
			_l_count += collision_line( x-11+_skew, y, x-11+_skew, y-_range, obj_parent_obstacle, false, false ) > 0;
			if ( x < room_width div 2 ) _l_count += collision_line( x+_skew, y, x+_skew, y-_range, obj_parent_obstacle, false, false ) > 0;
			                       else _r_count += collision_line( x+_skew, y, x+_skew, y-_range, obj_parent_obstacle, false, false ) > 0;
			_r_count += collision_line( x+11+_skew, y, x+11+_skew, y-_range, obj_parent_obstacle, false, false ) > 0;
			_r_count += collision_line( x+22+_skew, y, x+22+_skew, y-_range, obj_parent_obstacle, false, false ) > 0;
			
			if ( _l_count + _r_count > 0 ) {
				var _a = 0;
				if ( _l_count > _r_count ) _a += (1-hand_t) * acceleration;
				if ( _r_count > _l_count ) _a -= (1-hand_t) * acceleration;
				velocity_x += _a;
			}
			
			#endregion
		}
		
	}
	
	velocity_x = clamp( velocity_x, -3, 3 );
	x += velocity_x;
	
	if ( x < 40 ) {
		velocity_x = abs( velocity_x*0.5 );
		x = 40;
	}
	if ( x > room_width-40 ) {
		velocity_x = -abs( velocity_x*0.5 );
		x = room_width-40;
	}
	
	camera_lead_y = lerp( -120, 0, hand_t );
	y = ystart + hand_q*( (obj_kitty_target.y - obj_shooter.y) * lerp( 0.85, 1.12, push_power ) );
	
	if ( hand_t >= 1 ) {
		
		sound_play( snd_points_get, 1, false );
		
		free = false;
		camera_interesting = false;
		obj_shooter.state = 5;
		
		var _dist = point_distance( x, y, obj_kitty_target.x, obj_kitty_target.y );
		score_add( player_index, floor( max( 0, 300 - _dist )*30 ) );
		
	}
		
} else if ( hand_t <= 0 ) {
	
	root_x = x;
	
}
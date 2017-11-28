var _good_state = ( global.gameflow_state == e_game_state.play_1a )
               or ( global.gameflow_state == e_game_state.play_2a )
               or ( global.gameflow_state == e_game_state.play_2b )
               or ( global.gameflow_state == e_game_state.play_1b );

var _current_player = false;
var _ai = false;
switch( global.gameflow_mode ) {
	
	case e_game_mode.ai:
		_ai = true;
	break;
	
	case e_game_mode.local_:
		_current_player = true;
	break;
	
	case e_game_mode.single:
		if ( !global.gameflow_second_player ) {
			_current_player = ( global.gameflow_state == e_game_state.play_1a ) or ( global.gameflow_state == e_game_state.play_1b );
			_ai             = ( global.gameflow_state == e_game_state.play_2a ) or ( global.gameflow_state == e_game_state.play_2b );
		} else {
			_ai             = ( global.gameflow_state == e_game_state.play_1a ) or ( global.gameflow_state == e_game_state.play_1b );
			_current_player = ( global.gameflow_state == e_game_state.play_2a ) or ( global.gameflow_state == e_game_state.play_2b );
		}
	break;
	
}

if ( _good_state ) {
	
	if ( _current_player ) {
		
		#region Player control
		switch( state ) {
		
			case 0: //Waiting for next command from obj_gameflow
				hand_position = room_width div 2;
				hand_power = 1;
				hand = noone;
			break;
		
			case 1: //Waiting for input
				if ( control_ez_fire( PRESSED ) ) {
					sound_play( snd_hand, 1, false );
					meter_timer = current_time;
					state = 2;
				}
			break;
		
			case 2: //Showing position bar
				var _t = current_time - meter_timer;
				hand_position = ( room_width div 2 ) + room_width*0.4*dsin( 0.2*_t );
				hand.x = hand_position;
			
				if ( control_ez_fire( PRESSED ) ) and ( _t > 300 ) {
					sound_play( snd_hand, 1, false );
					meter_timer = current_time;
					state = 3;
				}
			break;
		
			case 3: //Showing power bar
				var _elapsed = current_time - meter_timer;
				var _rotation = _elapsed * rotation_factor;
				wheel_index = wheel_segments-1 - floor( wheel_segments*(90+_rotation)/360 ) mod wheel_segments;
				if ( wheel_index_prev != wheel_index ) sound_play( snd_wheel, 1, false );
				wheel_index_prev = wheel_index;
				hand_power = clamp( wheel_array[ wheel_index ] + random_range( -0.06, 0.06 ), 0, 1 );
			
				if ( control_ez_fire( PRESSED ) and ( _elapsed > 300 ) ) {
				
					score_add( global.gameflow_player, 10000 );
				
					cam_add_focus( hand );
					cam_follow();
				
					with( hand ) {
						velocity_x = random_range( -2.5, 2.5 );
						start_time = current_time;
						camera_interesting = true;
						free = true;
						push_power = other.hand_power;
						if ( abs( push_power - 0.5 ) < 0.05 ) sound_play( snd_launch_perfect, 1, false ) else sound_play( snd_launch, 1, false );
						alarm[0] = 4;
					}
					
					state = 4;
				
				}
			break;
		
			case 4: //Hand's free, waiting for it to stop
				hand_position = room_width div 2;
				hand_power = 1;
			break;
		
			case 5: //Hand's stopped, waiting for next command from obj_gameflow
			break;
		
		}
		#endregion
		
	} else if ( _ai ) {
		
		#region AI control
		switch( state ) {
		
			case 0: //Waiting for next command from obj_gameflow
				hand_position = room_width div 2;
				hand_power = 1;
				hand = noone;
			break;
		
			case 1: //Waiting for input
				meter_timer = current_time;
				state = 2;
				ai_launch_point = random_range( -1, 1 );
			break;
		
			case 2: //Showing position bar
				
				var _t = current_time - meter_timer;
				var _q = dsin( 0.2*_t );
				hand_position = ( room_width div 2 ) + room_width*0.4*_q;
				hand.x = hand_position;
				
				if ( _t > 300 ) and ( abs( _q - ai_launch_point ) < 0.05 ) {
					meter_timer = current_time;
					state = 3;
				}
				
			break;
		
			case 3: //Showing power bar
			
				var _elapsed = current_time - meter_timer;
				var _rotation = _elapsed * rotation_factor;
				wheel_index = wheel_segments-1 - floor( wheel_segments*(90+_rotation)/360 ) mod wheel_segments;
				if ( wheel_index_prev != wheel_index ) sound_play( snd_wheel, 1, false );
				wheel_index_prev = wheel_index;
				hand_power = clamp( wheel_array[ wheel_index ] + random_range( -0.06, 0.06 ), 0, 1 );
			
				if ( _elapsed > 1000 ) and ( abs(hand_power-0.5 ) < 0.4 ) and ( abs(hand_power-0.5) > 0.1 ) {
				
					score_add( global.gameflow_player, 10000 );
				
					cam_add_focus( hand );
					cam_follow();
				
					with( hand ) {
						is_ai = true;
						velocity_x = random_range( -2.5, 2.5 );
						start_time = current_time;
						camera_interesting = true;
						free = true;
						push_power = other.hand_power;
						if ( abs( push_power - 0.5 ) < 0.05 ) sound_play( snd_launch_perfect, 1, false ) else sound_play( snd_launch, 1, false );
						alarm[0] = 1;
					}
					
					state = 4;
				
				}
			break;
		
			case 4: //Hand's free, waiting for it to stop
				hand_position = room_width div 2;
				hand_power = 1;
			break;
		
			case 5: //Hand's stopped, waiting for next command from obj_gameflow
			break;
		
		}
		#endregion
		
	} else {
		
		if ( state == 2 ) {
			var _t = current_time - meter_timer;
			hand_position = ( room_width div 2 ) + room_width*0.4*dsin( 0.2*_t );
			hand.x = hand_position;
			hand.root_x = hand_position;
		}
		
	}
	
}
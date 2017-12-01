switch( global.gameflow_state ) {
	
	case e_game_state.menu:
		if ( room == rm_game ) {
			
			cam_static( obj_kitty_target.x, obj_kitty_target.y );
			
			if ( !transition_exists() ) {
				global.gameflow_timer = current_time;
				global.gameflow_state = e_game_state.intro_pause;
			}
			
		}
	break;
	
	
	
	//Intro
	case e_game_state.intro_pause:
		if ( time_passed( global.gameflow_timer, 1000 ) ) {
			sound_play( snd_purr_0, 1, false );
			global.gameflow_timer = current_time;
			global.gameflow_state = e_game_state.intro;
		}
	break;
	
	case e_game_state.intro:
		if ( time_passed( global.gameflow_timer, 1500 ) ) {
			global.gameflow_timer = current_time;
			global.gameflow_state = e_game_state.messages;
			if ( !options_get( "intro", false ) ) {
				options_set( "intro", true );
				options_save();
				instantiate( obj_intro_message_controller );
			}
		}
	break;
	
	case e_game_state.messages:
		if ( !instance_exists( obj_intro_message_controller ) ) {
			global.gameflow_timer = current_time;
			global.gameflow_state = e_game_state.intro_pan;
			global.gameflow_player = 0;
			global.gameflow_hand = 0;
			sound_play( snd_cameraPan_8secs, 1, false );
			shooter_spawn_new_hand();
			cam_pan( obj_kitty_target.x, obj_kitty_target.y, 1,
			         undefined,
					 obj_shooter.x, room_height-135, 1,
					 0, 8000 );
		}
	break;
	
	case e_game_state.intro_pan:
		if ( obj_camera.camera_state != e_camera_state.pan ) {
			global.gameflow_timer = current_time;
			global.gameflow_state = e_game_state.play_1a;
			instance_create_layer( 110, 410, "Instances", obj_score_a );
		}
	break;
	
	
	
	//Player 1 - first shot
	case e_game_state.play_1a:
		if ( obj_shooter.state == 4 ) {
			global.gameflow_timer = current_time;
			global.gameflow_state = e_game_state.follow_1a;
		}
	break;
	
	case e_game_state.follow_1a:
		if ( obj_shooter.state == 5 ) {
			global.gameflow_timer = current_time;
			global.gameflow_player = 1;
			global.gameflow_hand = 0;
			shooter_spawn_new_hand();
			global.gameflow_state = e_game_state.pan_1a;
			cam_pan( undefined, undefined, undefined,
			         undefined,
					 obj_shooter.x, room_height-135, 1,
					 120, 1000 );
		}
	break;
	
	case e_game_state.pan_1a:
		if ( obj_camera.camera_state != e_camera_state.pan ) {
			global.gameflow_timer = current_time;
			global.gameflow_state = e_game_state.play_2a;
			instance_create_layer( display_get_gui_width() - 110, 410, "Instances", obj_score_b );
		}
	break;
	
	
	
	//Player 2 - first shot
	case e_game_state.play_2a:
		if ( obj_shooter.state == 4 ) {
			global.gameflow_timer = current_time;
			global.gameflow_state = e_game_state.follow_2a;
		}
	break;
	
	case e_game_state.follow_2a:
		if ( obj_shooter.state == 5 ) {
			global.gameflow_timer = current_time;
			global.gameflow_state = e_game_state.disturbed_pan;
			cam_pan( undefined, undefined, undefined,
			         undefined,
					 obj_kitty_target.x, obj_kitty_target.y, 1,
					 120, 1000 );
		}
	break;
	
	case e_game_state.disturbed_pan:
		if ( obj_camera.camera_state != e_camera_state.pan ) {
			global.gameflow_timer = current_time;
			sound_play( snd_chill_mew_1, 1, false );
			with( obj_kitty_face ) {
				sprite_index = spr_kitty_annoyed_face;
				start_time = VERY_SMALL;
			}
			global.gameflow_state = e_game_state.disturbed;
		}
	break;
	
	case e_game_state.disturbed:
		if ( time_passed( global.gameflow_timer, 2000 ) ) {
			global.gameflow_timer = current_time;
			global.gameflow_player = 1;
			global.gameflow_hand = 1;
			shooter_spawn_new_hand();
			global.gameflow_state = e_game_state.pan_2a;
			cam_pan( undefined, undefined, undefined,
			         undefined,
					 obj_shooter.x, room_height-135, 1,
					 120, 1000 );
		}
	break;
	
	case e_game_state.pan_2a:
		if ( obj_camera.camera_state != e_camera_state.pan ) {
			global.gameflow_timer = current_time;
			global.gameflow_state = e_game_state.play_2b;
		}
	break;
	
	
	
	//Player 2 - second shot
	case e_game_state.play_2b:
		if ( obj_shooter.state == 4 ) {
			global.gameflow_timer = current_time;
			global.gameflow_state = e_game_state.follow_2b;
		}
	break;
	
	case e_game_state.follow_2b:
		if ( obj_shooter.state == 5 ) {
			global.gameflow_timer = current_time;
			global.gameflow_player = 0;
			global.gameflow_hand = 1;
			shooter_spawn_new_hand();
			global.gameflow_state = e_game_state.pan_2b;
			cam_pan( undefined, undefined, undefined,
			         undefined,
					 obj_shooter.x, room_height-135, 1,
					 120, 1000 );
		}
	break;
	
	case e_game_state.pan_2b:
		if ( obj_camera.camera_state != e_camera_state.pan ) {
			global.gameflow_timer = current_time;
			global.gameflow_state = e_game_state.play_1b;
		}
	break;
	
	
	
	//Player 1 - second shot
	case e_game_state.play_1b:
		if ( obj_shooter.state == 4 ) {
			global.gameflow_timer = current_time;
			global.gameflow_state = e_game_state.follow_1b;
		}
	break;
	
	case e_game_state.follow_1b:
		if ( obj_shooter.state == 5 ) {
			global.gameflow_timer = current_time;
			global.gameflow_state = e_game_state.pan_1b;
			cam_pan( undefined, undefined, undefined,
			         undefined,
					 obj_kitty_target.x, obj_kitty_target.y, 1,
					 120, 800 );
		}
	break;
	
	case e_game_state.pan_1b:
		if ( obj_camera.camera_state != e_camera_state.pan ) {
			global.gameflow_timer = current_time;
			global.gameflow_state = e_game_state.end_pause;
		}
	break;
	
	
	
	//Outro
	case e_game_state.end_pause:
		if ( time_passed( global.gameflow_timer, 100 ) ) {
			
			var _winner = 0;
			if ( global.gameflow_score_b > global.gameflow_score_a ) _winner = 1;
			with( obj_hand ) if ( player_index != _winner ) instance_destroy();
			with( obj_hand ) {
				
				if ( !player_index ) {
					if ( !hand_index ) sprite_index = spr_hand_a_right_scritch else sprite_index = spr_hand_a_scritch;
				} else {
					if ( !hand_index ) sprite_index = spr_hand_b_right_scritch else sprite_index = spr_hand_b_scritch;
				}
				
				tween_start_x = x;
				tween_start_y = y;
			}
			
			global.gameflow_timer = current_time;
			global.gameflow_state = e_game_state.scoring;
		}
	break;
	
	case e_game_state.scoring:
		
		var _q = ease_sine_inout( clamp( ( current_time - global.gameflow_timer ) / 700, 0, 1 ) );
		with( obj_hand ) {
			
			if ( hand_index == 0 ) {
				var _target_x = obj_kitty_target.x+20;
				var _target_y = obj_kitty_target.y;
			} else {
				var _target_x = obj_kitty_target.x-20;
				var _target_y = obj_kitty_target.y;
			}
			
			x = lerp( tween_start_x, _target_x, _q );
			y = lerp( tween_start_y, _target_y, _q );
			
			var _cross_x = source_path[| cross_index   ];
			var _cross_y = source_path[| cross_index+1 ];
			var _size = ds_list_size( path );
			for( var _i = cross_index; _i < _size; _i += 2 ) {
				var _t = ( _i - cross_index ) / ( _size - cross_index );
				scritch_path[| _i   ] = lerp( _cross_x, _target_x, _t );
				scritch_path[| _i+1 ] = lerp( _cross_y, _target_y, _t );
				path[| _i   ] = lerp( source_path[| _i   ], scritch_path[| _i   ], _q*_t );
				path[| _i+1 ] = lerp( source_path[| _i+1 ], scritch_path[| _i+1 ], _q*_t );
			}
				
		}
		
		if ( time_passed( global.gameflow_timer, 700 ) ) {
			
			global.gameflow_timer = current_time;
			global.gameflow_state = e_game_state.scritch;
			
			with( obj_parent_score ) {
				out_tween            = true;
				out_tween_start_time = current_time;
				out_tween_length     = 800;
				out_tween_t          = 0;
			}
			
		}
	break;
	
	case e_game_state.scritch:
		
		var _elapsed = current_time - global.gameflow_timer;
		with( obj_hand ) {
			
			if ( abs( _elapsed mod 500 ) < 16 ) sound_play( snd_scratch0, 1, false );
			
			if ( hand_index == 0 ) {
				x = lengthdir_x( 30, 180+_elapsed*0.24 )+obj_kitty_target.x+50;
				y = lengthdir_y( 30, 180+_elapsed*0.24 )+obj_kitty_target.y;
			} else {
				x = lengthdir_x( 30, -_elapsed*0.26 )+obj_kitty_target.x-50;
				y = lengthdir_y( 30, -_elapsed*0.26 )+obj_kitty_target.y;
			}
				
			var _cross_x = path[| cross_index   ];
			var _cross_y = path[| cross_index+1 ];
			var _size = ds_list_size( path );
			for( var _i = cross_index; _i < _size; _i += 2 ) {
				var _t = ( _i - cross_index ) / ( _size - cross_index );
				scritch_path[| _i   ] = lerp( _cross_x, x, _t );
				scritch_path[| _i+1 ] = lerp( _cross_y, y, _t );
				path[| _i   ] = lerp( source_path[| _i   ], scritch_path[| _i   ], _t );
				path[| _i+1 ] = lerp( source_path[| _i+1 ], scritch_path[| _i+1 ], _t );
			}
				
		}
		
		if ( time_passed( global.gameflow_timer, 3500 ) ) {
			sound_play( snd_hiss_0, 1, false );
			obj_kitty_face.sprite_index = spr_kitty_angry_face;
			with( obj_parent_kitty ) start_time = VERY_SMALL;
			global.gameflow_timer = current_time;
			global.gameflow_state = e_game_state.bite;
		}
	break;
	
	case e_game_state.bite:
		if ( time_passed( global.gameflow_timer, 1000 ) ) {
			global.gameflow_timer = current_time;
			global.gameflow_state = e_game_state.outro;
			instantiate( obj_outro_message_controller );
		}
	break;
	
	case e_game_state.outro:
		if ( !instance_exists( obj_outro_message_controller ) ) {
			global.gameflow_timer = current_time;
			global.gameflow_state = e_game_state.outro_transition;
			transition( obj_transition_wipe, DEFAULT, DEFAULT, TRANSITION_RETURN );
		}
	break;
	
	case e_game_state.outro_transition:
		if ( room != rm_game ) {
			global.gameflow_state = e_game_state.menu;
		}
	break;
	
}
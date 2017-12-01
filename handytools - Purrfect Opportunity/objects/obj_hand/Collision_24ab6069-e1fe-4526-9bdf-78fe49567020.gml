if ( ds_list_find_index( obstacles_hit, other.id ) < 0 ) {
	ds_list_add( obstacles_hit, other.id );
		
	if ( other.object_index == obj_obstacle_duck ) sound_play( snd_duck_0, 1, false ) else sound_play( snd_bad_donk, 1, false );
		
	velocity_x += choose( random_range( -2, -3 ), random_range( 2, 3 ) );
	velocity_x = clamp( velocity_x, -3, 3 );
	
	with (other) {
		event_user(0);	
	}
	
	score_add( player_index, -500 );
		
}
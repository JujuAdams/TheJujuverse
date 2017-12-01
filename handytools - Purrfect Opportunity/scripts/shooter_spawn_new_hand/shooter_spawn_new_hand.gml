with( obj_shooter ) {
	
	state = 1;
	
	hand = instance_create_layer( x, y, "Instances", obj_hand );
	with( hand ) {
		
		player_index = global.gameflow_player;
		hand_index = global.gameflow_hand;
		
		if ( !player_index ) {
			if ( !hand_index ) sprite_index = spr_hand_a_right else sprite_index = spr_hand_a;
		} else {
			if ( !hand_index ) sprite_index = spr_hand_b_right else sprite_index = spr_hand_b;
		}
		
	}
	
	for( var _i = 0; _i < wheel_segments; _i++ ) wheel_array[ _i ] = undefined;
	
	var _middle = wheel_segments div 2;
	
	var _j = irandom_range( 1, wheel_segments-2 );
	wheel_array[ _j-1 ] = 0.0;
	wheel_array[ _j   ] = 0.5;
	wheel_array[ _j+1 ] = 1.0;
	
	for( var _i = 1; _i < _middle; _i++ ) {
		do {
			var _j = irandom( wheel_segments-1 );
		} until ( wheel_array[ _j ] == undefined );
		wheel_array[ _j ] = _i/wheel_segments;
	}
	
	for( var _i = _middle+1; _i < wheel_segments-1; _i++ ) {
		do {
			var _j = irandom( wheel_segments-1 );
		} until ( wheel_array[ _j ] == undefined );
		wheel_array[ _j ] = _i/wheel_segments;
	}
	
}
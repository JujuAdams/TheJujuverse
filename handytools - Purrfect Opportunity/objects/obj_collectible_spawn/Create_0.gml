repeat( 2 ) {
	
	var _inst = instance_create_layer( VERY_SMALL, VERY_SMALL, "Obstacles", obj_collectible );
	with( _inst ) {
	
		var _iterations = 0;
		do {
			_iterations++;
			if ( _iterations > 100 ) break;
			
			x = irandom_range( other.bbox_left, other.bbox_right );
			y = irandom_range( other.bbox_top, other.bbox_bottom );
			
		} until ( !place_meeting( x, y, obj_collectible ) ) and ( !place_meeting( x, y, obj_parent_obstacle ) ) and ( rectangle_in_rectangle(       bbox_left ,       bbox_top   ,
		                                                                                                                                            bbox_right,       bbox_bottom,
		                                                                                                                                      other.bbox_left , other.bbox_top   ,
																						                                                      other.bbox_right, other.bbox_bottom ) == 1 );
	
	}
	
	if ( _iterations >= 100 ) {
		instance_destroy( _inst );
		break;
	}
	
}

instance_destroy();
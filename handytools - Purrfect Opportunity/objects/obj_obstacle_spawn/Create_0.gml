obstacle_objects = [ obj_obstacle_duck, obj_obstacle_duck, obj_obstacle_flipflop, obj_obstacle_fish, obj_obstacle_fish, obj_obstacle_yarn ];

var _object = obstacle_objects[ irandom( array_length_1d( obstacle_objects)-1 ) ];
var _inst = instance_create_layer( VERY_SMALL, VERY_SMALL, "Obstacles", _object );

with( _inst ) {
	do {
		x = irandom_range( other.bbox_left, other.bbox_right );
		y = irandom_range( other.bbox_top, other.bbox_bottom );
	} until ( !place_meeting( x, y, obj_parent_obstacle ) ) and ( rectangle_in_rectangle(       bbox_left ,       bbox_top   ,
	                                                                                            bbox_right,       bbox_bottom,
	                                                                                      other.bbox_left , other.bbox_top   ,
																						  other.bbox_right, other.bbox_bottom ) == 1 );
}

instance_destroy();
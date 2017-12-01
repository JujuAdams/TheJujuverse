event_inherited();

var _dir = point_direction( x, y, mean( obj_floor.x1, obj_floor.x2 ), mean( obj_floor.y1, obj_floor.y2 ) );
_dir = round( _dir/90 )*90;
swell_x = lengthdir_x( global.game_swell, _dir );
swell_y = lengthdir_y( global.game_swell, _dir );
/// @param surface

var _spr = sprite_create_from_surface( argument0, 0, 0, surface_get_width( argument0 ), surface_get_height( argument0 ), false, false, 0, 0 );
sprite_collision_mask( _spr, false, 0,   0,0,0,0,  0, 0 );
return _spr;
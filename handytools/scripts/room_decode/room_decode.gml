/// @param string

var _string = argument0;
var _root_map = json_decode( _string );
var _objects_map = _root_map[? "objects" ];

for( var _object_name = ds_map_find_first( _objects_map ); _object_name != undefined; _object_name = ds_map_find_next( _objects_map, _object_name ) ) {
    
    var _object = asset_get_index( _object_name );
    if ( global.game_room != 0 ) and ( _object == obj_door ) continue;
    
    var _list = _objects_map[? _object_name ];
    var _size = ds_list_size( _list );
    for( var _i = 0; _i < _size; _i++ ) {
        
        var _map = _list[| _i ];
        
        switch( _object ) {
            case obj_wall:
                var _sprite = _map[? "sprite" ];
                if ( _sprite == undefined ) _sprite = spr_tex_wall6 else _sprite = asset_get_index( _sprite );
                define_wall( _map[? "x1" ], _map[? "y1" ], _map[? "z1" ],
                             _map[? "x2" ], _map[? "y2" ], _map[? "z2" ],
                             _sprite );
            break;
            case obj_floor:
                define_floor( _map[? "x1" ], _map[? "y1" ],
                              _map[? "x2" ], _map[? "y2" ],
                              _map[? "z"  ], _map[? "tile_size" ], asset_get_index( _map[? "sprite" ] ) );
            break;
            case obj_ceiling:
                define_ceiling( _map[? "x1" ], _map[? "y1" ],
                                _map[? "x2" ], _map[? "y2" ],
                                _map[? "z"  ], _map[? "tile_size" ], asset_get_index( _map[? "sprite" ] ) );
            break;
            case obj_light:
                var _inst = instance_create_z( _map[? "x" ], _map[? "y" ], _map[? "z" ], _map[? "image_angle" ], _object );
                _inst.range = _map[? "range" ];
                _inst.colour = _map[? "colour" ];
            break;
            default:
                var _inst = instance_create_z( _map[? "x" ], _map[? "y" ], _map[? "z" ], _map[? "image_angle" ], _object );
				with( _inst ) trace( "creating ", object_get_name( object_index ), ", ", x, ", ", y, ", ", z );
            break;
        }
        
    }
    
}

with( obj_player_spawn ) {
    
    if ( !instance_exists( obj_player ) ) {
        
        instance_create_z( x, y, z+50, 0, obj_player );
        
        if ( !instance_exists( obj_camera ) ) {
            var _inst = instance_create( x, y, obj_camera );
            _inst.z = z + 50;
            _inst.look_xy_angle = image_angle;
        }
        
    }
    
}
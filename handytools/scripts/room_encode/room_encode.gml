///room_encode()

var _root_map = tr_map_create();
_root_map[? "time" ] = date_datetime_string( date_current_datetime() );

var _objects_map = tr_map_create();
tr_map_add_map( _root_map, "objects", _objects_map );

with( obj_par_game ) {
    if ( object_index == obj_camera ) or ( object_index == obj_player ) continue;
    
    var _name = object_get_name( object_index );
    var _list = _objects_map[? _name ];
    if ( _list == undefined ) {
        _list = tr_list_create();
        tr_map_add_list( _objects_map, _name, _list );
    }
    
    var _map = tr_map_create();
    _map[? "x" ] = x;
    _map[? "y" ] = y;
    _map[? "z" ] = z;
    _map[? "image_angle" ] = image_angle;
    switch( object_index ) {
        case obj_wall:
            _map[? "x1" ] = x1;
            _map[? "y1" ] = y1;
            _map[? "z1" ] = z1;
            _map[? "x2" ] = x2;
            _map[? "y2" ] = y2;
            _map[? "z2" ] = z2;
            _map[? "sprite" ] = sprite_get_name( sprite );
            _map[? "thickness" ] = thickness;
        break;
        case obj_floor:
        case obj_ceiling:
            _map[? "x1" ] = x1;
            _map[? "y1" ] = y1;
            _map[? "x2" ] = x2;
            _map[? "y2" ] = y2;
            _map[? "sprite" ] = sprite_get_name( sprite );
            _map[? "tile_size" ] = tile_size;
        break;
        case obj_light:
            _map[? "range"  ] = range;
            _map[? "colour" ] = colour;
        break;
    }
    
    tr_list_add_map( _list, _map );
    
}

var _str = json_encode( _root_map );
tr_map_destroy( _root_map );
return _str;
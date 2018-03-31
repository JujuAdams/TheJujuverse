/// @param string

global.mirror_count = 0;
global.mirror_click_count = 0;

var _string = argument0;
var _root_map = json_decode( _string );
var _objects_map = _root_map[? "objects" ];

for( var _object_name = ds_map_find_first( _objects_map ); _object_name != undefined; _object_name = ds_map_find_next( _objects_map, _object_name ) ) {
    
    var _object = asset_get_index( _object_name );
    
    var _list = _objects_map[? _object_name ];
    var _size = ds_list_size( _list );
    for( var _i = 0; _i < _size; _i++ ) {
        
        var _map = _list[| _i ];
        
        switch( _object ) {
            case obj_light:
                var _inst = tr_instance_create_z( _map[? "x" ], _map[? "y" ], _map[? "z" ], _map[? "image_angle" ], _object );
                _inst.range = _map[? "range" ];
                _inst.colour = _map[? "colour" ];
                
                var _node_map = editor_new_node( global.editor_scene_graph, _object, object_get_name( _object ) + "##" + string( _inst ), _inst );
                editor_property_serialise( _node_map, _inst );
            break;
            case obj_directional_light:
                var _inst = tr_instance_create_z( _map[? "x" ], _map[? "y" ], _map[? "z" ], _map[? "image_angle" ], _object );
                _inst.range = _map[? "range" ];
                _inst.colour = _map[? "colour" ];
                with( _inst ) {
                    quat = quaternion_rotate_worldx( quat, -10 );
                    quat = quaternion_rotate_worldz( quat, 135 );
                }
                
                var _node_map = editor_new_node( global.editor_scene_graph, _object, object_get_name( _object ) + "##" + string( _inst ), _inst );
                editor_property_serialise( _node_map, _inst );
            break;
            default:
                if ( !object_exists( _object ) ) {
                    trace_error_q( false, _object_name, " does not exist!" );
                } else {
                    var _inst = tr_instance_create_z( _map[? "x" ], _map[? "y" ], _map[? "z" ], _map[? "image_angle" ], _object );
                
                    var _node_map = editor_new_node( global.editor_scene_graph, _object, object_get_name( _object ) + "##" + string( _inst ), _inst );
                    editor_property_serialise( _node_map, _inst );
                }
            break;
        }
        
    }
    
}

ds_map_destroy( _root_map );

with( obj_player_spawn ) {
    
    if ( !instance_exists( obj_player ) ) {
        
        tr_instance_create_z( x, y, z+50, 0, obj_player );
        
        if ( !instance_exists( obj_camera ) ) {
            var _inst = tr_instance_create( x, y, obj_camera );
            _inst.z = z + 50;
            _inst.look_xy_angle = image_angle;
        }
        
    }
    
}
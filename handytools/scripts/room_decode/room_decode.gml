/// @param string

global.mirror_count = 0;
global.mirror_click_count = 0;

var _string = argument0;
var _root_map = json_decode( _string );

tr_map_destroy( global.editor_scene_graph );
global.editor_scene_graph = _root_map[? "scene graph" ];
editor_property_deserialise_recursive( global.editor_scene_graph );

with( obj_floor ) define_floor( x, y, x2, y2, z, tile_size, asset_get_index( sprite_asset_name ) );

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
/// @param map
/// @param name

var _map  = argument0;
var _name = argument1;

var _list = _map[? "children" ];
var _has_children = ( _list != undefined ) && ( ds_list_size( _list ) > 0 );
    
var _flags = ( ( global.imguigml_build_tree_from_json_focus == _name )? EImGui_TreeNodeFlags.Selected : 0 )
           | ( ( _has_children )? 0 : EImGui_TreeNodeFlags.Bullet );

var _state = imguigml_tree_node_ex( _map[? "name" ], _flags );
if ( _state ) {
    
    if ( _has_children ) {
        var _size = ds_list_size( _list );
        for( var _i = 0; _i < _size; _i++ ) imguigml_build_tree_from_json( _list[| _i ], concat( _name, ",", _i ) );
    }
    
    imguigml_tree_pop();
}

if ( _state != ds_map_get_safe( global.imguigml_build_tree_from_json_state, _name ) ) {
    ds_list_add( global.imguigml_build_tree_from_json_clicked, _name );
    ds_list_add( global.imguigml_build_tree_from_json_clicked, _map );
}
    
global.imguigml_build_tree_from_json_state[? _name ] = _state;
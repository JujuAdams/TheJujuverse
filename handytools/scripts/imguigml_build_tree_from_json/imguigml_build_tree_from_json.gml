/// @param map
/// @param name

var _map  = argument0;
var _name = argument1;

var _focused = ( global.imguigml_build_tree_from_json_focus_map == _map );

var _list = _map[? "children" ];
var _has_children = ( _list != undefined ) && ( ds_list_size( _list ) > 0 );
    
var _flags = EImGui_TreeNodeFlags.NoTreePushOnOpen | EImGui_TreeNodeFlags.DefaultOpen | ( _has_children? 0 : EImGui_TreeNodeFlags.Bullet );

var _state = imguigml_tree_node_ex( "---##" + _map[? "name" ], _flags );
if ( imguigml_is_item_clicked() && !_has_children ) {
	_map[? "##selected" ] = !_focused;
	global.imguigml_build_tree_from_json_focus_map = _focused? undefined : _map;
}

imguigml_same_line();
imguigml_text( " " );
imguigml_same_line();
var _result = imguigml_checkbox( _map[? "name" ], ds_map_get_safe( _map, "##selected" ) );
if ( _result[0] ) {
	_map[? "##selected" ] = _result[1];
	global.imguigml_build_tree_from_json_focus_map = _result[1]? _map : undefined;
} else {
	_map[? "##selected" ] = _focused;
}

if ( _state ) {
	imguigml_tree_push( _map[? "name" ] );
    if ( _has_children ) {
        var _size = ds_list_size( _list );
        for( var _i = 0; _i < _size; _i++ ) imguigml_build_tree_from_json( _list[| _i ], concat( _name, ",", _i ) );
    }
    imguigml_tree_pop();
}
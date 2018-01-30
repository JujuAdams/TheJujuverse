/// @param map
/// @param name
/// @param selected_map
/// @param multiselect

var _map          = argument0;
var _name         = argument1;
var _selected_map = argument2;
var _multiselect  = argument3;

var _focused = ds_map_get_safe( _selected_map, _map ); //( global.imguigml_build_tree_from_json_focus_map == _map );

var _list = _map[? "children" ];
var _has_children = ( _list != undefined ) && ( ds_list_size( _list ) > 0 );
var _name = editor_property_value( _map, "name" );

var _flags = EImGui_TreeNodeFlags.NoTreePushOnOpen | EImGui_TreeNodeFlags.DefaultOpen | ( _has_children? 0 : EImGui_TreeNodeFlags.Bullet );
var _state = imguigml_tree_node_ex( "---##" + _name, _flags );

if ( imguigml_is_item_clicked() && !_has_children ) {
	_map[? "selected" ] = !_focused;
	if ( _focused )	{
		ds_map_delete( _selected_map, _map );
	} else {
		if ( !_multiselect ) ds_map_clear( _selected_map );
		_selected_map[? _map ] = true;
	}
}

imguigml_same_line();
imguigml_text( " " );
imguigml_same_line();

var _result = imguigml_checkbox( _name + ( editor_property_value( _map, "visible" )? "" : " (inv)"), ds_map_get_safe( _map, "selected" ) );
if ( _result[0] ) {
	_map[? "selected" ] = _result[1];
	if ( _result[1] ) {
		if ( !_multiselect ) ds_map_clear( _selected_map );
		_selected_map[? _map ] = true;
	} else {
		ds_map_delete( _selected_map, _map );
	}
} else {
	_map[? "selected" ] = _focused;
}

if ( _state ) {
	imguigml_tree_push( _name );
    if ( _has_children ) {
        var _size = ds_list_size( _list );
        for( var _i = 0; _i < _size; _i++ ) imguigml_build_tree_from_json( _list[| _i ], concat( _name, ",", _i ), _selected_map, _multiselect );
    }
    imguigml_tree_pop();
}
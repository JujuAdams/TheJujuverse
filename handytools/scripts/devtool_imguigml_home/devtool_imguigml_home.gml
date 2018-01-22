/// @description Customisation for DEVTOOL's home page

if imguigml_button( "New game instance" ) new_game_instance();
imguigml_same_line();
if imguigml_button( "Quit game" ) game_end();
if ( TRACKER_ON ) {
    imguigml_same_line();
    if imguigml_button( "Tracker dump" ) trace_f( tracker_dump() );
    imguigml_same_line();
    if imguigml_button( "Tracker dump to clipboard" ) { clipboard_set_text( tracker_dump() ); imguigml_popup( "", "Copied to clipboard!" ); }
}
imguigml_new_line();
if ( FPS_ON ) {
    var _result = imguigml_checkbox( "Show FPS", global.fps_show );
    if ( _result[0] ) global.fps_show = _result[1];
}

repeat( 5 ) imguigml_spacing();
imguigml_separator();

ds_list_clear( global.imguigml_build_tree_from_json_clicked );
if ( imguigml_tree_node_ex( "Scene Graph", EImGui_TreeNodeFlags.Framed | EImGui_TreeNodeFlags.DefaultOpen ) ) {
    imguigml_build_tree_from_json( global.test_json, "" );
    imguigml_tree_pop();
    imguigml_text( "" );
}

if ( ds_list_size( global.imguigml_build_tree_from_json_clicked ) > 0 ) {
    global.imguigml_build_tree_from_json_focus     = global.imguigml_build_tree_from_json_clicked[| 0 ];
    global.imguigml_build_tree_from_json_focus_map = global.imguigml_build_tree_from_json_clicked[| 1 ];
    ds_list_clear( global.imguigml_build_tree_from_json_clicked );
}

if ( imguigml_tree_node_ex( "Node Details", EImGui_TreeNodeFlags.Framed | EImGui_TreeNodeFlags.DefaultOpen ) ) {
    
    if ( global.imguigml_build_tree_from_json_focus_map != undefined ) {
        
        var _size = ds_map_size( global.imguigml_build_tree_from_json_focus_map );
        var _key = ds_map_find_first( global.imguigml_build_tree_from_json_focus_map );
        
        imguigml_text( string_ext( global.imguigml_build_tree_from_json_focus_map[? "name" ] ) );
        imguigml_text( "" );
        
        if ( imguigml_tree_node_ex( "Children", EImGui_TreeNodeFlags.DefaultOpen ) ) {
            var _list = global.imguigml_build_tree_from_json_focus_map[? "children" ];
            var _size = ds_list_size( _list );
            
            if ( _size <= 0 ) {
                if ( imguigml_tree_node_ex( "<empty>", EImGui_TreeNodeFlags.Leaf ) ) imguigml_tree_pop();
            } else {
                var _delete = undefined;
                for( var _i = 0; _i < _size; _i++ ) {
                    var _map = _list[| _i ];
                    if ( imguigml_button( concat( "X ", _map[? "name" ] ) ) ) _delete = _i;
                }
                if ( _delete != undefined ) ds_list_delete( _list, _delete );
            }
        
            if ( imguigml_button( "+" ) ) {
                var _map = ds_map_create();
                _map[? "name" ] = concat( "New Child ", irandom( 999999 ) );
                _map[? "x" ] = 0;
                _map[? "y" ] = 0;
                _map[? "z" ] = 0;
                _map[? "absolute x" ] = 0;
                _map[? "absolute y" ] = 0;
                _map[? "absolute z" ] = 0;
                ds_map_add_list( _map, "children", ds_list_create() );
                ds_list_add_map( global.imguigml_build_tree_from_json_focus_map[? "children" ], _map );
            }
            
            imguigml_tree_pop();
        }
        
        imguigml_text( "" );
        
        var _key = ds_map_find_first( global.imguigml_build_tree_from_json_focus_map );
        repeat( _size ) {
            if ( _key != "children" ) && ( _key != "name" ) imguigml_text( concat( _key, "  :  ", global.imguigml_build_tree_from_json_focus_map[? _key ] ) );
            var _key = ds_map_find_next( global.imguigml_build_tree_from_json_focus_map, _key );
        }
        
    } else {
        
        imguigml_text( "No node is selected!" );
        
    }
    
    imguigml_tree_pop();
}

if ( ds_list_size( global.imguigml_build_tree_from_json_clicked ) > 0 ) {
    global.imguigml_build_tree_from_json_focus     = global.imguigml_build_tree_from_json_clicked[| 0 ];
    global.imguigml_build_tree_from_json_focus_map = global.imguigml_build_tree_from_json_clicked[| 1 ];
    ds_list_clear( global.imguigml_build_tree_from_json_clicked );
}

repeat( 5 ) imguigml_spacing();
imguigml_separator();

repeat( 5 ) imguigml_spacing();
imguigml_separator();
repeat( 5 ) imguigml_spacing();

var _size = ds_list_size( global.master_game_output );
for( var _i = max( 0, _size-5 ); _i < _size; _i++ ) imguigml_text( global.master_game_output[| _i ] );
imguigml_separator();

imguigml_new_line();
imguigml_text( concat( "Current room=", QU, room_get_name( room ), QU, " (", room, ")" ) );
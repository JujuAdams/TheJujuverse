/// @description ImGUI service initialisation

if ( IMGUI_ON ) {
    trace_f( "ImGUI" );
    global.imguigml_build_tree_from_json_focus     = "";
    global.imguigml_build_tree_from_json_focus_map = undefined;
    global.imguigml_build_tree_from_json_state     = tr_map_create(  "global.imguigml_build_tree_from_json_state"  , true );
    global.imguigml_build_tree_from_json_clicked   = tr_list_create( "global.imguigml_build_tree_from_json_clicked", true );
}
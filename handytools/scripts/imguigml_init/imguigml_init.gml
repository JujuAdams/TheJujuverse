/// @description ImGUI service initialisation

if ( IMGUI_ON ) {
    trace_f( "ImGUI" );
    global.imguigml_build_tree_from_json_focus_map = tr_map_create();
}
/// @description EDITOR service initialisation

if ( EDITOR_ON ) {
    trace_f( "EDITOR" );
    global.editor_noclip = DEVELOPMENT;
    global.editor_fly    = DEVELOPMENT;
} else {
    trace_f( "EDITOR (limited)" );
    global.editor_noclip = false;
    global.editor_fly    = false;
}

global.editor_object_properties_map = editor_object_properties();
global.editor_scene_graph = editor_new_node( UD, "Root" );
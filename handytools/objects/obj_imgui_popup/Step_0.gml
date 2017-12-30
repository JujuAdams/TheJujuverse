var ret = imguigml_begin( window_name, true,
                            EImGui_WindowFlags.NoResize |
                            EImGui_WindowFlags.NoCollapse |
                            EImGui_WindowFlags.NoSavedSettings |
                            EImGui_WindowFlags.AlwaysAutoResize );
if ( !ret[1] ) tr_instance_destroy();

imguigml_text( window_text );
imguigml_new_line();
if imguigml_button( "OK" ) tr_instance_destroy();

if ( window_frames <= 1 ) {
    imguigml_set_window_pos( window_name,
                             (GUI_WIDTH-imguigml_get_window_width( window_name ))/2,
                             (GUI_HEIGHT-imguigml_get_window_height( window_name ))/2 );
}

imguigml_end();

window_frames++;
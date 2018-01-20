__imguigml_event_end_step();

if ( FORCE_NO_CURSOR && ( !imguigml_any_window_open() || ( editor_is_open() && editor_is_collapsed() ) ) ){
    window_set_cursor( cr_none );
}
/// @description Sets the editor page
/// @param page

with( obj_editor ) {
    window_page_return = window_page;
    window_page = argument0;
    return argument0;
}
return E_EDITOR_PAGE.CLOSED;
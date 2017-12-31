/// @description Returns the current editor page, if open

with( obj_editor ) if ( !window_show ) return E_EDITOR_PAGE.CLOSED else return window_page;
return E_EDITOR_PAGE.CLOSED;
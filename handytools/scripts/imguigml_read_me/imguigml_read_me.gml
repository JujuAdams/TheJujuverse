/*
<link rel = "stylesheet" type = "text/css" href = "retro.css" />  

![imguigml_banner](https://i.imgur.com/C1EZNVC.png)
# imguigml

Wow! What can I say guys? ImGui in GML? amiright? lets hear a round of applause. alright, alright. alright settle down now. alright. seriously, we got a whole read me to go here. settle down. SETTLE down. jesus. some people.

### Overview

GML Bindings for [dear imgui,]()

* [Usage](#usage)
* [ImGui and IDs](#imgui-and-ids)
* [Changelist](#changelist)
  * [Coming Soon](#coming-soon)
  * [Unsupported Features](#unsupported-features)


### Usage

*  drop the `imguigml` object into your game, and voila. it begins activated.
*  call `imgui_deactivate();` and `imgui_activate()` for hiding/showing, which also stops all updates. 
  *  _imgui is **inaccessible completely** when deactivated_
*  _Note: imguigml is a **Persistent** object_

For most imgui functions, it's a straight wrap through. Call whatever you're looking for with 

`imguigml_<function>` as opposed to `ImGui::<function>` from the C++ analog.

### ImGui and IDs

_Copy and pasted from the ImGui Documentation from v1.53 of dear ImGui, edited for GML_


- Elements that are not clickable, such as Text() items don't need an ID.

- Interactive widgets require state to be carried over multiple frames (most typically Dear ImGui often needs to remember what is 
  the "active" widget). to do so they need a unique ID. unique ID are typically derived from a string label or an integer index.

    imguigml_button("OK");        // Label = "OK",     ID = hash of "OK"
    imguigml_button("Cancel");    // Label = "Cancel", ID = hash of "Cancel"

- ID are uniquely scoped within windows, tree nodes, etc. so no conflict can happen if you have two imguigml_buttons called "OK"
  in two different windows or in two different locations of a tree.

- If you have a same ID twice in the same location, you'll have a conflict:

    imguigml_button("OK");
    imguigml_button("OK");           // ID collision! Both imguigml_buttons will be treated as the same.

  Fear not! this is easy to solve and there are many ways to solve it!

- When passing a label you can optionally specify extra unique ID information within string itself. 
  This helps solving the simpler collision cases. Use "##" to pass a complement to the ID that won't be visible to the end-user:

    imguigml_button("Play");         // Label = "Play",   ID = hash of "Play"
    imguigml_button("Play##foo1");   // Label = "Play",   ID = hash of "Play##foo1" (different from above)
    imguigml_button("Play##foo2");   // Label = "Play",   ID = hash of "Play##foo2" (different from above)

- If you want to completely hide the label, but still need an ID:

    Checkbox("##On", &b);   // Label = "",       ID = hash of "##On" (no label!)

- Occasionally/rarely you might want change a label while preserving a constant ID. This allows you to animate labels.
  For example you may want to include varying information in a window title bar (and windows are uniquely identified by their ID.. obviously)
  Use "###" to pass a label that isn't part of ID:

    imguigml_button("Hello###ID";   // Label = "Hello",  ID = hash of "ID"
    imguigml_button("World###ID";   // Label = "World",  ID = hash of "ID" (same as above)

- Use imguigml_push_id() / imguigml_pop_id() to create scopes and avoid ID conflicts within the same Window.
  This is the most convenient way of distinguishing ID if you are iterating and creating many UI elements.
  You can push a string or an integer value. Remember that ID are formed from the concatenation of everything in the ID stack!

    for (int i = 0; i < 100; i++)
    {
      imguigml_push_id(i);
      imguigml_button("Click");   // Label = "Click",  ID = hash of integer + "label" (unique)
      imguigml_pop_id();
    }

    for (int i = 0; i < 100; i++)
    {
      var inst_id = Instancse[i];
      imguigml_push_id(inst_id);
      imguigml_button("Click");   // Label = "Click",  ID = hash of instance_id + "label" (unique)
      imguigml_pop_id();
    }

    for (int i = 0; i < 100; i++)
    {
      var inst = Instances[i];
      imguigml_push_id(instance.name);
      imguigml_button("Click");   // Label = "Click",  ID = hash of string + "label" (unique)
      imguigml_pop_id();
    }

- More example showing that you can stack multiple prefixes into the ID stack:

    imguigml_button("Click");     // Label = "Click",  ID = hash of "Click"
    imguigml_push_id("node");
    imguigml_button("Click");     // Label = "Click",  ID = hash of "node" + "Click"
      imguigml_push_id(my_ptr);
        imguigml_button("Click"); // Label = "Click",  ID = hash of "node" + ptr + "Click"
      imguigml_pop_id();
    imguigml_pop_id();

- Tree nodes implicitly creates a scope for you by calling imguigml_push_id().

    imguigml_button("Click");     // Label = "Click",  ID = hash of "Click"
    if (imguigml_tree_node("node"))
    {
      imguigml_button("Click");   // Label = "Click",  ID = hash of "node" + "Click"
      imguigml_tree_pop();
    }

- When working with trees, ID are used to preserve the open/close state of each tree node.
  Depending on your use cases you may want to use strings or indices as ID.
  e.g. when displaying a single object that may change over time (dynamic 1-1 relationship), using a static string as ID will preserve your
    node open/closed state when the targeted object change.
  e.g. when displaying a list of objects, using indices as ID will preserve the node open/closed state differently. 
    experiment and see what makes more sense!

### Reference

### `imguigml_activate(  )`  
 | | | | 
| -- | -- | -- 
**returns**: | None

*helper function to simply activate imguigml again* 

---

### `imguigml_deactivate(  )`  
 | | | | 
| -- | -- | -- 
**returns**: | None

*helper function to simply deactivate imguigml again* 

---

### `imguigml_ready(  )`  
 | | | | 
| -- | -- | -- 
**returns**: | {Boolean}

*returns true if imguigml is ready for commands to be called* 

---

### `imguigml_separator(  )`  
 | | | | 
| -- | -- | -- 
**returns**: | None

*separator, generally horizontal. inside a menu bar or in horizontal layout mode, this becomes a vertical separator.* 

---

### `imguigml_same_line( [_pos_x=0.0] , [_spacing_w=-1.0] )`  
 | | | | 
| -- | -- | -- 
**[_pos_x=0.0]:** | {Real} |  
**[_spacing_w=-1.0]:** | {Real} |  
**returns**: | None

*call between widgets or groups to layout them horizontally* 

---

### `imguigml_new_line(  )`  
 | | | | 
| -- | -- | -- 
**returns**: | None

*undo a SameLine()* 

---

### `imguigml_spacing(  )`  
 | | | | 
| -- | -- | -- 
**returns**: | None

*add vertical spacing* 

---

### `imguigml_dummy( [_pos_x=0.0] , [_spacing_w=-1.0] )`  
 | | | | 
| -- | -- | -- 
**[_pos_x=0.0]:** | {Real} |  
**[_spacing_w=-1.0]:** | {Real} |  
**returns**: | None

*add a dummy item of given size* 

---

### `imguigml_indent( [_index_w=0.0f] )`  
 | | | | 
| -- | -- | -- 
**[_index_w=0.0f]:** | {Real} |  
**returns**: | None

*move content position toward the right, by style.IndentSpacing or indent_w if >0* 

---

### `imguigml_unindent( [_index_w=0.0f] )`  
 | | | | 
| -- | -- | -- 
**[_index_w=0.0f]:** | {Real} |  
**returns**: | None

*move content position back to the left, by style.IndentSpacing or indent_w if >0* 

---

### `imguigml_begin_group(  )`  
 | | | | 
| -- | -- | -- 
**returns**: | None

*lock horizontal starting position + capture group bounding box into one "item" (so you can use IsItemHovered() or layout primitives such as SameLine() on whole group, etc.)* 

---

### `imguigml_end_group(  )`  
 | | | | 
| -- | -- | -- 
**returns**: | None

*end horizontal capture group* 

---

### `imguigml_get_cursor_pos(  )`  
 | | | | 
| -- | -- | -- 
**returns**: | {Array:[x,y]}

*cursor position is relative to window position* 

---

### `imguigml_get_cursor_pos_x(  )`  
 | | | | 
| -- | -- | -- 
**returns**: | {Real} x

*cursor position is relative to window position* 

---

### `imguigml_get_cursor_pos_y(  )`  
 | | | | 
| -- | -- | -- 
**returns**: | {Real} y

*cursor position is relative to window position* 

---

### `imguigml_set_cursor_pos( _x , _y )`  
 | | | | 
| -- | -- | -- 
**_x:** | {Real} |  
**_y:** | {Real} |  
**returns**: | None

*set the imgui cursor position* 

---

### `imguigml_set_cursor_pos_x( _x )`  
 | | | | 
| -- | -- | -- 
**_x:** | {Real} |  
**returns**: | None

*set the imgui cursor position x* 

---

### `imguigml_set_cursor_pos_y( _y )`  
 | | | | 
| -- | -- | -- 
**_y:** | {Real} |  
**returns**: | None

*set the imgui cursor position y* 

---

### `imguigml_get_cursor_start_pos(  )`  
 | | | | 
| -- | -- | -- 
**returns**: | {Array:[x,y]}

*initial cursor position* 

---

### `imguigml_get_cursor_screen_pos(  )`  
 | | | | 
| -- | -- | -- 
**returns**: | {Array:[x,y]}

*cursor position in absolute screen coordinates [0..io.DisplaySize] (useful to work with ImDrawList API)* 

---

### `imguigml_set_cursor_screen_pos( _x , _y )`  
 | | | | 
| -- | -- | -- 
**_x:** | {Real} |  
**_y:** | {Real} |  
**returns**: | None

*cursor position in absolute screen coordinates [0..io.DisplaySize]* 

---

### `imguigml_align_text_to_frame_padding(  )`  
 | | | | 
| -- | -- | -- 
**returns**: | None

*vertically align/lower upcoming text to FramePadding.y so that it will aligns to upcoming widgets (call if you have text on a line before regular widgets)* 

---

### `imguigml_get_text_line_height(  )`  
 | | | | 
| -- | -- | -- 
**returns**: | {Real} height of font == GetWindowFontSize()

*height of font == GetWindowFontSize()* 

---

### `imguigml_get_text_line_height_with_spacing(  )`  
 | | | | 
| -- | -- | -- 
**returns**: | {Real} distance (in pixels) between 2 consecutive lines of text == GetWindowFontSize() + GetStyle().ItemSpacing.y

*distance (in pixels) between 2 consecutive lines of text == GetWindowFontSize() + GetStyle().ItemSpacing.y* 

---

### `imguigml_get_items_line_height_with_spacing(  )`  
 | | | | 
| -- | -- | -- 
**returns**: | {Real} distance (in pixels) between 2 consecutive lines of standard height widgets == GetWindowFontSize() + GetStyle().FramePadding.y*2 + GetStyle().ItemSpacing.y

*distance (in pixels) between 2 consecutive lines of standard height widgets == GetWindowFontSize() + GetStyle().FramePadding.y*2 + GetStyle().ItemSpacing.y* 

---

### `imguigml_columns( [_count=1] , [_id=undefined] , [_border=true] )`  
 | | | | 
| -- | -- | -- 
**[_count=1]:** | {Real} |  
**[_id=undefined]:** | {String} |  
**[_border=true]:** | {Boolean} |  
**returns**: | None

*You can also use SameLine(pos_x) for simplified columns.* 

---

### `imguigml_next_column(  )`  
 | | | | 
| -- | -- | -- 
**returns**: | None

*next column, defaults to current row or next row if the current row is finished* 

---

### `imguigml_get_column_index(  )`  
 | | | | 
| -- | -- | -- 
**returns**: | {Real} column_index

*get current column index* 

---

### `imguigml_get_column_width( [_column_index=-1] )`  
 | | | | 
| -- | -- | -- 
**[_column_index=-1]:** | {Real} |  
**returns**: | {Real} _column_width

*get column width (in pixels). pass -1 to use current column* 

---

### `imguigml_set_column_width( _column_index , _width )`  
 | | | | 
| -- | -- | -- 
**_column_index:** | {Real} | column to set width of (-1 for current) 
**_width:** | {Real} | width in pixels to use 
**returns**: | None

*set column width (in pixels). pass -1 to use current column* 

---

### `imguigml_get_column_offset( [_column_index=-1] )`  
 | | | | 
| -- | -- | -- 
**[_column_index=-1]:** | {Real} | pass -1 to use current column, otherwise 0..GetColumnsCount() inclusive. column 0 is typically 0.0f 
**returns**: | None

*get position of column line (in pixels, from the left side of the contents region).* 

---

### `imguigml_set_column_offset( _column_index , _offset_x )`  
 | | | | 
| -- | -- | -- 
**_column_index:** | {Real} | pass -1 to use current column 
**_offset_x:** | {Real} | offset in pixels from the left side of the contents 
**returns**: | None

*set position of column line (in pixels, from the left side of the contents region).* 

---

### `imguigml_get_columns_count(  )`  
 | | | | 
| -- | -- | -- 
**returns**: | {Real} columns count

*get amount of columns* 

---

### `imguigml_push_id( _id , [_end_id] )`  
 | | | | 
| -- | -- | -- 
**_id:** | {Real|String} | string or real id to push 
**[_end_id]:** | {String} | last id to push 
**returns**: | None

*push identifier into the ID stack. IDs are hash of the entire stack!* 

---

### `imguigml_pop_id(  )`  
 | | | | 
| -- | -- | -- 
**returns**: | None

*pop identifier from ID stack* 

---

### `imguigml_get_id( _id , [_end_id] )`  
 | | | | 
| -- | -- | -- 
**_id:** | {Real|String} | string or real id to get 
**[_end_id]:** | {String} | last id to get 
**returns**: | {Real} ImGuiID

*push identifier into the ID stack. IDs are hash of the entire stack!* 

---

### `imguigml_get_version(  )`  
 | | | | 
| -- | -- | -- 
**returns**: | None

** 

---

### `imguigml_get_clipboard_text(  )`  
 | | | | 
| -- | -- | -- 
**returns**: | {String} clipboard text

*get the clipboard text* 

---

### `imguigml_set_clipboard_text(  )`  
 | | | | 
| -- | -- | -- 
**returns**: | None

*set the clipboard text* 

---

### `imguigml_get_key_index( _key_index )`  
 | | | | 
| -- | -- | -- 
**_key_index:** | {Real:__ImGuiKey_} |  
**returns**: | {Real}

*get mapped index for imgui_key index, you really don't need this* 

---

### `imguigml_is_key_down( _key_index )`  
 | | | | 
| -- | -- | -- 
**_key_index:** | {Real:__ImGuiKey_} |  
**returns**: | {Boolean}

*is key being held. == io.KeysDown[user_key_index]. note that imgui doesn't know the semantic of each entry of io.KeyDown[]. Use your own indices/enums according to how your backend/engine stored them into KeyDown[]!* 

---

### `imguigml_is_key_pressed( _key_index , [_repeat=true] )`  
 | | | | 
| -- | -- | -- 
**_key_index:** | {Real:__ImGuiKey_} |  
**[_repeat=true]:** | {Boolean} | repeat=true, uses io.KeyRepeatDelay / KeyRepeatRate 
**returns**: | {Boolean}

*was key pressed (went from !Down to Down)* 

---

### `imguigml_is_key_released( _key_index )`  
 | | | | 
| -- | -- | -- 
**_key_index:** | {Real:__ImGuiKey_} |  
**returns**: | {Boolean}

*is key released* 

---

### `imguigml_get_key_pressed_amount( _key_index , _repeat_delay , _rate )`  
 | | | | 
| -- | -- | -- 
**_key_index:** | {Real} |  
**_repeat_delay:** | {Real} |  
**_rate:** | {Real} |  
**returns**: | {Real} return a count, most often 0 or 1 but might be >1 if RepeatRate is small enough that DeltaTime > RepeatRate

*uses provided repeat rate/delay.* 

---

### `imguigml_is_mouse_down( _button )`  
 | | | | 
| -- | -- | -- 
**_button:** | {Real} |  
**returns**: | {Boolean}

*is mouse button held* 

---

### `imguigml_is_mouse_clicked( _button , [_repeat=false] )`  
 | | | | 
| -- | -- | -- 
**_button:** | {Real} |  
**[_repeat=false]:** | {Boolean} |  
**returns**: | {Boolean}

*did mouse button clicked (went from !Down to Down)* 

---

### `imguigml_is_mouse_double_clicked( _button )`  
 | | | | 
| -- | -- | -- 
**_button:** | {Real} |  
**returns**: | {Boolean}

*did mouse button double-clicked. a double-click returns false in IsMouseClicked(). uses io.MouseDoubleClickTime.* 

---

### `imguigml_is_mouse_released( _button )`  
 | | | | 
| -- | -- | -- 
**_button:** | {Real} |  
**returns**: | {Boolean}

*did mouse button released (went from Down to !Down)* 

---

### `imguigml_is_mouse_dragging( [_button=0] , [_lock_threshold=-1.0] )`  
 | | | | 
| -- | -- | -- 
**[_button=0]:** | {Real} |  
**[_lock_threshold=-1.0]:** | {Real} | if lock_threshold < -1.0f uses io.MouseDraggingThreshold 
**returns**: | {Boolean}

*is mouse dragging.* 

---

### `imguigml_is_mouse_hovering_rect( _min_x , _min_y , _max_x , _max_y , [_clip=true] )`  
 | | | | 
| -- | -- | -- 
**_min_x:** | {Real} |  
**_min_y:** | {Real} |  
**_max_x:** | {Real} |  
**_max_y:** | {Real} |  
**[_clip=true]:** | {Boolean} | clipped by current clipping settings. disregarding of consideration of focus/window ordering/blocked by a popup. 
**returns**: | {Boolean}

*is mouse hovering given bounding rect (in screen space).* 

---

### `imguigml_is_mouse_pos_valid(  )`  
 | | | | 
| -- | -- | -- 
**returns**: | {Boolean}

*is the mouse position valid* 

---

### `imguigml_get_mouse_pos(  )`  
 | | | | 
| -- | -- | -- 
**returns**: | {Boolean}

*shortcut to ImGui::GetIO().MousePos provided by user, to be consistent with other calls* 

---

### `imguigml_get_mouse_pos_on_opening_current_popup(  )`  
 | | | | 
| -- | -- | -- 
**returns**: | None

*retrieve backup of mouse positioning at the time of opening popup we have BeginPopup() into* 

---

### `imguigml_get_mouse_drag_delta(  )`  
 | | | | 
| -- | -- | -- 
**returns**: | None

*retrieve backup of mouse positioning at the time of opening popup we have BeginPopup() into* 

---

### `imguigml_reset_mouse_drag_delta( [_button=0] )`  
 | | | | 
| -- | -- | -- 
**[_button=0]:** | {Real} |  
**returns**: | None

*reset the drag delta* 

---

### `imguigml_get_mouse_cursor(  )`  
 | | | | 
| -- | -- | -- 
**returns**: | {Real:EImGui_MouseCursor} cursor id

*get desired cursor type, reset in ImGui::NewFrame(), this is updated during the frame. valid before Render(). If you use software rendering by setting io.MouseDrawCursor ImGui will render those for you* 

---

### `imguigml_set_mouse_cursor( _type )`  
 | | | | 
| -- | -- | -- 
**_type:** | {Real:EImGui_MouseCursor} |  
**returns**: | None

*set desired cursor type* 

---

### `imguigml_capture_keyboard_from_app( [_capture=true] )`  
 | | | | 
| -- | -- | -- 
**[_capture=true]:** | {Boolean} |  
**returns**: | None

*manually override io.WantCaptureKeyboard flag next frame (said flag is entirely left for your application handle). e.g. force capture keyboard when your widget is being hovered.* 

---

### `imguigml_capture_mouse_from_app( [_capture=true] )`  
 | | | | 
| -- | -- | -- 
**[_capture=true]:** | {Boolean} |  
**returns**: | None

*manually override io.WantCaptureMouse flag next frame (said flag is entirely left for your application handle).* 

---

### `imguigml_log_to_tty( [_max_depth=-1] )`  
 | | | | 
| -- | -- | -- 
**[_max_depth=-1]:** | {Real} |  
**returns**: | None

*start logging to tty* 

---

### `imguigml_log_to_file( [_max_depth=-1] , [_file_name=undefined] )`  
 | | | | 
| -- | -- | -- 
**[_max_depth=-1]:** | {Real} |  
**[_file_name=undefined]:** | {String} | absolute path to log 
**returns**: | None

*start logging to file* 

---

### `imguigml_log_to_clipboard( [_max_depth=-1] )`  
 | | | | 
| -- | -- | -- 
**[_max_depth=-1]:** | {Real} |  
**returns**: | None

*start logging to OS clipboard* 

---

### `imguigml_log_finish(  )`  
 | | | | 
| -- | -- | -- 
**returns**: | None

*stop logging (close file, etc.)* 

---

### `imguigml_log_buttons(  )`  
 | | | | 
| -- | -- | -- 
**returns**: | None

*helper to display buttons for logging to tty/file/clipboard* 

---

### `imguigml_log_text( _text )`  
 | | | | 
| -- | -- | -- 
**_text:** | {String} |  
**returns**: | None

*pass text data straight to log (without being displayed)* 

---

### `imguigml_begin_main_menu_bar(  )`  
 | | | | 
| -- | -- | -- 
**returns**: | {Boolean}

*create and append to a full screen menu-bar. only call EndMainMenuBar() if this returns true!* 

---

### `imguigml_end_main_menu_bar(  )`  
 | | | | 
| -- | -- | -- 
**returns**: | None

*end main menu bar* 

---

### `imguigml_begin_menu_bar(  )`  
 | | | | 
| -- | -- | -- 
**returns**: | {Boolean}

*append to menu-bar of current window (requires ImGuiWindowFlags_MenuBar flag set on parent window). only call EndMenuBar() if this returns true!* 

---

### `imguigml_end_menu_bar(  )`  
 | | | | 
| -- | -- | -- 
**returns**: | None

*end menu bar* 

---

### `imguigml_begin_menu( _label , [_enabled=true] )`  
 | | | | 
| -- | -- | -- 
**_label:** | {String} |  
**[_enabled=true]:** | {Boolean} |  
**returns**: | {Boolean}

*create a sub-menu entry. only call EndMenu() if this returns true!* 

---

### `imguigml_end_menu(  )`  
 | | | | 
| -- | -- | -- 
**returns**: | None

*end sub-menu entry* 

---

### `imguigml_menu_item( _label , [_shortcut=""] , [_selected=false] , [_enabled=true] )`  
 | | | | 
| -- | -- | -- 
**_label:** | {String} |  
**[_shortcut=""]:** | {String} | shortcuts are displayed for convenience but not processed by ImGui at the moment 
**[_selected=false]:** | {Boolean} |  
**[_enabled=true]:** | {Boolean} |  
**returns**: | {Boolean} true when activated.

*show a sub-menu item* 

---

### `imguigml_open_popup( _str_id )`  
 | | | | 
| -- | -- | -- 
**_str_id:** | {String} |  
**returns**: | None

*call to mark popup as open (don't call every frame!). popups are closed when user click outside,      or if CloseCurrentPopup() is called within a BeginPopup()/EndPopup() block. By default,      Selectable()/MenuItem() are calling CloseCurrentPopup(). Popup identifiers are relative to the      current ID-stack (so OpenPopup and BeginPopup needs to be at the same level).* 

---

### `imguigml_open_popup_on_item_click( [_str_id=undefined] , [_mouse_button=1] )`  
 | | | | 
| -- | -- | -- 
**[_str_id=undefined]:** | {String} |  
**[_mouse_button=1]:** | {Real} |  
**returns**: | {Boolean} true when just opened.

*helper to open popup when clicked on last item.* 

---

### `imguigml_begin_popup( _str_id )`  
 | | | | 
| -- | -- | -- 
**_str_id:** | {String} |  
**returns**: | {Boolean} true if the popup is open, and you can start outputting to it.

*begin a pop up - only call EndPopup() if BeginPopup() returned true!* 

---

### `imguigml_begin_popup_modal( _name , [_open=undefined] , [_extra_flags=0] )`  
 | | | | 
| -- | -- | -- 
**_name:** | {String} |  
**[_open=undefined]:** | {Boolean} | if passed, a close button is shown if true, or its closed if false, returns array with second value being if its open still 
**[_extra_flags=0]:** | {Real:EImGui_WindowFlags} |  
**returns**: | {Boolean|Array:[Boolean, Boolean]} if `_open` is passed, then an array for [ BeginPopupModal, _open ]

*modal dialog (block interactions behind the modal window, can't close the modal window by clicking outside)* 

---

### `imguigml_begin_popup_context_item( [_str_id=undefined] , [_mouse_button=1] )`  
 | | | | 
| -- | -- | -- 
**[_str_id=undefined]:** | {String} | if you can pass an `undefined` `_str_id` only if the previous item had an id. If you want to use that on a non-interactive item such as Text() you need to pass in an explicit ID here. 
**[_mouse_button=1]:** | {Real} |  
**returns**: | {Boolean}

*helper to open and begin popup when clicked on last item. if you can pass a NULL str_id only if the previous item had an id. If you want to use that on a non-interactive item such as Text() you need to pass in an explicit ID here. read comments in .cpp!* 

---

### `imguigml_begin_popup_context_window( [_str_id=undefined] , [_mouse_button=1] , [_also_over_items=true] )`  
 | | | | 
| -- | -- | -- 
**[_str_id=undefined]:** | {String} |  
**[_mouse_button=1]:** | {Real} |  
**[_also_over_items=true]:** | {Boolean} |  
**returns**: | {Boolean}

*helper to open and begin popup when clicked on current window.* 

---

### `imguigml_begin_popup_context_void( [_str_id=undefined] , [_mouse_button=1] )`  
 | | | | 
| -- | -- | -- 
**[_str_id=undefined]:** | {String} |  
**[_mouse_button=1]:** | {Real} |  
**returns**: | {Boolean}

*helper to open and begin popup when clicked in void (where there are no imgui windows).* 

---

### `imguigml_end_popup(  )`  
 | | | | 
| -- | -- | -- 
**returns**: | None

*end the current pop up* 

---

### `imguigml_is_popup_open( _str_id )`  
 | | | | 
| -- | -- | -- 
**_str_id:** | {String} |  
**returns**: | {Boolean}

*return true if the popup is open* 

---

### `imguigml_close_current_popup(  )`  
 | | | | 
| -- | -- | -- 
**returns**: | None

*close the popup we have begin-ed into. clicking on a MenuItem or Selectable automatically close the current popup.* 

---

### `imguigml_push_font(  )`  
 | | | | 
| -- | -- | -- 
**returns**: | None

*use undefined as a shortcut to push default font* 

---

### `imguigml_pop_font(  )`  
 | | | | 
| -- | -- | -- 
**returns**: | None

*pop the font* 

---

### `imguigml_push_style_color( _idx , _colOrR , [_g] , [_b] , [_a] )`  
 | | | | 
| -- | -- | -- 
**_idx:** | {Real:EImGui_Col} |  
**_colOrR:** | {Real} | if passing a single color, treated as a U32 colors 
**[_g]:** | {Real} |  
**[_b]:** | {Real} |  
**[_a]:** | {Real} |  
**returns**: | None

** 

---

### `imguigml_pop_style_color( [_count=1] )`  
 | | | | 
| -- | -- | -- 
**[_count=1]:** | {Real} |  
**returns**: | None

*pop style colors* 

---

### `imguigml_push_style_var( _idx , _valOrX , [_y] )`  
 | | | | 
| -- | -- | -- 
**_idx:** | {Real:EImGui_StyleVar} |  
**_valOrX:** | {Real} |  
**[_y]:** | {Real} | if passed, treat the values as a vec2 
**returns**: | None

*push a style var on the param stack* 

---

### `imguigml_pop_style_var( [_count=1] )`  
 | | | | 
| -- | -- | -- 
**[_count=1]:** | {Real} |  
**returns**: | None

*pop style colors* 

---

### `imguigml_get_style_color_vec4( _idx )`  
 | | | | 
| -- | -- | -- 
**_idx:** | {Real:EImGui_Col} |  
**returns**: | {Array:[r,g,b,a]}

*retrieve style color as stored in ImGuiStyle structure. use to feed back into PushStyleColor(), otherwhise use GetColorU32() to get style color + style alpha.* 

---

### `imguigml_get_font(  )`  
 | | | | 
| -- | -- | -- 
**returns**: | {Real} _font_id

*get current font* 

---

### `imguigml_get_font_size(  )`  
 | | | | 
| -- | -- | -- 
**returns**: | {Real} current font size

*get current font size (= height in pixels) of current font with current scale applied* 

---

### `imguigml_get_font_tex_uv_white_pixel(  )`  
 | | | | 
| -- | -- | -- 
**returns**: | {Array:[u,v]}

*get UV coordinate for a while pixel, useful to draw custom shapes via the ImDrawList API* 

---

### `imguigml_get_color_u32( _colOrR , [_g] , [_b] , [_a] )`  
 | | | | 
| -- | -- | -- 
**_colOrR:** | {Real} | U32 color, or r component 
**[_g]:** | {Real} | g component 
**[_b]:** | {Real} | b component 
**[_a]:** | {Real} | a component 
**returns**: | None

*retrieve given style color with style alpha applied and optional extra alpha multiplier* 

---

### `imguigml_get_color_u32_from_idx( _idx , [_alpha_mul=1.0] )`  
 | | | | 
| -- | -- | -- 
**_idx:** | {Real:EImGui_Col} |  
**[_alpha_mul=1.0]:** | {Real} |  
**returns**: | None

*retrieve given style color with style alpha applied and optional extra alpha multiplier* 

---

### `imguigml_push_item_width( _item_width )`  
 | | | | 
| -- | -- | -- 
**_item_width:** | {Real} | 0.0f = default to ~2/3 of windows width, >0.0f: width in pixels, <0.0f align xx pixels to the right of window (so -1.0f always align width to the right side) 
**returns**: | None

*width of items for the common item+label case, pixels.* 

---

### `imguigml_pop_item_width(  )`  
 | | | | 
| -- | -- | -- 
**returns**: | None

*pop item width* 

---

### `imguigml_calc_item_width(  )`  
 | | | | 
| -- | -- | -- 
**returns**: | {Real}

*width of item given pushed settings and current cursor position* 

---

### `imguigml_push_text_wrap_pos( [_wrap_pos_x=0.0] )`  
 | | | | 
| -- | -- | -- 
**[_wrap_pos_x=0.0]:** | {Real} | < 0.0f: no wrapping; 0.0f: wrap to end of window (or column); > 0.0f: wrap at 'wrap_pos_x' position in window local space 
**returns**: | None

*word-wrapping for Text*() commands.* 

---

### `imguigml_pop_text_wrap_pos(  )`  
 | | | | 
| -- | -- | -- 
**returns**: | None

*pop text wrap pos* 

---

### `imguigml_push_allow_keyboard_focus( _allow_keyboard_focus )`  
 | | | | 
| -- | -- | -- 
**_allow_keyboard_focus:** | {Boolean} |  
**returns**: | None

*allow focusing using TAB/Shift-TAB, enabled by default but you can disable it for certain widgets* 

---

### `imguigml_pop_allow_keyboard_focus(  )`  
 | | | | 
| -- | -- | -- 
**returns**: | None

*pop allow keyboard focus* 

---

### `imguigml_push_button_repeat( _repeat )`  
 | | | | 
| -- | -- | -- 
**_repeat:** | {Boolean} |  
**returns**: | None

*in 'repeat' mode, Button*() functions return repeated true in a typematic manner (using io.KeyRepeatDelay/io.KeyRepeatRate setting). Note that you can call IsItemActive() after any Button() to tell if the button is held in the current frame.* 

---

### `imguigml_pop_button_repeat(  )`  
 | | | | 
| -- | -- | -- 
**returns**: | None

*pop repeat mode* 

---

### `imguigml_selectable( _label , [_selected=false] , [_selectable_flags=0] , [_size_x=0] , [_size_y=0] )`  
 | | | | 
| -- | -- | -- 
**_label:** | {String} |  
**[_selected=false]:** | {Boolean} |  
**[_selectable_flags=0]:** | {Real:EImGui_SelectableFlags} |  
**[_size_x=0]:** | {Real} | size.x==0.0: use remaining width, size.x>0.0: specify width. 
**[_size_y=0]:** | {Real} | size.y==0.0: use label height, size.y>0.0: specify height 
**returns**: | {Array:[_val_changes, _is_selected]}

*selectable element* 

---

### `imguigml_list_box( _label , _current_item , _item_array , [_height_in_items=-1]) )`  
 | | | | 
| -- | -- | -- 
**_label:** | {String} |  
**_current_item:** | {Real} |  
**_item_array:** | {Array:String} |  
**[_height_in_items=-1]):** | {Real} |  
**returns**: | usn {Array:[{Boolean} _changed, {Real} _selected_index]}

*create a list box* 

---

### `imguigml_list_box_header( _label , _size_x , _size_y )`  
 | | | | 
| -- | -- | -- 
**_label:** | {String} |  
**_size_x:** | {Real} |  
**_size_y:** | {Real} |  
**returns**: | {Boolean}

*use if you want to reimplement ListBox() will custom data or interactions. make sure to call ListBoxFooter() afterwards.* 

---

### `imguigml_list_box_header_items( _label , _items_count , [_height_in_items=-1] )`  
 | | | | 
| -- | -- | -- 
**_label:** | {String} |  
**_items_count:** | {Real} |  
**[_height_in_items=-1]:** | {Real} |  
**returns**: | {Boolean}

*use if you want to reimplement ListBox() will custom data or interactions. make sure to call ListBoxFooter() afterwards.* 

---

### `imguigml_list_box_footer(  )`  
 | | | | 
| -- | -- | -- 
**returns**: | None

*terminate the scrolling region* 

---

### `imguigml_show_style_editor(  )`  
 | | | | 
| -- | -- | -- 
**returns**: | None

*add style editor block (not a window). you can pass in a reference ImGuiStyle structure to compare to, revert to and save to (else it uses the default style)* 

---

### `imguigml_style_colors_classic(  )`  
 | | | | 
| -- | -- | -- 
**returns**: | None

*use classic colors* 

---

### `imguigml_style_colors_dark(  )`  
 | | | | 
| -- | -- | -- 
**returns**: | None

*use dark colors* 

---

### `imguigml_set_tooltip( _tooltip_text )`  
 | | | | 
| -- | -- | -- 
**_tooltip_text:** | {String} |  
**returns**: | None

*set text tooltip under mouse-cursor, typically use with ImGui::IsItemHovered(). overidde any previous call to SetTooltip().* 

---

### `imguigml_begin_tooltip(  )`  
 | | | | 
| -- | -- | -- 
**returns**: | None

*begin/append a tooltip window. to create full-featured tooltip (with any kind of contents).* 

---

### `imguigml_end_tooltip(  )`  
 | | | | 
| -- | -- | -- 
**returns**: | None

*end a tooltip window* 

---

### `imguigml_value( _prefix , _val_type , _val , [_float_format] )`  
 | | | | 
| -- | -- | -- 
**_prefix:** | {String} | value prefix 
**_val_type:** | {Real:EImGui_ValType} | data type for value 
**_val:** | {Real} | value to apss 
**[_float_format]:** | {String} | (float value type only) 
**returns**: | None

*Output single value in "name: value" format (tip: freely declare more in your code to handle your types. you can add functions to the ImGui namespace)* 

---

### `imguigml_color_convert_u32_to_float4( _color )`  
 | | | | 
| -- | -- | -- 
**_color:** | {Real} | u32 color 
**returns**: | {Array:float4} _color

*convert a u32 color to a float 4* 

---

### `imguigml_color_convert_float4_to_u32( _r , _g , _b , _a )`  
 | | | | 
| -- | -- | -- 
**_r:** | {Real} |  
**_g:** | {Real} |  
**_b:** | {Real} |  
**_a:** | {Real} |  
**returns**: | {Real} _color

*convert a float4 color to a u32* 

---

### `imguigml_color_convert_rgb_to_hsv( _r , _g , _b )`  
 | | | | 
| -- | -- | -- 
**_r:** | {Real} |  
**_g:** | {Real} |  
**_b:** | {Real} |  
**returns**: | {Array:[h,s,v]}

*convert rgb to hsv* 

---

### `imguigml_color_convert_hsv_to_rgb( _h , _s , _b )`  
 | | | | 
| -- | -- | -- 
**_h:** | {Real} |  
**_s:** | {Real} |  
**_b:** | {Real} |  
**returns**: | {Array:[r,g,b]}

*convert rgb to hsv* 

---

### `imguigml_is_item_hovered( [_flags=0] )`  
 | | | | 
| -- | -- | -- 
**[_flags=0]:** | {Real:EImGui_HoveredFlags} |  
**returns**: | {Boolean}

*is the last item hovered by mouse (and usable)?* 

---

### `imguigml_is_item_active(  )`  
 | | | | 
| -- | -- | -- 
**returns**: | {Boolean}

*is the last item active? (e.g. button being held, text field being edited- items that don't interact will always return false)* 

---

### `imguigml_is_item_clicked( [_button=0] )`  
 | | | | 
| -- | -- | -- 
**[_button=0]:** | {Real} | mouse_button 
**returns**: | {Boolean}

*is the last item clicked? (e.g. button/node just clicked on)* 

---

### `imguigml_is_item_visible(  )`  
 | | | | 
| -- | -- | -- 
**returns**: | {Boolean}

*is the last item visible? (aka not out of sight due to clipping/scrolling.)* 

---

### `imguigml_is_any_item_hovered(  )`  
 | | | | 
| -- | -- | -- 
**returns**: | {Boolean}

*are any items hovered* 

---

### `imguigml_is_any_item_active(  )`  
 | | | | 
| -- | -- | -- 
**returns**: | {Boolean}

*are any items active* 

---

### `imguigml_get_item_rect_min(  )`  
 | | | | 
| -- | -- | -- 
**returns**: | {Array:[x,y]}

*get bounding rect of last item in screen space* 

---

### `imguigml_get_item_rect_max(  )`  
 | | | | 
| -- | -- | -- 
**returns**: | {Array:[x,y]}

*get bounding rect of last item in screen space* 

---

### `imguigml_get_item_rect_size(  )`  
 | | | | 
| -- | -- | -- 
**returns**: | {Array:[x,y]}

*get bounding rect of last item in screen space* 

---

### `imguigml_set_item_allow_overlap(  )`  
 | | | | 
| -- | -- | -- 
**returns**: | None

*allow last item to be overlapped by a subsequent item. sometimes useful with invisible buttons, selectables, etc. to catch unused area.* 

---

### `imguigml_is_window_focused(  )`  
 | | | | 
| -- | -- | -- 
**returns**: | {Boolean}

*is current Begin()-ed window focused?* 

---

### `imguigml_is_window_hovered( [_flags=0] )`  
 | | | | 
| -- | -- | -- 
**[_flags=0]:** | {Real:EImGui_HoveredFlags} |  
**returns**: | {Boolean}

*is current Begin()-ed window hovered (and typically: not blocked by a popup/modal)?* 

---

### `imguigml_is_root_window_focused(  )`  
 | | | | 
| -- | -- | -- 
**returns**: | {Boolean}

*is current Begin()-ed root window focused (root = top-most parent of a child, otherwise self)?* 

---

### `imguigml_is_root_window_or_any_child_focused(  )`  
 | | | | 
| -- | -- | -- 
**returns**: | {Boolean}

*is current Begin()-ed root window or any of its child (including current window) focused?* 

---

### `imguigml_is_any_window_hovered(  )`  
 | | | | 
| -- | -- | -- 
**returns**: | {Boolean}

*is mouse hovering any visible window* 

---

### `imguigml_is_rect_visible( _size_or_min_x , _size_or_min_y , [_max_x] , [_max_y] )`  
 | | | | 
| -- | -- | -- 
**_size_or_min_x:** | {Real} | if only size given, test from cursor pos 
**_size_or_min_y:** | {Real} |  
**[_max_x]:** | {Real} | if max given, test in screen space 
**[_max_y]:** | {Real} |  
**returns**: | {Boolean}

*test if a rectangle is visible / not clipped* 

---

### `imguigml_get_time(  )`  
 | | | | 
| -- | -- | -- 
**returns**: | None

*get the time* 

---

### `imguigml_get_frame_count(  )`  
 | | | | 
| -- | -- | -- 
**returns**: | None

*get the time* 

---

### `imguigml_get_style_color_name( _idx )`  
 | | | | 
| -- | -- | -- 
**_idx:** | {Real:EImGui_Col} |  
**returns**: | {String} _color_name

*get the style color's name* 

---

### `imguigml_calc_item_rect_closest_point( _pos_x , _pos_y , [_on_edge=false] , [_outward=+0.0]) )`  
 | | | | 
| -- | -- | -- 
**_pos_x:** | {Real} |  
**_pos_y:** | {Real} |  
**[_on_edge=false]:** | {Boolean} |  
**[_outward=+0.0]):** | {Real} |  
**returns**: | {Array:x,y}

*utility to find the closest point the last item bounding rectangle edge. useful to visually link items* 

---

### `imguigml_calc_text_size( _text , [_text_end=undefined] , [_hide_text_after_double_hash=false] , [_wrap_width=-1.0f]); )`  
 | | | | 
| -- | -- | -- 
**_text:** | {String} |  
**[_text_end=undefined]:** | {String} |  
**[_hide_text_after_double_hash=false]:** | {Boolean} |  
**[_wrap_width=-1.0f]);:** | {Real} |  
**returns**: | {Array:[x,y]}

*Calculate text size. Text can be multi-line. Optionally ignore text after a ## marker.* 

---

### `imguigml_calc_list_clipping( _items_count , _items_height )`  
 | | | | 
| -- | -- | -- 
**_items_count:** | {Real} |  
**_items_height:** | {Real} |  
**returns**: | {Array:[item_start, item_end]}

*calculate coarse clipping for large list of evenly sized items. Prefer using the ImGuiListClipper higher-level helper if you can.* 

---

### `imguigml_push_clip_rect( _min_x , _min_y , _max_x , _max_y , _intersect_with_current_clip_rect )`  
 | | | | 
| -- | -- | -- 
**_min_x:** | {Real} | clip_rect_min_x 
**_min_y:** | {Real} | clip_rect_min_y 
**_max_x:** | {Real} | clip_rect_max_x 
**_max_y:** | {Real} | clip_rect_max_y 
**_intersect_with_current_clip_rect:** | {Boolean} |  
**returns**: | None

** 

---

### `imguigml_pop_clip_rect(  )`  
 | | | | 
| -- | -- | -- 
**returns**: | None

*pop the clip rect* 

---

### `imguigml_slider_float( _label , _val , _min , _max , [_display_fmt="%.3f"] , [_power=1.0]) )`  
 | | | | 
| -- | -- | -- 
**_label:** | {String} |  
**_val:** | {Real} |  
**_min:** | {Real} |  
**_max:** | {Real} |  
**[_display_fmt="%.3f"]:** | {String} |  
**[_power=1.0]):** | {Real} |  
**returns**: | {Array:[_changed, _val]}

*adjust display_format to decorate the value with a prefix or a suffix for in-slider labels or unit display. Use power!=1.0 for logarithmic sliders* 

---

### `imguigml_slider_float2( _label , _val , _val2 , _min , _max , [_display_fmt="%.3f"] , [_power=1.0]) )`  
 | | | | 
| -- | -- | -- 
**_label:** | {String} |  
**_val:** | {Real} |  
**_val2:** | {Real} |  
**_min:** | {Real} |  
**_max:** | {Real} |  
**[_display_fmt="%.3f"]:** | {String} |  
**[_power=1.0]):** | {Real} |  
**returns**: | {Array:[_changed, _val]}

*adjust display_format to decorate the value with a prefix or a suffix for in-slider labels or unit display. Use power!=1.0 for logarithmic sliders* 

---

### `imguigml_slider_float3( _label , _val , _val2 , _val3 , _min , _max , [_display_fmt="%.3f"] , [_power=1.0]) )`  
 | | | | 
| -- | -- | -- 
**_label:** | {String} |  
**_val:** | {Real} |  
**_val2:** | {Real} |  
**_val3:** | {Real} |  
**_min:** | {Real} |  
**_max:** | {Real} |  
**[_display_fmt="%.3f"]:** | {String} |  
**[_power=1.0]):** | {Real} |  
**returns**: | {Array:[_changed, _val]}

*adjust display_format to decorate the value with a prefix or a suffix for in-slider labels or unit display. Use power!=1.0 for logarithmic sliders* 

---

### `imguigml_slider_float4( _label , _val , _val2 , _val3 , _val4 , _min , _max , [_display_fmt="%.3f"] , [_power=1.0]) )`  
 | | | | 
| -- | -- | -- 
**_label:** | {String} |  
**_val:** | {Real} |  
**_val2:** | {Real} |  
**_val3:** | {Real} |  
**_val4:** | {Real} |  
**_min:** | {Real} |  
**_max:** | {Real} |  
**[_display_fmt="%.3f"]:** | {String} |  
**[_power=1.0]):** | {Real} |  
**returns**: | {Array:[_changed, _val]}

*adjust display_format to decorate the value with a prefix or a suffix for in-slider labels or unit display. Use power!=1.0 for logarithmic sliders* 

---

### `imguigml_slider_angle( _label , _rad , [_degree_min=-360.0] , [_degree_max=360.0] )`  
 | | | | 
| -- | -- | -- 
**_label:** | {String} |  
**_rad:** | {Real} |  
**[_degree_min=-360.0]:** | {Real} |  
**[_degree_max=360.0]:** | {Real} |  
**returns**: | {Array:[_changed, _rad]}

*angle slider* 

---

### `imguigml_slider_int( _label , _v , _v_min , _v_max , [_display_fmt="%.0f"] )`  
 | | | | 
| -- | -- | -- 
**_label:** | {String} |  
**_v:** | {Real} |  
**_v_min:** | {Real} |  
**_v_max:** | {Real} |  
**[_display_fmt="%.0f"]:** | {String} |  
**returns**: | {Array:[_changed, _v]}

*add an integer slider* 

---

### `imguigml_slider_int2( _label , _v , _v2 , _v_min , _v_max , [_display_fmt="%.0f"] )`  
 | | | | 
| -- | -- | -- 
**_label:** | {String} |  
**_v:** | {Real} |  
**_v2:** | {Real} |  
**_v_min:** | {Real} |  
**_v_max:** | {Real} |  
**[_display_fmt="%.0f"]:** | {String} |  
**returns**: | {Array:[_changed, _v]}

*add an integer slider* 

---

### `imguigml_slider_int3( _label , _v , _v2 , _v3 , _v_min , _v_max , [_display_fmt="%.0f"] )`  
 | | | | 
| -- | -- | -- 
**_label:** | {String} |  
**_v:** | {Real} |  
**_v2:** | {Real} |  
**_v3:** | {Real} |  
**_v_min:** | {Real} |  
**_v_max:** | {Real} |  
**[_display_fmt="%.0f"]:** | {String} |  
**returns**: | {Array:[_changed, _v]}

*add an integer slider* 

---

### `imguigml_slider_int4( _label , _v , _v2 , _v3 , _v4 , _v_min , _v_max , [_display_fmt="%.0f"] )`  
 | | | | 
| -- | -- | -- 
**_label:** | {String} |  
**_v:** | {Real} |  
**_v2:** | {Real} |  
**_v3:** | {Real} |  
**_v4:** | {Real} |  
**_v_min:** | {Real} |  
**_v_max:** | {Real} |  
**[_display_fmt="%.0f"]:** | {String} |  
**returns**: | {Array:[_changed, _v]}

*add an integer slider* 

---

### `imguigml_vslider_float( _label , _size_x , _size_y , _v , _v_min , _v_max , [_display_fmt="%.0f"] )`  
 | | | | 
| -- | -- | -- 
**_label:** | {String} |  
**_size_x:** | {Real} |  
**_size_y:** | {Real} |  
**_v:** | {Real} |  
**_v_min:** | {Real} |  
**_v_max:** | {Real} |  
**[_display_fmt="%.0f"]:** | {String} |  
**returns**: | {Array:[_changed, _v]}

*a vslider float?* 

---

### `imguigml_vslider_int( _label , _size_x , _size_y , _v , _v_min , _v_max , [_display_fmt="%.0f"] )`  
 | | | | 
| -- | -- | -- 
**_label:** | {String} |  
**_size_x:** | {Real} |  
**_size_y:** | {Real} |  
**_v:** | {Real} |  
**_v_min:** | {Real} |  
**_v_max:** | {Real} |  
**[_display_fmt="%.0f"]:** | {String} |  
**returns**: | {Array:[_changed, _v]}

*a vslider int?* 

---

### `imguigml_color_edit3( _label , _r , _g , _b , [_flags=0] )`  
 | | | | 
| -- | -- | -- 
**_label:** | {String} |  
**_r:** | {Real} |  
**_g:** | {Real} |  
**_b:** | {Real} |  
**[_flags=0]:** | {Real:EImGui_ColorEditFlags} |  
**returns**: | None

*show a color edit field* 

---

### `imguigml_color_edit4( _label , _r , _g , _b , _a , [_flags=0] )`  
 | | | | 
| -- | -- | -- 
**_label:** | {String} |  
**_r:** | {Real} |  
**_g:** | {Real} |  
**_b:** | {Real} |  
**_a:** | {Real} |  
**[_flags=0]:** | {Real:EImGui_ColorEditFlags} |  
**returns**: | None

*show a color edit field* 

---

### `imguigml_color_picker3( _label , _r , _g , _b , [_flags=0] )`  
 | | | | 
| -- | -- | -- 
**_label:** | {String} |  
**_r:** | {Real} |  
**_g:** | {Real} |  
**_b:** | {Real} |  
**[_flags=0]:** | {Real:EImGui_ColorEditFlags} |  
**returns**: | None

*show a color edit field* 

---

### `imguigml_color_picker4( _label , _r , _g , _b , _a , [_flags=0] )`  
 | | | | 
| -- | -- | -- 
**_label:** | {String} |  
**_r:** | {Real} |  
**_g:** | {Real} |  
**_b:** | {Real} |  
**_a:** | {Real} |  
**[_flags=0]:** | {Real:EImGui_ColorEditFlags} |  
**returns**: | None

*show a color edit field* 

---

### `imguigml_color_button( _desc_id , _r , _g , _b , _a , [_flags=0] , [_size_x=0] , [_size_y=0]) )`  
 | | | | 
| -- | -- | -- 
**_desc_id:** | {String} |  
**_r:** | {Real} |  
**_g:** | {Real} |  
**_b:** | {Real} |  
**_a:** | {Real} |  
**[_flags=0]:** | {Real:EImGui_ColorEditFlags} |  
**[_size_x=0]:** | {Real} |  
**[_size_y=0]):** | {Real} |  
**returns**: | None

*display a colored square/button, hover for details, return true when pressed.* 

---

### `imguigml_set_color_edit_options(  )`  
 | | | | 
| -- | -- | -- 
**returns**: | None

*initialize current options (generally on application startup) if you want to select a default format, picker type, etc. User will be able to change many settings, unless you pass the _NoOptions flag to your calls.* 

---

### `imguigml_drag_float( _label , _v , [_v_speed=1.0] , [_v_min=0.0] , [_v_max=0.0] , [_displayFmt="%.3f"] , [_power=1.0] )`  
 | | | | 
| -- | -- | -- 
**_label:** | {String} |  
**_v:** | {Real} |  
**[_v_speed=1.0]:** | {Real} |  
**[_v_min=0.0]:** | {Real} |  
**[_v_max=0.0]:** | {Real} |  
**[_displayFmt="%.3f"]:** | {String} |  
**[_power=1.0]:** | {Real} |  
**returns**: | {Array:[_changed, _v]}

*If v_min >= v_max we have no bound* 

---

### `imguigml_drag_float2( _label , _v , _v2 , [_v_speed=1.0] , [_v_min=0.0] , [_v_max=0.0] , [_displayFmt="%.3f"] , [_power=1.0] )`  
 | | | | 
| -- | -- | -- 
**_label:** | {String} |  
**_v:** | {Real} |  
**_v2:** | {Real} |  
**[_v_speed=1.0]:** | {Real} |  
**[_v_min=0.0]:** | {Real} |  
**[_v_max=0.0]:** | {Real} |  
**[_displayFmt="%.3f"]:** | {String} |  
**[_power=1.0]:** | {Real} |  
**returns**: | {Array:[_changed, _v, _v2]}

*If v_min >= v_max we have no bound* 

---

### `imguigml_drag_float3( _label , _v , _v2 , _v3 , [_v_speed=1.0] , [_v_min=0.0] , [_v_max=0.0] , [_displayFmt="%.3f"] , [_power=1.0] )`  
 | | | | 
| -- | -- | -- 
**_label:** | {String} |  
**_v:** | {Real} |  
**_v2:** | {Real} |  
**_v3:** | {Real} |  
**[_v_speed=1.0]:** | {Real} |  
**[_v_min=0.0]:** | {Real} |  
**[_v_max=0.0]:** | {Real} |  
**[_displayFmt="%.3f"]:** | {String} |  
**[_power=1.0]:** | {Real} |  
**returns**: | {Array:[_changed, _v, _v2, _v3]}

*If v_min >= v_max we have no bound* 

---

### `imguigml_drag_float4( _label , _v , _v2 , _v3 , _v4 , [_v_speed=1.0] , [_v_min=0.0] , [_v_max=0.0] , [_displayFmt="%.3f"] , [_power=1.0] )`  
 | | | | 
| -- | -- | -- 
**_label:** | {String} |  
**_v:** | {Real} |  
**_v2:** | {Real} |  
**_v3:** | {Real} |  
**_v4:** | {Real} |  
**[_v_speed=1.0]:** | {Real} |  
**[_v_min=0.0]:** | {Real} |  
**[_v_max=0.0]:** | {Real} |  
**[_displayFmt="%.3f"]:** | {String} |  
**[_power=1.0]:** | {Real} |  
**returns**: | {Array:[_changed, _v, _v2, _v3, _v4]}

*If v_min >= v_max we have no bound* 

---

### `imguigml_drag_float_range2( _label , _v_current_min , _v_current_max , [_v_speed=1.0] , [_v_min=0.0] , [_v_max=0.0] , [_displayFmt="%.0f"] , [_displayFmtMax=undefined] , [_power=1.0] )`  
 | | | | 
| -- | -- | -- 
**_label:** | {String} |  
**_v_current_min:** | {Real} |  
**_v_current_max:** | {Real} |  
**[_v_speed=1.0]:** | {Real} |  
**[_v_min=0.0]:** | {Real} |  
**[_v_max=0.0]:** | {Real} |  
**[_displayFmt="%.0f"]:** | {String} |  
**[_displayFmtMax=undefined]:** | {String} |  
**[_power=1.0]:** | {Real} |  
**returns**: | {Array:[_changed, _min, _max]}

*drag an integer range 2?* 

---

### `imguigml_drag_int( _label , _v , [_v_speed=1.0] , [_v_min=0.0] , [_v_max=0.0] , [_displayFmt="%.0f"] )`  
 | | | | 
| -- | -- | -- 
**_label:** | {String} |  
**_v:** | {Real} |  
**[_v_speed=1.0]:** | {Real} |  
**[_v_min=0.0]:** | {Real} |  
**[_v_max=0.0]:** | {Real} |  
**[_displayFmt="%.0f"]:** | {String} |  
**returns**: | {Array:[_changed, _v]}

*If v_min >= v_max we have no bound* 

---

### `imguigml_drag_int2( _label , _v , _v2 , [_v_speed=1.0] , [_v_min=0.0] , [_v_max=0.0] , [_displayFmt="%.0f"] )`  
 | | | | 
| -- | -- | -- 
**_label:** | {String} |  
**_v:** | {Real} |  
**_v2:** | {Real} |  
**[_v_speed=1.0]:** | {Real} |  
**[_v_min=0.0]:** | {Real} |  
**[_v_max=0.0]:** | {Real} |  
**[_displayFmt="%.0f"]:** | {String} |  
**returns**: | {Array:[_changed, _v, _v2]}

*If v_min >= v_max we have no bound* 

---

### `imguigml_drag_int3( _label , _v , _v2 , _v3 , [_v_speed=1.0] , [_v_min=0.0] , [_v_max=0.0] , [_displayFmt="%.0f"] )`  
 | | | | 
| -- | -- | -- 
**_label:** | {String} |  
**_v:** | {Real} |  
**_v2:** | {Real} |  
**_v3:** | {Real} |  
**[_v_speed=1.0]:** | {Real} |  
**[_v_min=0.0]:** | {Real} |  
**[_v_max=0.0]:** | {Real} |  
**[_displayFmt="%.0f"]:** | {String} |  
**returns**: | {Array:[_changed, _v, _v2, _v3]}

*If v_min >= v_max we have no bound* 

---

### `imguigml_drag_int4( _label , _v , _v2 , _v3 , _v4 , [_v_speed=1.0] , [_v_min=0.0] , [_v_max=0.0] , [_displayFmt="%.0f"] )`  
 | | | | 
| -- | -- | -- 
**_label:** | {String} |  
**_v:** | {Real} |  
**_v2:** | {Real} |  
**_v3:** | {Real} |  
**_v4:** | {Real} |  
**[_v_speed=1.0]:** | {Real} |  
**[_v_min=0.0]:** | {Real} |  
**[_v_max=0.0]:** | {Real} |  
**[_displayFmt="%.0f"]:** | {String} |  
**returns**: | {Array:[_changed, _v, _v2, _v3, _v4]}

*If v_min >= v_max we have no bound* 

---

### `imguigml_drag_int_range2( _label , _v_current_min , _v_current_max , [_v_speed=1.0] , [_v_min=0] , [_v_max=0] , [_displayFmt="%.0f"] , [_displayFmtMax=undefined] )`  
 | | | | 
| -- | -- | -- 
**_label:** | {String} |  
**_v_current_min:** | {Real} |  
**_v_current_max:** | {Real} |  
**[_v_speed=1.0]:** | {Real} |  
**[_v_min=0]:** | {Real} |  
**[_v_max=0]:** | {Real} |  
**[_displayFmt="%.0f"]:** | {String} |  
**[_displayFmtMax=undefined]:** | {String} |  
**returns**: | {Array:[_changed, _min, _max]}

*drag an integer range 2?* 

---

### `imguigml_input_text( _label , _text , _max_length , [_flags=0] , [_callback=noone] , [_userdata=undefined] )`  
 | | | | 
| -- | -- | -- 
**_label:** | {String} | label to show next to the input 
**_text:** | {String} | text to pre-fill field with 
**_max_length:** | {Real} | max length to allow text 
**[_flags=0]:** | {Real:EImGui_InputTextFlags} | input text flags (see enum) 
**[_callback=noone]:** | {Real} | a call back that takes ({Array:EImGui_TextCallbackData}, [_user_data]) and returns != 0 on char filter to remove character (otherwise return is ignored) 
**[_userdata=undefined]:** | {*} | data passed to the callback 
**returns**: | {Array:[_changed, _text]}

*add an input text field* 

---

### `imguigml_input_text_multiline( _label , _text , _max_len , _size_x , _size_y , [_flags=0] , [_callback=noone] , [_userdata=undefined] )`  
 | | | | 
| -- | -- | -- 
**_label:** | {String} |  
**_text:** | {String} |  
**_max_len:** | {Real} |  
**_size_x:** | {Real} |  
**_size_y:** | {Real} |  
**[_flags=0]:** | {Real:EImGui_InputTextFlags} |  
**[_callback=noone]:** | {Real} | a call back that takes ({Array:EImGui_TextCallbackData}, [_user_data]) and returns != 0 on char filter to remove character (otherwise return is ignored) 
**[_userdata=undefined]:** | {*} | data passed to the callback 
**returns**: | {Array:[_changed, _text]}

*add an input text field* 

---

### `imguigml_input_float( _label , _val , [_step=0.0f] , [_step_fast=0.0f] , [_decimal_precision=-1] , [_extra_flags=0]) )`  
 | | | | 
| -- | -- | -- 
**_label:** | {String} |  
**_val:** | {Real} |  
**[_step=0.0f]:** | {Real} |  
**[_step_fast=0.0f]:** | {Real} |  
**[_decimal_precision=-1]:** | {Real} |  
**[_extra_flags=0]):** | {Real:EImGui_WindowFlags} |  
**returns**: | {Array:[_changed, _val]}

*keyboard input field float* 

---

### `imguigml_input_float2( _label , _val , _val2 , [_decimal_precision=-1] , [_extra_flags=0]) )`  
 | | | | 
| -- | -- | -- 
**_label:** | {String} |  
**_val:** | {Real} |  
**_val2:** | {Real} |  
**[_decimal_precision=-1]:** | {Real} |  
**[_extra_flags=0]):** | {Real:EImGui_InputTextFlags} |  
**returns**: | {Array:[_changed, _val, _val2]}

*keyboard input field float* 

---

### `imguigml_input_float3( _label , _val , _val2 , _val3 , [_decimal_precision=-1] , [_extra_flags=0]) )`  
 | | | | 
| -- | -- | -- 
**_label:** | {String} |  
**_val:** | {Real} |  
**_val2:** | {Real} |  
**_val3:** | {Real} |  
**[_decimal_precision=-1]:** | {Real} |  
**[_extra_flags=0]):** | {Real:EImGui_InputTextFlags} |  
**returns**: | {Array:[_changed, _val, _val2, _val3]}

*keyboard input field float* 

---

### `imguigml_input_float4( _label , _val , _val2 , _val3 , _val4 , [_decimal_precision=-1] , [_extra_flags=0]) )`  
 | | | | 
| -- | -- | -- 
**_label:** | {String} |  
**_val:** | {Real} |  
**_val2:** | {Real} |  
**_val3:** | {Real} |  
**_val4:** | {Real} |  
**[_decimal_precision=-1]:** | {Real} |  
**[_extra_flags=0]):** | {Real:EImGui_InputTextFlags} |  
**returns**: | {Array:[_changed, _val, _val2, _val3, _val4]}

*keyboard input field float* 

---

### `imguigml_input_int( _label , _val , [_step=1] , [_step_fast=100] , [_extra_flags=0]) )`  
 | | | | 
| -- | -- | -- 
**_label:** | {String} |  
**_val:** | {Real} |  
**[_step=1]:** | {Real} |  
**[_step_fast=100]:** | {Real} |  
**[_extra_flags=0]):** | {Real:EImGui_InputTextFlags} |  
**returns**: | {Array:[_changed, _val]}

*keyboard input field float* 

---

### `imguigml_input_int2( _label , _val , _val2 , [_extra_flags=0]) )`  
 | | | | 
| -- | -- | -- 
**_label:** | {String} |  
**_val:** | {Real} |  
**_val2:** | {Real} |  
**[_extra_flags=0]):** | {Real:EImGui_InputTextFlags} |  
**returns**: | {Array:[_changed, _val, _val2]}

*keyboard input field float* 

---

### `imguigml_input_int3( _label , _val , _val2 , _val3 , [_extra_flags=0]) )`  
 | | | | 
| -- | -- | -- 
**_label:** | {String} |  
**_val:** | {Real} |  
**_val2:** | {Real} |  
**_val3:** | {Real} |  
**[_extra_flags=0]):** | {Real:EImGui_InputTextFlags} |  
**returns**: | {Array:[_changed, _val, _val2, _val3]}

*keyboard input field float* 

---

### `imguigml_input_int4( _label , _val , _val2 , _val3 , _val4 , [_extra_flags=0]) )`  
 | | | | 
| -- | -- | -- 
**_label:** | {String} |  
**_val:** | {Real} |  
**_val2:** | {Real} |  
**_val3:** | {Real} |  
**_val4:** | {Real} |  
**[_extra_flags=0]):** | {Real:EImGui_InputTextFlags} |  
**returns**: | {Array:[_changed, _val, _val2, _val3, _val4]}

*keyboard input field float* 

---

### `imguigml_button( _label , [_size_x=0.0] , [_size_y=0.0] )`  
 | | | | 
| -- | -- | -- 
**_label:** | {String} | button label 
**[_size_x=0.0]:** | {Real} | width 
**[_size_y=0.0]:** | {Real} | height 
**returns**: | {Boolean} pressed

*ImGui::Button()* 

---

### `imguigml_small_button( _label )`  
 | | | | 
| -- | -- | -- 
**_label:** | {String} | button label 
**returns**: | {Boolean}

*button with FramePadding=(0,0) to easily embed within text* 

---

### `imguigml_invisible_button( _str_id , [_size_x=0.0] , [_size_y=0.0] )`  
 | | | | 
| -- | -- | -- 
**_str_id:** | {String} | string id 
**[_size_x=0.0]:** | {Real} | width 
**[_size_y=0.0]:** | {Real} | height 
**returns**: | {Boolean}

*ImGui::InvisibleButton()* 

---

### `imguigml_image( _texture_id , _size_x , _size_y , [_u0=0.0] , [_v0=0.0] , [_u1=1.0] , [_v1=1.0] , [_tint_r=1.0] , [_tint_g=1.0] , [_tint_b=1.0] , [_tint_a=1.0] , [_border_r=0.0] , [_border_g=0.0] , [_border_b=0.0] , [_border_a=0.0] )`  
 | | | | 
| -- | -- | -- 
**_texture_id:** | {Real} | texture id 
**_size_x:** | {Real} | width 
**_size_y:** | {Real} | height 
**[_u0=0.0]:** | {Real} | texture u0 
**[_v0=0.0]:** | {Real} | texture v0 
**[_u1=1.0]:** | {Real} | texture u1 
**[_v1=1.0]:** | {Real} | texture v1 
**[_tint_r=1.0]:** | {Real} | tint color r 
**[_tint_g=1.0]:** | {Real} | tint color g 
**[_tint_b=1.0]:** | {Real} | tint color b 
**[_tint_a=1.0]:** | {Real} | tint color a 
**[_border_r=0.0]:** | {Real} | border color r 
**[_border_g=0.0]:** | {Real} | border color g 
**[_border_b=0.0]:** | {Real} | border color b 
**[_border_a=0.0]:** | {Real} | border color a 
**returns**: | None

*ImGui::Image()* 

---

### `imguigml_image_button( _texture_id , _size_x , _size_y , [_u0=0.0] , [_v0=0.0] , [_u1=1.0] , [_v1=1.0] , [_frame_padding=-1] , [_bg_r=0.0] , [_bg_g=0.0] , [_bg_b=0.0] , [_bg_a=0.0] , [_tint_r=1.0] , [_tint_g=1.0] , [_tint_b=1.0] , [_tint_a=1.0] )`  
 | | | | 
| -- | -- | -- 
**_texture_id:** | {Real} | texture id 
**_size_x:** | {Real} | width 
**_size_y:** | {Real} | height 
**[_u0=0.0]:** | {Real} | texture u0 
**[_v0=0.0]:** | {Real} | texture v0 
**[_u1=1.0]:** | {Real} | texture u1 
**[_v1=1.0]:** | {Real} | texture v1 
**[_frame_padding=-1]:** | {Real} | <0 frame_padding uses default frame padding settings. 0 for no padding 
**[_bg_r=0.0]:** | {Real} | border color r 
**[_bg_g=0.0]:** | {Real} | border color g 
**[_bg_b=0.0]:** | {Real} | border color b 
**[_bg_a=0.0]:** | {Real} | border color a 
**[_tint_r=1.0]:** | {Real} | tint color r 
**[_tint_g=1.0]:** | {Real} | tint color g 
**[_tint_b=1.0]:** | {Real} | tint color b 
**[_tint_a=1.0]:** | {Real} | tint color a 
**returns**: | {Boolean} _pressed

*ImGui::ImageButton()* 

---

### `imguigml_checkbox( _label , _val )`  
 | | | | 
| -- | -- | -- 
**_label:** | {String} | button label 
**_val:** | {Boolean} | checked 
**returns**: | {Boolean} checked

*ImGui::Checkbox()* 

---

### `imguigml_checkbox_flags( _label , _flags , _flag_val )`  
 | | | | 
| -- | -- | -- 
**_label:** | {String} | button label 
**_flags:** | {Real} | check flags 
**_flag_val:** | {Real} | current value of flags 
**returns**: | {Real} _flags result

*ImGui::CheckboxFlags()* 

---

### `imguigml_radio_button( _label , _activeOrVal , _current_val )`  
 | | | | 
| -- | -- | -- 
**_label:** | {String} | button label 
**_activeOrVal:** | {Real} | radio button value, or if this is checked 
**_current_val:** | {Real} | current value of radio buttons 
**returns**: | {Real} val result if _current_val passed

*ImGui::RadioButton()* 

---

### `imguigml_combo( _label , _current_item , _items )`  
 | | | | 
| -- | -- | -- 
**_label:** | {String} |  
**_current_item:** | {Real} |  
**_items:** | {Array:String} | [string unsupported] if a string, separate each item with a 0 
**returns**: | {Array:[_changed, current_item]

** 

---

### `imguigml_plot_lines( _label , _values , [_values_offset=0] , [_overlay=undefined] , [_scale_min=undefined] , [_scale_max=undefined] , [_graph_size_x=0] , [_graph_size_y=0] , [_stride=sizeof(float)] )`  
 | | | | 
| -- | -- | -- 
**_label:** | {String} |  
**_values:** | {Array} |  
**[_values_offset=0]:** | {Real} |  
**[_overlay=undefined]:** | {String} |  
**[_scale_min=undefined]:** | {Real} |  
**[_scale_max=undefined]:** | {Real} |  
**[_graph_size_x=0]:** | {Real} |  
**[_graph_size_y=0]:** | {Real} |  
**[_stride=sizeof(float)]:** | {Real} |  
**returns**: | None

*plot a line graph i guess* 

---

### `imguigml_plot_histogram( _label , _values , [_values_offset=0] , [_overlay=undefined] , [_scale_min=undefined] , [_scale_max=undefined] , [_graph_size_x=0] , [_graph_size_y=0] , [_stride=sizeof(float)] )`  
 | | | | 
| -- | -- | -- 
**_label:** | {String} |  
**_values:** | {Array} |  
**[_values_offset=0]:** | {Real} |  
**[_overlay=undefined]:** | {String} |  
**[_scale_min=undefined]:** | {Real} |  
**[_scale_max=undefined]:** | {Real} |  
**[_graph_size_x=0]:** | {Real} |  
**[_graph_size_y=0]:** | {Real} |  
**[_stride=sizeof(float)]:** | {Real} |  
**returns**: | None

*plot a histogram graph i guess* 

---

### `imguigml_progress_bar( _fraction , [_size_x=-1.0] , [_size_y=0.0] , [_overlay=undefined] )`  
 | | | | 
| -- | -- | -- 
**_fraction:** | {String} |  
**[_size_x=-1.0]:** | {Real} | < 0.0f: align to end, 0.0f: auto, > 0.0f: specified size 
**[_size_y=0.0]:** | {Real} | < 0.0f: align to end, 0.0f: auto, > 0.0f: specified size 
**[_overlay=undefined]:** | {String} |  
**returns**: | None

** 

---

### `imguigml_sprite( _sprite_index , _sub_img , _size_x , _size_y , [_tint_r=1.0] , [_tint_g=1.0] , [_tint_b=1.0] , [_tint_a=1.0] , [_border_r=0.0] , [_border_g=0.0] , [_border_b=0.0] , [_border_a=0.0] )`  
 | | | | 
| -- | -- | -- 
**_sprite_index:** | {Real} | sprite 
**_sub_img:** | {Real} |  
**_size_x:** | {Real} | width 
**_size_y:** | {Real} | height 
**[_tint_r=1.0]:** | {Real} | tint color r 
**[_tint_g=1.0]:** | {Real} | tint color g 
**[_tint_b=1.0]:** | {Real} | tint color b 
**[_tint_a=1.0]:** | {Real} | tint color a 
**[_border_r=0.0]:** | {Real} | border color r 
**[_border_g=0.0]:** | {Real} | border color g 
**[_border_b=0.0]:** | {Real} | border color b 
**[_border_a=0.0]:** | {Real} | border color a 
**returns**: | None

*ImGui::Image()* 

---

### `imguigml_sprite_button( _sprite_index , _sub_img , _size_x , _size_y , [_frame_padding=-1] , [_bg_r=0.0] , [_bg_g=0.0] , [_bg_b=0.0] , [_bg_a=0.0] , [_tint_r=1.0] , [_tint_g=1.0] , [_tint_b=1.0] , [_tint_a=1.0] )`  
 | | | | 
| -- | -- | -- 
**_sprite_index:** | {Real} | sprite 
**_sub_img:** | {Real} |  
**_size_x:** | {Real} | width 
**_size_y:** | {Real} | height 
**[_frame_padding=-1]:** | {Real} | <0 frame_padding uses default frame padding settings. 0 for no padding 
**[_bg_r=0.0]:** | {Real} | border color r 
**[_bg_g=0.0]:** | {Real} | border color g 
**[_bg_b=0.0]:** | {Real} | border color b 
**[_bg_a=0.0]:** | {Real} | border color a 
**[_tint_r=1.0]:** | {Real} | tint color r 
**[_tint_g=1.0]:** | {Real} | tint color g 
**[_tint_b=1.0]:** | {Real} | tint color b 
**[_tint_a=1.0]:** | {Real} | tint color a 
**returns**: | {Boolean} _pressed

*ImGui::ImageButton()* 

---

### `imguigml_text( _text )`  
 | | | | 
| -- | -- | -- 
**_text:** | {String} |  
**returns**: | None

*simple formatted text* 

---

### `imguigml_text_colored( _r , _g , _b , _a , _text )`  
 | | | | 
| -- | -- | -- 
**_r:** | {Real} |  
**_g:** | {Real} |  
**_b:** | {Real} |  
**_a:** | {Real} |  
**_text:** | {String} |  
**returns**: | None

*shortcut for PushStyleColor(ImGuiCol_Text, style.Colors[ImGuiCol_TextDisabled]); Text(fmt, ...); PopStyleColor();* 

---

### `imguigml_text_disabled( _text )`  
 | | | | 
| -- | -- | -- 
**_text:** | {String} |  
**returns**: | None

*shortcut for PushStyleColor(ImGuiCol_Text, style.Colors[ImGuiCol_TextDisabled]); Text(fmt, ...); PopStyleColor();* 

---

### `imguigml_text_wrapped( _text )`  
 | | | | 
| -- | -- | -- 
**_text:** | {String} |  
**returns**: | None

*shortcut for `imguigml_push_text_wrap_pos(0.0f); imguigml_text(_text); imguigml_pop_text_wrap_pos();`.* 

---

### `imguigml_label_text( _label , _text )`  
 | | | | 
| -- | -- | -- 
**_label:** | {String} |  
**_text:** | {String} |  
**returns**: | None

*display text+label aligned the same way as value+label widgets* 

---

### `imguigml_bullet_text( _text )`  
 | | | | 
| -- | -- | -- 
**_text:** | {String} |  
**returns**: | None

*shortcut for Bullet()+Text()* 

---

### `imguigml_bullet(  )`  
 | | | | 
| -- | -- | -- 
**returns**: | None

*draw a small circle and keep the cursor on the same line.       advance cursor x position by GetTreeNodeToLabelSpacing(), same distance that TreeNode() uses* 

---

### `imguigml_tree_node(  )`  
 | | | | 
| -- | -- | -- 
**returns**: | None

** 

---

### `imguigml_tree_node_ex(  )`  
 | | | | 
| -- | -- | -- 
**returns**: | None

** 

---

### `imguigml_tree_push(  )`  
 | | | | 
| -- | -- | -- 
**returns**: | None

** 

---

### `imguigml_tree_pop(  )`  
 | | | | 
| -- | -- | -- 
**returns**: | None

*~ Unindent()+PopId()* 

---

### `imguigml_tree_advance_to_label_pos(  )`  
 | | | | 
| -- | -- | -- 
**returns**: | None

*advance cursor x position by GetTreeNodeToLabelSpacing()* 

---

### `imguigml_get_tree_node_to_label_spacing(  )`  
 | | | | 
| -- | -- | -- 
**returns**: | {Real}

** 

---

### `imguigml_set_next_tree_node_open( _is_open , [_cond=0] )`  
 | | | | 
| -- | -- | -- 
**_is_open:** | {Boolean} |  
**[_cond=0]:** | {Real:EImGui_Cond} |  
**returns**: | None

*set next TreeNode/CollapsingHeader open state.* 

---

### `imguigml_collapsing_header( _label , [_open=undefined] , [_flags=0] )`  
 | | | | 
| -- | -- | -- 
**_label:** | {String} |  
**[_open=undefined]:** | {Boolean} | when `open` isn't `undefined`, display an additional small close button on upper right of the header 
**[_flags=0]:** | {Real:EImGui_TreeNodeFlags] |  
**returns**: | {Array:[_collapsed, [_open]} if returning 'true' the header is open. doesn't indent nor push on ID stack. user doesn't have to call TreePop().

*add a collapsing header* 

---

### `imguigml_begin( _name , [_open=undefined] , [_flags=0] )`  
 | | | | 
| -- | -- | -- 
**_name:** | {String} | title for window 
**[_open=undefined]:** | {Real} | pass true/false for if this window is open w/close button, undefined for no button 
**[_flags=0]:** | {Real:EImGui_WindowFlags} | window flags 
**returns**: | {Array:[_collapsed, [_open]]}

*Push a new ImGui window to add widgets to.* 

---

### `imguigml_end(  )`  
 | | | | 
| -- | -- | -- 
**returns**: | None

*ImGui::End()* 

---

### `imguigml_begin_child( _id , [_size_x=0] , [_size_y=0] , [_border=false] , [_extra_flags=0] )`  
 | | | | 
| -- | -- | -- 
**_id:** | {Real|String} |  
**[_size_x=0]:** | {Real} | size==0.0f: use remaining window size, size<0.0f: use remaining window size minus abs(size). size>0.0f: fixed size. 
**[_size_y=0]:** | {Real} | size==0.0f: use remaining window size, size<0.0f: use remaining window size minus abs(size). size>0.0f: fixed size. 
**[_border=false]:** | {Boolean} |  
**[_extra_flags=0]:** | {Real:EImGui_WindowFlags} |  
**returns**: | {Boolean} false when collapsed

*begin a scrolling region. each axis can use a different mode, e.g. ImVec2(0,400).* 

---

### `imguigml_end_child(  )`  
 | | | | 
| -- | -- | -- 
**returns**: | None

*end a scrolling region* 

---

### `imguigml_get_content_region_max(  )`  
 | | | | 
| -- | -- | -- 
**returns**: | {Array:EPos2D} boundaries

*current content boundaries (typically window boundaries including scrolling, or current column boundaries), in windows coordinates* 

---

### `imguigml_get_content_region_avail(  )`  
 | | | | 
| -- | -- | -- 
**returns**: | {Array:EPos2D} region

*== GetContentRegionMax() - GetCursorPos()* 

---

### `imguigml_get_content_region_avail_width(  )`  
 | | | | 
| -- | -- | -- 
**returns**: | {Real} width

*get available width* 

---

### `imguigml_get_window_content_region_min(  )`  
 | | | | 
| -- | -- | -- 
**returns**: | {Array:EPos2D} region

*content boundaries min (roughly (0,0)-Scroll), in window coordinates* 

---

### `imguigml_get_window_content_region_max(  )`  
 | | | | 
| -- | -- | -- 
**returns**: | {Array:EPos2D}

*content boundaries max (roughly (0,0)+Size-Scroll) where Size can be override with SetNextWindowContentSize(), in window coordinates* 

---

### `imguigml_get_window_content_region_width(  )`  
 | | | | 
| -- | -- | -- 
**returns**: | {Real} content width

*content width in windows coordinates* 

---

### `imguigml_get_window_pos(  )`  
 | | | | 
| -- | -- | -- 
**returns**: | {Array:EPos2D} window pos

*get current window position in screen space (useful if you want to do your own drawing via the DrawList api)* 

---

### `imguigml_get_window_size(  )`  
 | | | | 
| -- | -- | -- 
**returns**: | {Array:E2D} size

*get current window size* 

---

### `imguigml_get_window_width(  )`  
 | | | | 
| -- | -- | -- 
**returns**: | {Real} width

*get current window width* 

---

### `imguigml_get_window_height(  )`  
 | | | | 
| -- | -- | -- 
**returns**: | {Real} height

*get current window height* 

---

### `imguigml_is_window_collapsed(  )`  
 | | | | 
| -- | -- | -- 
**returns**: | {Boolean} is current window collapsed

*is current window collapsed* 

---

### `imguigml_is_window_appearing(  )`  
 | | | | 
| -- | -- | -- 
**returns**: | {Boolean} is current window appearing

*is current window appearing* 

---

### `imguigml_set_window_font_scale( _scale )`  
 | | | | 
| -- | -- | -- 
**_scale:** | {Real} | font scale for this window 
**returns**: | None

*per-window font scale. Adjust IO.FontGlobalScale if you want to scale all windows* 

---

### `imguigml_set_next_window_pos( _x , _y , [_cond=0] , [_pivot_x , [_pivot_y )`  
 | | | | 
| -- | -- | -- 
**_x:** | {Real} | pos x 
**_y:** | {Real} | pos y 
**[_cond=0]:** | {Real:EImGui_Cond} | condition for setting (not a bit flag) 
**[_pivot_x:** | {Real} | = 0] used to center on a point 
**[_pivot_y:** | {Real} | = 0] used to center on a point 
**returns**: | None

*set next window position. call before Begin(). use pivot=(0.5f,0.5f) to center on given point, etc.* 

---

### `imguigml_set_next_window_size( _x , _y , [_cond=0] )`  
 | | | | 
| -- | -- | -- 
**_x:** | {Real} | size x 
**_y:** | {Real} | size y 
**[_cond=0]:** | {Real:EImGui_Cond} | condition for setting (not a bit flag) 
**returns**: | None

*set next window size. set axis to 0.0f to force an auto-fit on this axis. call before Begin()* 

---

### `imguigml_set_next_window_size_constraints( _min_x , _min_y , _max_x , _max_y , [_cond=0] )`  
 | | | | 
| -- | -- | -- 
**_min_x:** | {Real} | min size x 
**_min_y:** | {Real} | min size y 
**_max_x:** | {Real} | max size x 
**_max_y:** | {Real} | max size y 
**[_cond=0]:** | {Real:EImGui_Cond} | condition for setting (not a bit flag) 
**returns**: | None

*set next window size limits. use -1,-1 on either X/Y axis to preserve the current size.* 

---

### `imguigml_set_next_window_content_size( _size_x , _size_y )`  
 | | | | 
| -- | -- | -- 
**_size_x:** | {Real} | width 
**_size_y:** | {Real} | height 
**returns**: | None

*set next window content size (enforce the range of scrollbars). set axis to 0.0f to leave it automatic. call before Begin()* 

---

### `imguigml_set_next_window_content_width( _width )`  
 | | | | 
| -- | -- | -- 
**_width:** | {Real} | width 
**returns**: | None

*set next window content width (enforce the range of horizontal scrollbar). call before Begin()* 

---

### `imguigml_set_next_window_collapsed( _collapsed , [_cond=0] )`  
 | | | | 
| -- | -- | -- 
**_collapsed:** | {Boolean} | true if collapsed 
**[_cond=0]:** | {Real:EImGui_Cond} | condition for setting (not a bit flag) 
**returns**: | None

*set next window collapsed state. call before Begin()* 

---

### `imguigml_set_next_window_focus(  )`  
 | | | | 
| -- | -- | -- 
**returns**: | None

*set next window to be focused / front-most. call before Begin()* 

---

### `imguigml_set_window_pos( _name , _pos_x , _pos_y , [_cond=0] )`  
 | | | | 
| -- | -- | -- 
**_name:** | {String} | name 
**_pos_x:** | {Real} | pos x 
**_pos_y:** | {Real} | pos y 
**[_cond=0]:** | {Real:EImGui_Cond} | condition for setting (not a bit flag) 
**returns**: | None

*set named window position.* 

---

### `imguigml_set_window_size( _name , _size_x , _size_y , [_cond=0] )`  
 | | | | 
| -- | -- | -- 
**_name:** | {String} | name 
**_size_x:** | {Real} | size x 
**_size_y:** | {Real} | size y 
**[_cond=0]:** | {Real:EImGui_Cond} | condition for setting (not a bit flag) 
**returns**: | None

*set named window size. set axis to 0.0f to force an auto-fit on this axis.* 

---

### `imguigml_set_window_collapsed( _name , _collapsed , [_cond=0] )`  
 | | | | 
| -- | -- | -- 
**_name:** | {String} | name 
**_collapsed:** | {Boolean} | true if collapsed 
**[_cond=0]:** | {Real:EImGui_Cond} | condition for setting (not a bit flag) 
**returns**: | None

*set named window collapsed state* 

---

### `imguigml_set_window_focus( _name )`  
 | | | | 
| -- | -- | -- 
**_name:** | {String} | named window 
**returns**: | None

*set named window to be focused / front-most. use NULL to remove focus.* 

---

### `imguigml_get_scroll_x(  )`  
 | | | | 
| -- | -- | -- 
**returns**: | {Real} [0..GetScrollMaxX()]

*get scrolling amount [0..GetScrollMaxX()]* 

---

### `imguigml_get_scroll_y(  )`  
 | | | | 
| -- | -- | -- 
**returns**: | {Real} [0..GetScrollMaxY()]

*get scrolling amount [0..GetScrollMaxY()]* 

---

### `imguigml_get_scroll_max_x(  )`  
 | | | | 
| -- | -- | -- 
**returns**: | {Real} scrolling amount ~~ ContentSize.X - WindowSize.X

*get maximum scrolling amount ~~ ContentSize.X - WindowSize.X* 

---

### `imguigml_get_scroll_max_y(  )`  
 | | | | 
| -- | -- | -- 
**returns**: | {Real} scrolling amount ~~ ContentSize.Y - WindowSize.Y

*get maximum scrolling amount ~~ ContentSize.Y - WindowSize.Y* 

---

### `imguigml_set_scroll_x( _scroll_x )`  
 | | | | 
| -- | -- | -- 
**_scroll_x:** | {Real} | 0..GetScrollMaxX() 
**returns**: | None

*set scrolling amount [0..GetScrollMaxX()]* 

---

### `imguigml_set_scroll_y( _scroll_y )`  
 | | | | 
| -- | -- | -- 
**_scroll_y:** | {Real} | 0..GetScrollMaxY() 
**returns**: | None

*set scrolling amount [0..GetScrollMaxY()]* 

---

### `imguigml_set_scroll_here( [_center_y_ratio=0.0] )`  
 | | | | 
| -- | -- | -- 
**[_center_y_ratio=0.0]:** | {Real} | top, 0.5: center, 1.0: bottom. 
**returns**: | None

*adjust scrolling amount to make current cursor position visible.* 

---

### `imguigml_set_scroll_from_pos_y( [_center_y_ratio=0.0] )`  
 | | | | 
| -- | -- | -- 
**[_center_y_ratio=0.0]:** | {Real} | top, 0.5: center, 1.0: bottom. 
**returns**: | None

*adjust scrolling amount to make given position valid. use GetCursorPos() or GetCursorStartPos()+offset to get valid positions.* 

---

### `imguigml_set_keyboard_focus_here( [_offset] )`  
 | | | | 
| -- | -- | -- 
**[_offset]:** | {Real} | Use positive 'offset' to access sub components of a multiple component widget. Use -1 to access previous widget. 
**returns**: | None

*focus keyboard on the next widget.* 

---

### `imguigml_set_state_storage( _tree )`  
 | | | | 
| -- | -- | -- 
**_tree:** | {*} | todo: implement 
**returns**: | None

*replace tree state storage with our own (if you want to manipulate it yourself, typically clear subsection of it)* 

---

### `imguigml_get_state_storage( _tree )`  
 | | | | 
| -- | -- | -- 
**_tree:** | {*} | todo: implement 
**returns**: | None

*replace tree state storage with our own (if you want to manipulate it yourself, typically clear subsection of it)* 

---

### `imguigml_begin_child_frame( _guiID , _size_x , _size_y , [_extra_flags=0] )`  
 | | | | 
| -- | -- | -- 
**_guiID:** | {Real} | ImGui ID 
**_size_x:** | {Real} | width 
**_size_y:** | {Real} | height 
**[_extra_flags=0]:** | {Real:EImGui_WindowFlags} |  
**returns**: | None

*helper to create a child window / scrolling region that looks like a normal widget frame* 

---

### `imguigml_end_child_frame( [_offset] )`  
 | | | | 
| -- | -- | -- 
**[_offset]:** | {Real} | Use positive 'offset' to access sub components of a multiple component widget. Use -1 to access previous widget. 
**returns**: | None

*helper to create a child window / scrolling region that looks like a normal widget frame* 

---

### `imguigml_io_ini_saving_rate( [_time] , { )`  
 | | | | 
| -- | -- | -- 
**[_time]:** | {Real} | sets time to use if passed (= 5.0) 
**{:** | returns | Real } current time to use 
**returns**: | None

*Maximum time between saving positions/sizes to .ini file, in seconds.* 

---

### `imguigml_io_mouse_double_click_time( [_time] , { )`  
 | | | | 
| -- | -- | -- 
**[_time]:** | {Real} | sets time to use if passed (= 0.30) 
**{:** | returns | Real } current time to use 
**returns**: | None

*Time for a double-click, in seconds.* 

---

### `imguigml_io_mouse_double_click_max_dist( [_distance] , { )`  
 | | | | 
| -- | -- | -- 
**[_distance]:** | {Real} | sets max distance if passed (= 6.0) 
**{:** | returns | Real } current max distance 
**returns**: | None

*Distance threshold to stay in to validate a double-click, in pixels.* 

---

### `imguigml_io_mouse_drag_threshold( [_distance] , { )`  
 | | | | 
| -- | -- | -- 
**[_distance]:** | {Real} | sets distance threshold if passed (= 6.0) 
**{:** | returns | Real } current distance threshold 
**returns**: | None

*Distance threshold before considering we are dragging* 

---

### `imguigml_io_key_repeat_delay( [_time] , { )`  
 | | | | 
| -- | -- | -- 
**[_time]:** | {Real} | sets time before repeating if passed (= 0.250) 
**{:** | returns | Real } current time 
**returns**: | None

*When holding a key/button, time before it starts repeating, in seconds (for buttons in Repeat mode, etc.).* 

---

### `imguigml_io_key_repeat_rate( [_time] , { )`  
 | | | | 
| -- | -- | -- 
**[_time]:** | {Real} | sets repeat rate if passed (0.050) 
**{:** | returns | Real } current repeat rate 
**returns**: | None

*When holding a key/button, rate at which it repeats, in seconds.* 

---

### `imguigml_io_font_global_scale( [_scale] , { )`  
 | | | | 
| -- | -- | -- 
**[_scale]:** | {Real} | sets scale for all fonts if passed (= 1.0) 
**{:** | returns | Real } current font scale 
**returns**: | None

*Global scale all fonts* 

---

### `imguigml_io_font_allow_user_scaling( [_boolean] , { )`  
 | | | | 
| -- | -- | -- 
**[_boolean]:** | {Boolean} | sets allow user scaling if passed (=false) 
**{:** | returns | Boolean } current value 
**returns**: | None

*Allow user scaling text of individual window with CTRL+Wheel.* 

---

### `imguigml_io_display_framebuffer_scaling( [_x=1.0] , [_y=1.0] , { )`  
 | | | | 
| -- | -- | -- 
**[_x=1.0]:** | {Float} | sets x value if passed 
**[_y=1.0]:** | {Float} | sets y value if passed 
**{:** | returns | Array } [x value, y value] 
**returns**: | None

*For retina display or other situations where window coordinates are different from framebuffer coordinates. User storage only, presently not used by ImGui.* 

---

### `imguigml_io_display_visible_min( [_x] , [_y] , { )`  
 | | | | 
| -- | -- | -- 
**[_x]:** | {Float} | sets min size on x axis if passed 
**[_y]:** | {Float} | sets min size on y axis if passed 
**{:** | returns | Array } [x min, y min] 
**returns**: | None

*If you use DisplaySize as a virtual space larger than your screen, set DisplayVisibleMin/Max to the visible area.* 

---

### `imguigml_io_display_visible_max( [_x] , [_y] , { )`  
 | | | | 
| -- | -- | -- 
**[_x]:** | {Float} | sets max size on x axis if passed 
**[_y]:** | {Float} | sets max size on y axis if passed 
**{:** | returns | Array } [x max, y max] 
**returns**: | None

*If the values are the same, we defaults to Min=(0.0f) and Max=DisplaySize* 

---

### `imguigml_io_osx_behaviors( [_boolean] , { )`  
 | | | | 
| -- | -- | -- 
**[_boolean]:** | {Boolean} | boolean (=IsApple) 
**{:** | returns | Boolean } current value 
**returns**: | None

*OS X style: Text editing cursor movement using Alt instead of Ctrl, Shortcuts using Cmd/Super instead of Ctrl, Line/Text Start and End using Cmd+Arrows instead of Home/End, ouble click selects by word instead of selecting whole text, Multi-selection in lists uses Cmd/Super instead of Ctrl* 

---

### `imguigml_io_ini_filename( [_filename] )`  
 | | | | 
| -- | -- | -- 
**[_filename]:** | {String} | sets ini filename if passed 
**returns**: | {String} current ini filename

*Path to .ini file. NULL to disable .ini saving.* 

---

### `imguigml_io_log_filename( [_path] )`  
 | | | | 
| -- | -- | -- 
**[_path]:** | {String} | sets path if passed 
**returns**: | {String} current log filename path

*Path to .log file - default parameter to ImGui::LogToFile when no file is specified. defaults to "imgui_log.txt* 

---

### `__imguigml_draw(  )`  
 | | | | 
| -- | -- | -- 
**returns**: | None

*draw the imgui* 

---

### `__imguigml_texture_id( _texture_ptr )`  
 | | | | 
| -- | -- | -- 
**_texture_ptr:** | {Ptr} |  
**returns**: | {Real} _id for texture

*return an index for a texture id so we can render this properly* 

---

### `__imguigml_wrapper_buffer(  )`  
 | | | | 
| -- | -- | -- 
**returns**: | {Real} buffer_index

*prepare the wrapper buffer for next use* 

---

### `__imguigml_handle_text_callback( _call_id , _callback )`  
 | | | | 
| -- | -- | -- 
**_call_id:** | {Real} | id returned from a text input callback function 
**_callback:** | {Real} | script_index of callback script to execute 
**returns**: | None

*handle text input callback functions, the script it supports is:      `real _text_input_callback({Array:EImguiGML_TextCallback}_data, [_user_data=_undefined])` - on CallbackCharFilter return 1 to discard. ignored elsewise.* 

---

### `__imguigml_event_create(  )`  
 | | | | 
| -- | -- | -- 
**returns**: | None

*imguigml create event* 

---

### `__imguigml_event_begin_step(  )`  
 | | | | 
| -- | -- | -- 
**returns**: | None

*imguigml begin step event* 

---

### `__imguigml_event_end_step(  )`  
 | | | | 
| -- | -- | -- 
**returns**: | None

*imguigml end step event* 

---

### `__imguigml_event_clean_up(  )`  
 | | | | 
| -- | -- | -- 
**returns**: | None

*imguigml clean up event* 

---

### `__imguigml_event_draw(  )`  
 | | | | 
| -- | -- | -- 
**returns**: | None

*imguigml draw event* 

---

### `__imguigml_event_draw_gui(  )`  
 | | | | 
| -- | -- | -- 
**returns**: | None

*imguigml draw gui event* 

---

### `__imguigml_init_rendering(  )`  
 | | | | 
| -- | -- | -- 
**returns**: | None

*called `with` imguigml - initialize the rendering* 

---

### `__imguigml_init_font(  )`  
 | | | | 
| -- | -- | -- 
**returns**: | None

*called `with` imguigml - load the font texture* 

---

### `__imguigml_init_input(  )`  
 | | | | 
| -- | -- | -- 
**returns**: | None

*called `with` imguigml - initilaize the input stuff* 

---

### `__imguigml_init_wrapper(  )`  
 | | | | 
| -- | -- | -- 
**returns**: | None

*called `with` imguigml - initialize wrapper buffer* 

---

### `rousr_array( _rousr_array , _index , [_val] )`  
 | | | | 
| -- | -- | -- 
**_rousr_array:** | {Array} | rousr_array to read / write 
**_index:** | {Real} | index to read or write to 
**[_val]:** | {*} | if passed, value to set element to, same as insert. 
**returns**: | None

*return an index, or set an index in a `_rousr_array`* 

---

### `rousr_array_create( [_array] , [_arraySize] )`  
 | | | | 
| -- | -- | -- 
**[_array]:** | {Array} | array to wrap 
**[_arraySize]:** | {Real} | if `_array`s size is cached, pass it. 
**returns**: | None

*create a `rousr style` array, with the size as the first element, and the actual array as second* 

---

### `rousr_array_data( - )`  
 | | | | 
| -- | -- | -- 
**-:** | _rousr_array | `rousr_array` to get the data from 
**returns**: | {Array} data in the `rousr_array`

*return the data of the `rousr_array`* 

---

### `rousr_array_destroy( _array )`  
 | | | | 
| -- | -- | -- 
**_array:** | {Array} | - array to destroy 
**returns**: | None

*destroy a `rousr style` array - currently does nothing, but future proofing by including.* 

---

### `rousr_array_find( _rousr_array , _val , [_startIndex=0] )`  
 | | | | 
| -- | -- | -- 
**_rousr_array:** | {Array} | - rousr_array to search 
**_val:** | {*} | - value to search for 
**[_startIndex=0]:** | {Real} | - index to start searching from 
**returns**: | {Real} index or -1 if not found

*returns the first occurence of _val beginning at _startIndex* 

---

### `rousr_array_insert( _rousr_array , _index , _val )`  
 | | | | 
| -- | -- | -- 
**_rousr_array:** | {Array} | rousr array to insert value into 
**_index:** | {Real} | index to insert value at 
**_val:** | {*} | value to insert 
**returns**: | {Boolean} true on success

*insert a value into a rousr array* 

---

### `rousr_array_pop_back( _rousr_array )`  
 | | | | 
| -- | -- | -- 
**_rousr_array:** | {Array} | - rousr array to pop last value of 
**returns**: | {*} back, or undefined on failure

*pop the back of a rousr array and return it* 

---

### `rousr_array_pop_front( _rousr_array )`  
 | | | | 
| -- | -- | -- 
**_rousr_array:** | {Array} | - rousr array to pop last value of 
**returns**: | {*} front or undefined

*pop the front of an array and return it* 

---

### `rousr_array_push_back( _rousr_array , _val )`  
 | | | | 
| -- | -- | -- 
**_rousr_array:** | {Array} | - _rousr_array to push data to 
**_val:** | {*} | - value to push onto the array 
**returns**: | {Real} index pushed or -1 on error

*push a value on the end of a rousr_array* 

---

### `rousr_array_push_front( _array , _val )`  
 | | | | 
| -- | -- | -- 
**_array:** | {Array} | - rousr_array to push data to 
**_val:** | {*} | - value to push onto the array 
**returns**: | {Real} index pushed or -1 on error

*push a value on the front of a rousr array* 

---

### `rousr_array_push_unique( _rousr_array , _val , [_returnIndexOnExists=false] )`  
 | | | | 
| -- | -- | -- 
**_rousr_array:** | {Array} | - rousr_array to push data to 
**_val:** | {*} | - value to push onto the array 
**[_returnIndexOnExists=false]:** | {Boolean} | - if true returns index if it already exists, otherwise returns undefined (to signal failure) 
**returns**: | {Real} index pushed or -1 if it's not unique

*push a value on the end of a rousr array, but only if value isn't in the array already* 

---

### `rousr_array_remove( _rousr_array , _index )`  
 | | | | 
| -- | -- | -- 
**_rousr_array:** | {Array} | - rousr_array to remove element at `_index` from 
**_index:** | {Real} | - index to remove from _array 
**returns**: | {*} element at removed index, or undefined

*generate a new array with _index removed from the `_rousr_array`* 

---

### `rousr_array_remove_multi( _rousr_array , _index_array , [_index_array_size] )`  
 | | | | 
| -- | -- | -- 
**_rousr_array:** | {Array} | - rousr array to remove element at `_index` from 
**_index_array:** | {Real} | - index to remove from _array (note: normal array) 
**[_index_array_size]:** | {Real} | - size of `_index_array` if you've already cached it. 
**returns**: | {Array} removed values or undefined if error

*generate a new array with _index removed from the `_rousr_array`* 

---

### `rousr_array_size( - , [_new_size] )`  
 | | | | 
| -- | -- | -- 
**-:** | _rousr_array | `rousr_array` to get the size of 
**[_new_size]:** | {Real} | - if passed, sets the size of the array to this new size 
**returns**: | {Real} size of `rousr_array` (before it was set new, if `_new_size` is passed)

*return the size of the `rousr_array`* 

---

### `rousr_stack_array_create(  )`  
 | | | | 
| -- | -- | -- 
**returns**: | {Array} rousr_stack_array

*create a `rousr_stack_array` - a stack purely made of arrays* 

---

### `rousr_stack_array_destroy( _rousr_stack_array )`  
 | | | | 
| -- | -- | -- 
**_rousr_stack_array:** | {Array} | - `rousr_stack_array` to destroy 
**returns**: | None

*destroy a `rousr_stack_array` - since they're made up of arrays, this is unnecessary to call, but provided future API use or re-using stack arrays.* 

---

### `rousr_stack_array_empty( _rousr_stack_array )`  
 | | | | 
| -- | -- | -- 
**_rousr_stack_array:** | {Array} | - `rousr_stack_array` to check 
**returns**: | {Boolean} true if `_rousr_stack_array` is empty

*check if a stack is empty* 

---

### `rousr_stack_array_pop( _rousr_stack_array )`  
 | | | | 
| -- | -- | -- 
**_rousr_stack_array:** | {Array} | - `rousr_stack_array` array object to pop 
**returns**: | {*} the end of the stack, or undefined if empty

*pop the last `val`  from a `_rousr_stack_array`* 

---

### `rousr_stack_array_push( _rousr_stack_array , _val )`  
 | | | | 
| -- | -- | -- 
**_rousr_stack_array:** | {Array} | - `rousr_stack_array` to push `_val` on to 
**_val:** | {*} | - value to push on stack 
**returns**: | {Real} new top index

*push a `_val` onto the stack of a `_rousr_stack_array`* 

---

### `rousr_stack_array_top( _rousr_stack_array )`  
 | | | | 
| -- | -- | -- 
**_rousr_stack_array:** | {Array} | - `rousr_stack_array` to get top index of 
**returns**: | {Real} index of top, or -1 if empty

*return the top index of a `rousr_stack_array`* 

---

### `rousr_buffer_defines(  )`  
 | | | | 
| -- | -- | -- 
**returns**: | None

*enums / macros for rousr buffer functions (no need to call)* 

---

### `rousr_buffer_rousr_type_to_buffer_type( _type )`  
 | | | | 
| -- | -- | -- 
**_type:** | {Real} | - The ERousrData to get buffer_xx of 
**returns**: | {Real} buffer_xx to use for this type when writing to a buffer

*return a buffer type from a luarousr data type* 

---

### `rousr_buffer_read_val( _buffer )`  
 | | | | 
| -- | -- | -- 
**_buffer:** | {Real} | - id of buffer we're reading the _next_ value from 
**returns**: | {Real|String} return of the buffer read

*Reads a value from a packed buffer, first reading data type to expect.* 

---

### `rousr_buffer_write_val( _buffer , _val , [type=ERousrData.Invalid] )`  
 | | | | 
| -- | -- | -- 
**_buffer:** | {Real} | - buffer id to write to 
**_val:** | {Real|String} | - val to write to the buffer 
**[type=ERousrData.Invalid]:** | {Real|String} | - the forced type to use, can be string, or ERousrData 
**returns**: | {Boolean} true on success

*writes a value to the buffer, but first writes the type* 

---

### `rousr_callstack_defines(  )`  
 | | | | 
| -- | -- | -- 
**returns**: | None

*(do not call) rousr callstack definitions and enums* 

---

### `rousr_callstack_init(  )`  
 | | | | 
| -- | -- | -- 
**returns**: | None

*Initial rousr_callstack data* 

---

### `rousr_callstack_clean_up(  )`  
 | | | | 
| -- | -- | -- 
**returns**: | None

*delete all the buffers in the rousr callstack system - call before you 'reset' anything using the callstacks* 

---

### `rousr_callstack_process( _call_id )`  
 | | | | 
| -- | -- | -- 
**_call_id:** | {Real} |  
**returns**: | {Boolean} returns false if there's nothing left to process for `_call_id`, if true, see `rousr_callstack_buffer` for extracting data from DLL

*allow passing back and forth between DLL and GML* 

---

### `rousr_callstack_out( [_call_id=last )`  
 | | | | 
| -- | -- | -- 
**[_call_id=last:** | {Real} | id] if not passed - uses the last call_id passed to `rousr_callstack_process` right before returning 
**returns**: | {Real} buffer_id seek'd to start - this is a rousr_buffer and can be used to read parameters in the order expected from the DLL

*read data OUT of the DLL - get the output buffer for the `_call_id`* 

---

### `rousr_callstack_in( [_call_id=last , [_seek_start=true] )`  
 | | | | 
| -- | -- | -- 
**[_call_id=last:** | {Real} | id] if not passed - uses the last call_id passed to `rousr_callstack_process` right before returning 
**[_seek_start=true]:** | {Boolean} | by default, seek to the start 
**returns**: | {Real} rousr_buffer (at start) and should be written to using `rousr_buffer_write_val`

*write data IN to the DLL - get the input buffer for the `_call_id`      **NOTE:** Don't call this until after you're finished with `out` - they're the same buffer.* 

---

### `_rousr_callstack_call( _call_id )`  
 | | | | 
| -- | -- | -- 
**_call_id:** | {Real} |  
**returns**: | {Array:ERousrCall}

*return a call struct for a call id, if the id doesn't currently exist, assign it a buffer and return* 

---

### Changelist

* **v0.9.0: RC1**
  * Added: io settings, Callbacks for InputText and InputTextMultiLine (ImGuiTextEditCallback), **Reference docs, thanks @net8floz**
  * Fixed: `input_int` crashing and using a float value 

* **v0.5.0:** Last Preview 'Major' before RC1
  *  Fixed: Clean Up event crashes and memory leaks, YYC crash in `imguigml_set_next_window_pos`
  *  Added: `imguigml_activate` `imguigml_deactivate` and `imguigml_ready` helpers

* **v0.2.0:** First "private" release
  * **v0.2.1:** Hot Fix: Fixed: `imguigml_plot_histogram` _overlay param
  * **v0.2.3:** Hot Fix: BeginChild/EndChild weren't implemented, removed IM_ASSERT from the DLL
  * **v0.2.4:** HotFix 
    *  Fixed: `set_column_width` call and input field returns
    *  Added: **MouseWheel** Support, Added **Keyboard Input** Support
    *  Optimized Render thread ever so slightly.
  * **v0.2.5:** HotFix - Fixed: `plot_lines` arguments, "help" parser
  * **v0.2.6:** Added: `imguigml_sprite` and `imguigml_sprite_button` support

#### Coming Soon

**WIP**
*  ImGuiListClipper Support
*  ImDrawList
*  Fonts - Loading TTF fonts - think I can probably just pass TTF fonts to it?
*  SetStateStorage / UnsetStateStorage: Not sure what these are for, may support?
*  Context Manager - Pass ImGui Context to another DLL Extension so 3rd Party DLLs can add ImGui features.
*  Consider implementation: 
  *  Callback `SetNextWindowSizeConstraints`
  *  `imguigml_combo()`: Support `_items_separated_by_zeros`

#### Unsupported functions

**Probably never coming**

*   **IO functions:** Not sure what you're going to try to pull here..
    *   Memory Manager
        *   ImGui::MemAlloc
        *   ImGui::MemFree
*/
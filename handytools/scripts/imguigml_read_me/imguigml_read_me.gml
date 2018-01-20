/*
<link rel = "stylesheet" type = "text/css" href = "retro.css" />  

![imguigml_banner](https://i.imgur.com/C1EZNVC.png)
# imguigml

**ImGuiGML** is a DLL / GML wrapper of the popular [Dear ImGui,](https://github.com/ocornut/imgui) library.
  
It's currently available only on the **Windows** platform with *macOS* and *Linux* coming soon.

ImGui is a UI library designed for fast implementation and iteration, using an 'Immediate Mode GUI' paradigm You will primarily be putting your GUI functions in step events that are called each step, rather than an event / retained based paradigm of only making updates.

_Extension by babyjeans (Follow [@babyj3ans](https://twitter.com/babyj3ans/))_   
_Special Thanks to [@net8floz](https://twitter.com/net8floz/) for additional programming and the excellent example screenshots!_

_**Special** Special Thanks to [JujuAdams](https://twitter.com/jujuadams) for supporting the project!_

### Overview

GML Bindings for [dear imgui,]()

* [Usage](#usage)
* [ImGui and IDs](#imgui-and-ids)
* [Reference](#reference)
* [Changelist](#changelist)
  * [Coming Soon](#coming-soon)
  * [Unsupported Features](#unsupported-features)

### Usage

*  drop the `imguigml` object into your game, and voila. it begins activated.
*  call `imguigml_deactivate();` and `imguigml_activate()` for hiding/showing, which also stops all updates. 
  *  _imgui is **inaccessible completely** when deactivated_
*  _Note: in some cases, its necessary to make sure `imguigml_ready()` is true right before calling functions using it._
*  _Note: imguigml is a **Persistent** object_

**For most imgui functions, it's a straight wrap!** Call whatever you're looking for with:
`imguigml_<function>` as opposed to `ImGui::<function>` from the C++ analog.

Now, each step that you'd like to show some ImGui, just call all of the functions that make up your UI. See the example provided for details!

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

#### `imguigml_activate`   
**returns**: None   
```
imguigml_activate()
```   
helper function to simply activate imguigml again

---

#### `imguigml_deactivate`   
**returns**: None   
```
imguigml_deactivate()
```   
helper function to simply deactivate imguigml again

---

#### `imguigml_ready`   
**returns**: {Boolean}   
```
imguigml_ready()
```   
returns true if imguigml is ready for commands to be called

---

#### `imguigml_color_convert_gml_to_u32`   
| | | 
| -------------- | --------------------------- |   
**_color**       | {Real}    
**[_alpha=1.0]** | {Real} alpha value from 0 1   
**returns**: |  {Real} ImGui U32 color   
```
imguigml_color_convert_gml_to_u32(_color, [_alpha=1.0])
```   
get an ImGui color from a gml color

---

#### `imguigml_color_convert_gml_to_float4`   
| | | 
| -------------- | --------------------------- |   
**_color**       | {Real}    
**[_alpha=1.0]** | {Real} alpha value from 0 1   
**returns**: |  {Array} [_r,_g,_b,_a]   
```
imguigml_color_convert_gml_to_float4(_color, [_alpha=1.0])
```   
get an ImGui color4 from a gml color

---

#### `imguigml_color_convert_float4_to_gml`   
| | | 
| ---------------- | ------- |   
**_r_or_array4**   | {Real}    
**[_g=undefined]** | {Real}    
**[_b=undefined]** | {Real}    
**[_a=undefined]** | {Real}    
**returns**: |    {Array} [gml_colour,_alpha]   
```
imguigml_color_convert_float4_to_gml(_r_or_array4, [_g=undefined], [_b=undefined], [_a=undefined])
```   
get an gml color from a ImGui color4

---

#### `imguigml_color_convert_u32_to_gml`   
| | | 
| ---------- | --------------------------- |   
**_color**   | {Real} u32 color from imgui   
**returns**: | {Array:[ _gml_color, _alpha]}   
```
imguigml_color_convert_u32_to_gml(_color)
```   
get an ImGui color from a gml color

---

#### `imguigml_toggle_cursor`   
| | | 
| ---------- | --------------------------------------------------------------- |   
**[_force]** | {Boolean} if passed, will set the cursor visibility accordingly   
**returns**: | None   
```
imguigml_toggle_cursor([_force])
```   
Toggle whether or not ImGui will touch the cursor or not

---

#### `imguigml_enable_depth`   
| | | 
| ------------ | ----------------------------------------------------------------- |   
**[_enabled]** | {Boolean} enable depth if not passed, returns value currently set   
**returns**: | {Boolean} _enabled   
```
imguigml_enable_depth([_enabled])
```   
if enabled, setting the `depth` of the `imgui` instance will change the `z-value` imgui renders, otherwise it's at z=1.0

---

#### `imguigml_set_display_mode`   
| | | 
| ------------------- | -------------------------------------------------------------------------- |   
**_display_mode**     | {Real:EImGui_DisplayMode} display mode to set   
**[_display_view=0]** | {Real} which view imgui respects viewport aspect ratio defaults to view 0.   
**returns**: |       None   
```
imguigml_set_display_mode(_display_mode, [_display_view=0])
```   
set the imguigml display mode - this affects how the window is resized / handled.      currently there's the 3 display modes:      *  GUIAspect     - ImGuiGML Draws on the GUI layer, but corrects for aspect ratio according to the viewport of view passed. **DEFAULT**      *  View          - ImGuiGML will Draw in a normal Draw call **NOT** Draw GUI, the mouse will scale to the view given. **Use if you want to Draw ImGuiGML during the Draw event (application surface).**      **NOTE: This should be set before or after `Begin Step` and `Draw` of the `imgui` object,      it affects both mouse (Begin Step) and rendering (Draw)**      _If you're using `EImGui_DisplayMode.View` you may want to experiment with [imguigml_set_display_scale](#imguigml_set_display_scale)_

---

#### `imguigml_get_display_mode`   
**returns**: {Real:EImGui_DisplayMode} ImGuIGML's current `Display_mode`   
```
imguigml_get_display_mode()
```   
returns the current set display mode

---

#### `imguigml_get_display_view`   
**returns**: {Real:EImGui_DisplayMode} ImGuIGML's current `Display_mode`   
```
imguigml_get_display_view()
```   
returns the current set display view - the view who's viewport we respect the aspect ratio of with using `EImGui_DisplayMode.GUIWindowSize` or `EImGui_DisplayMode.GUIAspect`

---

#### `imguigml_set_display_scale`   
| | | 
| ---------- | ------------------------------------------ |   
**_x**       | {Real} width (%) to scale (Default = 1.0)   
**_y**       | {Real} height (%) to scale (Default = 1.0)   
**returns**: | None   
```
imguigml_set_display_scale(_x, _y)
```   
set the imguigml display scaling - it will scale the mouse and the vertex buffer ImGui passes ImGuiGML by this much.      if you pass no arguments, Scale will no longer be overriden

---

#### `imguigml_get_display_scale_width`   
**returns**: {Real}   
```
imguigml_get_display_scale_width()
```   
get the scale % we scale the width of

---

#### `imguigml_get_display_scale_height`   
**returns**: {Real}   
```
imguigml_get_display_scale_height()
```   
get the scale % we scale the height of

---

#### `imguigml_set_display_size`   
| | | 
| ----------- | ------- |   
**[_width]**  | {Real}    
**[_height]** | {Real}    
**returns**: | None   
```
imguigml_set_display_size([_width], [_height])
```   
set the display size (how imgui will clamp windows).      by default, ImGuiGML automatically sets the display size to the window size each step. using this function disables that behavior.      calling this fucntion with **NO** params, re-enables that functionality.

---

#### `imguigml_get_display_size`   
**returns**: {Array:[x, y]}   
```
imguigml_get_display_size()
```   
get the display size (how imgui will clamp windows)

---

#### `imguigml_separator`   
**returns**: None   
```
imguigml_separator()
```   
separator, generally horizontal. inside a menu bar or in horizontal layout mode, this becomes a vertical separator.

---

#### `imguigml_same_line`   
| | | 
| ------------------- | ------- |   
**[_pos_x=0.0]**      | {Real}    
**[_spacing_w=-1.0]** | {Real}    
**returns**: |       None   
```
imguigml_same_line([_pos_x=0.0], [_spacing_w=-1.0])
```   
call between widgets or groups to layout them horizontally

---

#### `imguigml_new_line`   
**returns**: None   
```
imguigml_new_line()
```   
undo a SameLine()

---

#### `imguigml_spacing`   
**returns**: None   
```
imguigml_spacing()
```   
add vertical spacing

---

#### `imguigml_dummy`   
| | | 
| ------------------- | ------- |   
**[_pos_x=0.0]**      | {Real}    
**[_spacing_w=-1.0]** | {Real}    
**returns**: |       None   
```
imguigml_dummy([_pos_x=0.0], [_spacing_w=-1.0])
```   
add a dummy item of given size

---

#### `imguigml_indent`   
| | | 
| ----------------- | ------- |   
**[_index_w=0.0f]** | {Real}    
**returns**: |     None   
```
imguigml_indent([_index_w=0.0f])
```   
move content position toward the right, by style.IndentSpacing or indent_w if >0

---

#### `imguigml_unindent`   
| | | 
| ----------------- | ------- |   
**[_index_w=0.0f]** | {Real}    
**returns**: |     None   
```
imguigml_unindent([_index_w=0.0f])
```   
move content position back to the left, by style.IndentSpacing or indent_w if >0

---

#### `imguigml_begin_group`   
**returns**: None   
```
imguigml_begin_group()
```   
lock horizontal starting position + capture group bounding box into one "item" (so you can use IsItemHovered() or layout primitives such as SameLine() on whole group, etc.)

---

#### `imguigml_end_group`   
**returns**: None   
```
imguigml_end_group()
```   
end horizontal capture group

---

#### `imguigml_get_cursor_pos`   
**returns**: {Array:[x,y]}   
```
imguigml_get_cursor_pos()
```   
cursor position is relative to window position

---

#### `imguigml_get_cursor_pos_x`   
**returns**: {Real} x   
```
imguigml_get_cursor_pos_x()
```   
cursor position is relative to window position

---

#### `imguigml_get_cursor_pos_y`   
**returns**: {Real} y   
```
imguigml_get_cursor_pos_y()
```   
cursor position is relative to window position

---

#### `imguigml_set_cursor_pos`   
| | | 
| ---------- | ------- |   
**_x**       | {Real}    
**_y**       | {Real}    
**returns**: | None   
```
imguigml_set_cursor_pos(_x, _y)
```   
set the imgui cursor position

---

#### `imguigml_set_cursor_pos_x`   
| | | 
| ---------- | ------- |   
**_x**       | {Real}    
**returns**: | None   
```
imguigml_set_cursor_pos_x(_x)
```   
set the imgui cursor position x

---

#### `imguigml_set_cursor_pos_y`   
| | | 
| ---------- | ------- |   
**_y**       | {Real}    
**returns**: | None   
```
imguigml_set_cursor_pos_y(_y)
```   
set the imgui cursor position y

---

#### `imguigml_get_cursor_start_pos`   
**returns**: {Array:[x,y]}   
```
imguigml_get_cursor_start_pos()
```   
initial cursor position

---

#### `imguigml_get_cursor_screen_pos`   
**returns**: {Array:[x,y]}   
```
imguigml_get_cursor_screen_pos()
```   
cursor position in absolute screen coordinates [0..io.DisplaySize] (useful to work with ImDrawList API)

---

#### `imguigml_set_cursor_screen_pos`   
| | | 
| ---------- | ------- |   
**_x**       | {Real}    
**_y**       | {Real}    
**returns**: | None   
```
imguigml_set_cursor_screen_pos(_x, _y)
```   
cursor position in absolute screen coordinates [0..io.DisplaySize]

---

#### `imguigml_align_text_to_frame_padding`   
**returns**: None   
```
imguigml_align_text_to_frame_padding()
```   
vertically align/lower upcoming text to FramePadding.y so that it will aligns to upcoming widgets (call if you have text on a line before regular widgets)

---

#### `imguigml_get_text_line_height`   
**returns**: {Real} height of font == GetWindowFontSize()   
```
imguigml_get_text_line_height()
```   
height of font == GetWindowFontSize()

---

#### `imguigml_get_text_line_height_with_spacing`   
**returns**: {Real} distance (in pixels) between 2 consecutive lines of text == GetWindowFontSize() + GetStyle().ItemSpacing.y   
```
imguigml_get_text_line_height_with_spacing()
```   
distance (in pixels) between 2 consecutive lines of text == GetWindowFontSize() + GetStyle().ItemSpacing.y

---

#### `imguigml_get_frame_height`   
**returns**: {Real}   
```
imguigml_get_frame_height()
```   
gets the height of the active frame [~ FontSize + style.FramePadding.y * 2]

---

#### `imguigml_get_frame_height_with_spacing`   
**returns**: {Real} distance (in pixels) between 2 consecutive lines of standard height widgets == GetWindowFontSize() + GetStyle().FramePadding.y*2 + GetStyle().ItemSpacing.y   
```
imguigml_get_frame_height_with_spacing()
```   
distance (in pixels) between 2 consecutive lines of standard height widgets == GetWindowFontSize() + GetStyle().FramePadding.y*2 + GetStyle().ItemSpacing.y

---

#### `imguigml_columns`   
| | | 
| ----------------- | ---------- |   
**[_count=1]**      | {Real}    
**[_id=undefined]** | {String}    
**[_border=true]**  | {Boolean}    
**returns**: |     None   
```
imguigml_columns([_count=1], [_id=undefined], [_border=true])
```   
You can also use SameLine(pos_x) for simplified columns.

---

#### `imguigml_next_column`   
**returns**: None   
```
imguigml_next_column()
```   
next column, defaults to current row or next row if the current row is finished

---

#### `imguigml_get_column_index`   
**returns**: {Real} column_index   
```
imguigml_get_column_index()
```   
get current column index

---

#### `imguigml_get_column_width`   
| | | 
| -------------------- | ------- |   
**[_column_index=-1]** | {Real}    
**returns**: |        {Real} _column_width   
```
imguigml_get_column_width([_column_index=-1])
```   
get column width (in pixels). pass -1 to use current column

---

#### `imguigml_set_column_width`   
| | | 
| --------------- | ---------------------------------------------- |   
**_column_index** | {Real} column to set width of (-1 for current)   
**_width**        | {Real} width in pixels to use   
**returns**: |   None   
```
imguigml_set_column_width(_column_index, _width)
```   
set column width (in pixels). pass -1 to use current column

---

#### `imguigml_get_column_offset`   
| | | 
| -------------------- | ---------------------------------------------------------------------------------------------------------- |   
**[_column_index=-1]** | {Real} pass -1 to use current column, otherwise 0..GetColumnsCount() inclusive. column 0 is typically 0.0f   
**returns**: |        None   
```
imguigml_get_column_offset([_column_index=-1])
```   
get position of column line (in pixels, from the left side of the contents region).

---

#### `imguigml_set_column_offset`   
| | | 
| --------------- | ---------------------------------------------------------- |   
**_column_index** | {Real} pass -1 to use current column   
**_offset_x**     | {Real} offset in pixels from the left side of the contents   
**returns**: |   None   
```
imguigml_set_column_offset(_column_index, _offset_x)
```   
set position of column line (in pixels, from the left side of the contents region).

---

#### `imguigml_get_columns_count`   
**returns**: {Real} columns count   
```
imguigml_get_columns_count()
```   
get amount of columns

---

#### `imguigml_push_id`   
| | | 
| ----------- | --------------------------------------- |   
**_id**       | {Real|String} string or real id to push   
**[_end_id]** | {String} last id to push   
**returns**: | None   
```
imguigml_push_id(_id, [_end_id])
```   
push identifier into the ID stack. IDs are hash of the entire stack!

---

#### `imguigml_pop_id`   
**returns**: None   
```
imguigml_pop_id()
```   
pop identifier from ID stack

---

#### `imguigml_get_id`   
| | | 
| ----------- | -------------------------------------- |   
**_id**       | {Real|String} string or real id to get   
**[_end_id]** | {String} last id to get   
**returns**: | {Real} ImGuiID   
```
imguigml_get_id(_id, [_end_id])
```   
push identifier into the ID stack. IDs are hash of the entire stack!

---

#### `imguigml_get_clipboard_text`   
**returns**: {String} clipboard text   
```
imguigml_get_clipboard_text()
```   
get the clipboard text

---

#### `imguigml_set_clipboard_text`   
**returns**: None   
```
imguigml_set_clipboard_text()
```   
set the clipboard text

---

#### `imguigml_get_key_index`   
| | | 
| ------------ | ------------------- |   
**_key_index** | {Real:__ImGuiKey_}    
**returns**: | {Real}   
```
imguigml_get_key_index(_key_index)
```   
get mapped index for imgui_key index, you really don't need this

---

#### `imguigml_is_key_down`   
| | | 
| ------------ | ------------------- |   
**_key_index** | {Real:__ImGuiKey_}    
**returns**: | {Boolean}   
```
imguigml_is_key_down(_key_index)
```   
is key being held. == io.KeysDown[user_key_index]. note that imgui doesn't know the semantic of each entry of io.KeyDown[]. Use your own indices/enums according to how your backend/engine stored them into KeyDown[]!

---

#### `imguigml_is_key_pressed`   
| | | 
| ---------------- | ------------------------------------------------------------- |   
**_key_index**     | {Real:__ImGuiKey_}    
**[_repeat=true]** | {Boolean} repeat=true, uses io.KeyRepeatDelay / KeyRepeatRate   
**returns**: |    {Boolean}   
```
imguigml_is_key_pressed(_key_index, [_repeat=true])
```   
was key pressed (went from !Down to Down)

---

#### `imguigml_is_key_released`   
| | | 
| ------------ | ------------------- |   
**_key_index** | {Real:__ImGuiKey_}    
**returns**: | {Boolean}   
```
imguigml_is_key_released(_key_index)
```   
is key released

---

#### `imguigml_get_key_pressed_amount`   
| | | 
| --------------- | ------- |   
**_key_index**    | {Real}    
**_repeat_delay** | {Real}    
**_rate**         | {Real}    
**returns**: |   {Real} return a count, most often 0 or 1 but might be >1 if RepeatRate is small enough that DeltaTime > RepeatRate   
```
imguigml_get_key_pressed_amount(_key_index, _repeat_delay, _rate)
```   
uses provided repeat rate/delay.

---

#### `imguigml_is_mouse_down`   
| | | 
| ---------- | ------- |   
**_button**  | {Real}    
**returns**: | {Boolean}   
```
imguigml_is_mouse_down(_button)
```   
is mouse button held

---

#### `imguigml_is_mouse_clicked`   
| | | 
| ----------------- | ---------- |   
**_button**         | {Real}    
**[_repeat=false]** | {Boolean}    
**returns**: |     {Boolean}   
```
imguigml_is_mouse_clicked(_button, [_repeat=false])
```   
did mouse button clicked (went from !Down to Down)

---

#### `imguigml_is_mouse_double_clicked`   
| | | 
| ---------- | ------- |   
**_button**  | {Real}    
**returns**: | {Boolean}   
```
imguigml_is_mouse_double_clicked(_button)
```   
did mouse button double-clicked. a double-click returns false in IsMouseClicked(). uses io.MouseDoubleClickTime.

---

#### `imguigml_is_mouse_released`   
| | | 
| ---------- | ------- |   
**_button**  | {Real}    
**returns**: | {Boolean}   
```
imguigml_is_mouse_released(_button)
```   
did mouse button released (went from Down to !Down)

---

#### `imguigml_is_mouse_dragging`   
| | | 
| ------------------------ | --------------------------------------------------------------- |   
**[_button=0]**            | {Real}    
**[_lock_threshold=-1.0]** | {Real} if lock_threshold < -1.0f uses io.MouseDraggingThreshold   
**returns**: |            {Boolean}   
```
imguigml_is_mouse_dragging([_button=0], [_lock_threshold=-1.0])
```   
is mouse dragging.

---

#### `imguigml_is_mouse_hovering_rect`   
| | | 
| -------------- | -------------------------------------------------------------------------------------------------------------------------- |   
**_min_x**       | {Real}    
**_min_y**       | {Real}    
**_max_x**       | {Real}    
**_max_y**       | {Real}    
**[_clip=true]** | {Boolean} clipped by current clipping settings. disregarding of consideration of focus/window ordering/blocked by a popup.   
**returns**: |  {Boolean}   
```
imguigml_is_mouse_hovering_rect(_min_x, _min_y, _max_x, _max_y, [_clip=true])
```   
is mouse hovering given bounding rect (in screen space).

---

#### `imguigml_is_mouse_pos_valid`   
**returns**: {Boolean}   
```
imguigml_is_mouse_pos_valid()
```   
is the mouse position valid

---

#### `imguigml_get_mouse_pos`   
**returns**: {Boolean}   
```
imguigml_get_mouse_pos()
```   
shortcut to ImGui::GetIO().MousePos provided by user, to be consistent with other calls

---

#### `imguigml_get_mouse_pos_on_opening_current_popup`   
**returns**: None   
```
imguigml_get_mouse_pos_on_opening_current_popup()
```   
retrieve backup of mouse positioning at the time of opening popup we have BeginPopup() into

---

#### `imguigml_get_mouse_drag_delta`   
**returns**: None   
```
imguigml_get_mouse_drag_delta()
```   
retrieve backup of mouse positioning at the time of opening popup we have BeginPopup() into

---

#### `imguigml_reset_mouse_drag_delta`   
| | | 
| ------------- | ------- |   
**[_button=0]** | {Real}    
**returns**: | None   
```
imguigml_reset_mouse_drag_delta([_button=0])
```   
reset the drag delta

---

#### `imguigml_get_mouse_cursor`   
**returns**: {Real:EImGui_MouseCursor} cursor id   
```
imguigml_get_mouse_cursor()
```   
get desired cursor type, reset in ImGui::NewFrame(), this is updated during the frame. valid before Render(). If you use software rendering by setting io.MouseDrawCursor ImGui will render those for you

---

#### `imguigml_set_mouse_cursor`   
| | | 
| ---------- | -------------------------- |   
**_type**    | {Real:EImGui_MouseCursor}    
**returns**: | None   
```
imguigml_set_mouse_cursor(_type)
```   
set desired cursor type

---

#### `imguigml_capture_keyboard_from_app`   
| | | 
| ----------------- | ---------- |   
**[_capture=true]** | {Boolean}    
**returns**: |     None   
```
imguigml_capture_keyboard_from_app([_capture=true])
```   
manually override io.WantCaptureKeyboard flag next frame (said flag is entirely left for your application handle). e.g. force capture keyboard when your widget is being hovered.

---

#### `imguigml_capture_mouse_from_app`   
| | | 
| ----------------- | ---------- |   
**[_capture=true]** | {Boolean}    
**returns**: |     None   
```
imguigml_capture_mouse_from_app([_capture=true])
```   
manually override io.WantCaptureMouse flag next frame (said flag is entirely left for your application handle).

---

#### `imguigml_log_to_tty`   
| | | 
| ----------------- | ------- |   
**[_max_depth=-1]** | {Real}    
**returns**: |     None   
```
imguigml_log_to_tty([_max_depth=-1])
```   
start logging to tty

---

#### `imguigml_log_to_file`   
| | | 
| ------------------------ | ----------------------------- |   
**[_max_depth=-1]**        | {Real}    
**[_file_name=undefined]** | {String} absolute path to log   
**returns**: |            None   
```
imguigml_log_to_file([_max_depth=-1], [_file_name=undefined])
```   
start logging to file

---

#### `imguigml_log_to_clipboard`   
| | | 
| ----------------- | ------- |   
**[_max_depth=-1]** | {Real}    
**returns**: |     None   
```
imguigml_log_to_clipboard([_max_depth=-1])
```   
start logging to OS clipboard

---

#### `imguigml_log_finish`   
**returns**: None   
```
imguigml_log_finish()
```   
stop logging (close file, etc.)

---

#### `imguigml_log_buttons`   
**returns**: None   
```
imguigml_log_buttons()
```   
helper to display buttons for logging to tty/file/clipboard

---

#### `imguigml_log_text`   
| | | 
| ---------- | --------- |   
**_text**    | {String}    
**returns**: | None   
```
imguigml_log_text(_text)
```   
pass text data straight to log (without being displayed)

---

#### `imguigml_begin_main_menu_bar`   
**returns**: {Boolean}   
```
imguigml_begin_main_menu_bar()
```   
create and append to a full screen menu-bar. only call EndMainMenuBar() if this returns true!

---

#### `imguigml_end_main_menu_bar`   
**returns**: None   
```
imguigml_end_main_menu_bar()
```   
end main menu bar

---

#### `imguigml_begin_menu_bar`   
**returns**: {Boolean}   
```
imguigml_begin_menu_bar()
```   
append to menu-bar of current window (requires ImGuiWindowFlags_MenuBar flag set on parent window). only call EndMenuBar() if this returns true!

---

#### `imguigml_end_menu_bar`   
**returns**: None   
```
imguigml_end_menu_bar()
```   
end menu bar

---

#### `imguigml_begin_menu`   
| | | 
| ----------------- | ---------- |   
**_label**          | {String}    
**[_enabled=true]** | {Boolean}    
**returns**: |     {Boolean}   
```
imguigml_begin_menu(_label, [_enabled=true])
```   
create a sub-menu entry. only call EndMenu() if this returns true!

---

#### `imguigml_end_menu`   
**returns**: None   
```
imguigml_end_menu()
```   
end sub-menu entry

---

#### `imguigml_menu_item`   
| | | 
| ------------------- | ----------------------------------------------------------------------------------------- |   
**_label**            | {String}    
**[_shortcut=""]**    | {String} shortcuts are displayed for convenience but not processed by ImGui at the moment   
**[_selected=false]** | {Boolean}    
**[_enabled=true]**   | {Boolean}    
**returns**: |       None   
```
imguigml_menu_item(_label, [_shortcut=""], [_selected=false], [_enabled=true])
```   
show a sub-menu item

---

#### `imguigml_open_popup`   
| | | 
| ---------- | --------- |   
**_str_id**  | {String}    
**returns**: | None   
```
imguigml_open_popup(_str_id)
```   
call to mark popup as open (don't call every frame!). popups are closed when user click outside,      or if CloseCurrentPopup() is called within a BeginPopup()/EndPopup() block. By default,      Selectable()/MenuItem() are calling CloseCurrentPopup(). Popup identifiers are relative to the      current ID-stack (so OpenPopup and BeginPopup needs to be at the same level).

---

#### `imguigml_open_popup_on_item_click`   
| | | 
| --------------------- | --------- |   
**[_str_id=undefined]** | {String}    
**[_mouse_button=1]**   | {Real}    
**returns**: |         {Boolean} true when just opened.   
```
imguigml_open_popup_on_item_click([_str_id=undefined], [_mouse_button=1])
```   
helper to open popup when clicked on last item.

---

#### `imguigml_begin_popup`   
| | | 
| ---------- | --------- |   
**_str_id**  | {String}    
**returns**: | {Boolean} true if the popup is open, and you can start outputting to it.   
```
imguigml_begin_popup(_str_id)
```   
begin a pop up - only call EndPopup() if BeginPopup() returned true!

---

#### `imguigml_begin_popup_modal`   
| | | 
| ------------------- | ------------------------------------------------------------------------------------------------------------------------------------- |   
**_name**             | {String}    
**[_open=undefined]** | {Boolean} if passed, a close button is shown if true, or its closed if false, returns array with second value being if its open still   
**[_extra_flags=0]**  | {Real:EImGui_WindowFlags}    
**returns**: |       {Boolean|Array:[Boolean, Boolean]} if `_open` is passed, then an array for [ BeginPopupModal, _open ]   
```
imguigml_begin_popup_modal(_name, [_open=undefined], [_extra_flags=0])
```   
modal dialog (block interactions behind the modal window, can't close the modal window by clicking outside)

---

#### `imguigml_begin_popup_context_item`   
| | | 
| --------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |   
**[_str_id=undefined]** | {String} if you can pass an `undefined` `_str_id` only if the previous item had an id. If you want to use that on a non-interactive item such as Text() you need to pass in an explicit ID here.   
**[_mouse_button=1]**   | {Real}    
**returns**: |         {Boolean}   
```
imguigml_begin_popup_context_item([_str_id=undefined], [_mouse_button=1])
```   
helper to open and begin popup when clicked on last item. if you can pass a NULL str_id only if the previous item had an id. If you want to use that on a non-interactive item such as Text() you need to pass in an explicit ID here. read comments in .cpp!

---

#### `imguigml_begin_popup_context_window`   
| | | 
| ------------------------- | ---------- |   
**[_str_id=undefined]**     | {String}    
**[_mouse_button=1]**       | {Real}    
**[_also_over_items=true]** | {Boolean}    
**returns**: |             {Boolean}   
```
imguigml_begin_popup_context_window([_str_id=undefined], [_mouse_button=1], [_also_over_items=true])
```   
helper to open and begin popup when clicked on current window.

---

#### `imguigml_begin_popup_context_void`   
| | | 
| --------------------- | --------- |   
**[_str_id=undefined]** | {String}    
**[_mouse_button=1]**   | {Real}    
**returns**: |         {Boolean}   
```
imguigml_begin_popup_context_void([_str_id=undefined], [_mouse_button=1])
```   
helper to open and begin popup when clicked in void (where there are no imgui windows).

---

#### `imguigml_end_popup`   
**returns**: None   
```
imguigml_end_popup()
```   
end the current pop up

---

#### `imguigml_is_popup_open`   
| | | 
| ---------- | --------- |   
**_str_id**  | {String}    
**returns**: | {Boolean}   
```
imguigml_is_popup_open(_str_id)
```   
return true if the popup is open

---

#### `imguigml_close_current_popup`   
**returns**: None   
```
imguigml_close_current_popup()
```   
close the popup we have begin-ed into. clicking on a MenuItem or Selectable automatically close the current popup.

---

#### `imguigml_push_font`   
**returns**: None   
```
imguigml_push_font()
```   
use undefined as a shortcut to push default font

---

#### `imguigml_pop_font`   
**returns**: None   
```
imguigml_pop_font()
```   
pop the font

---

#### `imguigml_push_style_color`   
| | | 
| ---------- | --------------------------------------------------------- |   
**_idx**     | {Real:EImGui_Col}    
**_colOrR**  | {Real} if passing a single color, treated as a U32 colors   
**[_g]**     | {Real}    
**[_b]**     | {Real}    
**[_a]**     | {Real}    
**returns**: | None   
```
imguigml_push_style_color(_idx, _colOrR, [_g], [_b], [_a])
```   
false

---

#### `imguigml_pop_style_color`   
| | | 
| ------------ | ------- |   
**[_count=1]** | {Real}    
**returns**: | None   
```
imguigml_pop_style_color([_count=1])
```   
pop style colors

---

#### `imguigml_push_style_var`   
| | | 
| ---------- | -------------------------------------------- |   
**_idx**     | {Real:EImGui_StyleVar}    
**_valOrX**  | {Real}    
**[_y]**     | {Real} if passed, treat the values as a vec2   
**returns**: | None   
```
imguigml_push_style_var(_idx, _valOrX, [_y])
```   
push a style var on the param stack

---

#### `imguigml_pop_style_var`   
| | | 
| ------------ | ------- |   
**[_count=1]** | {Real}    
**returns**: | None   
```
imguigml_pop_style_var([_count=1])
```   
pop style colors

---

#### `imguigml_get_style_color_vec4`   
| | | 
| ---------- | ------------------ |   
**_idx**     | {Real:EImGui_Col}    
**returns**: | {Array:[r,g,b,a]}   
```
imguigml_get_style_color_vec4(_idx)
```   
retrieve style color as stored in ImGuiStyle structure. use to feed back into PushStyleColor(), otherwhise use GetColorU32() to get style color + style alpha.

---

#### `imguigml_get_font`   
**returns**: {Real} _font_id   
```
imguigml_get_font()
```   
get current font

---

#### `imguigml_get_font_size`   
**returns**: {Real} current font size   
```
imguigml_get_font_size()
```   
get current font size (= height in pixels) of current font with current scale applied

---

#### `imguigml_get_font_tex_uv_white_pixel`   
**returns**: {Array:[u,v]}   
```
imguigml_get_font_tex_uv_white_pixel()
```   
get UV coordinate for a while pixel, useful to draw custom shapes via the ImDrawList API

---

#### `imguigml_get_color_u32`   
| | | 
| ---------- | -------------------------------- |   
**_colOrR**  | {Real} U32 color, or r component   
**[_g]**     | {Real} g component   
**[_b]**     | {Real} b component   
**[_a]**     | {Real} a component   
**returns**: | None   
```
imguigml_get_color_u32(_colOrR, [_g], [_b], [_a])
```   
retrieve given style color with style alpha applied and optional extra alpha multiplier

---

#### `imguigml_get_color_u32_from_idx`   
| | | 
| ------------------ | ------------------ |   
**_idx**             | {Real:EImGui_Col}    
**[_alpha_mul=1.0]** | {Real}    
**returns**: |      None   
```
imguigml_get_color_u32_from_idx(_idx, [_alpha_mul=1.0])
```   
retrieve given style color with style alpha applied and optional extra alpha multiplier

---

#### `imguigml_push_item_width`   
| | | 
| ------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------- |   
**_item_width** | {Real} 0.0f = default to ~2/3 of windows width, >0.0f: width in pixels, <0.0f align xx pixels to the right of window (so -1.0f always align width to the right side)   
**returns**: | None   
```
imguigml_push_item_width(_item_width)
```   
width of items for the common item+label case, pixels.

---

#### `imguigml_pop_item_width`   
**returns**: None   
```
imguigml_pop_item_width()
```   
pop item width

---

#### `imguigml_calc_item_width`   
**returns**: {Real}   
```
imguigml_calc_item_width()
```   
width of item given pushed settings and current cursor position

---

#### `imguigml_push_text_wrap_pos`   
| | | 
| ------------------- | -------------------------------------------------------------------------------------------------------------------------------- |   
**[_wrap_pos_x=0.0]** | {Real} < 0.0f: no wrapping; 0.0f: wrap to end of window (or column); > 0.0f: wrap at 'wrap_pos_x' position in window local space   
**returns**: |       None   
```
imguigml_push_text_wrap_pos([_wrap_pos_x=0.0])
```   
word-wrapping for Text*() commands.

---

#### `imguigml_pop_text_wrap_pos`   
**returns**: None   
```
imguigml_pop_text_wrap_pos()
```   
pop text wrap pos

---

#### `imguigml_push_allow_keyboard_focus`   
| | | 
| ----------------------- | ---------- |   
**_allow_keyboard_focus** | {Boolean}    
**returns**: |           None   
```
imguigml_push_allow_keyboard_focus(_allow_keyboard_focus)
```   
allow focusing using TAB/Shift-TAB, enabled by default but you can disable it for certain widgets

---

#### `imguigml_pop_allow_keyboard_focus`   
**returns**: None   
```
imguigml_pop_allow_keyboard_focus()
```   
pop allow keyboard focus

---

#### `imguigml_push_button_repeat`   
| | | 
| ---------- | ---------- |   
**_repeat**  | {Boolean}    
**returns**: | None   
```
imguigml_push_button_repeat(_repeat)
```   
in 'repeat' mode, Button*() functions return repeated true in a typematic manner (using io.KeyRepeatDelay/io.KeyRepeatRate setting). Note that you can call IsItemActive() after any Button() to tell if the button is held in the current frame.

---

#### `imguigml_pop_button_repeat`   
**returns**: None   
```
imguigml_pop_button_repeat()
```   
pop repeat mode

---

#### `imguigml_selectable`   
| | | 
| ----------------------- | ------------------------------------------------------------------- |   
**_label**                | {String}    
**[_selected=false]**     | {Boolean}    
**[_selectable_flags=0]** | {Real:EImGui_SelectableFlags}    
**[_size_x=0]**           | {Real} size.x==0.0: use remaining width, size.x>0.0: specify width.   
**[_size_y=0]**           | {Real} size.y==0.0: use label height, size.y>0.0: specify height   
**returns**: |           {Array:[_val_changes, _is_selected]}   
```
imguigml_selectable(_label, [_selected=false], [_selectable_flags=0], [_size_x=0], [_size_y=0])
```   
selectable element

---

#### `imguigml_list_box`   
| | | 
| ------------------------ | --------------- |   
**_label**                 | {String}    
**_current_item**          | {Real}    
**_item_array**            | {Array:String}    
**[_height_in_items=-1])** | {Real}    
**returns**: |            {Array:[{Boolean} _changed, {Real} _selected_index]}   
```
imguigml_list_box(_label, _current_item, _item_array, [_height_in_items=-1]))
```   
create a list box

---

#### `imguigml_list_box_header`   
| | | 
| ---------- | --------- |   
**_label**   | {String}    
**_size_x**  | {Real}    
**_size_y**  | {Real}    
**returns**: | {Boolean}   
```
imguigml_list_box_header(_label, _size_x, _size_y)
```   
use if you want to reimplement ListBox() will custom data or interactions. make sure to call ListBoxFooter() afterwards.

---

#### `imguigml_list_box_header_items`   
| | | 
| ----------------------- | --------- |   
**_label**                | {String}    
**_items_count**          | {Real}    
**[_height_in_items=-1]** | {Real}    
**returns**: |           {Boolean}   
```
imguigml_list_box_header_items(_label, _items_count, [_height_in_items=-1])
```   
use if you want to reimplement ListBox() will custom data or interactions. make sure to call ListBoxFooter() afterwards.

---

#### `imguigml_list_box_footer`   
**returns**: None   
```
imguigml_list_box_footer()
```   
terminate the scrolling region

---

#### `imguigml_show_style_editor`   
**returns**: None   
```
imguigml_show_style_editor()
```   
add style editor block (not a window). you can pass in a reference ImGuiStyle structure to compare to, revert to and save to (else it uses the default style)

---

#### `imguigml_style_colors_classic`   
**returns**: None   
```
imguigml_style_colors_classic()
```   
use classic colors

---

#### `imguigml_style_colors_dark`   
**returns**: None   
```
imguigml_style_colors_dark()
```   
use dark colors

---

#### `imguigml_style_colors_light`   
**returns**: None   
```
imguigml_style_colors_light()
```   
use light colors

---

#### `imguigml_show_style_selector`   
| | | 
| ---------- | --------- |   
**_label**   | {String}    
**returns**: | None   
```
imguigml_show_style_selector(_label)
```   
show the style selector widget

---

#### `imguigml_set_tooltip`   
| | | 
| --------------- | --------- |   
**_tooltip_text** | {String}    
**returns**: |   None   
```
imguigml_set_tooltip(_tooltip_text)
```   
set text tooltip under mouse-cursor, typically use with ImGui::IsItemHovered(). overidde any previous call to SetTooltip().

---

#### `imguigml_begin_tooltip`   
**returns**: None   
```
imguigml_begin_tooltip()
```   
begin/append a tooltip window. to create full-featured tooltip (with any kind of contents).

---

#### `imguigml_end_tooltip`   
**returns**: None   
```
imguigml_end_tooltip()
```   
end a tooltip window

---

#### `imguigml_value`   
| | | 
| ----------------- | ----------------------------------------- |   
**_prefix**         | {String} value prefix   
**_val_type**       | {Real:EImGui_ValType} data type for value   
**_val**            | {Real} value to apss   
**[_float_format]** | {String} (float value type only)   
**returns**: |     None   
```
imguigml_value(_prefix, _val_type, _val, [_float_format])
```   
Output single value in "name: value" format (tip: freely declare more in your code to handle your types. you can add functions to the ImGui namespace)

---

#### `imguigml_color_convert_u32_to_float4`   
| | | 
| ---------- | ---------------- |   
**_color**   | {Real} u32 color   
**returns**: | {Array:float4} _color   
```
imguigml_color_convert_u32_to_float4(_color)
```   
convert a u32 color to a float 4

---

#### `imguigml_color_convert_float4_to_u32`   
| | | 
| ---------------- | ------- |   
**_r_or_array4**   | {Real}    
**[_g=undefined]** | {Real}    
**[_b=undefined]** | {Real}    
**[_a=undefined]** | {Real}    
**returns**: |    {Real} _color   
```
imguigml_color_convert_float4_to_u32(_r_or_array4, [_g=undefined], [_b=undefined], [_a=undefined])
```   
convert a float4 color to a u32

---

#### `imguigml_color_convert_rgb_to_hsv`   
| | | 
| ---------- | ------- |   
**_r**       | {Real}    
**_g**       | {Real}    
**_b**       | {Real}    
**returns**: | {Array:[h,s,v]}   
```
imguigml_color_convert_rgb_to_hsv(_r, _g, _b)
```   
convert rgb to hsv

---

#### `imguigml_color_convert_hsv_to_rgb`   
| | | 
| ---------- | ------- |   
**_h**       | {Real}    
**_s**       | {Real}    
**_b**       | {Real}    
**returns**: | {Array:[r,g,b]}   
```
imguigml_color_convert_hsv_to_rgb(_h, _s, _b)
```   
convert rgb to hsv

---

#### `imguigml_is_item_hovered`   
| | | 
| ------------ | --------------------------- |   
**[_flags=0]** | {Real:EImGui_HoveredFlags}    
**returns**: | {Boolean}   
```
imguigml_is_item_hovered([_flags=0])
```   
is the last item hovered by mouse (and usable)?

---

#### `imguigml_is_item_active`   
**returns**: {Boolean}   
```
imguigml_is_item_active()
```   
is the last item active? (e.g. button being held, text field being edited- items that don't interact will always return false)

---

#### `imguigml_is_item_clicked`   
| | | 
| ------------- | ------------------- |   
**[_button=0]** | {Real} mouse_button   
**returns**: | {Boolean}   
```
imguigml_is_item_clicked([_button=0])
```   
is the last item clicked? (e.g. button/node just clicked on)

---

#### `imguigml_is_item_visible`   
**returns**: {Boolean}   
```
imguigml_is_item_visible()
```   
is the last item visible? (aka not out of sight due to clipping/scrolling.)

---

#### `imguigml_is_any_item_hovered`   
**returns**: {Boolean}   
```
imguigml_is_any_item_hovered()
```   
are any items hovered

---

#### `imguigml_is_any_item_active`   
**returns**: {Boolean}   
```
imguigml_is_any_item_active()
```   
are any items active

---

#### `imguigml_get_item_rect_min`   
**returns**: {Array:[x,y]}   
```
imguigml_get_item_rect_min()
```   
get bounding rect of last item in screen space

---

#### `imguigml_get_item_rect_max`   
**returns**: {Array:[x,y]}   
```
imguigml_get_item_rect_max()
```   
get bounding rect of last item in screen space

---

#### `imguigml_get_item_rect_size`   
**returns**: {Array:[x,y]}   
```
imguigml_get_item_rect_size()
```   
get bounding rect of last item in screen space

---

#### `imguigml_set_item_allow_overlap`   
**returns**: None   
```
imguigml_set_item_allow_overlap()
```   
allow last item to be overlapped by a subsequent item. sometimes useful with invisible buttons, selectables, etc. to catch unused area.

---

#### `imguigml_is_window_focused`   
| | | 
| ------------ | --------------------------- |   
**[_flags=0]** | {Real:EImGui_FocusedFlags}    
**returns**: | {Boolean}   
```
imguigml_is_window_focused([_flags=0])
```   
is current Begin()-ed window focused?

---

#### `imguigml_is_window_hovered`   
| | | 
| ------------ | --------------------------- |   
**[_flags=0]** | {Real:EImGui_HoveredFlags}    
**returns**: | {Boolean}   
```
imguigml_is_window_hovered([_flags=0])
```   
is current Begin()-ed window hovered (and typically: not blocked by a popup/modal)?

---

#### `imguigml_is_any_window_hovered`   
**returns**: {Boolean}   
```
imguigml_is_any_window_hovered()
```   
is mouse hovering any visible window

---

#### `imguigml_is_rect_visible`   
| | | 
| ---------------- | ----------------------------------------------- |   
**_size_or_min_x** | {Real} if only size given, test from cursor pos   
**_size_or_min_y** | {Real}    
**[_max_x]**       | {Real} if max given, test in screen space   
**[_max_y]**       | {Real}    
**returns**: |    {Boolean}   
```
imguigml_is_rect_visible(_size_or_min_x, _size_or_min_y, [_max_x], [_max_y])
```   
test if a rectangle is visible / not clipped

---

#### `imguigml_get_time`   
**returns**: None   
```
imguigml_get_time()
```   
get the time

---

#### `imguigml_get_frame_count`   
**returns**: None   
```
imguigml_get_frame_count()
```   
get the time

---

#### `imguigml_get_style_color_name`   
| | | 
| ---------- | ------------------ |   
**_idx**     | {Real:EImGui_Col}    
**returns**: | {String} _color_name   
```
imguigml_get_style_color_name(_idx)
```   
get the style color's name

---

#### `imguigml_calc_item_rect_closest_point`   
| | | 
| ------------------ | ---------- |   
**_pos_x**           | {Real}    
**_pos_y**           | {Real}    
**[_on_edge=false]** | {Boolean}    
**[_outward=+0.0])** | {Real}    
**returns**: |      {Array:x,y}   
```
imguigml_calc_item_rect_closest_point(_pos_x, _pos_y, [_on_edge=false], [_outward=+0.0]))
```   
utility to find the closest point the last item bounding rectangle edge. useful to visually link items

---

#### `imguigml_calc_text_size`   
| | | 
| -------------------------------------- | ---------- |   
**_text**                                | {String}    
**[_text_end=undefined]**                | {String}    
**[_hide_text_after_double_hash=false]** | {Boolean}    
**[_wrap_width=-1.0f]);**                | {Real}    
**returns**: |                          {Array:[x,y]}   
```
imguigml_calc_text_size(_text, [_text_end=undefined], [_hide_text_after_double_hash=false], [_wrap_width=-1.0f]);)
```   
Calculate text size. Text can be multi-line. Optionally ignore text after a ## marker.

---

#### `imguigml_calc_list_clipping`   
| | | 
| --------------- | ------- |   
**_items_count**  | {Real}    
**_items_height** | {Real}    
**returns**: |   {Array:[item_start, item_end]}   
```
imguigml_calc_list_clipping(_items_count, _items_height)
```   
calculate coarse clipping for large list of evenly sized items. Prefer using the ImGuiListClipper higher-level helper if you can.

---

#### `imguigml_push_clip_rect`   
| | | 
| ----------------------------------- | ---------------------- |   
**_min_x**                            | {Real} clip_rect_min_x   
**_min_y**                            | {Real} clip_rect_min_y   
**_max_x**                            | {Real} clip_rect_max_x   
**_max_y**                            | {Real} clip_rect_max_y   
**_intersect_with_current_clip_rect** | {Boolean}    
**returns**: |                       None   
```
imguigml_push_clip_rect(_min_x, _min_y, _max_x, _max_y, _intersect_with_current_clip_rect)
```   
false

---

#### `imguigml_pop_clip_rect`   
**returns**: None   
```
imguigml_pop_clip_rect()
```   
pop the clip rect

---

#### `imguigml_slider_float`   
| | | 
| ----------------------- | --------- |   
**_label**                | {String}    
**_val**                  | {Real}    
**_min**                  | {Real}    
**_max**                  | {Real}    
**[_display_fmt="%.3f"]** | {String}    
**[_power=1.0])**         | {Real}    
**returns**: |           {Array:[_changed, _val]}   
```
imguigml_slider_float(_label, _val, _min, _max, [_display_fmt="%.3f"], [_power=1.0]))
```   
adjust display_format to decorate the value with a prefix or a suffix for in-slider labels or unit display. Use power!=1.0 for logarithmic sliders

---

#### `imguigml_slider_float2`   
| | | 
| ----------------------- | --------- |   
**_label**                | {String}    
**_val**                  | {Real}    
**_val2**                 | {Real}    
**_min**                  | {Real}    
**_max**                  | {Real}    
**[_display_fmt="%.3f"]** | {String}    
**[_power=1.0])**         | {Real}    
**returns**: |           {Array:[_changed, _val]}   
```
imguigml_slider_float2(_label, _val, _val2, _min, _max, [_display_fmt="%.3f"], [_power=1.0]))
```   
adjust display_format to decorate the value with a prefix or a suffix for in-slider labels or unit display. Use power!=1.0 for logarithmic sliders

---

#### `imguigml_slider_float3`   
| | | 
| ----------------------- | --------- |   
**_label**                | {String}    
**_val**                  | {Real}    
**_val2**                 | {Real}    
**_val3**                 | {Real}    
**_min**                  | {Real}    
**_max**                  | {Real}    
**[_display_fmt="%.3f"]** | {String}    
**[_power=1.0])**         | {Real}    
**returns**: |           {Array:[_changed, _val]}   
```
imguigml_slider_float3(_label, _val, _val2, _val3, _min, _max, [_display_fmt="%.3f"], [_power=1.0]))
```   
adjust display_format to decorate the value with a prefix or a suffix for in-slider labels or unit display. Use power!=1.0 for logarithmic sliders

---

#### `imguigml_slider_float4`   
| | | 
| ----------------------- | --------- |   
**_label**                | {String}    
**_val**                  | {Real}    
**_val2**                 | {Real}    
**_val3**                 | {Real}    
**_val4**                 | {Real}    
**_min**                  | {Real}    
**_max**                  | {Real}    
**[_display_fmt="%.3f"]** | {String}    
**[_power=1.0])**         | {Real}    
**returns**: |           {Array:[_changed, _val]}   
```
imguigml_slider_float4(_label, _val, _val2, _val3, _val4, _min, _max, [_display_fmt="%.3f"], [_power=1.0]))
```   
adjust display_format to decorate the value with a prefix or a suffix for in-slider labels or unit display. Use power!=1.0 for logarithmic sliders

---

#### `imguigml_slider_angle`   
| | | 
| ---------------------- | --------- |   
**_label**               | {String}    
**_rad**                 | {Real}    
**[_degree_min=-360.0]** | {Real}    
**[_degree_max=360.0]**  | {Real}    
**returns**: |          {Array:[_changed, _rad]}   
```
imguigml_slider_angle(_label, _rad, [_degree_min=-360.0], [_degree_max=360.0])
```   
angle slider

---

#### `imguigml_slider_int`   
| | | 
| ----------------------- | --------- |   
**_label**                | {String}    
**_v**                    | {Real}    
**_v_min**                | {Real}    
**_v_max**                | {Real}    
**[_display_fmt="%.0f"]** | {String}    
**returns**: |           {Array:[_changed, _v]}   
```
imguigml_slider_int(_label, _v, _v_min, _v_max, [_display_fmt="%.0f"])
```   
add an integer slider

---

#### `imguigml_slider_int2`   
| | | 
| ----------------------- | --------- |   
**_label**                | {String}    
**_v**                    | {Real}    
**_v2**                   | {Real}    
**_v_min**                | {Real}    
**_v_max**                | {Real}    
**[_display_fmt="%.0f"]** | {String}    
**returns**: |           {Array:[_changed, _v]}   
```
imguigml_slider_int2(_label, _v, _v2, _v_min, _v_max, [_display_fmt="%.0f"])
```   
add an integer slider

---

#### `imguigml_slider_int3`   
| | | 
| ----------------------- | --------- |   
**_label**                | {String}    
**_v**                    | {Real}    
**_v2**                   | {Real}    
**_v3**                   | {Real}    
**_v_min**                | {Real}    
**_v_max**                | {Real}    
**[_display_fmt="%.0f"]** | {String}    
**returns**: |           {Array:[_changed, _v]}   
```
imguigml_slider_int3(_label, _v, _v2, _v3, _v_min, _v_max, [_display_fmt="%.0f"])
```   
add an integer slider

---

#### `imguigml_slider_int4`   
| | | 
| ----------------------- | --------- |   
**_label**                | {String}    
**_v**                    | {Real}    
**_v2**                   | {Real}    
**_v3**                   | {Real}    
**_v4**                   | {Real}    
**_v_min**                | {Real}    
**_v_max**                | {Real}    
**[_display_fmt="%.0f"]** | {String}    
**returns**: |           {Array:[_changed, _v]}   
```
imguigml_slider_int4(_label, _v, _v2, _v3, _v4, _v_min, _v_max, [_display_fmt="%.0f"])
```   
add an integer slider

---

#### `imguigml_vslider_float`   
| | | 
| ----------------------- | --------- |   
**_label**                | {String}    
**_size_x**               | {Real}    
**_size_y**               | {Real}    
**_v**                    | {Real}    
**_v_min**                | {Real}    
**_v_max**                | {Real}    
**[_display_fmt="%.0f"]** | {String}    
**returns**: |           {Array:[_changed, _v]}   
```
imguigml_vslider_float(_label, _size_x, _size_y, _v, _v_min, _v_max, [_display_fmt="%.0f"])
```   
a vslider float?

---

#### `imguigml_vslider_int`   
| | | 
| ----------------------- | --------- |   
**_label**                | {String}    
**_size_x**               | {Real}    
**_size_y**               | {Real}    
**_v**                    | {Real}    
**_v_min**                | {Real}    
**_v_max**                | {Real}    
**[_display_fmt="%.0f"]** | {String}    
**returns**: |           {Array:[_changed, _v]}   
```
imguigml_vslider_int(_label, _size_x, _size_y, _v, _v_min, _v_max, [_display_fmt="%.0f"])
```   
a vslider int?

---

#### `imguigml_color_edit3`   
| | | 
| ---------------- | ----------------------------- |   
**_label**         | {String}    
**_r_or_array3**   | {Real}    
**[_g=undefined]** | {Real}    
**[_b=undefined]** | {Real}    
**[_flags=0]**     | {Real:EImGui_ColorEditFlags}    
**returns**: |    None   
```
imguigml_color_edit3(_label, _r_or_array3, [_g=undefined], [_b=undefined], [_flags=0])
```   
show a color edit field

---

#### `imguigml_color_edit4`   
| | | 
| ---------------- | ----------------------------- |   
**_label**         | {String}    
**_r_or_array4**   | {Real}    
**[_g=undefined]** | {Real}    
**[_b=undefined]** | {Real}    
**[_a=undefined]** | {Real}    
**[_flags=0]**     | {Real:EImGui_ColorEditFlags}    
**returns**: |    None   
```
imguigml_color_edit4(_label, _r_or_array4, [_g=undefined], [_b=undefined], [_a=undefined], [_flags=0])
```   
show a color edit field

---

#### `imguigml_color_picker3`   
| | | 
| ---------------- | ----------------------------- |   
**_label**         | {String}    
**_r_or_array4**   | {Real}    
**[_g=undefined]** | {Real}    
**[_b=undefined]** | {Real}    
**[_flags=0]**     | {Real:EImGui_ColorEditFlags}    
**returns**: |    None   
```
imguigml_color_picker3(_label, _r_or_array4, [_g=undefined], [_b=undefined], [_flags=0])
```   
show a color edit field

---

#### `imguigml_color_picker4`   
| | | 
| ---------------- | ----------------------------- |   
**_label**         | {String}    
**_r_or_array4**   | {Real}    
**[_g=undefined]** | {Real}    
**[_b=undefined]** | {Real}    
**[_a=undefined]** | {Real}    
**[_flags=0]**     | {Real:EImGui_ColorEditFlags}    
**returns**: |    None   
```
imguigml_color_picker4(_label, _r_or_array4, [_g=undefined], [_b=undefined], [_a=undefined], [_flags=0])
```   
show a color edit field

---

#### `imguigml_color_button`   
| | | 
| -------------- | ----------------------------- |   
**_desc_id**     | {String}    
**_r**           | {Real}    
**_g**           | {Real}    
**_b**           | {Real}    
**_a**           | {Real}    
**[_flags=0]**   | {Real:EImGui_ColorEditFlags}    
**[_size_x=0]**  | {Real}    
**[_size_y=0])** | {Real}    
**returns**: |  None   
```
imguigml_color_button(_desc_id, _r, _g, _b, _a, [_flags=0], [_size_x=0], [_size_y=0]))
```   
display a colored square/button, hover for details, return true when pressed.

---

#### `imguigml_set_color_edit_options`   
**returns**: None   
```
imguigml_set_color_edit_options()
```   
initialize current options (generally on application startup) if you want to select a default format, picker type, etc. User will be able to change many settings, unless you pass the _NoOptions flag to your calls.

---

#### `imguigml_drag_float`   
| | | 
| ---------------------- | --------- |   
**_label**               | {String}    
**_v**                   | {Real}    
**[_v_speed=1.0]**       | {Real}    
**[_v_min=0.0]**         | {Real}    
**[_v_max=0.0]**         | {Real}    
**[_displayFmt="%.3f"]** | {String}    
**[_power=1.0]**         | {Real}    
**returns**: |          {Array:[_changed, _v]}   
```
imguigml_drag_float(_label, _v, [_v_speed=1.0], [_v_min=0.0], [_v_max=0.0], [_displayFmt="%.3f"], [_power=1.0])
```   
If v_min >= v_max we have no bound

---

#### `imguigml_drag_float2`   
| | | 
| ---------------------- | --------- |   
**_label**               | {String}    
**_v**                   | {Real}    
**_v2**                  | {Real}    
**[_v_speed=1.0]**       | {Real}    
**[_v_min=0.0]**         | {Real}    
**[_v_max=0.0]**         | {Real}    
**[_displayFmt="%.3f"]** | {String}    
**[_power=1.0]**         | {Real}    
**returns**: |          {Array:[_changed, _v, _v2]}   
```
imguigml_drag_float2(_label, _v, _v2, [_v_speed=1.0], [_v_min=0.0], [_v_max=0.0], [_displayFmt="%.3f"], [_power=1.0])
```   
If v_min >= v_max we have no bound

---

#### `imguigml_drag_float3`   
| | | 
| ---------------------- | --------- |   
**_label**               | {String}    
**_v**                   | {Real}    
**_v2**                  | {Real}    
**_v3**                  | {Real}    
**[_v_speed=1.0]**       | {Real}    
**[_v_min=0.0]**         | {Real}    
**[_v_max=0.0]**         | {Real}    
**[_displayFmt="%.3f"]** | {String}    
**[_power=1.0]**         | {Real}    
**returns**: |          {Array:[_changed, _v, _v2, _v3]}   
```
imguigml_drag_float3(_label, _v, _v2, _v3, [_v_speed=1.0], [_v_min=0.0], [_v_max=0.0], [_displayFmt="%.3f"], [_power=1.0])
```   
If v_min >= v_max we have no bound

---

#### `imguigml_drag_float4`   
| | | 
| ---------------------- | --------- |   
**_label**               | {String}    
**_v**                   | {Real}    
**_v2**                  | {Real}    
**_v3**                  | {Real}    
**_v4**                  | {Real}    
**[_v_speed=1.0]**       | {Real}    
**[_v_min=0.0]**         | {Real}    
**[_v_max=0.0]**         | {Real}    
**[_displayFmt="%.3f"]** | {String}    
**[_power=1.0]**         | {Real}    
**returns**: |          {Array:[_changed, _v, _v2, _v3, _v4]}   
```
imguigml_drag_float4(_label, _v, _v2, _v3, _v4, [_v_speed=1.0], [_v_min=0.0], [_v_max=0.0], [_displayFmt="%.3f"], [_power=1.0])
```   
If v_min >= v_max we have no bound

---

#### `imguigml_drag_float_range2`   
| | | 
| ---------------------------- | --------- |   
**_label**                     | {String}    
**_v_current_min**             | {Real}    
**_v_current_max**             | {Real}    
**[_v_speed=1.0]**             | {Real}    
**[_v_min=0.0]**               | {Real}    
**[_v_max=0.0]**               | {Real}    
**[_displayFmt="%.0f"]**       | {String}    
**[_displayFmtMax=undefined]** | {String}    
**[_power=1.0]**               | {Real}    
**returns**: |                {Array:[_changed, _min, _max]}   
```
imguigml_drag_float_range2(_label, _v_current_min, _v_current_max, [_v_speed=1.0], [_v_min=0.0], [_v_max=0.0], [_displayFmt="%.0f"], [_displayFmtMax=undefined], [_power=1.0])
```   
drag an integer range 2?

---

#### `imguigml_drag_int`   
| | | 
| ---------------------- | --------- |   
**_label**               | {String}    
**_v**                   | {Real}    
**[_v_speed=1.0]**       | {Real}    
**[_v_min=0.0]**         | {Real}    
**[_v_max=0.0]**         | {Real}    
**[_displayFmt="%.0f"]** | {String}    
**returns**: |          {Array:[_changed, _v]}   
```
imguigml_drag_int(_label, _v, [_v_speed=1.0], [_v_min=0.0], [_v_max=0.0], [_displayFmt="%.0f"])
```   
If v_min >= v_max we have no bound

---

#### `imguigml_drag_int2`   
| | | 
| ---------------------- | --------- |   
**_label**               | {String}    
**_v**                   | {Real}    
**_v2**                  | {Real}    
**[_v_speed=1.0]**       | {Real}    
**[_v_min=0.0]**         | {Real}    
**[_v_max=0.0]**         | {Real}    
**[_displayFmt="%.0f"]** | {String}    
**returns**: |          {Array:[_changed, _v, _v2]}   
```
imguigml_drag_int2(_label, _v, _v2, [_v_speed=1.0], [_v_min=0.0], [_v_max=0.0], [_displayFmt="%.0f"])
```   
If v_min >= v_max we have no bound

---

#### `imguigml_drag_int3`   
| | | 
| ---------------------- | --------- |   
**_label**               | {String}    
**_v**                   | {Real}    
**_v2**                  | {Real}    
**_v3**                  | {Real}    
**[_v_speed=1.0]**       | {Real}    
**[_v_min=0.0]**         | {Real}    
**[_v_max=0.0]**         | {Real}    
**[_displayFmt="%.0f"]** | {String}    
**returns**: |          {Array:[_changed, _v, _v2, _v3]}   
```
imguigml_drag_int3(_label, _v, _v2, _v3, [_v_speed=1.0], [_v_min=0.0], [_v_max=0.0], [_displayFmt="%.0f"])
```   
If v_min >= v_max we have no bound

---

#### `imguigml_drag_int4`   
| | | 
| ---------------------- | --------- |   
**_label**               | {String}    
**_v**                   | {Real}    
**_v2**                  | {Real}    
**_v3**                  | {Real}    
**_v4**                  | {Real}    
**[_v_speed=1.0]**       | {Real}    
**[_v_min=0.0]**         | {Real}    
**[_v_max=0.0]**         | {Real}    
**[_displayFmt="%.0f"]** | {String}    
**returns**: |          {Array:[_changed, _v, _v2, _v3, _v4]}   
```
imguigml_drag_int4(_label, _v, _v2, _v3, _v4, [_v_speed=1.0], [_v_min=0.0], [_v_max=0.0], [_displayFmt="%.0f"])
```   
If v_min >= v_max we have no bound

---

#### `imguigml_drag_int_range2`   
| | | 
| ---------------------------- | --------- |   
**_label**                     | {String}    
**_v_current_min**             | {Real}    
**_v_current_max**             | {Real}    
**[_v_speed=1.0]**             | {Real}    
**[_v_min=0]**                 | {Real}    
**[_v_max=0]**                 | {Real}    
**[_displayFmt="%.0f"]**       | {String}    
**[_displayFmtMax=undefined]** | {String}    
**returns**: |                {Array:[_changed, _min, _max]}   
```
imguigml_drag_int_range2(_label, _v_current_min, _v_current_max, [_v_speed=1.0], [_v_min=0], [_v_max=0], [_displayFmt="%.0f"], [_displayFmtMax=undefined])
```   
drag an integer range 2?

---

#### `imguigml_input_text`   
| | | 
| ----------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------- |   
**_label**                | {String} label to show next to the input   
**_text**                 | {String} text to pre-fill field with   
**_max_length**           | {Real} max length to allow text   
**[_flags=0]**            | {Real:EImGui_InputTextFlags} input text flags (see enum)   
**[_callback=noone]**     | {Real} a call back that takes ({Array:EImGui_TextCallbackData}, [_user_data]) and returns != 0 on char filter to remove character (otherwise return is ignored)   
**[_userdata=undefined]** | {*} data passed to the callback   
**returns**: |           {Array:[_changed, _text]}   
```
imguigml_input_text(_label, _text, _max_length, [_flags=0], [_callback=noone], [_userdata=undefined])
```   
add an input text field

---

#### `imguigml_input_text_multiline`   
| | | 
| ----------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------- |   
**_label**                | {String}    
**_text**                 | {String}    
**_max_len**              | {Real}    
**_size_x**               | {Real}    
**_size_y**               | {Real}    
**[_flags=0]**            | {Real:EImGui_InputTextFlags}    
**[_callback=noone]**     | {Real} a call back that takes ({Array:EImGui_TextCallbackData}, [_user_data]) and returns != 0 on char filter to remove character (otherwise return is ignored)   
**[_userdata=undefined]** | {*} data passed to the callback   
**returns**: |           {Array:[_changed, _text]}   
```
imguigml_input_text_multiline(_label, _text, _max_len, _size_x, _size_y, [_flags=0], [_callback=noone], [_userdata=undefined])
```   
add an input text field

---

#### `imguigml_input_float`   
| | | 
| ------------------------- | -------------------------- |   
**_label**                  | {String}    
**_val**                    | {Real}    
**[_step=0.0f]**            | {Real}    
**[_step_fast=0.0f]**       | {Real}    
**[_decimal_precision=-1]** | {Real}    
**[_extra_flags=0])**       | {Real:EImGui_WindowFlags}    
**returns**: |             {Array:[_changed, _val]}   
```
imguigml_input_float(_label, _val, [_step=0.0f], [_step_fast=0.0f], [_decimal_precision=-1], [_extra_flags=0]))
```   
keyboard input field float

---

#### `imguigml_input_float2`   
| | | 
| ------------------------- | ----------------------------- |   
**_label**                  | {String}    
**_val**                    | {Real}    
**_val2**                   | {Real}    
**[_decimal_precision=-1]** | {Real}    
**[_extra_flags=0])**       | {Real:EImGui_InputTextFlags}    
**returns**: |             {Array:[_changed, _val, _val2]}   
```
imguigml_input_float2(_label, _val, _val2, [_decimal_precision=-1], [_extra_flags=0]))
```   
keyboard input field float

---

#### `imguigml_input_float3`   
| | | 
| ------------------------- | ----------------------------- |   
**_label**                  | {String}    
**_val**                    | {Real}    
**_val2**                   | {Real}    
**_val3**                   | {Real}    
**[_decimal_precision=-1]** | {Real}    
**[_extra_flags=0])**       | {Real:EImGui_InputTextFlags}    
**returns**: |             {Array:[_changed, _val, _val2, _val3]}   
```
imguigml_input_float3(_label, _val, _val2, _val3, [_decimal_precision=-1], [_extra_flags=0]))
```   
keyboard input field float

---

#### `imguigml_input_float4`   
| | | 
| ------------------------- | ----------------------------- |   
**_label**                  | {String}    
**_val**                    | {Real}    
**_val2**                   | {Real}    
**_val3**                   | {Real}    
**_val4**                   | {Real}    
**[_decimal_precision=-1]** | {Real}    
**[_extra_flags=0])**       | {Real:EImGui_InputTextFlags}    
**returns**: |             {Array:[_changed, _val, _val2, _val3, _val4]}   
```
imguigml_input_float4(_label, _val, _val2, _val3, _val4, [_decimal_precision=-1], [_extra_flags=0]))
```   
keyboard input field float

---

#### `imguigml_input_int`   
| | | 
| ------------------- | ----------------------------- |   
**_label**            | {String}    
**_val**              | {Real}    
**[_step=1]**         | {Real}    
**[_step_fast=100]**  | {Real}    
**[_extra_flags=0])** | {Real:EImGui_InputTextFlags}    
**returns**: |       {Array:[_changed, _val]}   
```
imguigml_input_int(_label, _val, [_step=1], [_step_fast=100], [_extra_flags=0]))
```   
keyboard input field float

---

#### `imguigml_input_int2`   
| | | 
| ------------------- | ----------------------------- |   
**_label**            | {String}    
**_val**              | {Real}    
**_val2**             | {Real}    
**[_extra_flags=0])** | {Real:EImGui_InputTextFlags}    
**returns**: |       {Array:[_changed, _val, _val2]}   
```
imguigml_input_int2(_label, _val, _val2, [_extra_flags=0]))
```   
keyboard input field float

---

#### `imguigml_input_int3`   
| | | 
| ------------------- | ----------------------------- |   
**_label**            | {String}    
**_val**              | {Real}    
**_val2**             | {Real}    
**_val3**             | {Real}    
**[_extra_flags=0])** | {Real:EImGui_InputTextFlags}    
**returns**: |       {Array:[_changed, _val, _val2, _val3]}   
```
imguigml_input_int3(_label, _val, _val2, _val3, [_extra_flags=0]))
```   
keyboard input field float

---

#### `imguigml_input_int4`   
| | | 
| ------------------- | ----------------------------- |   
**_label**            | {String}    
**_val**              | {Real}    
**_val2**             | {Real}    
**_val3**             | {Real}    
**_val4**             | {Real}    
**[_extra_flags=0])** | {Real:EImGui_InputTextFlags}    
**returns**: |       {Array:[_changed, _val, _val2, _val3, _val4]}   
```
imguigml_input_int4(_label, _val, _val2, _val3, _val4, [_extra_flags=0]))
```   
keyboard input field float

---

#### `imguigml_button`   
| | | 
| --------------- | --------------------- |   
**_label**        | {String} button label   
**[_size_x=0.0]** | {Real} width   
**[_size_y=0.0]** | {Real} height   
**returns**: |   {Boolean} pressed   
```
imguigml_button(_label, [_size_x=0.0], [_size_y=0.0])
```   
ImGui::Button()

---

#### `imguigml_small_button`   
| | | 
| ---------- | --------------------- |   
**_label**   | {String} button label   
**returns**: | {Boolean}   
```
imguigml_small_button(_label)
```   
button with FramePadding=(0,0) to easily embed within text

---

#### `imguigml_invisible_button`   
| | | 
| --------------- | ------------------ |   
**_str_id**       | {String} string id   
**[_size_x=0.0]** | {Real} width   
**[_size_y=0.0]** | {Real} height   
**returns**: |   {Boolean}   
```
imguigml_invisible_button(_str_id, [_size_x=0.0], [_size_y=0.0])
```   
ImGui::InvisibleButton()

---

#### `imguigml_image`   
| | | 
| ----------------- | --------------------- |   
**_texture_id**     | {Real} texture id   
**_size_x**         | {Real} width   
**_size_y**         | {Real} height   
**[_u0=0.0]**       | {Real} texture u0   
**[_v0=0.0]**       | {Real} texture v0   
**[_u1=1.0]**       | {Real} texture u1   
**[_v1=1.0]**       | {Real} texture v1   
**[_tint_r=1.0]**   | {Real} tint color r   
**[_tint_g=1.0]**   | {Real} tint color g   
**[_tint_b=1.0]**   | {Real} tint color b   
**[_tint_a=1.0]**   | {Real} tint color a   
**[_border_r=0.0]** | {Real} border color r   
**[_border_g=0.0]** | {Real} border color g   
**[_border_b=0.0]** | {Real} border color b   
**[_border_a=0.0]** | {Real} border color a   
**returns**: |     None   
```
imguigml_image(_texture_id, _size_x, _size_y, [_u0=0.0], [_v0=0.0], [_u1=1.0], [_v1=1.0], [_tint_r=1.0], [_tint_g=1.0], [_tint_b=1.0], [_tint_a=1.0], [_border_r=0.0], [_border_g=0.0], [_border_b=0.0], [_border_a=0.0])
```   
ImGui::Image()

---

#### `imguigml_surface`   
| | | 
| -------------------- | -------------------------------------------------- |   
**_surface**           | {Real} surface   
**[width=undefined]**  | {Real} width will use surface_width if undefined   
**[height=undefined]** | {Real} height will use surface_height if undefined   
**[_u0=0.0]**          | {Real} texture u0   
**[_v0=0.0]**          | {Real} texture v0   
**[_u1=1.0]**          | {Real} texture u1   
**[_v1=1.0]**          | {Real} texture v1   
**[_tint_r=1.0]**      | {Real} tint color r   
**[_tint_g=1.0]**      | {Real} tint color g   
**[_tint_b=1.0]**      | {Real} tint color b   
**[_tint_a=1.0]**      | {Real} tint color a   
**[_border_r=0.0]**    | {Real} border color r   
**[_border_g=0.0]**    | {Real} border color g   
**[_border_b=0.0]**    | {Real} border color b   
**[_border_a=0.0]**    | {Real} border color a   
**returns**: |        None   
```
imguigml_surface(_surface, [width=undefined], [height=undefined], [_u0=0.0], [_v0=0.0], [_u1=1.0], [_v1=1.0], [_tint_r=1.0], [_tint_g=1.0], [_tint_b=1.0], [_tint_a=1.0], [_border_r=0.0], [_border_g=0.0], [_border_b=0.0], [_border_a=0.0])
```   
ImGui::Image()

---

#### `imguigml_sprite`   
| | | 
| --------------------- | ----------------------------------------------------- |   
**_sprite_index**       | {Real} sprite   
**_sub_img**            | {Real} sprite_index   
**[_width=undefined]**  | {Real} width will use sprite_get_width if undefined   
**[_height=undefined]** | {Real} height will use sprite_get_height if undefined   
**[_tint_r=1.0]**       | {Real} tint color r   
**[_tint_g=1.0]**       | {Real} tint color g   
**[_tint_b=1.0]**       | {Real} tint color b   
**[_tint_a=1.0]**       | {Real} tint color a   
**[_border_r=0.0]**     | {Real} border color r   
**[_border_g=0.0]**     | {Real} border color g   
**[_border_b=0.0]**     | {Real} border color b   
**[_border_a=0.0]**     | {Real} border color a   
**returns**: |         None   
```
imguigml_sprite(_sprite_index, _sub_img, [_width=undefined], [_height=undefined], [_tint_r=1.0], [_tint_g=1.0], [_tint_b=1.0], [_tint_a=1.0], [_border_r=0.0], [_border_g=0.0], [_border_b=0.0], [_border_a=0.0])
```   
ImGui::Image()

---

#### `imguigml_image_button`   
| | | 
| --------------------- | ----------------------------------------------------------------------------- |   
**_texture_id**         | {Real} texture id   
**_size_x**             | {Real} width   
**_size_y**             | {Real} height   
**[_u0=0.0]**           | {Real} texture u0   
**[_v0=0.0]**           | {Real} texture v0   
**[_u1=1.0]**           | {Real} texture u1   
**[_v1=1.0]**           | {Real} texture v1   
**[_frame_padding=-1]** | {Real} <0 frame_padding uses default frame padding settings. 0 for no padding   
**[_bg_r=0.0]**         | {Real} bg color r   
**[_bg_g=0.0]**         | {Real} bg color g   
**[_bg_b=0.0]**         | {Real} bg color b   
**[_bg_a=0.0]**         | {Real} bg color a   
**[_tint_r=1.0]**       | {Real} tint color r   
**[_tint_g=1.0]**       | {Real} tint color g   
**[_tint_b=1.0]**       | {Real} tint color b   
**[_tint_a=1.0]**       | {Real} tint color a   
**returns**: |         {Boolean} _pressed   
```
imguigml_image_button(_texture_id, _size_x, _size_y, [_u0=0.0], [_v0=0.0], [_u1=1.0], [_v1=1.0], [_frame_padding=-1], [_bg_r=0.0], [_bg_g=0.0], [_bg_b=0.0], [_bg_a=0.0], [_tint_r=1.0], [_tint_g=1.0], [_tint_b=1.0], [_tint_a=1.0])
```   
ImGui::ImageButton()

---

#### `imguigml_surface_button`   
| | | 
| --------------------- | ----------------------------------------------------------------------------- |   
**_surface**            | {Real} surface index   
**[width=undefined]**   | {Real} width will use surface_width if undefined   
**[height=undefined]**  | {Real} height will use surface_height if undefined   
**[_u0=0.0]**           | {Real} texture u0   
**[_v0=0.0]**           | {Real} texture v0   
**[_u1=1.0]**           | {Real} texture u1   
**[_v1=1.0]**           | {Real} texture v1   
**[_frame_padding=-1]** | {Real} <0 frame_padding uses default frame padding settings. 0 for no padding   
**[_bg_r=0.0]**         | {Real} bg color r   
**[_bg_g=0.0]**         | {Real} bg color g   
**[_bg_b=0.0]**         | {Real} bg color b   
**[_bg_a=0.0]**         | {Real} bg color a   
**[_tint_r=1.0]**       | {Real} tint color r   
**[_tint_g=1.0]**       | {Real} tint color g   
**[_tint_b=1.0]**       | {Real} tint color b   
**[_tint_a=1.0]**       | {Real} tint color a   
**returns**: |         {Boolean} _pressed   
```
imguigml_surface_button(_surface, [width=undefined], [height=undefined], [_u0=0.0], [_v0=0.0], [_u1=1.0], [_v1=1.0], [_frame_padding=-1], [_bg_r=0.0], [_bg_g=0.0], [_bg_b=0.0], [_bg_a=0.0], [_tint_r=1.0], [_tint_g=1.0], [_tint_b=1.0], [_tint_a=1.0])
```   
Add an ImGui button that uses a surface for its appearance

---

#### `imguigml_sprite_button`   
| | | 
| --------------------- | ----------------------------------------------------------------------------- |   
**_sprite_index**       | {Real} sprite   
**_sub_img**            | {Real} image_index   
**[_width=undefined]**  | {Real} width will use sprite_get_width if undefined   
**[_height=undefined]** | {Real} height will use sprite_get_height if undefined   
**[_frame_padding=-1]** | {Real} <0 frame_padding uses default frame padding settings. 0 for no padding   
**[_bg_r=0.0]**         | {Real} bg color r   
**[_bg_g=0.0]**         | {Real} bg color g   
**[_bg_b=0.0]**         | {Real} bg color b   
**[_bg_a=0.0]**         | {Real} bg color a   
**[_tint_r=1.0]**       | {Real} tint color r   
**[_tint_g=1.0]**       | {Real} tint color g   
**[_tint_b=1.0]**       | {Real} tint color b   
**[_tint_a=1.0]**       | {Real} tint color a   
**returns**: |         {Boolean} _pressed   
```
imguigml_sprite_button(_sprite_index, _sub_img, [_width=undefined], [_height=undefined], [_frame_padding=-1], [_bg_r=0.0], [_bg_g=0.0], [_bg_b=0.0], [_bg_a=0.0], [_tint_r=1.0], [_tint_g=1.0], [_tint_b=1.0], [_tint_a=1.0])
```   
ImGui::ImageButton()

---

#### `imguigml_checkbox`   
| | | 
| ---------- | --------------------- |   
**_label**   | {String} button label   
**_val**     | {Boolean} checked   
**returns**: | {Array: [_changed, _val] } checked   
```
imguigml_checkbox(_label, _val)
```   
ImGui::Checkbox()

---

#### `imguigml_checkbox_flags`   
| | | 
| ----------- | ----------------------------- |   
**_label**    | {String} button label   
**_flags**    | {Real} check flags   
**_flag_val** | {Real} current value of flags   
**returns**: | {Real} _flags result   
```
imguigml_checkbox_flags(_label, _flags, _flag_val)
```   
Show a checkbox with multiple flags

---

#### `imguigml_radio_button`   
| | | 
| -------------- | ------------------------------------------------ |   
**_label**       | {String} button label   
**_activeOrVal** | {Real} radio button value, or if this is checked   
**_current_val** | {Real} current value of radio buttons   
**returns**: |  {Real} val result if _current_val passed   
```
imguigml_radio_button(_label, _activeOrVal, _current_val)
```   
Show a radio button (multiple choice, single answer)

---

#### `imguigml_plot_lines`   
| | | 
| ------------------------- | --------- |   
**_label**                  | {String}    
**_values**                 | {Array}    
**[_values_offset=0]**      | {Real}    
**[_overlay=undefined]**    | {String}    
**[_scale_min=undefined]**  | {Real}    
**[_scale_max=undefined]**  | {Real}    
**[_graph_size_x=0]**       | {Real}    
**[_graph_size_y=0]**       | {Real}    
**[_stride=sizeof(float)]** | {Real}    
**returns**: |             None   
```
imguigml_plot_lines(_label, _values, [_values_offset=0], [_overlay=undefined], [_scale_min=undefined], [_scale_max=undefined], [_graph_size_x=0], [_graph_size_y=0], [_stride=sizeof(float)])
```   
Plots a line graph, index as x axis values for y

---

#### `imguigml_plot_histogram`   
| | | 
| ------------------------- | --------- |   
**_label**                  | {String}    
**_values**                 | {Array}    
**[_values_offset=0]**      | {Real}    
**[_overlay=undefined]**    | {String}    
**[_scale_min=undefined]**  | {Real}    
**[_scale_max=undefined]**  | {Real}    
**[_graph_size_x=0]**       | {Real}    
**[_graph_size_y=0]**       | {Real}    
**[_stride=sizeof(float)]** | {Real}    
**returns**: |             None   
```
imguigml_plot_histogram(_label, _values, [_values_offset=0], [_overlay=undefined], [_scale_min=undefined], [_scale_max=undefined], [_graph_size_x=0], [_graph_size_y=0], [_stride=sizeof(float)])
```   
Plots a histogram.

---

#### `imguigml_progress_bar`   
| | | 
| ---------------------- | --------------------------------------------------------------- |   
**_fraction**            | {String}    
**[_size_x=-1.0]**       | {Real} < 0.0f: align to end, 0.0f: auto, > 0.0f: specified size   
**[_size_y=0.0]**        | {Real} < 0.0f: align to end, 0.0f: auto, > 0.0f: specified size   
**[_overlay=undefined]** | {String}    
**returns**: |          None   
```
imguigml_progress_bar(_fraction, [_size_x=-1.0], [_size_y=0.0], [_overlay=undefined])
```   
false

---

#### `imguigml_text`   
| | | 
| ---------- | --------- |   
**_text**    | {String}    
**returns**: | None   
```
imguigml_text(_text)
```   
simple formatted text

---

#### `imguigml_text_colored`   
| | | 
| ---------- | --------- |   
**_r**       | {Real}    
**_g**       | {Real}    
**_b**       | {Real}    
**_a**       | {Real}    
**_text**    | {String}    
**returns**: | None   
```
imguigml_text_colored(_r, _g, _b, _a, _text)
```   
shortcut for PushStyleColor(ImGuiCol_Text, style.Colors[ImGuiCol_TextDisabled]); Text(fmt, ...); PopStyleColor();

---

#### `imguigml_text_disabled`   
| | | 
| ---------- | --------- |   
**_text**    | {String}    
**returns**: | None   
```
imguigml_text_disabled(_text)
```   
shortcut for PushStyleColor(ImGuiCol_Text, style.Colors[ImGuiCol_TextDisabled]); Text(fmt, ...); PopStyleColor();

---

#### `imguigml_text_wrapped`   
| | | 
| ---------- | --------- |   
**_text**    | {String}    
**returns**: | None   
```
imguigml_text_wrapped(_text)
```   
shortcut for `imguigml_push_text_wrap_pos(0.0f); imguigml_text(_text); imguigml_pop_text_wrap_pos();`.

---

#### `imguigml_label_text`   
| | | 
| ---------- | --------- |   
**_label**   | {String}    
**_text**    | {String}    
**returns**: | None   
```
imguigml_label_text(_label, _text)
```   
display text+label aligned the same way as value+label widgets

---

#### `imguigml_bullet_text`   
| | | 
| ---------- | --------- |   
**_text**    | {String}    
**returns**: | None   
```
imguigml_bullet_text(_text)
```   
shortcut for Bullet()+Text()

---

#### `imguigml_bullet`   
**returns**: None   
```
imguigml_bullet()
```   
draw a small circle and keep the cursor on the same line.       advance cursor x position by GetTreeNodeToLabelSpacing(), same distance that TreeNode() uses

---

#### `imguigml_tree_node`   
| | | 
| ------------ | ------------------------------------------------------------ |   
**_labelOrId** | {String|Real} a label or id to use used as id if passed real   
**returns**: | {Boolean} if returning 'true' the node is open and the tree id is pushed into the id stack. user is responsible for calling TreePop().   
```
imguigml_tree_node(_labelOrId)
```   
begin a tree node

---

#### `imguigml_tree_node_ex`   
| | | 
| ------------ | ------------------------------------------------------------ |   
**_labelOrId** | {String|Real} a label or id to use used as id if passed real   
**[_flags=0]** | {Real:EImGui_TreeNodeFlags}    
**returns**: | {Boolean} if returning 'true' the node is open and the tree id is pushed into the id stack. user is responsible for calling TreePop().   
```
imguigml_tree_node_ex(_labelOrId, [_flags=0])
```   
begin a tree node

---

#### `imguigml_tree_push`   
| | | 
| ------------ | ------------------------------------------------------------ |   
**_labelOrId** | {String|Real} a label or id to use used as id if passed real   
**returns**: | None   
```
imguigml_tree_push(_labelOrId)
```   
Indent()+PushId(). Already called by TreeNode() when returning true, but you can call Push/Pop yourself for layout purpose

---

#### `imguigml_tree_pop`   
**returns**: None   
```
imguigml_tree_pop()
```   
~ Unindent()+PopId()

---

#### `imguigml_tree_advance_to_label_pos`   
**returns**: None   
```
imguigml_tree_advance_to_label_pos()
```   
advance cursor x position by GetTreeNodeToLabelSpacing()

---

#### `imguigml_get_tree_node_to_label_spacing`   
**returns**: {Real}   
```
imguigml_get_tree_node_to_label_spacing()
```   
false

---

#### `imguigml_set_next_tree_node_open`   
| | | 
| ----------- | ------------------- |   
**_is_open**  | {Boolean}    
**[_cond=0]** | {Real:EImGui_Cond}    
**returns**: | None   
```
imguigml_set_next_tree_node_open(_is_open, [_cond=0])
```   
set next TreeNode/CollapsingHeader open state.

---

#### `imguigml_collapsing_header`   
| | | 
| ------------------- | -------------------------------------------------------------------------------------------------------------- |   
**_label**            | {String}    
**[_open=undefined]** | {Boolean} when `open` isn't `undefined`, display an additional small close button on upper right of the header   
**[_flags=0]**        | {Real:EImGui_TreeNodeFlags]    
**returns**: |       {Array:[_collapsed, [_open]} if returning 'true' the header is open. doesn't indent nor push on ID stack. user doesn't have to call TreePop().   
```
imguigml_collapsing_header(_label, [_open=undefined], [_flags=0])
```   
add a collapsing header

---

#### `imguigml_begin`   
| | | 
| ------------------- | ----------------------------------------------------------------------------------------- |   
**_name**             | {String} title for window   
**[_open=undefined]** | {Real} pass true/false for if this window is open w/close button, undefined for no button   
**[_flags=0]**        | {Real:EImGui_WindowFlags} window flags   
**returns**: |       {Array:[_expanded, [_open]]}   
```
imguigml_begin(_name, [_open=undefined], [_flags=0])
```   
Push a new ImGui window to add widgets to.

---

#### `imguigml_end`   
**returns**: None   
```
imguigml_end()
```   
ImGui::End()

---

#### `imguigml_begin_child`   
| | | 
| ------------------ | -------------------------------------------------------------------------------------------------------------------------- |   
**_id**              | {Real|String}    
**[_size_x=0]**      | {Real} size==0.0f: use remaining window size, size<0.0f: use remaining window size minus abs(size). size>0.0f: fixed size.   
**[_size_y=0]**      | {Real} size==0.0f: use remaining window size, size<0.0f: use remaining window size minus abs(size). size>0.0f: fixed size.   
**[_border=false]**  | {Boolean}    
**[_extra_flags=0]** | {Real:EImGui_WindowFlags}    
**returns**: |      {Boolean} false when collapsed   
```
imguigml_begin_child(_id, [_size_x=0], [_size_y=0], [_border=false], [_extra_flags=0])
```   
begin a scrolling region. each axis can use a different mode, e.g. ImVec2(0,400).

---

#### `imguigml_end_child`   
**returns**: None   
```
imguigml_end_child()
```   
end a scrolling region

---

#### `imguigml_get_content_region_max`   
**returns**: {Array:EPos2D} boundaries   
```
imguigml_get_content_region_max()
```   
current content boundaries (typically window boundaries including scrolling, or current column boundaries), in windows coordinates

---

#### `imguigml_get_content_region_avail`   
**returns**: {Array:EPos2D} region   
```
imguigml_get_content_region_avail()
```   
== GetContentRegionMax() - GetCursorPos()

---

#### `imguigml_get_content_region_avail_width`   
**returns**: {Real} width   
```
imguigml_get_content_region_avail_width()
```   
get available width

---

#### `imguigml_get_window_content_region_min`   
**returns**: {Array:EPos2D} region   
```
imguigml_get_window_content_region_min()
```   
content boundaries min (roughly (0,0)-Scroll), in window coordinates

---

#### `imguigml_get_window_content_region_max`   
**returns**: {Array:EPos2D}   
```
imguigml_get_window_content_region_max()
```   
content boundaries max (roughly (0,0)+Size-Scroll) where Size can be override with SetNextWindowContentSize(), in window coordinates

---

#### `imguigml_get_window_content_region_width`   
**returns**: {Real} content width   
```
imguigml_get_window_content_region_width()
```   
content width in windows coordinates

---

#### `imguigml_get_window_pos`   
**returns**: {Array:EPos2D} window pos   
```
imguigml_get_window_pos()
```   
get current window position in screen space (useful if you want to do your own drawing via the DrawList api)

---

#### `imguigml_get_window_size`   
**returns**: {Array:E2D} size   
```
imguigml_get_window_size()
```   
get current window size

---

#### `imguigml_get_window_width`   
**returns**: {Real} width   
```
imguigml_get_window_width()
```   
get current window width

---

#### `imguigml_get_window_height`   
**returns**: {Real} height   
```
imguigml_get_window_height()
```   
get current window height

---

#### `imguigml_is_window_collapsed`   
**returns**: {Boolean} is current window collapsed   
```
imguigml_is_window_collapsed()
```   
is current window collapsed

---

#### `imguigml_is_window_appearing`   
**returns**: {Boolean} is current window appearing   
```
imguigml_is_window_appearing()
```   
is current window appearing

---

#### `imguigml_set_window_font_scale`   
| | | 
| ---------- | --------------------------------- |   
**_scale**   | {Real} font scale for this window   
**returns**: | None   
```
imguigml_set_window_font_scale(_scale)
```   
per-window font scale. Adjust IO.FontGlobalScale if you want to scale all windows

---

#### `imguigml_set_next_window_pos`   
| | | 
| ----------- | --------------------------------------------------------- |   
**_x**        | {Real} pos x   
**_y**        | {Real} pos y   
**[_cond=0]** | {Real:EImGui_Cond} condition for setting (not a bit flag)   
**[_pivot_x** | {Real} = 0] used to center on a point   
**[_pivot_y** | {Real} = 0] used to center on a point   
**returns**: | None   
```
imguigml_set_next_window_pos(_x, _y, [_cond=0], [_pivot_x, [_pivot_y)
```   
set next window position. call before Begin(). use pivot=(0.5f,0.5f) to center on given point, etc.

---

#### `imguigml_set_next_window_size`   
| | | 
| ----------- | --------------------------------------------------------- |   
**_x**        | {Real} size x   
**_y**        | {Real} size y   
**[_cond=0]** | {Real:EImGui_Cond} condition for setting (not a bit flag)   
**returns**: | None   
```
imguigml_set_next_window_size(_x, _y, [_cond=0])
```   
set next window size. set axis to 0.0f to force an auto-fit on this axis. call before Begin()

---

#### `imguigml_set_next_window_size_constraints`   
| | | 
| ----------- | --------------------------------------------------------- |   
**_min_x**    | {Real} min size x   
**_min_y**    | {Real} min size y   
**_max_x**    | {Real} max size x   
**_max_y**    | {Real} max size y   
**[_cond=0]** | {Real:EImGui_Cond} condition for setting (not a bit flag)   
**returns**: | None   
```
imguigml_set_next_window_size_constraints(_min_x, _min_y, _max_x, _max_y, [_cond=0])
```   
set next window size limits. use -1,-1 on either X/Y axis to preserve the current size.

---

#### `imguigml_set_next_window_content_size`   
| | | 
| ---------- | ------------- |   
**_size_x**  | {Real} width   
**_size_y**  | {Real} height   
**returns**: | None   
```
imguigml_set_next_window_content_size(_size_x, _size_y)
```   
set next window content size (enforce the range of scrollbars). set axis to 0.0f to leave it automatic. call before Begin()

---

#### `imguigml_set_next_window_collapsed`   
| | | 
| ------------ | --------------------------------------------------------- |   
**_collapsed** | {Boolean} true if collapsed   
**[_cond=0]**  | {Real:EImGui_Cond} condition for setting (not a bit flag)   
**returns**: | None   
```
imguigml_set_next_window_collapsed(_collapsed, [_cond=0])
```   
set next window collapsed state. call before Begin()

---

#### `imguigml_set_next_window_focus`   
**returns**: None   
```
imguigml_set_next_window_focus()
```   
set next window to be focused / front-most. call before Begin()

---

#### `imguigml_set_window_pos`   
| | | 
| ----------- | --------------------------------------------------------- |   
**_name**     | {String} name   
**_pos_x**    | {Real} pos x   
**_pos_y**    | {Real} pos y   
**[_cond=0]** | {Real:EImGui_Cond} condition for setting (not a bit flag)   
**returns**: | None   
```
imguigml_set_window_pos(_name, _pos_x, _pos_y, [_cond=0])
```   
set named window position.

---

#### `imguigml_set_window_size`   
| | | 
| ----------- | --------------------------------------------------------- |   
**_name**     | {String} name   
**_size_x**   | {Real} size x   
**_size_y**   | {Real} size y   
**[_cond=0]** | {Real:EImGui_Cond} condition for setting (not a bit flag)   
**returns**: | None   
```
imguigml_set_window_size(_name, _size_x, _size_y, [_cond=0])
```   
set named window size. set axis to 0.0f to force an auto-fit on this axis.

---

#### `imguigml_set_window_collapsed`   
| | | 
| ------------ | --------------------------------------------------------- |   
**_name**      | {String} name   
**_collapsed** | {Boolean} true if collapsed   
**[_cond=0]**  | {Real:EImGui_Cond} condition for setting (not a bit flag)   
**returns**: | None   
```
imguigml_set_window_collapsed(_name, _collapsed, [_cond=0])
```   
set named window collapsed state

---

#### `imguigml_set_window_focus`   
| | | 
| ---------- | --------------------- |   
**_name**    | {String} named window   
**returns**: | None   
```
imguigml_set_window_focus(_name)
```   
set named window to be focused / front-most. use NULL to remove focus.

---

#### `imguigml_get_scroll_x`   
**returns**: {Real} [0..GetScrollMaxX()]   
```
imguigml_get_scroll_x()
```   
get scrolling amount [0..GetScrollMaxX()]

---

#### `imguigml_get_scroll_y`   
**returns**: {Real} [0..GetScrollMaxY()]   
```
imguigml_get_scroll_y()
```   
get scrolling amount [0..GetScrollMaxY()]

---

#### `imguigml_get_scroll_max_x`   
**returns**: {Real} scrolling amount ~~ ContentSize.X - WindowSize.X   
```
imguigml_get_scroll_max_x()
```   
get maximum scrolling amount ~~ ContentSize.X - WindowSize.X

---

#### `imguigml_get_scroll_max_y`   
**returns**: {Real} scrolling amount ~~ ContentSize.Y - WindowSize.Y   
```
imguigml_get_scroll_max_y()
```   
get maximum scrolling amount ~~ ContentSize.Y - WindowSize.Y

---

#### `imguigml_set_scroll_x`   
| | | 
| ----------- | ------------------------- |   
**_scroll_x** | {Real} 0..GetScrollMaxX()   
**returns**: | None   
```
imguigml_set_scroll_x(_scroll_x)
```   
set scrolling amount [0..GetScrollMaxX()]

---

#### `imguigml_set_scroll_y`   
| | | 
| ----------- | ------------------------- |   
**_scroll_y** | {Real} 0..GetScrollMaxY()   
**returns**: | None   
```
imguigml_set_scroll_y(_scroll_y)
```   
set scrolling amount [0..GetScrollMaxY()]

---

#### `imguigml_set_scroll_here`   
| | | 
| ----------------------- | ------------------------------------- |   
**[_center_y_ratio=0.0]** | {Real} top, 0.5: center, 1.0: bottom.   
**returns**: |           None   
```
imguigml_set_scroll_here([_center_y_ratio=0.0])
```   
adjust scrolling amount to make current cursor position visible.

---

#### `imguigml_set_scroll_from_pos_y`   
| | | 
| ----------------------- | ------------------------------------- |   
**[_center_y_ratio=0.0]** | {Real} top, 0.5: center, 1.0: bottom.   
**returns**: |           None   
```
imguigml_set_scroll_from_pos_y([_center_y_ratio=0.0])
```   
adjust scrolling amount to make given position valid. use GetCursorPos() or GetCursorStartPos()+offset to get valid positions.

---

#### `imguigml_set_keyboard_focus_here`   
| | | 
| ----------- | ----------------------------------------------------------------------------------------------------------------------- |   
**[_offset]** | {Real} Use positive 'offset' to access sub components of a multiple component widget. Use -1 to access previous widget.   
**returns**: | None   
```
imguigml_set_keyboard_focus_here([_offset])
```   
focus keyboard on the next widget.

---

#### `imguigml_set_state_storage`   
| | | 
| ---------- | ------------------- |   
**_tree**    | {*} todo: implement   
**returns**: | None   
```
imguigml_set_state_storage(_tree)
```   
replace tree state storage with our own (if you want to manipulate it yourself, typically clear subsection of it)

---

#### `imguigml_get_state_storage`   
| | | 
| ---------- | ------------------- |   
**_tree**    | {*} todo: implement   
**returns**: | None   
```
imguigml_get_state_storage(_tree)
```   
replace tree state storage with our own (if you want to manipulate it yourself, typically clear subsection of it)

---

#### `imguigml_begin_child_frame`   
| | | 
| ------------------ | -------------------------- |   
**_guiID**           | {Real} ImGui ID   
**_size_x**          | {Real} width   
**_size_y**          | {Real} height   
**[_extra_flags=0]** | {Real:EImGui_WindowFlags}    
**returns**: |      None   
```
imguigml_begin_child_frame(_guiID, _size_x, _size_y, [_extra_flags=0])
```   
helper to create a child window / scrolling region that looks like a normal widget frame

---

#### `imguigml_end_child_frame`   
| | | 
| ----------- | ----------------------------------------------------------------------------------------------------------------------- |   
**[_offset]** | {Real} Use positive 'offset' to access sub components of a multiple component widget. Use -1 to access previous widget.   
**returns**: | None   
```
imguigml_end_child_frame([_offset])
```   
helper to create a child window / scrolling region that looks like a normal widget frame

---

#### `imguigml_show_metrics_window`   
| | | 
| ------------------- | ------------------------------------------------- |   
**[_open=undefined]** | {Bool} if passed, gives the window a close button   
**returns**: |       {Array:[_expanded, [_open]]} (always expanded)   
```
imguigml_show_metrics_window([_open=undefined])
```   
create metrics window. display ImGui internals: draw commands (with individual draw calls and vertices), window list, basic internal state, etc.

---

#### `imguigml_show_user_guide`   
**returns**: None   
```
imguigml_show_user_guide()
```   
add basic help/info block (not a window): how to manipulate ImGui as a end-user (mouse/keyboard controls).

---

#### `imguigml_show_demo_window`   
| | | 
| ------------------- | ------------------------------------------------- |   
**[_open=undefined]** | {Bool} if passed, gives the window a close button   
**returns**: |       {Array:[_expanded, [_open]]} (always expanded)   
```
imguigml_show_demo_window([_open=undefined])
```   
create demo/test window (previously called ShowTestWindow). demonstrate most ImGui features. call this to learn about the library! try to make it always available in your application!

---

#### `imguigml_show_font_selector`   
| | | 
| ---------- | --------- |   
**_label**   | {String}    
**returns**: | None   
```
imguigml_show_font_selector(_label)
```   
show a font selector **NOTE:** Functionality is limited at this time until `ImGuiGML` has better font support

---

#### `imguigml_begin_drag_drop_source`   
**returns**: None   
```
imguigml_begin_drag_drop_source()
```   
call when the current item is active. If this return true, you can call imguigml_set_drag_drop_payload() + imguigml_end_drag_drop_target()

---

#### `imguigml_set_drag_drop_payload`   
| | | 
| ------------- | ---------------------------------------------------------------------------------------------- |   
**_type**       | {String} type of payload. limited to 8 characters, starting with "_" is reserved for ImGui   
**_payload_id** | {Real} id for your payload **NOTE: Converted to an integer, so don't use a floating point id**   
**[_flags=0]**  | {Real:EImGui_Cond}    
**returns**: | {Bool} to be quite frank, i'm not sure what it means   
```
imguigml_set_drag_drop_payload(_type, _payload_id, [_flags=0])
```   
pass an id to use to identify your payload data, or use the imgiugml_generate_payload / imguigml_set_payload_data / imguigml_release_payload_data helper functions

---

#### `imguigml_end_drag_drop_source`   
**returns**: None   
```
imguigml_end_drag_drop_source()
```   
end the drag drop source

---

#### `imguigml_begin_drop_target`   
**returns**: None   
```
imguigml_begin_drop_target()
```   
call after submitting an item that may receive an item. If this returns true, you can call AcceptDragDropPayload() + EndDragDropTarget()

---

#### `imguigml_accept_drag_drop_payload`   
| | | 
| ------------ | ------------------------------------------------------------------------------------------ |   
**_type**      | {String} type of payload. limited to 8 characters, starting with "_" is reserved for ImGui   
**[_flags=0]** | {Real:EImGui_Cond}    
**returns**: | {Array|undefined} undefined if no drop, else [ _payload, _is_preview, _is_delivery ] delivery is when we've released the mouse button, preview we are just hovering   
```
imguigml_accept_drag_drop_payload(_type, [_flags=0])
```   
accept contents of a given type. If ImGuiDragDropFlags_AcceptBeforeDelivery is set you can peek into the payload before the mouse button is released.

---

#### `imguigml_end_drag_drop_target`   
**returns**: None   
```
imguigml_end_drag_drop_target()
```   
end drag drop target

---

#### `imguigml_payload`   
| | | 
| --------------- | -------------------------------------------------------------------------------- |   
**[_id]**         | {Real} if a first param is passed, it's used as the id   
**_payload_data** | {*} payload data can be anything and is returned with a `imguigml_payload_get()`   
**returns**: |   {Real} _id to pass to dragdrop functions   
```
imguigml_payload([_id], _payload_data)
```   
if an id is passed, use this id when looking up the payload, otherwise, return a generated id.      these ids work by clearing each ImGui `NewFrame` and starting over again. generally, this should function fine, however, if you're having id misses in dragndrop,      try just using your own unique id.

---

#### `imguigml_payload_get`   
| | | 
| ---------- | ------- |   
**_id**      | {Real}    
**returns**: | {*} _payload_data   
```
imguigml_payload_get(_id)
```   
return a payload given a passed _id.

---

#### `imguigml_combo`   
| | | 
| --------------- | ---------------------------------------------------------------------------- |   
**_label**        | {String}    
**_current_item** | {Real}    
**_items**        | {Array:String} [string unsupported] if a string, separate each item with a 0   
**returns**: |   {Array:[_changed, current_item]   
```
imguigml_combo(_label, _current_item, _items)
```   
false

---

#### `imguigml_begin_combo`   
| | | 
| -------------- | ------------------------- |   
**_label**       | {String}    
**_preview_val** | {String}    
**[_flags=0]**   | {Real:EImGui_ComboFlags}    
**returns**: |  {Bool}   
```
imguigml_begin_combo(_label, _preview_val, [_flags=0])
```   
begin a combo widget

---

#### `imguigml_end_combo`   
**returns**: None   
```
imguigml_end_combo()
```   
end a combo widget

---

#### `imguigml_io_ini_saving_rate`   
| | | 
| ---------- | ----------------------------------------- |   
**[_time]**  | {Real} sets time to use if passed (= 5.0)   
**{**        | returns Real } current time to use   
**returns**: | None   
```
imguigml_io_ini_saving_rate([_time], {)
```   
Maximum time between saving positions/sizes to .ini file, in seconds.

---

#### `imguigml_io_mouse_double_click_time`   
| | | 
| ---------- | ------------------------------------------ |   
**[_time]**  | {Real} sets time to use if passed (= 0.30)   
**{**        | returns Real } current time to use   
**returns**: | None   
```
imguigml_io_mouse_double_click_time([_time], {)
```   
Time for a double-click, in seconds.

---

#### `imguigml_io_mouse_double_click_max_dist`   
| | | 
| ------------- | ------------------------------------------ |   
**[_distance]** | {Real} sets max distance if passed (= 6.0)   
**{**           | returns Real } current max distance   
**returns**: | None   
```
imguigml_io_mouse_double_click_max_dist([_distance], {)
```   
Distance threshold to stay in to validate a double-click, in pixels.

---

#### `imguigml_io_mouse_drag_threshold`   
| | | 
| ------------- | ------------------------------------------------ |   
**[_distance]** | {Real} sets distance threshold if passed (= 6.0)   
**{**           | returns Real } current distance threshold   
**returns**: | None   
```
imguigml_io_mouse_drag_threshold([_distance], {)
```   
Distance threshold before considering we are dragging

---

#### `imguigml_io_key_repeat_delay`   
| | | 
| ---------- | ----------------------------------------------------- |   
**[_time]**  | {Real} sets time before repeating if passed (= 0.250)   
**{**        | returns Real } current time   
**returns**: | None   
```
imguigml_io_key_repeat_delay([_time], {)
```   
When holding a key/button, time before it starts repeating, in seconds (for buttons in Repeat mode, etc.).

---

#### `imguigml_io_key_repeat_rate`   
| | | 
| ---------- | ----------------------------------------- |   
**[_time]**  | {Real} sets repeat rate if passed (0.050)   
**{**        | returns Real } current repeat rate   
**returns**: | None   
```
imguigml_io_key_repeat_rate([_time], {)
```   
When holding a key/button, rate at which it repeats, in seconds.

---

#### `imguigml_io_font_global_scale`   
| | | 
| ---------- | ------------------------------------------------- |   
**[_scale]** | {Real} sets scale for all fonts if passed (= 1.0)   
**{**        | returns Real } current font scale   
**returns**: | None   
```
imguigml_io_font_global_scale([_scale], {)
```   
Global scale all fonts

---

#### `imguigml_io_font_allow_user_scaling`   
| | | 
| ------------ | ---------------------------------------------------- |   
**[_boolean]** | {Boolean} sets allow user scaling if passed (=false)   
**{**          | returns Boolean } current value   
**returns**: | None   
```
imguigml_io_font_allow_user_scaling([_boolean], {)
```   
Allow user scaling text of individual window with CTRL+Wheel.

---

#### `imguigml_io_display_framebuffer_scaling`   
| | | 
| ---------- | ---------------------------------- |   
**[_x=1.0]** | {Float} sets x value if passed   
**[_y=1.0]** | {Float} sets y value if passed   
**{**        | returns Array } [x value, y value]   
**returns**: | None   
```
imguigml_io_display_framebuffer_scaling([_x=1.0], [_y=1.0], {)
```   
**NOTE: DOES NOTHING FOR NOW** For retina display or other situations where window coordinates are different from framebuffer coordinates. User storage only, presently not used by ImGui.

---

#### `imguigml_io_display_visible_min`   
| | | 
| ---------- | ----------------------------------------- |   
**[_x]**     | {Float} sets min size on x axis if passed   
**[_y]**     | {Float} sets min size on y axis if passed   
**{**        | returns Array } [x min, y min]   
**returns**: | None   
```
imguigml_io_display_visible_min([_x], [_y], {)
```   
If you use DisplaySize as a virtual space larger than your screen, set DisplayVisibleMin/Max to the visible area.

---

#### `imguigml_io_display_visible_max`   
| | | 
| ---------- | ----------------------------------------- |   
**[_x]**     | {Float} sets max size on x axis if passed   
**[_y]**     | {Float} sets max size on y axis if passed   
**{**        | returns Array } [x max, y max]   
**returns**: | None   
```
imguigml_io_display_visible_max([_x], [_y], {)
```   
If the values are the same, we defaults to Min=(0.0f) and Max=DisplaySize

---

#### `imguigml_io_osx_behaviors`   
| | | 
| ------------ | ------------------------------- |   
**[_boolean]** | {Boolean} boolean (=IsApple)   
**{**          | returns Boolean } current value   
**returns**: | None   
```
imguigml_io_osx_behaviors([_boolean], {)
```   
OS X style: Text editing cursor movement using Alt instead of Ctrl, Shortcuts using Cmd/Super instead of Ctrl, Line/Text Start and End using Cmd+Arrows instead of Home/End, ouble click selects by word instead of selecting whole text, Multi-selection in lists uses Cmd/Super instead of Ctrl

---

#### `imguigml_io_ini_filename`   
| | | 
| ------------- | ------------------------------------ |   
**[_filename]** | {String} sets ini filename if passed   
**returns**: | {String} current ini filename   
```
imguigml_io_ini_filename([_filename])
```   
Path to .ini file. NULL to disable .ini saving.

---

#### `imguigml_io_log_filename`   
| | | 
| ---------- | ---------------------------- |   
**[_path]**  | {String} sets path if passed   
**returns**: | {String} current log filename path   
```
imguigml_io_log_filename([_path])
```   
Path to .log file - default parameter to ImGui::LogToFile when no file is specified. defaults to "imgui_log.txt

---

#### `imguigml_io_cursor_blink`   
| | | 
| ------------ | ------------------------------------------------- |   
**[_enabled]** | {Bool} if passed, sets cursor blink to `_enabled`   
**returns**: | {Bool}   
```
imguigml_io_cursor_blink([_enabled])
```   
allow input currsors to blink

---

#### `imguigml_drawlist_add_line`   
**returns**: None   
```
imguigml_drawlist_add_line()
```   
false

---

#### `imguigml_drawlist_add_rect`   
| | | 
| ----------------------------- | ------------------------------ |   
**_x1**                         | {Real}    
**_y1**                         | {Real}    
**_x2**                         | {Real}    
**_y2**                         | {Real}    
**_col**                        | {Real}    
**[_rounding=0.0]**             | {Real}    
**[_rounding_corner_flags=-1]** | {Real:EImGui_DrawCornerFlags}    
**[_thickness=1.0]**            | {Real}    
**returns**: |                 None   
```
imguigml_drawlist_add_rect(_x1, _y1, _x2, _y2, _col, [_rounding=0.0], [_rounding_corner_flags=-1], [_thickness=1.0])
```   
Adds a rectangle to the drawlist

---

#### `imguigml_drawlist_add_rect_filled`   
| | | 
| ----------------------------- | ------------------------------ |   
**_x1**                         | {Real}    
**_y1**                         | {Real}    
**_x2**                         | {Real}    
**_y2**                         | {Real}    
**_col**                        | {Real}    
**[_rounding=0.0]**             | {Real}    
**[_rounding_corner_flags=-1]** | {Real:EImGui_DrawCornerFlags}    
**returns**: |                 None   
```
imguigml_drawlist_add_rect_filled(_x1, _y1, _x2, _y2, _col, [_rounding=0.0], [_rounding_corner_flags=-1])
```   
Adds a filled rectangle to the drawlist

---

#### `imguigml_drawlist_add_rect_filled_multicolor`   
| | | 
| ---------- | ------- |   
**_x1**      | {Real}    
**_y1**      | {Real}    
**_x2**      | {Real}    
**_y2**      | {Real}    
**_colUL**   | {Real}    
**_colUR**   | {Real}    
**_colBR**   | {Real}    
**_colBL**   | {Real}    
**returns**: | None   
```
imguigml_drawlist_add_rect_filled_multicolor(_x1, _y1, _x2, _y2, _colUL, _colUR, _colBR, _colBL)
```   
Adds a multicolored filled rectangle to the drawlist

---

#### `imguigml_drawlist_add_quad`   
| | | 
| ------------------ | ------- |   
**_x1**              | {Real}    
**_y1**              | {Real}    
**_x2**              | {Real}    
**_y2**              | {Real}    
**_x3**              | {Real}    
**_y3**              | {Real}    
**_x4**              | {Real}    
**_y5**              | {Real}    
**_col**             | {Real}    
**[_thickness=1.0]** | {Real}    
**returns**: |      None   
```
imguigml_drawlist_add_quad(_x1, _y1, _x2, _y2, _x3, _y3, _x4, _y5, _col, [_thickness=1.0])
```   
Adds a quad to the drawlist

---

#### `imguigml_drawlist_add_quad_filled`   
| | | 
| ------------------ | ------- |   
**_x1**              | {Real}    
**_y1**              | {Real}    
**_x2**              | {Real}    
**_y2**              | {Real}    
**_x3**              | {Real}    
**_y3**              | {Real}    
**_x4**              | {Real}    
**_y5**              | {Real}    
**_col**             | {Real}    
**[_thickness=1.0]** | {Real}    
**returns**: |      None   
```
imguigml_drawlist_add_quad_filled(_x1, _y1, _x2, _y2, _x3, _y3, _x4, _y5, _col, [_thickness=1.0])
```   
Adds a filled quad to the draw list

---

#### `imguigml_drawlist_add_triangle`   
| | | 
| ------------------ | ------- |   
**_x1**              | {Real}    
**_y1**              | {Real}    
**_x2**              | {Real}    
**_y2**              | {Real}    
**_x3**              | {Real}    
**_y3**              | {Real}    
**_col**             | {Real}    
**[_thickness=1.0]** | {Real}    
**returns**: |      None   
```
imguigml_drawlist_add_triangle(_x1, _y1, _x2, _y2, _x3, _y3, _col, [_thickness=1.0])
```   
Adds a triangle to the draw list

---

#### `imguigml_drawlist_add_triangle_filled`   
| | | 
| ---------- | ------- |   
**_x1**      | {Real}    
**_y1**      | {Real}    
**_x2**      | {Real}    
**_y2**      | {Real}    
**_x3**      | {Real}    
**_y3**      | {Real}    
**_col**     | {Real}    
**returns**: | None   
```
imguigml_drawlist_add_triangle_filled(_x1, _y1, _x2, _y2, _x3, _y3, _col)
```   
Adds a filled triangle to the draw list

---

#### `imguigml_drawlist_add_circle`   
| | | 
| -------------------- | -------------- |   
**_center_x**          | {Real}    
**_center_y**          | {Real}    
**_radius**            | {Real}    
**_col**               | {Real}    
**[_num_segments=12]** | {Real}    
**[_thickness**        | {Float} = 1.0]   
**returns**: |        None   
```
imguigml_drawlist_add_circle(_center_x, _center_y, _radius, _col, [_num_segments=12], [_thickness)
```   
Adds a circle to the drawlist

---

#### `imguigml_drawlist_add_circle_filled`   
| | | 
| -------------------- | ------- |   
**_center_x**          | {Real}    
**_center_y**          | {Real}    
**_radius**            | {Real}    
**_col**               | {Real}    
**[_num_segments=12]** | {Real}    
**returns**: |        None   
```
imguigml_drawlist_add_circle_filled(_center_x, _center_y, _radius, _col, [_num_segments=12])
```   
Adds a circle to the drawlist

---

#### `imguigml_drawlist_add_text`   
| | | 
| ------------- | --------- |   
**_pos_x**      | {Real}    
**_pos_y**      | {Real}    
**_col**        | {Real}    
**_text**       | {String}    
**_wrap_width** | {Real}    
**returns**: | None   
```
imguigml_drawlist_add_text(_pos_x, _pos_y, _col, _text, _wrap_width)
```   
Adds text to the drawlist

---

#### `imguigml_drawlist_add_surface`   
| | | 
| --------------------- | -------------------------------------------------- |   
**_surface**            | {Real} surface   
**_x**                  | {Real} x   
**_y**                  | {Real} y   
**[_width=undefined]**  | {Real} width uses surface_get_width if undefined   
**[_height=undefined]** | {Real} height uses surface_get_height if undefined   
**[_u0=0.0]**           | {Real} texture u0   
**[_v0=0.0]**           | {Real} texture v0   
**[_u1=1.0]**           | {Real} texture u1   
**[_v1=1.0]**           | {Real} texture v1   
**[_col=c_white]**      | {Real} image_blend   
**returns**: |         None   
```
imguigml_drawlist_add_surface(_surface, _x, _y, [_width=undefined], [_height=undefined], [_u0=0.0], [_v0=0.0], [_u1=1.0], [_v1=1.0], [_col=c_white])
```   
false

---

#### `imguigml_drawlist_add_surface_quad`   
| | | 
| ---------------- | ------- |   
**_surface**       | {Real}    
**_x1**            | {Real}    
**_y1**            | {Real}    
**_x2**            | {Real}    
**_y2**            | {Real}    
**_x3**            | {Real}    
**_y3**            | {Real}    
**_x4**            | {Real}    
**_y4**            | {Real}    
**[_col=c_white]** | {Real}    
**[_u1=0]**        | {Real}    
**[_v1=0]**        | {Real}    
**[_u2=1]**        | {Real}    
**[_v2=0]**        | {Real}    
**[_u3=1]**        | {Real}    
**[_v3=1]**        | {Real}    
**[_u4=0]**        | {Real}    
**[_v4=1]**        | {Real}    
**returns**: |    None   
```
imguigml_drawlist_add_surface_quad(_surface, _x1, _y1, _x2, _y2, _x3, _y3, _x4, _y4, [_col=c_white], [_u1=0], [_v1=0], [_u2=1], [_v2=0], [_u3=1], [_v3=1], [_u4=0], [_v4=1])
```   
Adds an image quad to the draw list

---

#### `imguigml_drawlist_add_sprite`   
| | | 
| --------------------- | ------- |   
**_sprite_index**       | {Real}    
**_image_index**        | {Real}    
**_x**                  | {Real}    
**_y**                  | {Real}    
**[_width=undefined]**  | {Real}    
**[_height=undefined]** | {Real}    
**[_col=c_white]**      | {Real}    
**returns**: |         None   
```
imguigml_drawlist_add_sprite(_sprite_index, _image_index, _x, _y, [_width=undefined], [_height=undefined], [_col=c_white])
```   
Adds an image to the draw list

---

#### `imguigml_drawlist_add_polyline`   
| | | 
| ------------------ | ------------------------------------------------------------------------- |   
**_y]}**             | {Array:[_x, _points an array of points, each point being an array: [x, y]   
**_col**             | {Real}    
**[_closed=true]**   | {Real} is the shape closed?   
**[_thickness=1.0]** | {Real}    
**returns**: |      None   
```
imguigml_drawlist_add_polyline(_y]}, _col, [_closed=true], [_thickness=1.0])
```   
add a line in a polygonal shape to the draw list

---

#### `imguigml_drawlist_add_convex_poly_filled`   
| | | 
| ---------- | --------------------------------------------------------------------- |   
**_points**  | {Array:[_x,_y]} an array of points, each point being an array: [x, y]   
**_col**     | {Real}    
**returns**: | None   
```
imguigml_drawlist_add_convex_poly_filled(_points, _col)
```   
add filled convex polygonal shape to the draw list

---

#### `imguigml_drawlist_add_bezier_curve`   
| | | 
| -------------------- | ------- |   
**_pos_x1**            | {Real}    
**_pos_y1**            | {Real}    
**_curve_x1**          | {Real}    
**_curve_y1**          | {Real}    
**_curve_x2**          | {Real}    
**_curve_y2**          | {Real}    
**_pos_x2**            | {Real}    
**_pos_y2**            | {Real}    
**_col**               | {Real}    
**_thickness**         | {Real}    
**[_num_segments=0])** | {Real}    
**returns**: |        None   
```
imguigml_drawlist_add_bezier_curve(_pos_x1, _pos_y1, _curve_x1, _curve_y1, _curve_x2, _curve_y2, _pos_x2, _pos_y2, _col, _thickness, [_num_segments=0]))
```   
Adds a bezier curve to the drawlist

---

#### `imguigml_drawlist_path_clear`   
**returns**: None   
```
imguigml_drawlist_path_clear()
```   
Clears the current path

---

#### `imguigml_drawlist_path_line_to`   
| | | 
| ---------- | ------- |   
**_x**       | {Real}    
**_y**       | {Real}    
**returns**: | None   
```
imguigml_drawlist_path_line_to(_x, _y)
```   
add a line to the current path

---

#### `imguigml_drawlist_path_line_to_merge_duplicate`   
| | | 
| ---------- | ------- |   
**_x**       | {Real}    
**_y**       | {Real}    
**returns**: | None   
```
imguigml_drawlist_path_line_to_merge_duplicate(_x, _y)
```   
add a line to the current path, merging any duplicate lines this creates

---

#### `imguigml_drawlist_path_fill_convex`   
| | | 
| ---------- | ------- |   
**_col**     | {Real}    
**returns**: | None   
```
imguigml_drawlist_path_fill_convex(_col)
```   
add fill the current convex shape created bhy the path

---

#### `imguigml_drawlist_path_stroke`   
| | | 
| ------------------- | ---------- |   
**_col**              | {Real}    
**_closed**           | {Boolean}    
**[_thickness=1.0])** | {Real}    
**returns**: |       None   
```
imguigml_drawlist_path_stroke(_col, _closed, [_thickness=1.0]))
```   
set the stroke settings for drawing paths

---

#### `imguigml_drawlist_path_arc_to`   
| | | 
| -------------------- | ------- |   
**_center_x**          | {Real}    
**_center_y**          | {Real}    
**_radius**            | {Real}    
**_min**               | {Real}    
**_max**               | {Real}    
**[_num_segments=10]** | {Real}    
**returns**: |        None   
```
imguigml_drawlist_path_arc_to(_center_x, _center_y, _radius, _min, _max, [_num_segments=10])
```   
Adds an arc to a path

---

#### `imguigml_drawlist_path_arc_to_fast`   
| | | 
| ------------ | ------- |   
**_center_x**  | {Real}    
**_center_y**  | {Real}    
**_radius**    | {Real}    
**_min_of_12** | {Real}    
**_max_of_12** | {Real}    
**returns**: | None   
```
imguigml_drawlist_path_arc_to_fast(_center_x, _center_y, _radius, _min_of_12, _max_of_12)
```   
More performant path_arc

---

#### `imguigml_drawlist_path_bezier_curve_to`   
| | | 
| ------------------- | ------- |   
**_x1**               | {Real}    
**_y1**               | {Real}    
**_x2**               | {Real}    
**_y2**               | {Real}    
**_x3**               | {Real}    
**_y3**               | {Real}    
**[_num_segments=0]** | {Real}    
**returns**: |       None   
```
imguigml_drawlist_path_bezier_curve_to(_x1, _y1, _x2, _y2, _x3, _y3, [_num_segments=0])
```   
Curve path to

---

#### `imguigml_drawlist_path_rect`   
| | | 
| ------------------------- | ------------------------------ |   
**_min_x**                  | {Real}    
**_min_y**                  | {Real}    
**_max_x**                  | {Real}    
**_max_y**                  | {Real}    
**[_rounding=0]**           | {Real}    
**[_round_corner_flags=-1** | {Real:EImGui_DrawCornerFlags}    
**returns**: |             None   
```
imguigml_drawlist_path_rect(_min_x, _min_y, _max_x, _max_y, [_rounding=0], [_round_corner_flags=-1)
```   
draw a rect on the path

---

#### `imguigml_drawlist_channels_split`   
| | | 
| ----------------- | ------- |   
**_channels_count** | {Real}    
**returns**: |     None   
```
imguigml_drawlist_channels_split(_channels_count)
```   
merge channels      Channels:      - Use to simulate layers. By switching channels to can render out-of-order (e.g. submit foreground primitives before background primitives)      - Use to minimize draw calls (e.g. if going back-and-forth between multiple non-overlapping clipping rectangles, prefer to append into separate channels then merge at the end)

---

#### `imguigml_drawlist_channels_merge`   
**returns**: None   
```
imguigml_drawlist_channels_merge()
```   
merge channels      Channels:      - Use to simulate layers. By switching channels to can render out-of-order (e.g. submit foreground primitives before background primitives)      - Use to minimize draw calls (e.g. if going back-and-forth between multiple non-overlapping clipping rectangles, prefer to append into separate channels then merge at the end)

---

#### `imguigml_drawlist_channels_set_current`   
| | | 
| ---------------- | ------- |   
**_channel_index** | {Real}    
**returns**: |    None   
```
imguigml_drawlist_channels_set_current(_channel_index)
```   
merge channels      Channels:      - Use to simulate layers. By switching channels to can render out-of-order (e.g. submit foreground primitives before background primitives)      - Use to minimize draw calls (e.g. if going back-and-forth between multiple non-overlapping clipping rectangles, prefer to append into separate channels then merge at the end)

---

#### `imguigml_drawlist_push_clip_rect`   
| | | 
| ------------------------------------ | ---------- |   
**_min_x**                             | {Real}    
**_min_y**                             | {Real}    
**_max_x**                             | {Real}    
**_max_y**                             | {Real}    
**[_intersect_with_clip_plane=false]** | {Boolean}    
**returns**: |                        None   
```
imguigml_drawlist_push_clip_rect(_min_x, _min_y, _max_x, _max_y, [_intersect_with_clip_plane=false])
```   
Render-level scissoring

---

#### `imguigml_drawlist_pop_clip_rect`   
**returns**: None   
```
imguigml_drawlist_pop_clip_rect()
```   
End Render-level scissoring

---

#### `imguigml_drawlist_push_clip_rect_fullscreen`   
**returns**: None   
```
imguigml_drawlist_push_clip_rect_fullscreen()
```   
Push the clip rect for the fullscreen

---

#### `imguigml_drawlist_get_clip_rect_min`   
**returns**: {Array:[ _min_x, _min_y ]   
```
imguigml_drawlist_get_clip_rect_min()
```   
Gets the max pos of clipping rectangle

---

#### `imguigml_drawlist_get_clip_rect_max`   
**returns**: {Array:[ _max_x, _max_y ]   
```
imguigml_drawlist_get_clip_rect_max()
```   
Gets the max pos of clipping rectangle

---

#### `imguigml_drawlist_push_texture_id`   
| | | 
| ---------- | ------- |   
**_tex_id**  | {Real}    
**returns**: | None   
```
imguigml_drawlist_push_texture_id(_tex_id)
```   
Pushes a texture to the drawlist

---

#### `imguigml_drawlist_pop_texture_id`   
**returns**: None   
```
imguigml_drawlist_pop_texture_id()
```   
Pops texture from drawlist

---

#### `imguigml_drawlist_set_flags`   
| | | 
| ---------- | ---------------------------- |   
**_flags**   | {Real:EImGui_DrawListFlags}    
**returns**: | None   
```
imguigml_drawlist_set_flags(_flags)
```   
set the antialising flags [per primitive]

---

#### `imguigml_drawlist_get_flags`   
**returns**: {Real:EImGui_DrawListFlags} _flags   
```
imguigml_drawlist_get_flags()
```   
get the antialising flags [per primitive]

---

#### `imguigml_drawlist_use_overlay`   
**returns**: None   
```
imguigml_drawlist_use_overlay()
```   
use imgui's overlay drawlist ontop of the screen

---

#### `imguigml_drawlist_use_window`   
**returns**: None   
```
imguigml_drawlist_use_window()
```   
use imgui's active window drawlist with drawlist functions

---

#### `__imguigml_ext_call`   
**returns**: None   
```
__imguigml_ext_call()
```   
wrap a _extImguiGML call in this, handle returns or checking immediately after a call

---

#### `imguigml_mem`   
**returns**: None   
```
imguigml_mem()
```   
false

---

#### `imguigml_memset`   
**returns**: None   
```
imguigml_memset()
```   
false

---

#### `imguigml_secure_save_mem`   
**returns**: None   
```
imguigml_secure_save_mem()
```   
false

---

#### `imguigml_secure_load_mem`   
**returns**: None   
```
imguigml_secure_load_mem()
```   
false

---

#### `imguigml_begin_tab_bar`   
| | | 
| ------------ | -------------------------- |   
**_std_id**    | {String}    
**[_flags=0]** | {Real:EImGui_TabBarFlags}    
**returns**: | None   
```
imguigml_begin_tab_bar(_std_id, [_flags=0])
```   
start a tab bar

---

#### `imguigml_end_tab_bar`   
**returns**: None   
```
imguigml_end_tab_bar()
```   
finish a tab bar

---

#### `imguigml_tab_item`   
| | | 
| ------------------- | ----------------------------------------------------------------------------------------- |   
**_name**             | {String} name for tab item   
**[_open=undefined]** | {Real} pass true/false for if this window is open w/close button, undefined for no button   
**[_flags=0]**        | {Real:EImGui_TabItemFlags} tab item flags   
**returns**: |       {Array:[_selected, [_is_open])   
```
imguigml_tab_item(_name, [_open=undefined], [_flags=0])
```   
create a tab item

---

#### `imguigml_set_tab_item_closed`   
| | | 
| ---------- | --------- |   
**_name**    | {String}    
**returns**: | None   
```
imguigml_set_tab_item_closed(_name)
```   
set a tab item as closed

---

#### `imguigml_set_tab_item_selected`   
| | | 
| ---------- | --------- |   
**_name**    | {String}    
**returns**: | None   
```
imguigml_set_tab_item_selected(_name)
```   
set a tab item as selected

---

#### `imguigml_show_tabs_demo`   
| | | 
| ------------------- | ----------------------------------------------------------------------------------------- |   
**_name**             | {String} name for demo win   
**[_open=undefined]** | {Real} pass true/false for if this window is open w/close button, undefined for no button   
**returns**: |       {Boolean} [_is_open] returned if _open passed   
```
imguigml_show_tabs_demo(_name, [_open=undefined])
```   
show the tabs demo

---

#### `imguigml_show_tabs_debug`   
**returns**: None   
```
imguigml_show_tabs_debug()
```   
show tabs debug pane

---

#### `imguigml_texteditor_create`   
**returns**: None   
```
imguigml_texteditor_create()
```   
create a new texteditor

---

#### `imguigml_texteditor_destroy`   
| | | 
| --------------- | ------- |   
**_editor_index** | {Real}    
**returns**: |   {undefined} so you can chain calls   
```
imguigml_texteditor_destroy(_editor_index)
```   
destroy a texteditor

---

#### `imguigml_texteditor_set_language_definition`   
| | | 
| --------------- | ----------------------------------------------------------------- |   
**_editor_index** | {Real}    
**_lang**         | {String} can be "CPlusPlus", "HLSL", "GLSL", "C", "SQL", or "Lua"   
**returns**: |   None   
```
imguigml_texteditor_set_language_definition(_editor_index, _lang)
```   
Sets the current text editor language definition

---

#### `imguigml_texteditor_get_language_definition`   
| | | 
| --------------- | ------- |   
**_editor_index** | {Real}    
**returns**: |   {String} lang def   
```
imguigml_texteditor_get_language_definition(_editor_index)
```   
Gets the current text editor language definition

---

#### `imguigml_texteditor_get_palette`   
| | | 
| --------------- | ------- |   
**_editor_index** | {Real}    
**returns**: |   {Array:EImGuiText_Palette} filled in array with current palette colors   
```
imguigml_texteditor_get_palette(_editor_index)
```   
Gets the palette of the current text editor

---

#### `imguigml_texteditor_set_palette`   
| | | 
| --------------- | ----------------------------------------------------------------------------- |   
**_editor_index** | {Real}    
**_palette**      | {Array:EImGuiText_Palette} note GetDark/Light palette will give you basic one   
**returns**: |   None   
```
imguigml_texteditor_set_palette(_editor_index, _palette)
```   
Sets the palette of the current text editor

---

#### `imguigml_texteditor_render`   
| | | 
| ----------------- | ---------- |   
**_editor_index**   | {Real}    
**_label**          | {String}    
**[_size_x=0]**     | {Real}    
**[_size_y=0]**     | {Real}    
**[_border=false]** | {Boolean}    
**returns**: |     None   
```
imguigml_texteditor_render(_editor_index, _label, [_size_x=0], [_size_y=0], [_border=false])
```   
Renders the text editor

---

#### `imguigml_texteditor_set_text`   
| | | 
| --------------- | --------- |   
**_editor_index** | {Real}    
**_text**         | {String}    
**returns**: |   None   
```
imguigml_texteditor_set_text(_editor_index, _text)
```   
Sets the text of the current editor

---

#### `imguigml_texteditor_get_text`   
| | | 
| --------------- | ------- |   
**_editor_index** | {Real}    
**returns**: |   {String}   
```
imguigml_texteditor_get_text(_editor_index)
```   
Gets the text from the current editor

---

#### `imguigml_texteditor_get_selected_text`   
| | | 
| --------------- | ------- |   
**_editor_index** | {Real}    
**returns**: |   {String}   
```
imguigml_texteditor_get_selected_text(_editor_index)
```   
Gets the selected text of the current editor

---

#### `imguigml_texteditor_get_total_lines`   
| | | 
| --------------- | ------- |   
**_editor_index** | {Real}    
**returns**: |   {Real}   
```
imguigml_texteditor_get_total_lines(_editor_index)
```   
Gets the total lines from the current text editor

---

#### `imguigml_texteditor_is_overwrite`   
| | | 
| --------------- | ------- |   
**_editor_index** | {Real}    
**returns**: |   {Boolean}   
```
imguigml_texteditor_is_overwrite(_editor_index)
```   
Checks if current text editor is in overwrite mode

---

#### `imguigml_texteditor_set_readonly`   
| | | 
| --------------- | ---------- |   
**_editor_index** | {Real}    
**_value**        | {Boolean}    
**returns**: |   None   
```
imguigml_texteditor_set_readonly(_editor_index, _value)
```   
Sets the text editor to read only

---

#### `imguigml_texteditor_is_readonly`   
| | | 
| --------------- | ------- |   
**_editor_index** | {Real}    
**returns**: |   {Boolean}   
```
imguigml_texteditor_is_readonly(_editor_index)
```   
Checks if the current editor is read only

---

#### `imguigml_texteditor_set_cursor_position`   
| | | 
| --------------- | ------- |   
**_editor_index** | {Real}    
**_line**         | {Real}    
**_col**          | {Real}    
**returns**: |   None   
```
imguigml_texteditor_set_cursor_position(_editor_index, _line, _col)
```   
Sets the cursor position using line and column

---

#### `imguigml_texteditor_get_cursor_position`   
| | | 
| --------------- | ------- |   
**_editor_index** | {Real}    
**returns**: |   {Array:[_line, _col]}   
```
imguigml_texteditor_get_cursor_position(_editor_index)
```   
Gets the line and column from the current text editor

---

#### `imguigml_texteditor_insert_text`   
| | | 
| --------------- | --------- |   
**_editor_index** | {Real}    
**_text**         | {String}    
**returns**: |   None   
```
imguigml_texteditor_insert_text(_editor_index, _text)
```   
Inserts text at position in the current text editor

---

#### `imguigml_texteditor_move_up`   
| | | 
| --------------- | --------------- |   
**_editor_index** | {Real}    
**_amount**       | {Real}    
**[_select**      | {Real} = false]   
**returns**: |   None   
```
imguigml_texteditor_move_up(_editor_index, _amount, [_select)
```   
Moves up  lines in the text editor

---

#### `imguigml_texteditor_move_down`   
| | | 
| --------------- | --------------- |   
**_editor_index** | {Real}    
**_amount**       | {Real}    
**[_select**      | {Real} = false]   
**returns**: |   None   
```
imguigml_texteditor_move_down(_editor_index, _amount, [_select)
```   
Moves down  lines in the text editor

---

#### `imguigml_texteditor_move_left`   
| | | 
| --------------- | --------------- |   
**_editor_index** | {Real}    
**_amount**       | {Real}    
**[_select**      | {Real} = false]   
**returns**: |   None   
```
imguigml_texteditor_move_left(_editor_index, _amount, [_select)
```   
Moves left  lines in the text editor

---

#### `imguigml_texteditor_move_right`   
| | | 
| --------------- | --------------- |   
**_editor_index** | {Real}    
**_amount**       | {Real}    
**[_select**      | {Real} = false]   
**returns**: |   None   
```
imguigml_texteditor_move_right(_editor_index, _amount, [_select)
```   
Moves right  lines in the text editor

---

#### `imguigml_texteditor_move_top`   
| | | 
| --------------- | --------------- |   
**_editor_index** | {Real}    
**[_select**      | {Real} = false]   
**returns**: |   None   
```
imguigml_texteditor_move_top(_editor_index, [_select)
```   
Skips to top of current editor

---

#### `imguigml_texteditor_move_bottom`   
| | | 
| --------------- | --------------- |   
**_editor_index** | {Real}    
**[_select**      | {Real} = false]   
**returns**: |   None   
```
imguigml_texteditor_move_bottom(_editor_index, [_select)
```   
Skips to bottom of current editor

---

#### `imguigml_texteditor_move_home`   
| | | 
| --------------- | --------------- |   
**_editor_index** | {Real}    
**[_select**      | {Real} = false]   
**returns**: |   None   
```
imguigml_texteditor_move_home(_editor_index, [_select)
```   
Moves to the home position of the current editor

---

#### `imguigml_texteditor_move_end`   
| | | 
| --------------- | --------------- |   
**_editor_index** | {Real}    
**[_select**      | {Real} = false]   
**returns**: |   None   
```
imguigml_texteditor_move_end(_editor_index, [_select)
```   
Moves to the end position of the current editor

---

#### `imguigml_texteditor_set_selection_start`   
| | | 
| --------------- | ------- |   
**_editor_index** | {Real}    
**_line**         | {Real}    
**_col**          | {Real}    
**returns**: |   None   
```
imguigml_texteditor_set_selection_start(_editor_index, _line, _col)
```   
Sets the start select position in the current editor

---

#### `imguigml_texteditor_set_selection_end`   
| | | 
| --------------- | ------- |   
**_editor_index** | {Real}    
**_line**         | {Real}    
**_col**          | {Real}    
**returns**: |   None   
```
imguigml_texteditor_set_selection_end(_editor_index, _line, _col)
```   
Sets the end select position in the current editor

---

#### `imguigml_texteditor_set_selection`   
| | | 
| --------------- | ------------------ |   
**_editor_index** | {Real}    
**_line1**        | {Real}    
**_col1**         | {Real}    
**_line2**        | {Real}    
**_col2**         | {Real}    
**[word_mode**    | {Boolean} = false]   
**returns**: |   None   
```
imguigml_texteditor_set_selection(_editor_index, _line1, _col1, _line2, _col2, [word_mode)
```   
Sets selection value in current editor

---

#### `imguigml_texteditor_select_word_under_cursor`   
| | | 
| --------------- | ------- |   
**_editor_index** | {Real}    
**returns**: |   None   
```
imguigml_texteditor_select_word_under_cursor(_editor_index)
```   
Selects the word under the mouse cursor in the current editor

---

#### `imguigml_texteditor_has_selection`   
| | | 
| --------------- | ------- |   
**_editor_index** | {Real}    
**returns**: |   {Boolean}   
```
imguigml_texteditor_has_selection(_editor_index)
```   
Checks if current editor has selected text

---

#### `imguigml_texteditor_copy`   
| | | 
| --------------- | ------- |   
**_editor_index** | {Real}    
**returns**: |   None   
```
imguigml_texteditor_copy(_editor_index)
```   
Copies the selected tex

---

#### `imguigml_texteditor_cut`   
| | | 
| --------------- | ------- |   
**_editor_index** | {Real}    
**returns**: |   None   
```
imguigml_texteditor_cut(_editor_index)
```   
Cuts the selected text

---

#### `imguigml_texteditor_paste`   
| | | 
| --------------- | ------- |   
**_editor_index** | {Real}    
**returns**: |   None   
```
imguigml_texteditor_paste(_editor_index)
```   
pastes the selected text

---

#### `imguigml_texteditor_delete`   
| | | 
| --------------- | ------- |   
**_editor_index** | {Real}    
**returns**: |   None   
```
imguigml_texteditor_delete(_editor_index)
```   
deletes the selected text

---

#### `imguigml_texteditor_can_undo`   
| | | 
| --------------- | ------- |   
**_editor_index** | {Real}    
**returns**: |   {Boolean}   
```
imguigml_texteditor_can_undo(_editor_index)
```   
Check if there is undo history

---

#### `imguigml_texteditor_can_redo`   
| | | 
| --------------- | ------- |   
**_editor_index** | {Real}    
**returns**: |   {Boolean}   
```
imguigml_texteditor_can_redo(_editor_index)
```   
Check if there is redo history

---

#### `imguigml_texteditor_get_dark_palette`   
| | | 
| --------------- | ------- |   
**_editor_index** | {Real}    
**returns**: |   {Array}   
```
imguigml_texteditor_get_dark_palette(_editor_index)
```   
Gets the dark palette that may be used with editor

---

#### `imguigml_texteditor_get_light_palette`   
| | | 
| --------------- | ------- |   
**_editor_index** | {Real}    
**returns**: |   {Array}   
```
imguigml_texteditor_get_light_palette(_editor_index)
```   
Gets the light palette that may be used with editor

---

### Changelist

* **v1.75.1** 
  Fixed drawlist sprite drawing to work like the other sprite imguigml items. 
  * Fixed `imguigml_drawlist_add_sprite`, removed uv params
  * Removed `imguigml_drawlist_add_sprite_quad`
* **v1.75.0** - Soft update to v1.53 - no new functions wrapped, but api updated.
  * **Fixes**
    * `imguigml_sprite` and `imguigml_sprite_button` now draw trimmed sprites and sprite_added sprites correctly. (added sprite cache) 
  * **Breaking Changes**
    * `imguigml_get_items_line_height_with_spacing` is now `imguigml_get_items_line_height_with_spacing`
    * removed `imguigml_is_root_window_focused()`  **see focused flags**
    * removed `imguigml_is_root_window_or_any_child_focused()` **see focused flags**
    * removed `imguigml_is_root_window_or_any_child_hovered()` **see focused flags**
    * removed `imguigml_set_next_window_content_width()`
    * removed `EImGuiGML_WindowFlags`: `ShowBorders`
  * **API Changes**
    * `imguigml_drawlist_add_poly` and `imguigml_drawlist_add_convex_poly_filled` no longer accept AA param
    * `imguigml_is_window_focused` now takes `EImGui_FocuseFlags`
  * **ADDED** (from 1.53)
    * `imguigml_drawlist_set_flags` and `imguigml_drawlist_get_flags` for messing with antialiasing (replacing the param above)
    * `imguigml_drawlist_use_overlay` and `imguigml_drawlist_use_window` allowing use of the new overlay
    * `imguigml_style_colors_light`
    * `imguigml_io_set_cursor_blink` and get.
    * `imguigml_show_demo_window`, `imguigml_show_metrics_window`, `imguigml_show_style_selector`, `imguigml_show_user_guide`, `imguigml_show_font_selector`
    * `imguigml_begin_drag_drop_source`, `imguigml_set_drag_drop_payload`, `imguigml_end_drag_drop_source`, `imguigml_begin_drop_target`, `imguigml_accept_drag_drop_payload`, `imguigml_end_drag_drop_target`
    * `imguigml_payload`, `imguigml_payload_get`
    * Flags
      * Added `PopupRounding`, `WindowBorderSize`, `FrameBorderSize`, `ChildBorderSize` to `EImGui_StyleVar`
      * Added `EImGui_InputTextFlags.NoUndoRedo`
      * Added `EImGui_WindowFlags`: `ResizeFromAnySide`
      * Added `EImGui_FocusedFlags` to pass to `imguigml_is_window_focused`, replacing the obsolete root_window functions
      * Added `EImGui_HoveredFlags` `RootWindow` and `ChildWindow` to include in hovered tests
      * Added `EImGui_DrawCornerFlags` for rounding flags

  
* **v1.3.0** - BIG update, here's a list of some of the fixes:
  * **v1.3.1** Hot Fix: Fixed a few scaling display issues, fixed texteditor buffer size limitations
  * **v1.3.2** Hot Fix: Add sprite caching
  *  Features
     *  Don't draw if a surface/texture doesn't exist (avoids white boxes flashing)
     *  Add ability to draw at depth
     *  Can draw in `Draw` event
  *  API 
     *  Added float4 -> gml color conversion functions 
  *  Fixes:
     *  `imguigml_texteditor_get_text` returned nothing, also fixed indexing text editors
     *  Fixed ImGuiGML bashing the cursor so that resize cursors, etc, didn't function properly.
     *  **Fixed ImGuiGML Display Issues when resizing the window or GUI Layer... more to come on this**
  *  Various doc fixes!

* **v1.2.3**
  * API
    * Added `imguigml_surface` and refactored how sprite and 'image' works. `imguigml_image` still takes a texture pointer, but there's rarely a reason to use it.
  * Fixes:
    * Fixed `draw_add_rect_filled`
    * Automatically multiply the normalized pixel percent trimmed from sprites when useing `imguigml_sprite`
    * `imguigml_button` now accepts 1 param for size
    * Fix `imguigml_color_convert_` gml / u32 functions being backwards
    
* **v1.1.3: Extras!**
  * Features
      * Added: ImDrawList, ImGui_Tabs, and ImGuiColorTextEdit
  * API: 
    * Added `imguigml_color_convert_u32_to_gml` and `imguigml_color_convert_gml_to_u32`
    * Added `imguigml_texteditor_*` functions (38 functions)
    * Added `imguigml_begin_tab_bar` `imguigml_tab_item` `imguigml_set_tab_item_closed`, +4 more tab functions
    * **API CHANGE:** 
      * Fixed `imguigml_checkbox` to now return an array: `[_changed, _val]` where _val is the current true/false of the checbbox. Before it only returned `_changed`
      * Fixed `imguigml_checkbox_flags` to now return an array: `[_changed, _val]` where _val is the current true/false of the checbbox. Before it only returned `_changed`
  * Fixes:
    * `imguigml_checkbox` and `imguigml_checkbox_flags` fixes from above
    * `imguigml_imguigml_color_convert_float4_to_u32` interanlly, param 3/4 were swapped.
    * `imguigml_tree_node` was accidentally left unimplemented
    * Various help / param issues fixed in the completion.
    * Slightly improved the demo.

* **v1.0.0: Public Release!!!**
  * Added: `imguigmlg_toggle_cursor` for preventing ImGui from touching your cursor, also added config lines for it.
  * Fixed: Crash when switching rooms while imgui is active, various function documentation was incorrect.

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

### Credits

ImGuiGML DLL was written by [@babyj3ans](https://twitter.com/babj3ans/)
with tons of help and example work by [@net8floz](https://twitter.com/net8floz/)

Created with:

* [ImGui](https://github.com/ocornut/imgui) - Of course
* [ImGuiColorTextEdit](https://github.com/BalazsJako/ImGuiColorTextEdit) - TextEditor implementation
*/
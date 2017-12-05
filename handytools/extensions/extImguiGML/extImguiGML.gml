#define imguigml_activate
///@function imguigml_activate()
///@desc helper function to simply activate imguigml again
with (ImGuiGML) {
  return;
}

if (ImGuiGML != noone) 
  instance_activate_object(ImGuiGML);

#define imguigml_deactivate
///@function imguigml_activate()
///@desc helper function to simply deactivate imguigml again
with (ImGuiGML)
  instance_deactivate_object(id);

#define imguigml_ready
///@function imguigml_ready()
///@desc returns true if imguigml is ready for commands to be called
///@returns {Boolean}
with (ImGuiGML)
  return NewFrame;

return false;

#define imguigml_separator
///@function imguigml_separator()
///@desc separator, generally horizontal. inside a menu bar or in horizontal layout mode, this becomes a vertical separator.
_extImguiGML_separator();

#define imguigml_same_line
///@function imguigml_same_line([_pos_x=0.0], [_spacing_w=-1.0])
///@desc call between widgets or groups to layout them horizontally
///@param {Real} [_pos_x=0.0]
///@param {Real} [_spacing_w=-1.0]
var in = __Imgui_in;
rousr_buffer_write_val(in, argument_count > 0 ? argument[0] : 0.0, ERousrData.Float);
rousr_buffer_write_val(in, argument_count > 1 ? argument[1] : -1.0, ERousrData.Float);
_extImguiGML_same_line();

#define imguigml_new_line
///@function imguigml_new_line()
///@desc undo a SameLine()
_extImguiGML_new_line();

#define imguigml_spacing
///@function imguigml_spacing()
///@desc add vertical spacing
_extImguiGML_spacing();

#define imguigml_dummy
///@function imguigml_dummy(_size_x, _size_y)
///@desc add a dummy item of given size
///@param {Real} [_pos_x=0.0]
///@param {Real} [_spacing_w=-1.0]
var buff = __imguigml_wrapper_buffer();
rousr_buffer_write_val(buff, argument_count > 0 ? argument[0] : 0.0, ERousrData.Float);
rousr_buffer_write_val(buff, argument_count > 1 ? argument[1] : -1.0, ERousrData.Float);
_extImguiGML_same_line();

#define imguigml_indent
///@function imguigml_indent([_index_w=0.0f])
///@desc move content position toward the right, by style.IndentSpacing or indent_w if >0
///@param {Real} [_index_w=0.0f]
rousr_buffer_write_val(__Imgui_in, argument_count > 0 ? argument[0] : 0.0, ERousrData.Float);
_extImguiGML_indent();

#define imguigml_unindent
///@function imguigml_indent([_index_w=0.0f])
///@desc move content position back to the left, by style.IndentSpacing or indent_w if >0
///@param {Real} [_index_w=0.0f]
var buff = __imguigml_wrapper_buffer();
rousr_buffer_write_val(buff, argument_count > 0 ? argument[0] : 0.0, ERousrData.Float);
_extImguiGML_unindent();

#define imguigml_begin_group
///@function imguigml_begin_group()
///@desc lock horizontal starting position + capture group bounding box into one "item" (so you can use IsItemHovered() or layout primitives such as SameLine() on whole group, etc.)
_extImguiGML_begin_group();

#define imguigml_end_group
///@function imguigml_end_group()
///@desc end horizontal capture group 
_extImguiGML_end_group();

#define imguigml_get_cursor_pos
///@function imguigml_get_cursor_pos()
///@desc cursor position is relative to window position
///@returns {Array:[x,y]}
_extImguiGML_get_cursor_pos();
var out = __Imgui_out;
var ret = array_create(2);
ret[@ 0] = buffer_read(out, buffer_f32);
ret[@ 1] = buffer_read(out, buffer_f32);
return ret;


#define imguigml_get_cursor_pos_x
///@function imguigml_get_cursor_pos_x()
///@desc cursor position is relative to window position
///@returns {Real} x
_extImguiGML_get_cursor_pos_x();
return buffer_read(__Imgui_out, buffer_f32);

#define imguigml_get_cursor_pos_y
///@function imguigml_get_cursor_pos_y()
///@desc cursor position is relative to window position
///@returns {Real} y
_extImguiGML_get_cursor_pos_y();
var _buff = __imguigml_wrapper_buffer();
return buffer_read(_buff, buffer_f32);


#define imguigml_set_cursor_pos
///@function imguigml_set_cursor_pos(_x, _y)
///@desc set the imgui cursor position
///@param {Real} _x
///@param {Real} _y
var buff = __imguigml_wrapper_buffer();
rousr_buffer_write_val(buff, argument[0], ERousrData.Float);
rousr_buffer_write_val(buff, argument[1], ERousrData.Float);
_extImguiGML_set_cursor_pos();

#define imguigml_set_cursor_pos_x
///@function imguigml_set_cursor_pos_x(_x)
///@desc set the imgui cursor position x
///@param {Real} _x
rousr_buffer_write_val(__Imgui_in, argument[0], ERousrData.Float);
_extImguiGML_set_cursor_pos_x();

#define imguigml_set_cursor_pos_y
///@function imguigml_set_cursor_pos_y(_y)
///@desc set the imgui cursor position y
///@param {Real} _y
var buff = __imguigml_wrapper_buffer();
rousr_buffer_write_val(buff, argument[0], ERousrData.Float);
_extImguiGML_set_cursor_pos_y();

#define imguigml_get_cursor_start_pos
///@function imguigml_get_cursor_start_pos()
///@desc initial cursor position
///@returns {Array:[x,y]}
_extImguiGML_get_cursor_start_pos();
var out = __Imgui_out;
var ret = array_create(2);
ret[@ 0] = buffer_read(out, buffer_f32);
ret[@ 1] = buffer_read(out, buffer_f32);
return ret;

#define imguigml_get_cursor_screen_pos
///@function imguigml_get_cursor_screen_pos()
///@desc cursor position in absolute screen coordinates [0..io.DisplaySize] (useful to work with ImDrawList API)
///@returns {Array:[x,y]}
_extImguiGML_get_cursor_screen_pos();

var out = __Imgui_out;
var ret = array_create(2);
ret[@ 0] = buffer_read(out, buffer_f32);
ret[@ 1] = buffer_read(out, buffer_f32);
return ret;


#define imguigml_set_cursor_screen_pos
///@function imguigml_set_cursor_screen_pos(_x, _y)
///@desc cursor position in absolute screen coordinates [0..io.DisplaySize]
///@param {Real} _x
///@param {Real} _y
var buff = __imguigml_wrapper_buffer();
rousr_buffer_write_val(buff, argument[0], ERousrData.Float);
rousr_buffer_write_val(buff, argument[1], ERousrData.Float);
_extImguiGML_set_cursor_screen_pos();

#define imguigml_align_text_to_frame_padding
///@function imguigml_align_text_to_frame_padding()
///@desc vertically align/lower upcoming text to FramePadding.y so that it will aligns to upcoming widgets (call if you have text on a line before regular widgets)
_extImguiGML_align_text_to_frame_padding();

#define imguigml_get_text_line_height
///@function imguigml_get_text_line_height()
///@desc height of font == GetWindowFontSize()
///@returns {Real} height of font == GetWindowFontSize()
_extImguiGML_get_text_line_height();
return buffer_read(__Imgui_out, buffer_f32);

#define imguigml_get_text_line_height_with_spacing
///@function imguigml_get_text_line_height_with_spacing()
///@desc distance (in pixels) between 2 consecutive lines of text == GetWindowFontSize() + GetStyle().ItemSpacing.y
///@returns {Real} distance (in pixels) between 2 consecutive lines of text == GetWindowFontSize() + GetStyle().ItemSpacing.y
_extImguiGML_get_text_line_height_with_spacing();
return buffer_read(__Imgui_out, buffer_f32);

#define imguigml_get_items_line_height_with_spacing
///@function imguigml_get_items_line_height_with_spacing()
///@desc distance (in pixels) between 2 consecutive lines of standard height widgets == GetWindowFontSize() + GetStyle().FramePadding.y*2 + GetStyle().ItemSpacing.y
///@returns {Real} distance (in pixels) between 2 consecutive lines of standard height widgets == GetWindowFontSize() + GetStyle().FramePadding.y*2 + GetStyle().ItemSpacing.y
_extImguiGML_get_items_line_height_with_spacing();
return buffer_read(__Imgui_out, buffer_f32);

#define imguigml_columns
///@function imguigml_columns([_count=1], [_id=undefined], [_border=true])
///@desc You can also use SameLine(pos_x) for simplified columns. 
///@param {Real} [_count=1]
///@param {String} [_id=undefined]
///@param {Boolean} [_border=true]
var in = __Imgui_in;
var _id = argument_count > 1 ? argument[1] : undefined;
_id = _id == undefined ? _id : noone;

rousr_buffer_write_val(in, argument_count > 0 ? argument[0] : 1, ERousrData.Int32);
rousr_buffer_write_val(in, _id)
rousr_buffer_write_val(in, argument_count > 2 ? argument[2] : 1, ERousrData.Int8);

_extImguiGML_columns();

#define imguigml_next_column
///@function imguigml_next_column()
///@desc next column, defaults to current row or next row if the current row is finished
_extImguiGML_next_column();

#define imguigml_get_column_index
///@function imguigml_get_column_index()
///@desc get current column index
///@returns {Real} column_index
_extImguiGML_get_column_index();
return buffer_read(__Imgui_out, buffer_s32);

#define imguigml_get_column_width
///@function imguigml_get_column_width([_column_index=-1])
///@desc get column width (in pixels). pass -1 to use current column
///@param {Real} [_column_index=-1]
///@returns {Real} _column_width
rousr_buffer_write_val(__Imgui_in, argument_count > 0 ? argument[0] : -1, ERousrData.Int32);
_extImguiGML_get_column_width();
return buffer_read(__Imgui_out, buffer_f32);

#define imguigml_set_column_width
///@function imguigml_set_column_width(_column_index, _width)
///@desc set column width (in pixels). pass -1 to use current column
///@param {Real} _column_index   column to set width of (-1 for current)
///@param {Real} _width          width in pixels to use
var buff = __Imgui_in;
rousr_buffer_write_val(buff, argument[0], ERousrData.Int32);
rousr_buffer_write_val(buff, argument[1], ERousrData.Float);
_extImguiGML_set_column_width();

#define imguigml_get_column_offset
///@function imguigml_get_column_offset([_column_index=-1])
///@desc get position of column line (in pixels, from the left side of the contents region).
///@param {Real} [_column_index=-1]   pass -1 to use current column, otherwise 0..GetColumnsCount() inclusive. column 0 is typically 0.0f
var buff = __imguigml_wrapper_buffer();
rousr_buffer_write_val(buff, argument_count > 0 ? argument[0] : -1, ERousrData.Int32);
_extImguiGML_get_column_offset();

#define imguigml_set_column_offset
///@function imguigml_set_column_offset(_column_index, _offset_x)
///@desc set position of column line (in pixels, from the left side of the contents region).
///@param {Real} _column_index   pass -1 to use current column
///@param {Real} _offset_x       offset in pixels from the left side of the contents
var in = __Imgui_in;
rousr_buffer_write_val(in, argument[0], ERousrData.Int32);
rousr_buffer_write_val(in, argument[1], ERousrData.Float);
_extImguiGML_set_column_offset();

#define imguigml_get_columns_count
///@function imguigml_get_columns_count()
///@desc get amount of columns
///@returns {Real} columns count
_extImguiGML_get_columns_count();
return buffer_read(__Imgui_out, buffer_s32);

#define imguigml_push_id
///@function imguigml_push_id(_id, [_end_id])
///@desc push identifier into the ID stack. IDs are hash of the entire stack!
///@param {Real|String} _id   string or real id to push
///@param {String} [_end_id]   last id to push
var _buff = __imguigml_wrapper_buffer();
var _id = argument[0];
if (argument_count > 1) {
  rousr_buffer_write_val(_buff, string(_id));
  rousr_buffer_write_val(_buff, string(argument[1]));
} else {
  if (is_real(_id) || is_int32(_id) || is_int64(_id))
    rousr_buffer_write_val(_buff, _id, ERousrData.Int32);
  else 
    rousr_buffer_write_val(_buff, string(_id));
}

_extImguiGML_push_id();

#define imguigml_pop_id
///@function imguigml_pop_id()
///@desc pop identifier from ID stack
_extImguiGML_pop_id();

#define imguigml_get_id
///@function imguigml_get_id(_id, [_end_id])
///@desc push identifier into the ID stack. IDs are hash of the entire stack!
///@param {Real|String} _id    string or real id to get
///@param {String} [_end_id]   last id to get
///@returns {Real} ImGuiID
var in = __imguigml_wrapper_buffer();
var _id = argument[0];
if (argument_count > 1) {
  rousr_buffer_write_val(in, string(_id));
  rousr_buffer_write_val(in, string(argument[1]));
} else {
  if (is_real(_id) || is_int32(_id) || is_int64(_id))
    rousr_buffer_write_val(in, _id, ERousrData.Uint32);
  else 
    rousr_buffer_write_val(in, string(_id));
}
_extImguiGML_get_id();

return buffer_read(__Imgui_out, buffer_u32);

#define imguigml_get_version


#define imguigml_get_clipboard_text
///@function imguigml_get_clipboard_text()
///@desc get the clipboard text
///@return {String} clipboard text
_extImguiGML_get_clipboard_text();
return buffer_read(__Imgui_out, buffer_string);

#define imguigml_set_clipboard_text
///@function imguigml_set_clipboard_text(_text)
///@desc set the clipboard text
var in = __Imgui_in;
rousr_buffer_write_val(in, argument[0]);
_extImguiGML_set_clipboard_text();

#define imguigml_get_key_index
///@function imguigml_get_key_index(_key_index)
///@desc get mapped index for imgui_key index, you really don't need this
///@param {Real:__ImGuiKey_} _key_index
///@returns {Real}
var in = __Imgui_in;
rousr_buffer_write_val(in, argument[0], ERousrData.Int32);
_extImguiGML_get_key_index();
return buffer_read(__Imgui_out, buffer_s32);

#define imguigml_is_key_down
///@function imguigml_is_key_down(_key_index)
///@desc is key being held. == io.KeysDown[user_key_index]. note that imgui doesn't know the semantic of each entry of io.KeyDown[]. Use your own indices/enums according to how your backend/engine stored them into KeyDown[]!
///@param {Real:__ImGuiKey_} _key_index
///@returns {Boolean}
var in = __Imgui_in;
rousr_buffer_write_val(in, argument[0], ERousrData.Int32);
_extImguiGML_is_key_down();
return buffer_read(__Imgui_out, buffer_s8) != 0;

#define imguigml_is_key_pressed
///@function imguigml_is_key_pressed(_key_index, [_repeat=true])
///@desc was key pressed (went from !Down to Down)
///@param {Real:__ImGuiKey_} _key_index
///@param {Boolean} [_repeat=true]        repeat=true, uses io.KeyRepeatDelay / KeyRepeatRate
///@returns {Boolean}
var in = __Imgui_in;
rousr_buffer_write_val(in, argument[0], ERousrData.Int32);
_extImguiGML_is_key_pressed();
return buffer_read(__Imgui_out, buffer_s8) != 0;

#define imguigml_is_key_released
///@function imguigml_is_key_released(_key_index)
///@desc is key released
///@param {Real:__ImGuiKey_} _key_index
///@returns {Boolean}
var in = __Imgui_in;
rousr_buffer_write_val(in, argument[0], ERousrData.Int32);
_extImguiGML_is_key_released();
return buffer_read(__Imgui_out, buffer_s8) != 0;

#define imguigml_get_key_pressed_amount
///@function imguigml_get_key_pressed_amount(_key_index, _repeat_delay, _rate);
///@desc uses provided repeat rate/delay. 
///@param {Real} _key_index
///@param {Real} _repeat_delay
///@param {Real} _rate
///@returns {Real} return a count, most often 0 or 1 but might be >1 if RepeatRate is small enough that DeltaTime > RepeatRate
var in = __Imgui_in;
rousr_buffer_write_val(in, argument[0], ERousrData.Int32);
rousr_buffer_write_val(in, argument[1], ERousrData.Float);
rousr_buffer_write_val(in, argument[2], ERousrData.Float);
_extImguiGML_get_key_pressed_amount();
return buffer_read(__Imgui_out, buffer_s32);

#define imguigml_is_mouse_down
///@function imguigml_is_mouse_down(_button)
///@desc is mouse button held
///@param {Real} _button
///@returns {Boolean}
var in = __Imgui_in;
rousr_buffer_write_val(in, argument[0], ERousrData.Int32);
_extImguiGML_is_mouse_down();
return buffer_read(__Imgui_out, buffer_s8) != 0;

#define imguigml_is_mouse_clicked
///@function imguigml_is_mouse_clicked(_button, [_repeat=false])
///@desc did mouse button clicked (went from !Down to Down)
///@param {Real} _button
///@param {Boolean} [_repeat=false]
///@returns {Boolean}
var in = __Imgui_in;
var _repeat = argument_count > 1 ? argument[1] : false;
rousr_buffer_write_val(in, argument[0], ERousrData.Int32);
rousr_buffer_write_val(in, _repeat ? 1 : 0, ERousrData.Int8);
_extImguiGML_is_mouse_clicked();
return buffer_read(__Imgui_out, buffer_s8) != 0;

#define imguigml_is_mouse_double_clicked
///@function imguigml_is_mouse_double_clicked(_button)
///@desc did mouse button double-clicked. a double-click returns false in IsMouseClicked(). uses io.MouseDoubleClickTime.
///@param {Real} _button
///@returns {Boolean}
var in = __Imgui_in;
rousr_buffer_write_val(in, argument[0], ERousrData.Int32);
_extImguiGML_is_mouse_double_clicked();
return buffer_read(__Imgui_out, buffer_s8) != 0;

#define imguigml_is_mouse_released
///@function imguigml_is_mouse_released(_button)
///@desc did mouse button released (went from Down to !Down)
///@param {Real} _button
///@returns {Boolean}
var in = __Imgui_in;
rousr_buffer_write_val(in, argument[0], ERousrData.Int32);
_extImguiGML_is_mouse_released();
return buffer_read(__Imgui_out, buffer_s8) != 0;

#define imguigml_is_mouse_dragging
///@function imguigml_is_mouse_dragging([_button=0], [_lock_threadhold=-1.0])
///@desc is mouse dragging. 
///@param {Real} [_button=0]
///@param {Real} [_lock_threshold=-1.0]   if lock_threshold < -1.0f uses io.MouseDraggingThreshold
///@returns {Boolean}
var in = __Imgui_in;
rousr_buffer_write_val(in, argument_count > 0 ? argument[0] :    0, ERousrData.Int32);
rousr_buffer_write_val(in, argument_count > 1 ? argument[1] : -1.0, ERousrData.Float);
_extImguiGML_is_mouse_dragging();
return buffer_read(__Imgui_out, buffer_s8) != 0;

#define imguigml_is_mouse_hovering_rect
///@function imguigml_is_mouse_hovering_rect(_min_x, _min_y, _max_x, _max_y, [_clip=true])
///@desc is mouse hovering given bounding rect (in screen space). 
///@param {Real} _min_x
///@param {Real} _min_y
///@param {Real} _max_x
///@param {Real} _max_y
///@param {Boolean} [_clip=true]   clipped by current clipping settings. disregarding of consideration of focus/window ordering/blocked by a popup.
///@returns {Boolean}
var in = __Imgui_in;
var clipped = argument_count > 4 ? argument[4] : true;

rousr_buffer_write_val(in, argument[0], ERousrData.Float);
rousr_buffer_write_val(in, argument[1], ERousrData.Float);
rousr_buffer_write_val(in, argument[2], ERousrData.Float);
rousr_buffer_write_val(in, argument[3], ERousrData.Float);
rousr_buffer_write_val(in, clipped ? 1 : 0, ERousrData.Int8);
_extImguiGML_is_mouse_hovering_rect();
return buffer_read(__Imgui_out, buffer_s8) != 0;

#define imguigml_is_mouse_pos_valid
///@function imguigml_is_mouse_pos_valid()
///@desc is the mouse position valid
///@returns {Boolean}
_extImguiGML_is_mouse_pos_valid();
return buffer_read(__Imgui_out, buffer_s8) == 1;

#define imguigml_get_mouse_pos
///@function imguigml_get_mouse_pos()
///@desc shortcut to ImGui::GetIO().MousePos provided by user, to be consistent with other calls
///@returns {Boolean}
_extImguiGML_get_mouse_pos();

var out = __Imgui_out;
var ret = array_create(2);
ret[@ 0] = buffer_read(out, buffer_f32);
ret[@ 1] = buffer_read(out, buffer_f32);
return ret;


#define imguigml_get_mouse_pos_on_opening_current_popup
///@function imguigml_get_mouse_pos_on_opening_current_popup()
///@desc retrieve backup of mouse positioning at the time of opening popup we have BeginPopup() into
_extImguiGML_get_mouse_pos_on_opening_current_popup();


var out = __Imgui_out;
var ret = array_create(2);
ret[@ 0] = buffer_read(out, buffer_f32);
ret[@ 1] = buffer_read(out, buffer_f32);
return ret;


#define imguigml_get_mouse_drag_delta
///@function imguigml_get_mouse_drag_delta()
///@desc retrieve backup of mouse positioning at the time of opening popup we have BeginPopup() into
var in = __Imgui_in;
rousr_buffer_write_val(in, argument_count > 0 ? argument[0] :    0, ERousrData.Int32);
rousr_buffer_write_val(in, argument_count > 1 ? argument[1] : -1.0, ERousrData.Float);
_extImguiGML_get_mouse_drag_delta();
var out = __Imgui_out;
var ret = array_create(2);
ret[@ 0] = buffer_read(out, buffer_f32);
ret[@ 1] = buffer_read(out, buffer_f32);
return ret;

#define imguigml_reset_mouse_drag_delta
///@function imguigml_reset_mouse_drag_delta([_button=0])
///@desc reset the drag delta
///@param {Real} [_button=0]
var in = __Imgui_in;
rousr_buffer_write_val(in, argument_count > 0 ? argument[0] : 0, ERousrData.Int32);
_extImguiGML_reset_mouse_drag_delta();

#define imguigml_get_mouse_cursor
///@function imguigml_get_mouse_cursor()
///@desc get desired cursor type, reset in ImGui::NewFrame(), this is updated during the frame. valid before Render(). If you use software rendering by setting io.MouseDrawCursor ImGui will render those for you
///@returns {Real:EImGui_MouseCursor} cursor id
_extImguiGML_get_mouse_cursor();
return buffer_read(__Imgui_out, buffer_s32);

#define imguigml_set_mouse_cursor
///@function imguigml_set_mouse_cursor(_type)
///@desc set desired cursor type
///@param {Real:EImGui_MouseCursor} _type
var in = __Imgui_in;
rousr_buffer_write_val(in, argument[0], ERousrData.Int32);
_extImguiGML_set_mouse_cursor();

#define imguigml_capture_keyboard_from_app
///@function imguigml_capture_keyboard_from_app([_capture=true])
///@desc manually override io.WantCaptureKeyboard flag next frame (said flag is entirely left for your application handle). e.g. force capture keyboard when your widget is being hovered.
///@param {Boolean} [_capture=true]
var in = __Imgui_in;
var _capture = argument_count > 0 ? argument[0] : true;
rousr_buffer_write_val(in, _capture ? 1 : 0, ERousrData.Int8);
_extImguiGML_capture_keyboard_from_app();

#define imguigml_capture_mouse_from_app
///@function imguigml_capture_mouse_from_app([_capture=true])
///@desc manually override io.WantCaptureMouse flag next frame (said flag is entirely left for your application handle).
///@param {Boolean} [_capture=true]
var in = __Imgui_in;
var _capture = argument_count > 0 ? argument[0] : true;
rousr_buffer_write_val(in, _capture ? 1 : 0, ERousrData.Int8);
_extImguiGML_capture_mouse_from_app();

#define imguigml_log_to_tty
///@function imguigml_log_to_tty([_max_depth=-1])
///@desc start logging to tty
///@param {Real} [_max_depth=-1]
var in = __Imgui_in;
rousr_buffer_write_val(in, argument_count > 0 ? argument[0] : -1, ERousrData.Int32);
_extImguiGML_log_to_tty();

#define imguigml_log_to_file
///@function imguigml_log_to_file([_max_depth=-1], [_file_name=undefined])
///@desc start logging to file
///@param {Real}   [_max_depth=-1]          
///@param {String} [_file_name=undefined]   absolute path to log   
var in = __Imgui_in;
var _filename = argument_count > 1 ? argument[1] : undefined;
rousr_buffer_write_val(in, argument_count > 0 ? argument[0] : -1, ERousrData.Int32);
if (is_string(_filename)) rousr_buffer_write_val(in, _filename);
_extImguiGML_log_to_tty();

#define imguigml_log_to_clipboard
///@function imguigml_log_to_clipboard([_max_depth=-1])
///@desc start logging to OS clipboard
///@param {Real} [_max_depth=-1]
var in = __Imgui_in;
rousr_buffer_write_val(in, argument_count > 0 ? argument[0] : -1, ERousrData.Int32);
_extImguiGML_log_to_clipboard();

#define imguigml_log_finish
///@function imguigml_log_finish
///@desc stop logging (close file, etc.)
_extImguiGML_log_finish();

#define imguigml_log_buttons
///@function imguigml_log_buttons()
///@desc helper to display buttons for logging to tty/file/clipboard
_extImguiGML_log_buttons();

#define imguigml_log_text
///@function imguigml_log_text(_text)
///@desc pass text data straight to log (without being displayed)
///@param {String} _text
var in = __Imgui_in;
rousr_buffer_write_val(in, argument[0]);
_extImguiGML_log_text();

#define imguigml_begin_main_menu_bar
///@function imguigml_begin_main_menu_bar()
///@desc create and append to a full screen menu-bar. only call EndMainMenuBar() if this returns true!
///@returns {Boolean}
_extImguiGML_begin_main_menu_bar()
return buffer_read(__Imgui_out, buffer_s8) == 1;

#define imguigml_end_main_menu_bar
///@function imguigml_end_main_menu_bar()
///@desc end main menu bar
_extImguiGML_end_main_menu_bar()

#define imguigml_begin_menu_bar
///@function imguigml_begin_menu_bar()
///@desc append to menu-bar of current window (requires ImGuiWindowFlags_MenuBar flag set on parent window). only call EndMenuBar() if this returns true!
///@returns {Boolean}
_extImguiGML_begin_menu_bar()
return buffer_read(__Imgui_out, buffer_s8) == 1;

#define imguigml_end_menu_bar
///@function imguigml_end_menu_bar()
///@desc end menu bar
_extImguiGML_end_menu_bar();

#define imguigml_begin_menu
///@function imguigml_begin_menu(_label, [_enabled=true]);
///@desc create a sub-menu entry. only call EndMenu() if this returns true!
///@param {String} _label          
///@param {Boolean} [_enabled=true]
///@returns {Boolean}
var in = __Imgui_in;
var _enabled = argument_count > 1 ? argument[1] : true;
rousr_buffer_write_val(in, argument[0]);
rousr_buffer_write_val(in, _enabled ? 1 : 0, ERousrData.Int8);
_extImguiGML_begin_menu();
return buffer_read(__Imgui_out, buffer_s8) != 0;

#define imguigml_end_menu
///@function imguigml_end_menu()
///@desc end sub-menu entry
_extImguiGML_end_menu();

#define imguigml_menu_item
///@function imguigml_menu_item(_label, [_shortcut=""], [_selected=false], [_enabled=true]);
///@desc show a sub-menu item
///@param {String} _label
///@param {String} [_shortcut=""]       shortcuts are displayed for convenience but not processed by ImGui at the moment
///@param {Boolean} [_selected=false]  
///@param {Boolean} [_enabled=true] 
/// @returns {Boolean} true when activated. 
var in = __Imgui_in;
var _selected = argument_count > 2 ? argument[2] : false;
var _enabled  = argument_count > 3 ? argument[3] : true;

rousr_buffer_write_val(in, string(argument[0]));
rousr_buffer_write_val(in, string(argument_count > 1 ? argument[1] : ""));
rousr_buffer_write_val(in, _selected ? 1 : 0, ERousrData.Int8);
rousr_buffer_write_val(in, _enabled ? 1 : 0, ERousrData.Int8);
_extImguiGML_menu_item();

return buffer_read(__Imgui_out, buffer_s8) != 0;

#define imguigml_open_popup
///@function imguigml_open_popup(_str_id)
///@desc call to mark popup as open (don't call every frame!). popups are closed when user click outside, 
///      or if CloseCurrentPopup() is called within a BeginPopup()/EndPopup() block. By default, 
///      Selectable()/MenuItem() are calling CloseCurrentPopup(). Popup identifiers are relative to the 
///      current ID-stack (so OpenPopup and BeginPopup needs to be at the same level).
///@param {String} _str_id
var in = __Imgui_in;
rousr_buffer_write_val(in, argument[0]);
_extImguiGML_open_popup();

#define imguigml_open_popup_on_item_click
///@function imguigml_open_popup_on_item_click([_str_id=undefined], [_mouse_button=1])
///@desc helper to open popup when clicked on last item. 
///@param {String} [_str_id=undefined]
///@param {Real} [_mouse_button=1]
///@returns {Boolean} true when just opened.
var in = __Imgui_in;
var str_id = argument_count > 0 ? argument[0] : noone;
if (!is_string(str_id)) str_id = noone;
rousr_buffer_write_val(in, str_id);
rousr_buffer_write_val(in, argument_count > 1 ? argument[1] : 1, ERousrData.Int32);
_extImguiGML_open_popup_on_item_click();
return buffer_read(__Imgui_out, buffer_s8) != 0;

#define imguigml_begin_popup
///@function imguigml_begin_popup(_str_id)
///@desc begin a pop up - only call EndPopup() if BeginPopup() returned true!
///@param {String} _str_id
///@returns {Boolean} true if the popup is open, and you can start outputting to it. 
var in = __Imgui_in;
rousr_buffer_write_val(in, argument[0]);
_extImguiGML_begin_popup();
return buffer_read(__Imgui_out, buffer_s8) != 0;

#define imguigml_begin_popup_modal
///@function imguigml_begin_popup_modal(_name, [_open=undefined], [_extra_flags=0])
///@desc modal dialog (block interactions behind the modal window, can't close the modal window by clicking outside)
///@param {String} _name
///@param {Boolean} [_open=undefined] if passed, a close button is shown if true, or its closed if false, returns array with second value being if its open still
///@param {Real:EImGui_WindowFlags} [_extra_flags=0]
///@returns {Boolean|Array:[Boolean, Boolean]} if `_open` is passed, then an array for [ BeginPopupModal, _open ]
var in = __Imgui_in;

var _open = argument_count > 1 ? argument[1] : undefined;
if (_open == noone) _open = undefined;
var do_open = _open == undefined;
rousr_buffer_write_val(in, string(argument[0]));
if (_open != undefined)
  rousr_buffer_write_val(in, _open ? 1 : 0, ERousrData.Int8)
else 
  rousr_buffer_write_val(in, " ");
rousr_buffer_write_val(in, argument_count > 2 ? argument[2] : 0, ERousrData.Int32);
_extImguiGML_begin_popup_modal();

var out = __Imgui_out;
if (do_open) {
	var ret = array_create(2);
	ret[@ 0] = buffer_read(out, buffer_s8);
	ret[@ 1] = buffer_read(out, buffer_s8);
	return ret;
} 

return buffer_read(out, buffer_s8) != 0;

#define imguigml_begin_popup_context_item
///@function imguigml_begin_popup_context_item([_str_id=undefined], [_mouse_button=1])
///@desc helper to open and begin popup when clicked on last item. if you can pass a NULL str_id only if the previous item had an id. If you want to use that on a non-interactive item such as Text() you need to pass in an explicit ID here. read comments in .cpp!
///@param {String} [_str_id=undefined]   if you can pass an `undefined` `_str_id` only if the previous item had an id. If you want to use that on a non-interactive item such as Text() you need to pass in an explicit ID here.
///@param {Real}   [_mouse_button=1]     
///@returns {Boolean}
var in = __Imgui_in;
var str_id = argument_count > 0 ? argument[0] : noone;
if (!is_string(str_id)) str_id = noone;

rousr_buffer_write_val(in, str_id);
rousr_buffer_write_val(in, argument_count > 1 ? argument[1] : 1, ERousrData.Int32);

_extImguiGML_begin_popup_context_item();
return buffer_read(__Imgui_out, buffer_s8) != 0;

#define imguigml_begin_popup_context_window
///@function imguigml_begin_popup_context_window([_str_id=undefined], [_mouse_button=1], [_also_over_items=true])
///@desc helper to open and begin popup when clicked on current window.
///@param {String} [_str_id=undefined]
///@param {Real} [_mouse_button=1]
///@param {Boolean} [_also_over_items=true]
///@returns {Boolean}
var in = __Imgui_in;
var str_id = argument_count > 0 ? argument[0] : noone;
if (!is_string(str_id)) str_id = noone;
var also_over_items = argument_count > 2 ? argument[2] : true;

rousr_buffer_write_val(in, str_id);
rousr_buffer_write_val(in, argument_count > 1 ? argument[1] : 1, ERousrData.Int32);
rousr_buffer_write_val(in, also_over_items ? 1 : 0, ERousrData.Int8);
_extImguiGML_begin_popup_context_window();
return buffer_read(__Imgui_out, buffer_s8) != 0;

#define imguigml_begin_popup_context_void
///@function imguigml_begin_popup_context_void([_str_id=undefined], [_mouse_button=1])
///@desc helper to open and begin popup when clicked in void (where there are no imgui windows).
///@param {String} [_str_id=undefined]
///@param {Real} [_mouse_button=1]
///@returns {Boolean}
var in = __Imgui_in;
var str_id = argument_count > 0 ? argument[0] : noone;
if (!is_string(str_id)) str_id = noone;
rousr_buffer_write_val(in, str_id);
rousr_buffer_write_val(in, argument_count > 1 ? argument[1] : 1, ERousrData.Int32);
_extImguiGML_begin_popup_context_void();
return buffer_read(__Imgui_out, buffer_s8) != 0;

#define imguigml_end_popup
///@function imguigml_end_popup()
///@desc end the current pop up
_extImguiGML_end_popup();

#define imguigml_is_popup_open
///@function imguigml_is_popup_open(_str_id)
///@desc return true if the popup is open
///@param {String} _str_id
///@returns {Boolean}
var in = __Imgui_in;
rousr_buffer_write_val(in, string(argument[0]));
_extImguiGML_is_popup_open();
return buffer_read(__Imgui_out, buffer_s8) != 0;

#define imguigml_close_current_popup
///@function imguigml_close_current_popup()
///@desc close the popup we have begin-ed into. clicking on a MenuItem or Selectable automatically close the current popup.
_extImguiGML_close_current_popup();

#define imguigml_push_font
///@function imguigml_push_font(_font_index)
///@desc use undefined as a shortcut to push default font

//todo: implement font system
//_extImguiGML_push_font();

#define imguigml_pop_font
///@function imguigml_pop_font()
///@desc pop the font

//todo: implement font system
//_extImguiGML_pop_font();

#define imguigml_push_style_color
///@function imguigml_push_style_color(_idx, _colOrR, [_g], [_b], [_a])
///@desc
///@param {Real:EImGui_Col} _idx    
///@param {Real} _colOrR if passing a single color, treated as a U32 colors
///@param {Real} [_g]    
///@param {Real} [_b]    
///@param {Real} [_a]    
var in = __Imgui_in;
rousr_buffer_write_val(in, argument[0], ERousrData.Int32);
if (argument_count == 2)
  rousr_buffer_write_val(in, argument[1], ERousrData.Uint32);
else {
  rousr_buffer_write_val(in, argument[1], ERousrData.Float);
  rousr_buffer_write_val(in, argument[2], ERousrData.Float);
  rousr_buffer_write_val(in, argument[3], ERousrData.Float);
  rousr_buffer_write_val(in, argument[4], ERousrData.Float);
}

_extImguiGML_push_style_color();

#define imguigml_pop_style_color
///@function imguigml_pop_style_color([_count=1])
///@desc pop style colors
///@param {Real} [_count=1]
var in = __Imgui_in;
rousr_buffer_write_val(in, argument_count > 0 ? argument[0] : 1, ERousrData.Int32);
_extImguiGML_pop_style_color();

#define imguigml_push_style_var
///@function imguigml_push_style_var
///@desc push a style var on the param stack
///@param {Real:EImGui_StyleVar} _idx 
///@param {Real} _valOrX  
///@param {Real} [_y]     if passed, treat the values as a vec2
var in = __Imgui_in;
rousr_buffer_write_val(in, argument[0], ERousrData.Int32);
rousr_buffer_write_val(in, argument[1], ERousrData.Float);
if (argument_count > 2)
  rousr_buffer_write_val(in, argument[2], ERousrData.Float);

_extImguiGML_push_style_var();

#define imguigml_pop_style_var
///@function imguigml_pop_style_var([_count=1])
///@desc pop style colors
///@param {Real} [_count=1]
var in = __Imgui_in;
rousr_buffer_write_val(in, argument_count > 0 ? argument[0] : 1, ERousrData.Int32);
_extImguiGML_pop_style_var();

#define imguigml_get_style_color_vec4
///@function imguigml_get_style_color_vec4(_idx)
///@desc retrieve style color as stored in ImGuiStyle structure. use to feed back into PushStyleColor(), otherwhise use GetColorU32() to get style color + style alpha.
///@param {Real:EImGui_Col} _idx    
///@returns {Array:[r,g,b,a]}
rousr_buffer_write_val(__Imgui_in, argument[0], ERousrData.Int32);
_extImguiGML_get_style_color_vec4();


var out = __Imgui_out;
var ret = array_create(4);
ret[@ 0] = buffer_read(out, buffer_f32);
ret[@ 1] = buffer_read(out, buffer_f32);
ret[@ 2] = buffer_read(out, buffer_f32);
ret[@ 3] = buffer_read(out, buffer_f32);
return ret;


#define imguigml_get_font
///@function imguigml_get_font()
///@desc get current font
///@returns {Real} _font_id

//todo: implement font system
//_extImguiGML_get_font();

#define imguigml_get_font_size
///@function imguigml_get_font_size()
///@desc get current font size (= height in pixels) of current font with current scale applied
///@returns {Real} current font size
_extImguiGML_get_font_size();
return buffer_read(__Imgui_out, buffer_f32);

#define imguigml_get_font_tex_uv_white_pixel
///@function imguigml_get_font_tex_uv_white_pixel()
///@desc get UV coordinate for a while pixel, useful to draw custom shapes via the ImDrawList API
///@returns {Array:[u,v]}
_extImguiGML_get_font_tex_uv_white_pixel();

var out = __Imgui_out;
var ret = array_create(2);
ret[@ 0] = buffer_read(out, buffer_f32);
ret[@ 1] = buffer_read(out, buffer_f32);
return ret;


#define imguigml_get_color_u32
///@function imguigml_get_color_u32(_colOrR, [_g], [_b], [_a])
///@desc retrieve given style color with style alpha applied and optional extra alpha multiplier
///@param {Real} _colOrR   U32 color, or r component
///@param {Real} [_g]      g component
///@param {Real} [_b]      b component
///@param {Real} [_a]      a component
var in = __Imgui_in;
if (argument_count == 1)
  rousr_buffer_write_val(in, argument[0], ERousrData.Uint32);
else {
  rousr_buffer_write_val(in, argument[0], ERousrData.Float);
  rousr_buffer_write_val(in, argument[1], ERousrData.Float);
  rousr_buffer_write_val(in, argument[2], ERousrData.Float);
  rousr_buffer_write_val(in, argument[3], ERousrData.Float);
}
_extImguiGML_get_color_u32();
return buffer_read(__Imgui_out, buffer_u32);

#define imguigml_get_color_u32_from_idx
///@function imguigml_get_color_u32_from_idx(_idx, [_alpha_mul=1.0])
///@desc retrieve given style color with style alpha applied and optional extra alpha multiplier
///@param {Real:EImGui_Col} _idx
///@param {Real} [_alpha_mul=1.0]
var in = __Imgui_in;
rousr_buffer_write_val(in, argument[0], ERousrData.Int32);
rousr_buffer_write_val(in, argument_count > 1 ? argument[1] : 1.0, ERousrData.Float);
_extImguiGML_get_color_u32();
return buffer_read(__Imgui_out, buffer_u32);

#define imguigml_push_item_width
///@function imguigml_push_item_width(_item_width)
///@desc width of items for the common item+label case, pixels. 
///@param {Real} _item_width   0.0f = default to ~2/3 of windows width, >0.0f: width in pixels, <0.0f align xx pixels to the right of window (so -1.0f always align width to the right side)
var in = __Imgui_in;
rousr_buffer_write_val(in, argument[0], ERousrData.Float);
_extImguiGML_push_item_width();

#define imguigml_pop_item_width
///@function imguigml_pop_item_width()
///@desc pop item width
_extImguiGML_pop_item_width();

#define imguigml_calc_item_width
///@function imguigml_calc_item_width()
///@desc width of item given pushed settings and current cursor position
///@returns {Real}
_extImguiGML_calc_item_width();
return buffer_read(__Imgui_out, buffer_f32);

#define imguigml_push_text_wrap_pos
///@function imguigml_push_text_wrap_pos([_wrap_pos_x=0.0])
///@desc word-wrapping for Text*() commands. 
///@param {Real} [_wrap_pos_x=0.0]    < 0.0f: no wrapping; 0.0f: wrap to end of window (or column); > 0.0f: wrap at 'wrap_pos_x' position in window local space
var in = __Imgui_in;
rousr_buffer_write_val(in, argument_count > 0 ? argument[0] : 0.0, ERousrData.Float);
_extImguiGML_push_text_wrap_pos();

#define imguigml_pop_text_wrap_pos
///@function imguigml_pop_text_wrap_pos()
///@desc pop text wrap pos
_extImguiGML_pop_text_wrap_pos();

#define imguigml_push_allow_keyboard_focus
///@function imguigml_push_allow_keyboard_focus(_allow_keyboard_focus)
///@desc allow focusing using TAB/Shift-TAB, enabled by default but you can disable it for certain widgets
///@param {Boolean} _allow_keyboard_focus   
var in = __Imgui_in;
rousr_buffer_write_val(in, argument[0] ? 1 : 0, ERousrData.Int8);
_extImguiGML_push_allow_keyboard_focus();

#define imguigml_pop_allow_keyboard_focus
///@function imguigml_pop_allow_keyboard_focus()
///@desc pop allow keyboard focus
_extImguiGML_pop_allow_keyboard_focus();

#define imguigml_push_button_repeat
///@function imguigml_push_button_repeat(_repeat)
///@desc in 'repeat' mode, Button*() functions return repeated true in a typematic manner (using io.KeyRepeatDelay/io.KeyRepeatRate setting). Note that you can call IsItemActive() after any Button() to tell if the button is held in the current frame.
///@param {Boolean} _repeat
var in = __Imgui_in;
rousr_buffer_write_val(in, argument[0] ? 1 : 0, ERousrData.Int8);
_extImguiGML_push_button_repeat();

#define imguigml_pop_button_repeat
///@function imguigml_pop_button_repeat()
///@desc pop repeat mode
_extImguiGML_pop_button_repeat();

#define imguigml_selectable
///@function imguigml_selectable(_label, [_selected=false], [_selectable_flags=0], [_size_x=0], [_size_y=0])
///@desc selectable element
///@param {String}                      _label   
///@param {Boolean}                     [_selected=false]
///@param {Real:EImGui_SelectableFlags} [_selectable_flags=0]
///@param {Real}                        [_size_x=0]            size.x==0.0: use remaining width, size.x>0.0: specify width.
///@param {Real}                        [_size_y=0]            size.y==0.0: use label height, size.y>0.0: specify height
///@returns {Array:[_val_changes, _is_selected]}
var in = __Imgui_in;
var _selected = argument_count > 1 ? argument[1] : false;

rousr_buffer_write_val(in, string(argument[0]));
rousr_buffer_write_val(in, _selected ? 1 : 0, ERousrData.Int8);
rousr_buffer_write_val(in, argument_count > 2 ? argument[2] : 0, ERousrData.Int32);
rousr_buffer_write_val(in, argument_count > 4 ? argument[3] : 0, ERousrData.Float);
rousr_buffer_write_val(in, argument_count > 4 ? argument[4] : 0, ERousrData.Float);

_extImguiGML_selectable();

var out = __Imgui_out;
var ret = array_create(2);
ret[@ 0] = buffer_read(out, buffer_s8) != 0;
ret[@ 1] = buffer_read(out, buffer_s8) != 0;
return ret;


#define imguigml_list_box
///@function imguigml_list_box(_label, _current_item, _item_array, [_height_in_items=-1])
///@desc create a list box
///@param {String} _label 
///@param {Real} _current_item
///@param {Array:String} _item_array
///@param {Real} [_height_in_items=-1])
///@retusn {Array:[{Boolean} _changed, {Real} _selected_index]}
var in = __Imgui_in;
rousr_buffer_write_val(in, argument[0]);
rousr_buffer_write_val(in, argument[1], ERousrData.Int32);

var _items = argument[2];
var num_items = array_length_1d(_items);
rousr_buffer_write_val(in, num_items, ERousrData.Int32);
for (var i = 0; i < num_items; ++i) 
  rousr_buffer_write_val(in, string(_items[i]));

rousr_buffer_write_val(in, argument_count > 3 ? argument[3] : -1, ERousrData.Int32);
_extImguiGML_list_box();

var out = __Imgui_out;
var ret = array_create(2);
ret[@ 0] = buffer_read(out, buffer_s8) != 0;
ret[@ 1] = buffer_read(out, buffer_s32);
return ret;

#define imguigml_list_box_header
///@function imguigml_list_box_header(_label, _size_x, _size_y)
///@desc use if you want to reimplement ListBox() will custom data or interactions. make sure to call ListBoxFooter() afterwards.
///@param {String} _label
///@param {Real} _size_x
///@param {Real} _size_y
///@returns {Boolean}
var in = __Imgui_in;
rousr_buffer_write_val(in, string(argument[0]));
rousr_buffer_write_val(in, argument[1], ERousrData.Float);
rousr_buffer_write_val(in, argument[2], ERousrData.Float);
_extImguiGML_list_box_header();
return buffer_read(__Imgui_out, buffer_s8) != 0;

#define imguigml_list_box_header_items
///@function imguigml_list_box_header_items(_label, _items_count,  [_height_in_items=-1]);
///@desc use if you want to reimplement ListBox() will custom data or interactions. make sure to call ListBoxFooter() afterwards.
///@param {String} _label
///@param {Real} _items_count
///@param {Real} [_height_in_items=-1]
///@returns {Boolean}
var in = __Imgui_in;
rousr_buffer_write_val(in, string(argument[0]));
rousr_buffer_write_val(in, argument[1], ERousrData.Int32);
rousr_buffer_write_val(in, argument_count > 2 ? argument[2] : -1, ERousrData.Int32);
_extImguiGML_list_box_header();
return buffer_read(__Imgui_out, buffer_s8) != 0;

#define imguigml_list_box_footer
///@function imguigml_list_box_footer()
///@desc terminate the scrolling region
_extImguiGML_list_box_footer();

#define imguigml_show_style_editor
///@function imguigml_show_style_editor()
///@desc add style editor block (not a window). you can pass in a reference ImGuiStyle structure to compare to, revert to and save to (else it uses the default style)
// todo: style index
_extImguiGML_show_style_editor();

#define imguigml_style_colors_classic
///@function imguigml_style_colors_classic()
///@desc use classic colors
// todo: style index
_extImguiGML_style_colors_classic()

#define imguigml_style_colors_dark
///@function imguigml_style_colors_dark()
///@desc use dark colors
// todo: style index
_extImguiGML_style_colors_dark()

#define imguigml_set_tooltip
///@function imguigml_set_tooltip(_tooltip_text)
///@desc set text tooltip under mouse-cursor, typically use with ImGui::IsItemHovered(). overidde any previous call to SetTooltip().
///@param {String} _tooltip_text
var in = __Imgui_in;
rousr_buffer_write_val(in, string(argument[0]));
_extImguiGML_set_tooltip();

#define imguigml_begin_tooltip
///@function imguigml_begin_tooltip()
///@desc begin/append a tooltip window. to create full-featured tooltip (with any kind of contents).
_extImguiGML_begin_tooltip();

#define imguigml_end_tooltip
///@function imguigml_end_tooltip()
///@desc end a tooltip window
_extImguiGML_end_tooltip();

#define imguigml_value
///@function imguigml_value(_label, _val_type, _val, [_float_format])
///@desc Output single value in "name: value" format (tip: freely declare more in your code to handle your types. you can add functions to the ImGui namespace)
///@param {String}              _prefix           value prefix
///@param {Real:EImGui_ValType} _val_type         data type for value
///@param {Real}                _val              value to apss
///@param {String}              [_float_format]   (float value type only)
var in = __Imgui_in;

rousr_buffer_write_val(in, string(argument[0]));                                   
switch(argument[1]) {
  case EImGui_ValType.Bool:        rousr_buffer_write_val(in, argument[2] ? 1 : 0, ERousrData.Int8); break;
  case EImGui_ValType.Int:         rousr_buffer_write_val(in, argument[2], ERousrData.Int32); break;
  case EImGui_ValType.UnsignedInt: rousr_buffer_write_val(in, argument[2], ERousrData.Uint32); break;
  case EImGui_ValType.Float:
    rousr_buffer_write_val(in, argument[2], ERousrData.Float); 
    if (argument_count > 3) rousr_buffer_write_val(in, string(argument[3]));
  break;
}
_extImguiGML_value();

#define imguigml_color_convert_u32_to_float4
///@function imguigml_color_convert_u32_to_float4(_color)
///@desc convert a u32 color to a float 4
///@param {Real} _color   u32 color
///@returns {Array:float4} _color
var buff = __imguigml_wrapper_buffer();
rousr_buffer_write_val(buff, argument[0], ERousrData.Uint32);
_extImguiGML_color_convert_u32_to_float4();

var out = __Imgui_out;
var ret = array_create(4);
ret[@ 0] = buffer_read(out, buffer_f32);
ret[@ 1] = buffer_read(out, buffer_f32);
ret[@ 2] = buffer_read(out, buffer_f32);
ret[@ 3] = buffer_read(out, buffer_f32);
return ret;


#define imguigml_color_convert_float4_to_u32
///@function imguigml_color_convert_float4_to_u32(_r, _g, _b, _a)
///@desc convert a float4 color to a u32
///@param {Real} _r
///@param {Real} _g
///@param {Real} _b
///@param {Real} _a
///@returns {Real} _color
var in = __Imgui_in;
rousr_buffer_write_val(in, argument[0], ERousrData.Float);
rousr_buffer_write_val(in, argument[1], ERousrData.Float);
rousr_buffer_write_val(in, argument[2], ERousrData.Float);
rousr_buffer_write_val(in, argument[3], ERousrData.Float);
_extImguiGML_color_convert_float4_to_u32();
return buffer_read(__Imgui_out, buffer_u32);

#define imguigml_color_convert_rgb_to_hsv
///@function imguigml_color_convert_rgb_to_hsv(_r, _g, _b)
///@desc convert rgb to hsv
///@param {Real} _r
///@param {Real} _g
///@param {Real} _b
///@returns {Array:[h,s,v]}
var buff = __imguigml_wrapper_buffer();
rousr_buffer_write_val(buff, argument[0], ERousrData.Float);
rousr_buffer_write_val(buff, argument[1], ERousrData.Float);
rousr_buffer_write_val(buff, argument[2], ERousrData.Float);
_extImguiGML_color_convert_rgb_to_hsv();


var out = __Imgui_out;
var ret = array_create(3);
ret[@ 0] = buffer_read(out, buffer_f32);
ret[@ 1] = buffer_read(out, buffer_f32);
ret[@ 2] = buffer_read(out, buffer_f32);
return ret;


#define imguigml_color_convert_hsv_to_rgb
///@function imguigml_color_convert_hsv_to_rgb(_h, _s, _v)
///@desc convert rgb to hsv
///@param {Real} _h
///@param {Real} _s
///@param {Real} _b
///@returns {Array:[r,g,b]}
var buff = __imguigml_wrapper_buffer();
rousr_buffer_write_val(buff, argument[0], ERousrData.Float);
rousr_buffer_write_val(buff, argument[1], ERousrData.Float);
rousr_buffer_write_val(buff, argument[2], ERousrData.Float);
_extImguiGML_color_convert_hsv_to_rgb();

var out = __Imgui_out;
var ret = array_create(3);
ret[@ 0] = buffer_read(out, buffer_f32);
ret[@ 1] = buffer_read(out, buffer_f32);
ret[@ 2] = buffer_read(out, buffer_f32);
return ret;


#define imguigml_is_item_hovered
///@function imguigml_is_item_hovered([_flags=0])
///@desc is the last item hovered by mouse (and usable)?
///@param {Real:EImGui_HoveredFlags} [_flags=0]
///@returns {Boolean}
var in = __Imgui_in;
rousr_buffer_write_val(in, argument_count > 0 ? argument[0] : 0, ERousrData.Int32);
_extImguiGML_is_item_hovered();
return buffer_read(__Imgui_out, buffer_s8) != 0;

#define imguigml_is_item_active
///@function imguigml_is_item_active()
///@desc is the last item active? (e.g. button being held, text field being edited- items that don't interact will always return false)
///@returns {Boolean}
var in = __Imgui_in;
_extImguiGML_is_item_active();
return buffer_read(__Imgui_out, buffer_s8) != 0;

#define imguigml_is_item_clicked
///@function imguigml_is_item_click([_button=0])
///@desc is the last item clicked? (e.g. button/node just clicked on)
///@param {Real} [_button=0]   mouse_button
///@returns {Boolean}
var in = __Imgui_in;
rousr_buffer_write_val(in, argument_count > 0 ? argument[0] : 0, ERousrData.Int32);
_extImguiGML_is_item_clicked();
return buffer_read(__Imgui_out, buffer_s8) != 0;

#define imguigml_is_item_visible
///@function imguigml_is_item_visible()
///@desc is the last item visible? (aka not out of sight due to clipping/scrolling.)
///@returns {Boolean}
var in = __Imgui_in;
_extImguiGML_is_item_visible();
return buffer_read(__Imgui_out, buffer_s8) != 0;

#define imguigml_is_any_item_hovered
///@function imguigml_is_any_item_hovered()
///@desc are any items hovered
///@returns {Boolean}
var in = __Imgui_in;
_extImguiGML_is_any_item_hovered();
return buffer_read(__Imgui_out, buffer_s8) != 0;

#define imguigml_is_any_item_active
///@function imguigml_is_any_item_active()
///@desc are any items active
///@returns {Boolean}
var in = __Imgui_in;
_extImguiGML_is_any_item_active();
return buffer_read(__Imgui_out, buffer_s8) != 0;

#define imguigml_get_item_rect_min
///@function imguigml_get_item_rect_min()
///@desc get bounding rect of last item in screen space
///@returns {Array:[x,y]}
_extImguiGML_get_item_rect_min();
var out = __Imgui_out;
var ret = array_create(2);
ret[@ 0] = buffer_read(out, buffer_f32);
ret[@ 1] = buffer_read(out, buffer_f32);
return ret;


#define imguigml_get_item_rect_max
///@function imguigml_get_item_rect_max()
///@desc get bounding rect of last item in screen space
///@returns {Array:[x,y]}
_extImguiGML_get_item_rect_max();

var out = __Imgui_out;
var ret = array_create(2);
ret[@ 0] = buffer_read(out, buffer_f32);
ret[@ 1] = buffer_read(out, buffer_f32);
return ret;


#define imguigml_get_item_rect_size
///@function imguigml_get_item_rect_size()
///@desc get bounding rect of last item in screen space
///@returns {Array:[x,y]}
_extImguiGML_get_item_rect_size();
var out = __Imgui_out;
var ret = array_create(2);
ret[@ 0] = buffer_read(out, buffer_f32);
ret[@ 1] = buffer_read(out, buffer_f32);
return ret;

#define imguigml_set_item_allow_overlap
///@function imguigml_set_item_allow_overlap
///@desc allow last item to be overlapped by a subsequent item. sometimes useful with invisible buttons, selectables, etc. to catch unused area.
_extImguiGML_set_item_allow_overlap();

#define imguigml_is_window_focused
///@function imguigml_is_window_focused()
///@desc is current Begin()-ed window focused?
///@returns {Boolean}
var in = __Imgui_in;
_extImguiGML_is_window_focused();
return buffer_read(__Imgui_out, buffer_s8) != 0;

#define imguigml_is_window_hovered
///@function imguigml_is_window_hovered([_flags=0])
///@desc is current Begin()-ed window hovered (and typically: not blocked by a popup/modal)?
///@param {Real:EImGui_HoveredFlags} [_flags=0]
///@returns {Boolean}
var in = __Imgui_in;
rousr_buffer_write_val(in, argument_count > 0 ? argument[0] : 0, ERousrData.Int32);
_extImguiGML_is_window_hovered();
return buffer_read(__Imgui_out, buffer_s8) != 0;

#define imguigml_is_root_window_focused
///@function imguigml_is_root_window_focused()
///@desc is current Begin()-ed root window focused (root = top-most parent of a child, otherwise self)?
///@returns {Boolean}
_extImguiGML_is_root_window_focused();
return buffer_read(__Imgui_out, buffer_s8) != 0;

#define imguigml_is_root_window_or_any_child_focused
///@function imguigml_is_root_window_or_any_child_focused()
///@desc is current Begin()-ed root window or any of its child (including current window) focused?
///@returns {Boolean}
_extImguiGML_is_root_window_or_any_child_focused();
return buffer_read(__Imgui_out, buffer_s8) != 0;

#define imguigml_is_any_window_hovered
///@function imguigml_is_any_window_hovered()
///@desc is mouse hovering any visible window
///@returns {Boolean}
_extImguiGML_is_any_window_hovered();
return buffer_read(__Imgui_out, buffer_s8) != 0;

#define imguigml_is_rect_visible
///@function imguigml_is_rect_visible(_sizeOrMin, [_max])
///@desc test if a rectangle is visible / not clipped
///@param {Real} _size_or_min_x   if only size given, test from cursor pos
///@param {Real} _size_or_min_y
///@param {Real} [_max_x]         if max given, test in screen space
///@param {Real} [_max_y]
///@returns {Boolean}
var in = __Imgui_in;
rousr_buffer_write_val(in, argument[0], ERousrData.Float);
rousr_buffer_write_val(in, argument[1], ERousrData.Float);
if (argument_count > 2) {
  rousr_buffer_write_val(in, argument[2], ERousrData.Float);
  rousr_buffer_write_val(in, argument[3], ERousrData.Float);
}

_extImguiGML_is_rect_visible();
return buffer_read(__Imgui_out, buffer_s8) != 0;

#define imguigml_get_time
///@function imguigml_get_time()
///@desc get the time
_extImguiGML_get_time();
return buffer_read(__Imgui_out, buffer_f32);

#define imguigml_get_frame_count
///@function imguigml_get_frame_count()
///@desc get the time
_extImguiGML_get_frame_count();
return buffer_read(__Imgui_out, buffer_s32);

#define imguigml_get_style_color_name
///@function imguigml_get_style_color_name(_idx)
///@desc get the style color's name
///@param {Real:EImGui_Col} _idx
///@returns {String} _color_name
var in = __Imgui_in;
rousr_buffer_write_val(in, argument[0], ERousrData.Int32);
_extImguiGML_get_style_color_name();
return buffer_read(__Imgui_out, buffer_string);

#define imguigml_calc_item_rect_closest_point
///@function imguigml_calc_item_rect_closest_point(_pos_x, _pos_y, [_on_edge=false], [_outward=+0.0])
///@desc utility to find the closest point the last item bounding rectangle edge. useful to visually link items
///@param {Real}    _pos_x
///@param {Real}    _pos_y
///@param {Boolean} [_on_edge=false]
///@param {Real}    [_outward=+0.0])
///@returns {Array:x,y}
var in = __Imgui_in;
var _on_edge = argument_count > 2 ? argument[2] : false;
rousr_buffer_write_val(in, argument[0], ERousrData.Float);
rousr_buffer_write_val(in, argument[1], ERousrData.Float);
rousr_buffer_write_val(in, _on_edge ? 1 : 0, ERousrData.Int8);
if (argument_count > 3)
  rousr_buffer_write_val(in, argument[3], ERousrData.Float);
  
_extImguiGML_calc_item_rect_closest_point();


var out = __Imgui_out;
var ret = array_create(2);
ret[@ 0] = buffer_read(out, buffer_f32);
ret[@ 1] = buffer_read(out, buffer_f32);
return ret;


#define imguigml_calc_text_size
///@function imguigml_calc_text_size(_text, [_text_end=undefined], [_hide_text_after_double_hash=false], [_wrap_width=-1.0f]);
///@desc Calculate text size. Text can be multi-line. Optionally ignore text after a ## marker.
///@param {String} _text
///@param {String} [_text_end=undefined]
///@param {Boolean} [_hide_text_after_double_hash=false]
///@param {Real} [_wrap_width=-1.0f]);
///@returns {Array:[x,y]}
var in = __Imgui_in;

var _text_end = argument_count > 1 && is_string(argument[1]) ? argument[1] : noone;
var _hide_text_after_double_hash = argument_count > 2 ? argument[2] : false;

rousr_buffer_write_val(in, string(argument[0]));
rousr_buffer_write_val(in, _text_end, !is_string(_text_end) ? ERousrData.Int8 : ERousrData.String);
rousr_buffer_write_val(in, _hide_text_after_double_hash ? 1 : 0, ERousrData.Int8);
rousr_buffer_write_val(in, argument_count > 3 ? argument[3] : -1.0, ERousrData.Float);
_extImguiGML_calc_text_size();

var out = __Imgui_out;
var ret = array_create(2);
ret[@ 0] = buffer_read(out, buffer_f32);
ret[@ 1] = buffer_read(out, buffer_f32);
return ret;


#define imguigml_calc_list_clipping
///@function imguigml_calc_list_clipping(_items_count, _items_height)
///@desc calculate coarse clipping for large list of evenly sized items. Prefer using the ImGuiListClipper higher-level helper if you can.
///@param {Real} _items_count
///@param {Real} _items_height
///@returns {Array:[item_start, item_end]}
var in = __Imgui_in;
rousr_buffer_write_val(in, argument[0], ERousrData.Int32);
rousr_buffer_write_val(in, argument[1], ERousrData.Float);
_extImguiGML_calc_list_clipping();
var out = __Imgui_out;
var ret = array_create(2);
ret[@ 0] = buffer_read(out, buffer_s32);
ret[@ 1] = buffer_read(out, buffer_s32);
return ret;

#define imguigml_push_clip_rect
///@function imguigml_push_clip_rect(_min_x, _min_y, _max_x, _max_y, _intersect_with_current_clip_rect)
///@desc
///@param {Real}    _min_x                            clip_rect_min_x
///@param {Real}    _min_y                            clip_rect_min_y
///@param {Real}    _max_x                            clip_rect_max_x
///@param {Real}    _max_y                            clip_rect_max_y
///@param {Boolean} _intersect_with_current_clip_rect 
var in = __Imgui_in;
rousr_buffer_write_val(in, argument[0], ERousrData.Float);
rousr_buffer_write_val(in, argument[1], ERousrData.Float);
rousr_buffer_write_val(in, argument[2], ERousrData.Float);
rousr_buffer_write_val(in, argument[3], ERousrData.Float);
rousr_buffer_write_val(in, argument[4] ? 1 : 0, ERousrData.Int8);
_extImguiGML_push_clip_rect();

#define imguigml_pop_clip_rect
///@function imguigml_pop_clip_rect
///@desc pop the clip rect
_extImguiGML_pop_clip_rect();

#define imguigml_slider_float
///@function imguigml_slider_float(_label, _val, _min, _max, [_display_fmt="%.3f"], [_power=1.0])
///@desc adjust display_format to decorate the value with a prefix or a suffix for in-slider labels or unit display. Use power!=1.0 for logarithmic sliders
///@param {String} _label
///@param {Real} _val
///@param {Real} _min
///@param {Real} _max
///@param {String} [_display_fmt="%.3f"]
///@param {Real} [_power=1.0])
///@returns {Array:[_changed, _val]} 
var in = __Imgui_in;
rousr_buffer_write_val(in, argument[0]);
rousr_buffer_write_val(in, argument[1], ERousrData.Float);
rousr_buffer_write_val(in, argument[2], ERousrData.Float);
rousr_buffer_write_val(in, argument[3], ERousrData.Float);
rousr_buffer_write_val(in, argument_count > 4 ? argument[4] : "%.3f");
rousr_buffer_write_val(in, argument_count > 5 ? argument[5] : 1.0, ERousrData.Float);
_extImguiGML_slider_float();

var out = __Imgui_out;
var ret = array_create(2);
ret[@ 0] = buffer_read(out, buffer_s8) != 0;
ret[@ 1] = buffer_read(out, buffer_f32);
return ret;


#define imguigml_slider_float2
///@function imguigml_slider_float2(_label, _val, _val2, _min, _max, [_display_fmt="%.3f"], [_power=1.0])
///@desc adjust display_format to decorate the value with a prefix or a suffix for in-slider labels or unit display. Use power!=1.0 for logarithmic sliders
///@param {String} _label
///@param {Real} _val
///@param {Real} _val2
///@param {Real} _min
///@param {Real} _max
///@param {String} [_display_fmt="%.3f"]
///@param {Real} [_power=1.0])
///@returns {Array:[_changed, _val]}
var in = __Imgui_in;
rousr_buffer_write_val(in, argument[0]);
rousr_buffer_write_val(in, argument[1], ERousrData.Float);
rousr_buffer_write_val(in, argument[2], ERousrData.Float);
rousr_buffer_write_val(in, argument[3], ERousrData.Float);
rousr_buffer_write_val(in, argument[4], ERousrData.Float);
rousr_buffer_write_val(in, argument_count > 5 ? argument[5] : "%.3f");
rousr_buffer_write_val(in, argument_count > 6 ? argument[6] : 1.0, ERousrData.Float);
_extImguiGML_slider_float2();

var out = __Imgui_out;
var ret = array_create(3);
ret[@ 0] = buffer_read(out, buffer_s8) != 0;
ret[@ 1] = buffer_read(out, buffer_f32);
ret[@ 2] = buffer_read(out, buffer_f32);
return ret;


#define imguigml_slider_float3
///@function imguigml_slider_float3(_label, _val, _val2, _val3, _min, _max, [_display_fmt="%.3f"], [_power=1.0])
///@desc adjust display_format to decorate the value with a prefix or a suffix for in-slider labels or unit display. Use power!=1.0 for logarithmic sliders
///@param {String} _label
///@param {Real} _val
///@param {Real} _val2
///@param {Real} _val3
///@param {Real} _min
///@param {Real} _max
///@param {String} [_display_fmt="%.3f"]
///@param {Real} [_power=1.0])
///@returns {Array:[_changed, _val]}
var in = __Imgui_in;
rousr_buffer_write_val(in, argument[0]);
rousr_buffer_write_val(in, argument[1], ERousrData.Float);
rousr_buffer_write_val(in, argument[2], ERousrData.Float);
rousr_buffer_write_val(in, argument[3], ERousrData.Float);
rousr_buffer_write_val(in, argument[4], ERousrData.Float);
rousr_buffer_write_val(in, argument[5], ERousrData.Float);
rousr_buffer_write_val(in, argument_count > 6 ? argument[6] : "%.3f");
rousr_buffer_write_val(in, argument_count > 7 ? argument[7] : 1.0, ERousrData.Float);
_extImguiGML_slider_float3();
var out = __Imgui_out;
var ret = array_create(4);
ret[@ 0] = buffer_read(out, buffer_s8) != 0;
ret[@ 1] = buffer_read(out, buffer_f32);
ret[@ 2] = buffer_read(out, buffer_f32);
ret[@ 3] = buffer_read(out, buffer_f32);
return ret;

#define imguigml_slider_float4
///@function imguigml_slider_float4(_label, _val, _val2, _val3, _val4, _min, _max, [_display_fmt="%.3f"], [_power=1.0])
///@desc adjust display_format to decorate the value with a prefix or a suffix for in-slider labels or unit display. Use power!=1.0 for logarithmic sliders
///@param {String} _label
///@param {Real} _val
///@param {Real} _val2
///@param {Real} _val3
///@param {Real} _val4
///@param {Real} _min
///@param {Real} _max
///@param {String} [_display_fmt="%.3f"]
///@param {Real} [_power=1.0])
///@returns {Array:[_changed, _val]}
var in = __Imgui_in;
rousr_buffer_write_val(in, argument[0]);
rousr_buffer_write_val(in, argument[1], ERousrData.Float);
rousr_buffer_write_val(in, argument[2], ERousrData.Float);
rousr_buffer_write_val(in, argument[3], ERousrData.Float);
rousr_buffer_write_val(in, argument[4], ERousrData.Float);
rousr_buffer_write_val(in, argument[5], ERousrData.Float);
rousr_buffer_write_val(in, argument[6], ERousrData.Float);
rousr_buffer_write_val(in, argument_count > 7 ? argument[6] : "%.3f");
rousr_buffer_write_val(in, argument_count > 8 ? argument[7] : 1.0, ERousrData.Float);
_extImguiGML_slider_float4();

var out = __Imgui_out;
var ret = array_create(5);
ret[@ 0] = buffer_read(out, buffer_s8) != 0;
ret[@ 1] = buffer_read(out, buffer_f32);
ret[@ 2] = buffer_read(out, buffer_f32);
ret[@ 3] = buffer_read(out, buffer_f32);
ret[@ 4] = buffer_read(out, buffer_f32);
return ret;


#define imguigml_slider_angle
///@function imguigml_slider_angle(_label, _rad, [_degree_min=-360.0], [_degree_max=360.0])
///@desc angle slider
///@param {String} _label
///@param {Real} _rad
///@param {Real} [_degree_min=-360.0]
///@param {Real} [_degree_max=360.0]
///@returns {Array:[_changed, _rad]}
var in = __Imgui_in;
rousr_buffer_write_val(in, argument[0])
rousr_buffer_write_val(in, argument[1], ERousrData.Float);
rousr_buffer_write_val(in, argument_count > 2 ? argument[2] : -360.0, ERousrData.Float);
rousr_buffer_write_val(in, argument_count > 3 ? argument[3] : 360.0, ERousrData.Float);
_extImguiGML_slider_angle();
var out = __Imgui_out;
var ret = array_create(2);
ret[@ 0] = buffer_read(out, buffer_s8) != 0;
ret[@ 1] = buffer_read(out, buffer_f32);
return ret;

#define imguigml_slider_int
///@function imguigml_slider_int(_label, _v, _v_min, _v_max, [_display_fmt="%.0f"])
///@desc add an integer slider
///@param {String} _label
///@param {Real} _v
///@param {Real} _v_min
///@param {Real} _v_max
///@param {String} [_display_fmt="%.0f"]
///@returns {Array:[_changed, _v]}
var in = __Imgui_in;
rousr_buffer_write_val(in, argument[0]);
rousr_buffer_write_val(in, argument[1], ERousrData.Int32);
rousr_buffer_write_val(in, argument[2], ERousrData.Int32);
rousr_buffer_write_val(in, argument[3], ERousrData.Int32);
rousr_buffer_write_val(in, argument_count > 4 ? argument[4] : "%.0f");

_extImguiGML_slider_int();
var out = __Imgui_out;  
var ret = array_create(2);
ret[@ 0] = buffer_read(out, buffer_s8) != 0;
ret[@ 1] = buffer_read(out, buffer_s32)
return ret;

#define imguigml_slider_int2
///@function imguigml_slider_int2(_label, _v, _v2, _v_min, _v_max, [_display_fmt="%.0f"])
///@desc add an integer slider
///@param {String} _label
///@param {Real} _v
///@param {Real} _v2
///@param {Real} _v_min
///@param {Real} _v_max
///@param {String} [_display_fmt="%.0f"]
///@returns {Array:[_changed, _v]}
var in = __Imgui_in;
rousr_buffer_write_val(in, argument[0]);
rousr_buffer_write_val(in, argument[1], ERousrData.Int32);
rousr_buffer_write_val(in, argument[2], ERousrData.Int32);
rousr_buffer_write_val(in, argument[3], ERousrData.Int32);
rousr_buffer_write_val(in, argument[4], ERousrData.Int32);
rousr_buffer_write_val(in, argument_count > 5 ? argument[5] : "%.0f");

_extImguiGML_slider_int2();


var out = __Imgui_out;
var ret = array_create(3);
ret[@ 0] = buffer_read(out, buffer_s8) != 0;
ret[@ 1] = buffer_read(out, buffer_s32);
ret[@ 2] = buffer_read(out, buffer_s32);
return ret;


#define imguigml_slider_int3
///@function imguigml_slider_int3(_label, _v, _v2, _v3, _v_min, _v_max, [_display_fmt="%.0f"])
///@desc add an integer slider
///@param {String} _label
///@param {Real} _v
///@param {Real} _v2
///@param {Real} _v3
///@param {Real} _v_min
///@param {Real} _v_max
///@param {String} [_display_fmt="%.0f"]
///@returns {Array:[_changed, _v]}
var in = __Imgui_in;
rousr_buffer_write_val(in, argument[0]);
rousr_buffer_write_val(in, argument[1], ERousrData.Int32);
rousr_buffer_write_val(in, argument[2], ERousrData.Int32);
rousr_buffer_write_val(in, argument[3], ERousrData.Int32);
rousr_buffer_write_val(in, argument[4], ERousrData.Int32);
rousr_buffer_write_val(in, argument[5], ERousrData.Int32);
rousr_buffer_write_val(in, argument_count > 6 ? argument[6] : "%.0f");

_extImguiGML_slider_int3();

var out = __Imgui_out;
var ret = array_create(4);
ret[@ 0] = buffer_read(out, buffer_s8) != 0;
ret[@ 1] = buffer_read(out, buffer_s32);
ret[@ 2] = buffer_read(out, buffer_s32);
ret[@ 3] = buffer_read(out, buffer_s32);
return ret;


#define imguigml_slider_int4
///@function imguigml_slider_int4(_label, _v, _v2, _v3, _v4, _v_min, _v_max, [_display_fmt="%.0f"])
///@desc add an integer slider
///@param {String} _label
///@param {Real} _v
///@param {Real} _v2
///@param {Real} _v3
///@param {Real} _v4
///@param {Real} _v_min
///@param {Real} _v_max
///@param {String} [_display_fmt="%.0f"]
///@returns {Array:[_changed, _v]}
var in = __Imgui_in;
rousr_buffer_write_val(in, argument[0]);
rousr_buffer_write_val(in, argument[1], ERousrData.Int32);
rousr_buffer_write_val(in, argument[2], ERousrData.Int32);
rousr_buffer_write_val(in, argument[3], ERousrData.Int32);
rousr_buffer_write_val(in, argument[4], ERousrData.Int32);
rousr_buffer_write_val(in, argument[5], ERousrData.Int32);
rousr_buffer_write_val(in, argument[6], ERousrData.Int32);
rousr_buffer_write_val(in, argument_count > 7 ? argument[7] : "%.0f");

_extImguiGML_slider_int4();


var out = __Imgui_out;
var ret = array_create(5);
ret[@ 0] = buffer_read(out, buffer_s8) != 0;
ret[@ 1] = buffer_read(out, buffer_s32);
ret[@ 2] = buffer_read(out, buffer_s32);
ret[@ 3] = buffer_read(out, buffer_s32);
ret[@ 4] = buffer_read(out, buffer_s32);
return ret;


#define imguigml_vslider_float
///@function imguigml_vslider_float(_label, _size_x, _size_y,  _v, _v_min, _v_max, [_display_fmt="%.0f"])
///@desc a vslider float?
///@param {String} _label
///@param {Real} _size_x
///@param {Real} _size_y
///@param {Real} _v
///@param {Real} _v_min
///@param {Real} _v_max
///@param {String} [_display_fmt="%.0f"]
///@returns {Array:[_changed, _v]}
var in = __Imgui_in;
rousr_buffer_write_val(in, argument[0]);
rousr_buffer_write_val(in, argument[1], ERousrData.Float);
rousr_buffer_write_val(in, argument[2], ERousrData.Float);
rousr_buffer_write_val(in, argument[3], ERousrData.Float);
rousr_buffer_write_val(in, argument[4], ERousrData.Float);
rousr_buffer_write_val(in, argument[5], ERousrData.Float);
rousr_buffer_write_val(in, argument_count > 6 ? argument[6] : "%.0f");
_extImguiGML_vslider_float();

var out = __Imgui_out;
var ret = array_create(2);
ret[@ 0] = buffer_read(out, buffer_s8) != 0;
ret[@ 1] = buffer_read(out, buffer_f32);
return ret;


#define imguigml_vslider_int
///@function imguigml_vslider_int(_label, _size_x, _size_y,  _v, _v_min, _v_max, [_display_fmt="%.0f"])
///@desc a vslider int?
///@param {String} _label
///@param {Real} _size_x
///@param {Real} _size_y
///@param {Real} _v
///@param {Real} _v_min
///@param {Real} _v_max
///@param {String} [_display_fmt="%.0f"]
///@returns {Array:[_changed, _v]}
var in = __Imgui_in;
rousr_buffer_write_val(in, argument[0]);
rousr_buffer_write_val(in, argument[1], ERousrData.Int32);
rousr_buffer_write_val(in, argument[2], ERousrData.Int32);
rousr_buffer_write_val(in, argument[3], ERousrData.Int32);
rousr_buffer_write_val(in, argument[4], ERousrData.Int32);
rousr_buffer_write_val(in, argument[5], ERousrData.Int32);
rousr_buffer_write_val(in, argument_count > 6 ? argument[6] : "%.0f");
_extImguiGML_vslider_int();

var out = __Imgui_out;
var ret = array_create(2);
ret[@ 0] = buffer_read(out, buffer_s8) != 0;
ret[@ 1] = buffer_read(out, buffer_s32);
return ret; 


#define imguigml_color_edit3
///@function imguigml_color_edit3(_label, _r, _g, _b, [_flags=0])
///@desc show a color edit field
///@param {String} _label
///@param {Real} _r
///@param {Real} _g
///@param {Real} _b
///@param {Real:EImGui_ColorEditFlags} [_flags=0]
var in = __Imgui_in;
rousr_buffer_write_val(in, argument[0]);
rousr_buffer_write_val(in, argument[1], ERousrData.Float);
rousr_buffer_write_val(in, argument[2], ERousrData.Float);
rousr_buffer_write_val(in, argument[3], ERousrData.Float);
rousr_buffer_write_val(in, argument_count > 4 ? argument[4] : 0, ERousrData.Int32); 
_extImguiGML_color_edit3();


var out = __Imgui_out;
var ret = array_create(4);
ret[@ 0] = buffer_read(out, buffer_s8) != 0;
ret[@ 1] = buffer_read(out, buffer_f32);
ret[@ 2] = buffer_read(out, buffer_f32);
ret[@ 3] = buffer_read(out, buffer_f32);
return ret;


#define imguigml_color_edit4
///@function imguigml_color_edit4(_label, _r, _g, _b, _a, [_flags=0])
///@desc show a color edit field
///@param {String} _label
///@param {Real} _r
///@param {Real} _g
///@param {Real} _b
///@param {Real} _a
///@param {Real:EImGui_ColorEditFlags} [_flags=0]
var in = __Imgui_in;
rousr_buffer_write_val(in, argument[0]);
rousr_buffer_write_val(in, argument[1], ERousrData.Float);
rousr_buffer_write_val(in, argument[2], ERousrData.Float);
rousr_buffer_write_val(in, argument[3], ERousrData.Float);
rousr_buffer_write_val(in, argument[4], ERousrData.Float);
rousr_buffer_write_val(in, argument_count > 5 ? argument[5] : 0, ERousrData.Int32); 
_extImguiGML_color_edit4();

var out = __Imgui_out;
var ret = array_create(5);
ret[@ 0] = buffer_read(out, buffer_s8) != 0;
ret[@ 1] = buffer_read(out, buffer_f32);
ret[@ 2] = buffer_read(out, buffer_f32);
ret[@ 3] = buffer_read(out, buffer_f32);
ret[@ 4] = buffer_read(out, buffer_f32);
return ret;


#define imguigml_color_picker3
///@function imguigml_color_picker3(_label, _r, _g, _b, [_flags=0])
///@desc show a color edit field
///@param {String} _label
///@param {Real} _r
///@param {Real} _g
///@param {Real} _b
///@param {Real:EImGui_ColorEditFlags} [_flags=0]
var in = __Imgui_in;
rousr_buffer_write_val(in, argument[0]);
rousr_buffer_write_val(in, argument[1], ERousrData.Float);
rousr_buffer_write_val(in, argument[2], ERousrData.Float);
rousr_buffer_write_val(in, argument[3], ERousrData.Float);
rousr_buffer_write_val(in, argument_count > 4 ? argument[4] : 0, ERousrData.Int32); 
_extImguiGML_color_picker3();


var out = __Imgui_out;
var ret = array_create(4);
ret[@ 0] = buffer_read(out, buffer_s8) != 0;
ret[@ 1] = buffer_read(out, buffer_f32);
ret[@ 2] = buffer_read(out, buffer_f32);
ret[@ 3] = buffer_read(out, buffer_f32);
return ret;


#define imguigml_color_picker4
///@function imguigml_color_picker4(_label, _r, _g, _b, [_flags=0])
///@desc show a color edit field
///@param {String} _label
///@param {Real} _r
///@param {Real} _g
///@param {Real} _b
///@param {Real} _a
///@param {Real:EImGui_ColorEditFlags} [_flags=0]
var in = __Imgui_in;
rousr_buffer_write_val(in, argument[0]);
rousr_buffer_write_val(in, argument[1], ERousrData.Float);
rousr_buffer_write_val(in, argument[2], ERousrData.Float);
rousr_buffer_write_val(in, argument[3], ERousrData.Float);
rousr_buffer_write_val(in, argument[4], ERousrData.Float);
rousr_buffer_write_val(in, argument_count > 5 ? argument[5] : 0, ERousrData.Int32); 
_extImguiGML_color_picker4();

var out = __Imgui_out;
var ret = array_create(5);
ret[@ 0] = buffer_read(out, buffer_s8) != 0;
ret[@ 1] = buffer_read(out, buffer_f32);
ret[@ 2] = buffer_read(out, buffer_f32);
ret[@ 3] = buffer_read(out, buffer_f32);
ret[@ 4] = buffer_read(out, buffer_f32);
return ret;



#define imguigml_color_button
///@function imguigml_color_button(_desc_id, _r, _g, _b, _a, [_flags=0], [_size_x=0], [_size_y=0])
///@desc display a colored square/button, hover for details, return true when pressed.
///@param {String} _desc_id
///@param {Real} _r
///@param {Real} _g
///@param {Real} _b
///@param {Real} _a
///@param {Real:EImGui_ColorEditFlags} [_flags=0]
///@param {Real} [_size_x=0]
///@param {Real} [_size_y=0])
var in = __Imgui_in;
rousr_buffer_write_val(in, argument[0]);
rousr_buffer_write_val(in, argument[1], ERousrData.Float);
rousr_buffer_write_val(in, argument[2], ERousrData.Float);
rousr_buffer_write_val(in, argument[3], ERousrData.Float);
rousr_buffer_write_val(in, argument[4], ERousrData.Float);
rousr_buffer_write_val(in, argument_count > 5 ? argument[5] : 0, ERousrData.Int32);
rousr_buffer_write_val(in, argument_count > 6 ? argument[6] : 0, ERousrData.Float);
rousr_buffer_write_val(in, argument_count > 7 ? argument[7] : 0, ERousrData.Float);
_extImguiGML_color_button();
return buffer_read(__Imgui_out, buffer_s8) != 0;

#define imguigml_set_color_edit_options
///@function imguigml_set_color_edit_options
///@desc initialize current options (generally on application startup) if you want to select a default format, picker type, etc. User will be able to change many settings, unless you pass the _NoOptions flag to your calls.
var in = __Imgui_in;
rousr_buffer_write_val(in, argument[0], ERousrData.Int32);
_extImguiGML_set_color_edit_options();

#define imguigml_drag_float
///@function imguigml_drag_float(_label, _v, [_v_speed=1.0], [_v_min=0.0], [_v_max=0.0], [_display_format="%.3f"], [_power=1.0]); 
///@desc  If v_min >= v_max we have no bound
///@param {String} _label
///@param {Real}   _v
///@param {Real}   [_v_speed=1.0]
///@param {Real}   [_v_min=0.0]
///@param {Real}   [_v_max=0.0]
///@param {String} [_displayFmt="%.3f"]
///@param {Real}   [_power=1.0]
///@returns {Array:[_changed, _v]}
var in = __Imgui_in;
rousr_buffer_write_val(in, argument[0]);
rousr_buffer_write_val(in, argument[1], ERousrData.Float);
rousr_buffer_write_val(in, argument[2], ERousrData.Float);
rousr_buffer_write_val(in, argument[3], ERousrData.Float);
rousr_buffer_write_val(in, argument[4], ERousrData.Float);
rousr_buffer_write_val(in, argument_count > 5 ? argument[5] : "%.3f");
rousr_buffer_write_val(in, argument_count > 6 ? argument[6] : 1.0, ERousrData.Float);

_extImguiGML_drag_float();


var out = __Imgui_out;
var ret = array_create(2);
ret[@ 0] = buffer_read(out, buffer_s8) != 0;
ret[@ 1] = buffer_read(out, buffer_f32);
return ret;


#define imguigml_drag_float2
///@function imguigml_drag_float2(_label, _v, _v2, [_v_speed=1.0], [_v_min=0.0], [_v_max=0.0], [_display_format="%.3f"], [_power=1.0]); 
///@desc  If v_min >= v_max we have no bound
///@param {String} _label
///@param {Real}   _v
///@param {Real}   _v2
///@param {Real}   [_v_speed=1.0]
///@param {Real}   [_v_min=0.0]
///@param {Real}   [_v_max=0.0]
///@param {String} [_displayFmt="%.3f"]
///@param {Real}   [_power=1.0]
///@returns {Array:[_changed, _v, _v2]}
var in = __Imgui_in;
rousr_buffer_write_val(in, argument[0]);
rousr_buffer_write_val(in, argument[1], ERousrData.Float);
rousr_buffer_write_val(in, argument[2], ERousrData.Float);
rousr_buffer_write_val(in, argument[3], ERousrData.Float);
rousr_buffer_write_val(in, argument[4], ERousrData.Float);
rousr_buffer_write_val(in, argument[5], ERousrData.Float);
rousr_buffer_write_val(in, argument_count > 6 ? argument[6] : "%.3f");
rousr_buffer_write_val(in, argument_count > 7 ? argument[7] : 1.0, ERousrData.Float);

_extImguiGML_drag_float2();

var out = __Imgui_out;
var ret = array_create(3);
ret[@ 0] = buffer_read(out, buffer_s8) != 0;
ret[@ 1] = buffer_read(out, buffer_f32);
ret[@ 2] = buffer_read(out, buffer_f32);
return ret;


#define imguigml_drag_float3
///@function imguigml_drag_float3(_label, _v, _v2, _v3, [_v_speed=1.0], [_v_min=0.0], [_v_max=0.0], [_display_format="%.3f"], [_power=1.0]); 
///@desc  If v_min >= v_max we have no bound
///@param {String} _label
///@param {Real}   _v
///@param {Real}   _v2
///@param {Real}   _v3
///@param {Real}   [_v_speed=1.0]
///@param {Real}   [_v_min=0.0]
///@param {Real}   [_v_max=0.0]
///@param {String} [_displayFmt="%.3f"]
///@param {Real}   [_power=1.0]
///@returns {Array:[_changed, _v, _v2, _v3]}
var in = __Imgui_in;
rousr_buffer_write_val(in, argument[0]);
rousr_buffer_write_val(in, argument[1], ERousrData.Float);
rousr_buffer_write_val(in, argument[2], ERousrData.Float);
rousr_buffer_write_val(in, argument[3], ERousrData.Float);
rousr_buffer_write_val(in, argument[4], ERousrData.Float);
rousr_buffer_write_val(in, argument[5], ERousrData.Float);
rousr_buffer_write_val(in, argument[6], ERousrData.Float);
rousr_buffer_write_val(in, argument_count > 7 ? argument[7] : "%.3f");
rousr_buffer_write_val(in, argument_count > 8 ? argument[8] : 1.0, ERousrData.Float);

_extImguiGML_drag_float3();

var out = __Imgui_out;
var ret = array_create(4);
ret[@ 0] = buffer_read(out, buffer_s8) != 0;
ret[@ 1] = buffer_read(out, buffer_f32);
ret[@ 2] = buffer_read(out, buffer_f32);
ret[@ 3] = buffer_read(out, buffer_f32);
return ret;


#define imguigml_drag_float4
///@function imguigml_drag_float4(_label, _v, _v2, _v3, _v4, [_v_speed=1.0], [_v_min=0.0], [_v_max=0.0], [_display_format="%.3f"], [_power=1.0]); 
///@desc  If v_min >= v_max we have no bound
///@param {String} _label
///@param {Real}   _v
///@param {Real}   _v2
///@param {Real}   _v3
///@param {Real}   _v4
///@param {Real}   [_v_speed=1.0]
///@param {Real}   [_v_min=0.0]
///@param {Real}   [_v_max=0.0]
///@param {String} [_displayFmt="%.3f"]
///@param {Real}   [_power=1.0]
///@returns {Array:[_changed, _v, _v2, _v3, _v4]}
var in = __Imgui_in;
rousr_buffer_write_val(in, argument[0]);
rousr_buffer_write_val(in, argument[1], ERousrData.Float);
rousr_buffer_write_val(in, argument[2], ERousrData.Float);
rousr_buffer_write_val(in, argument[3], ERousrData.Float);
rousr_buffer_write_val(in, argument[4], ERousrData.Float);
rousr_buffer_write_val(in, argument[5], ERousrData.Float);
rousr_buffer_write_val(in, argument[6], ERousrData.Float);
rousr_buffer_write_val(in, argument[7], ERousrData.Float);
rousr_buffer_write_val(in, argument_count > 8 ? argument[8] : "%.3f");
rousr_buffer_write_val(in, argument_count > 9 ? argument[9] : 1.0, ERousrData.Float);

_extImguiGML_drag_float4();


var out = __Imgui_out;
var ret = array_create(5);
ret[@ 0] = buffer_read(out, buffer_s8) != 0;
ret[@ 1] = buffer_read(out, buffer_f32);
ret[@ 2] = buffer_read(out, buffer_f32);
ret[@ 3] = buffer_read(out, buffer_f32);
ret[@ 4] = buffer_read(out, buffer_f32);
return ret;


#define imguigml_drag_float_range2
///@function imguigml_draw_float_range2(_label, _v_current_min, _v_current_max, [_v_speed=1.0], [_v_min=0], [_v_max=0], [_display_fmt="%.0f"], [_display_fmt_max=undefined])
///@desc drag an integer range 2?
///@param {String} _label
///@param {Real}   _v_current_min
///@param {Real}   _v_current_max
///@param {Real}   [_v_speed=1.0]
///@param {Real}   [_v_min=0.0]
///@param {Real}   [_v_max=0.0]
///@param {String} [_displayFmt="%.0f"]
///@param {String} [_displayFmtMax=undefined]
///@param {Real}   [_power=1.0]
///@returns {Array:[_changed, _min, _max]}
var in = __Imgui_in;
rousr_buffer_write_val(in, argument[0]);
rousr_buffer_write_val(in, argument[1], ERousrData.Float);
rousr_buffer_write_val(in, argument[2], ERousrData.Float);
rousr_buffer_write_val(in, argument[3], ERousrData.Float);
rousr_buffer_write_val(in, argument[4], ERousrData.Float);
rousr_buffer_write_val(in, argument[5], ERousrData.Float);
rousr_buffer_write_val(in, argument_count > 6 ? argument[6] : "%.0f");
if (argument_count > 7 && is_string(argument[7])) 
  rousr_buffer_write_val(in, argument[7]);
else 
  rousr_buffer_write_val(in, 0, ERousrData.Int8);
rousr_buffer_write_val(in, argument_count > 8 ? argument[8] : 1.0, ERousrData.Float);

_extImguiGML_drag_float_range2();
var out = __Imgui_out;
var ret = array_create(3);
ret[@ 0] = buffer_read(out, buffer_s8) != 0;
ret[@ 1] = buffer_read(out, buffer_f32);
ret[@ 2] = buffer_read(out, buffer_f32);
return ret;

#define imguigml_drag_int
///@function imguigml_drag_int(_label, _v, [_v_speed=1.0], [_v_min=0.0], [_v_max=0.0], [_display_format="%.3f"], [_power=1.0]); 
///@desc  If v_min >= v_max we have no bound
///@param {String} _label
///@param {Real}   _v
///@param {Real}   [_v_speed=1.0]
///@param {Real}   [_v_min=0.0]
///@param {Real}   [_v_max=0.0]
///@param {String} [_displayFmt="%.0f"]
///@returns {Array:[_changed, _v]}
var in = __Imgui_in;
rousr_buffer_write_val(in, argument[0]);
rousr_buffer_write_val(in, argument[1], ERousrData.Int32);
rousr_buffer_write_val(in, argument[2], ERousrData.Float);
rousr_buffer_write_val(in, argument[3], ERousrData.Int32);
rousr_buffer_write_val(in, argument[4], ERousrData.Int32);
rousr_buffer_write_val(in, argument_count > 5 ? argument[5] : "%.0f");

_extImguiGML_drag_int();


var out = __Imgui_out;
var ret = array_create(2);
ret[@ 0] = buffer_read(out, buffer_s8) != 0;
ret[@ 1] = buffer_read(out, buffer_s32);
return ret;


#define imguigml_drag_int2
///@function imguigml_drag_int2(_label, _v, _v2, [_v_speed=1.0], [_v_min=0.0], [_v_max=0.0], [_display_format="%.3f"], [_power=1.0]); 
///@desc  If v_min >= v_max we have no bound
///@param {String} _label
///@param {Real}   _v
///@param {Real}   _v2
///@param {Real}   [_v_speed=1.0]
///@param {Real}   [_v_min=0.0]
///@param {Real}   [_v_max=0.0]
///@param {String} [_displayFmt="%.0f"]
///@returns {Array:[_changed, _v, _v2]}
var in = __Imgui_in;
rousr_buffer_write_val(in, argument[0]);
rousr_buffer_write_val(in, argument[1], ERousrData.Int32);
rousr_buffer_write_val(in, argument[2], ERousrData.Int32);
rousr_buffer_write_val(in, argument[3], ERousrData.Float);
rousr_buffer_write_val(in, argument[4], ERousrData.Int32);
rousr_buffer_write_val(in, argument[5], ERousrData.Int32);
rousr_buffer_write_val(in, argument_count > 6 ? argument[6] : "%.0f");

_extImguiGML_drag_int2();

var out = __Imgui_out;
var ret = array_create(3);
ret[@ 0] = buffer_read(out, buffer_s8) != 0;
ret[@ 1] = buffer_read(out, buffer_s32);
ret[@ 2] = buffer_read(out, buffer_s32);
return ret;


#define imguigml_drag_int3
///@function imguigml_drag_int3(_label, _v, _v2, _v3, [_v_speed=1.0], [_v_min=0.0], [_v_max=0.0], [_display_format="%.3f"], [_power=1.0]); 
///@desc  If v_min >= v_max we have no bound
///@param {String} _label
///@param {Real}   _v
///@param {Real}   _v2
///@param {Real}   _v3
///@param {Real}   [_v_speed=1.0]
///@param {Real}   [_v_min=0.0]
///@param {Real}   [_v_max=0.0]
///@param {String} [_displayFmt="%.0f"]
///@returns {Array:[_changed, _v, _v2, _v3]}
var in = __Imgui_in;
rousr_buffer_write_val(in, argument[0]);
rousr_buffer_write_val(in, argument[1], ERousrData.Int32);
rousr_buffer_write_val(in, argument[2], ERousrData.Int32);
rousr_buffer_write_val(in, argument[3], ERousrData.Int32);
rousr_buffer_write_val(in, argument[4], ERousrData.Float);
rousr_buffer_write_val(in, argument[5], ERousrData.Int32);
rousr_buffer_write_val(in, argument[6], ERousrData.Int32);
rousr_buffer_write_val(in, argument_count > 7 ? argument[7] : "%.0f");

_extImguiGML_drag_int3();

var out = __Imgui_out;
var ret = array_create(4);
ret[@ 0] = buffer_read(out, buffer_s8) != 0;
ret[@ 1] = buffer_read(out, buffer_s32);
ret[@ 2] = buffer_read(out, buffer_s32);
ret[@ 3] = buffer_read(out, buffer_s32);
return ret;


#define imguigml_drag_int4
///@function imguigml_drag_int4(_label, _v, _v2, _v3, _v4, [_v_speed=1.0], [_v_min=0.0], [_v_max=0.0], [_display_format="%.3f"], [_power=1.0]); 
///@desc  If v_min >= v_max we have no bound
///@param {String} _label
///@param {Real}   _v
///@param {Real}   _v2
///@param {Real}   _v3
///@param {Real}   _v4
///@param {Real}   [_v_speed=1.0]
///@param {Real}   [_v_min=0.0]
///@param {Real}   [_v_max=0.0]
///@param {String} [_displayFmt="%.0f"]
///@returns {Array:[_changed, _v, _v2, _v3, _v4]}
var in = __Imgui_in;
rousr_buffer_write_val(in, argument[0]);
rousr_buffer_write_val(in, argument[1], ERousrData.Int32);
rousr_buffer_write_val(in, argument[2], ERousrData.Int32);
rousr_buffer_write_val(in, argument[3], ERousrData.Int32);
rousr_buffer_write_val(in, argument[4], ERousrData.Int32);
rousr_buffer_write_val(in, argument[5], ERousrData.Float);
rousr_buffer_write_val(in, argument[6], ERousrData.Int32);
rousr_buffer_write_val(in, argument[7], ERousrData.Int32);
rousr_buffer_write_val(in, argument_count > 8 ? argument[8] : "%.0f");

_extImguiGML_drag_int4();

var out = __Imgui_out;
var ret = array_create(5);
ret[@ 0] = buffer_read(out, buffer_s8) != 0;
ret[@ 1] = buffer_read(out, buffer_s32);
ret[@ 2] = buffer_read(out, buffer_s32);
ret[@ 3] = buffer_read(out, buffer_s32);
ret[@ 4] = buffer_read(out, buffer_s32);
return ret;


#define imguigml_drag_int_range2
///@function imguigml_draw_int_range2(_label, _v_current_min, _v_current_max, [_v_speed=1.0], [_v_min=0], [_v_max=0], [_display_fmt="%.0f"], [_display_fmt_max=undefined])
///@desc drag an integer range 2?
///@param {String} _label
///@param {Real}   _v_current_min
///@param {Real}   _v_current_max
///@param {Real}   [_v_speed=1.0]
///@param {Real}   [_v_min=0]
///@param {Real}   [_v_max=0]
///@param {String} [_displayFmt="%.0f"]
///@param {String} [_displayFmtMax=undefined]
///@returns {Array:[_changed, _min, _max]}
var in = __Imgui_in;
rousr_buffer_write_val(in, argument[0]);
rousr_buffer_write_val(in, argument[1], ERousrData.Int32);
rousr_buffer_write_val(in, argument[2], ERousrData.Int32);
rousr_buffer_write_val(in, argument[3], ERousrData.Float);
rousr_buffer_write_val(in, argument[4], ERousrData.Int32);
rousr_buffer_write_val(in, argument[5], ERousrData.Int32);
rousr_buffer_write_val(in, argument_count > 6 ? argument[6] : "%.0f");
if (argument_count > 7) 
  rousr_buffer_write_val(in, argument[7]);
else 
  rousr_buffer_write_val(in, 0, ERousrData.Int8);
_extImguiGML_drag_int_range2();
var out = __Imgui_out;

var ret = array_create(3);
ret[@ 0] = buffer_read(out, buffer_s8) != 0;
ret[@ 1] = buffer_read(out, buffer_s32);
ret[@ 2] = buffer_read(out, buffer_s32);
return ret;


#define imguigml_input_text
///@function imguigml_input_text(_label, _text, _max_length, [_flags=0], [_callback=undefined], [_user_data=undefined])
///@desc add an input text field
///@param {String} _label                           label to show next to the input
///@param {String} _text                            text to pre-fill field with
///@param {Real} _max_length                        max length to allow text
///@param {Real:EImGui_InputTextFlags} [_flags=0]   input text flags (see enum)
///@param {Real} [_callback=noone]                  a call back that takes ({Array:EImGui_TextCallbackData}, [_user_data]) and returns != 0 on char filter to remove character (otherwise return is ignored)
///@param {*} [_userdata=undefined]                 data passed to the callback   
///@returns {Array:[_changed, _text]}
var in = __Imgui_in;
rousr_buffer_write_val(in, argument[0]);
rousr_buffer_write_val(in, argument[1]);
rousr_buffer_write_val(in, argument[2], ERousrData.Uint32);
rousr_buffer_write_val(in, argument_count > 3 ? argument[3] : 0, ERousrData.Int32);
var callback = argument_count > 4 ? argument[4] : noone;
var user_data = argument_count > 5 ? argument[5] : undefined;

var call_id = _extImguiGML_input_text();
__imguigml_handle_text_callback(call_id, callback, user_data);

var out = __Imgui_out;
var ret = array_create(2);
ret[@ 0] = buffer_read(out, buffer_s8) != 0;
ret[@ 1] = buffer_read(out, buffer_string);
return ret;


#define imguigml_input_text_multiline
///@function imguigml_input_text_multiline(_label, _text, _max_len, _size_x, _size_y, [_flags=0], [_callback=undefined], [_user_data=undefined])
///@desc add an input text field
///@param {String} _label
///@param {String} _text
///@param {Real} _max_len
///@param {Real} _size_x
///@param {Real} _size_y
///@param {Real:EImGui_InputTextFlags} [_flags=0]
///@param {Real} [_callback=noone]                  a call back that takes ({Array:EImGui_TextCallbackData}, [_user_data]) and returns != 0 on char filter to remove character (otherwise return is ignored)
///@param {*} [_userdata=undefined]                 data passed to the callback   
///@returns {Array:[_changed, _text]}
var in = __Imgui_in;
rousr_buffer_write_val(in, argument[0]);
rousr_buffer_write_val(in, argument[1]);
rousr_buffer_write_val(in, argument[2], ERousrData.Uint32);
rousr_buffer_write_val(in, argument[3], ERousrData.Float);
rousr_buffer_write_val(in, argument[4], ERousrData.Float);
rousr_buffer_write_val(in, argument_count > 5 ? argument[5] : 0, ERousrData.Int32);
var callback = argument_count > 6 ? argument[6] : noone;
var user_data = argument_count > 7 ? argument[7] : undefined;

var call_id = _extImguiGML_input_text_multiline();
__imguigml_handle_text_callback(call_id, callback, user_data);

var out = __Imgui_out;
var ret = array_create(2);
ret[@ 0] = buffer_read(out, buffer_s8) != 0;
ret[@ 1] = buffer_read(out, buffer_string);
return ret; 

#define imguigml_input_float
///@function imguigml_input_float(_label, _val, [_step=0.0f], [_step_fast=0.0f], [_decimal_precision=-1], [_extra_flags=0])
///@desc keyboard input field float
///@param {String} _label
///@param {Real} _val
///@param {Real} [_step=0.0f]
///@param {Real} [_step_fast=0.0f]
///@param {Real} [_decimal_precision=-1]
///@param {Real:EImGui_WindowFlags} [_extra_flags=0])
///@returns {Array:[_changed, _val]}
var in = __Imgui_in;
rousr_buffer_write_val(in, argument[0]);
rousr_buffer_write_val(in, argument[1], ERousrData.Float);
rousr_buffer_write_val(in, argument_count > 2 ? argument[2] : 0.0, ERousrData.Float);
rousr_buffer_write_val(in, argument_count > 3 ? argument[3] : 0.0, ERousrData.Float);
rousr_buffer_write_val(in, argument_count > 4 ? argument[4] :  -1, ERousrData.Int32);
rousr_buffer_write_val(in, argument_count > 5 ? argument[5] :   0, ERousrData.Int32);

_extImguiGML_input_float();


var out = __Imgui_out;
var ret = array_create(2);
ret[@ 0] = buffer_read(out, buffer_s8) != 0;
ret[@ 1] = buffer_read(out, buffer_f32);
return ret;


#define imguigml_input_float2
///@function imguigml_input_float2(_label, _val, _val2, [_decimal_precision=-1], [_extra_flags=0])
///@desc keyboard input field float
///@param {String} _label
///@param {Real} _val
///@param {Real} _val2
///@param {Real} [_decimal_precision=-1]
///@param {Real:EImGui_InputTextFlags} [_extra_flags=0])
///@returns {Array:[_changed, _val, _val2]}
var in = __Imgui_in;
rousr_buffer_write_val(in, argument[0]);
rousr_buffer_write_val(in, argument[1], ERousrData.Float);
rousr_buffer_write_val(in, argument[2], ERousrData.Float);
rousr_buffer_write_val(in, argument_count > 3 ? argument[3] :  -1, ERousrData.Int32);
rousr_buffer_write_val(in, argument_count > 4 ? argument[4] :   0, ERousrData.Int32);
_extImguiGML_input_float2();

var out = __Imgui_out;
var ret = array_create(3);
ret[@ 0] = buffer_read(out, buffer_s8) != 0;
ret[@ 1] = buffer_read(out, buffer_f32);
ret[@ 2] = buffer_read(out, buffer_f32);
return ret;


#define imguigml_input_float3
///@function imguigml_input_float3(_label, _val, _val2, _val3, [_decimal_precision=-1], [_extra_flags=0])
///@desc keyboard input field float
///@param {String} _label
///@param {Real} _val
///@param {Real} _val2
///@param {Real} _val3
///@param {Real} [_decimal_precision=-1]
///@param {Real:EImGui_InputTextFlags} [_extra_flags=0])
///@returns {Array:[_changed, _val, _val2, _val3]}
var in = __Imgui_in;
rousr_buffer_write_val(in, argument[0]);
rousr_buffer_write_val(in, argument[1], ERousrData.Float);
rousr_buffer_write_val(in, argument[2], ERousrData.Float);
rousr_buffer_write_val(in, argument[3], ERousrData.Float);
rousr_buffer_write_val(in, argument_count > 4 ? argument[4] :  -1, ERousrData.Int32);
rousr_buffer_write_val(in, argument_count > 5 ? argument[5] :   0, ERousrData.Int32);
_extImguiGML_input_float3();

var out = __Imgui_out;
var ret = array_create(4);
ret[@ 0] = buffer_read(out, buffer_s8) != 0;
ret[@ 1] = buffer_read(out, buffer_f32);
ret[@ 2] = buffer_read(out, buffer_f32);
ret[@ 3] = buffer_read(out, buffer_f32);
return ret;


#define imguigml_input_float4
///@function imguigml_input_float4(_label, _val, _val2, _val3, _val4, [_decimal_precision=-1], [_extra_flags=0])
///@desc keyboard input field float
///@param {String} _label
///@param {Real} _val
///@param {Real} _val2
///@param {Real} _val3
///@param {Real} _val4
///@param {Real} [_decimal_precision=-1]
///@param {Real:EImGui_InputTextFlags} [_extra_flags=0])
///@returns {Array:[_changed, _val, _val2, _val3, _val4]}
var in = __Imgui_in;
rousr_buffer_write_val(in, argument[0]);
rousr_buffer_write_val(in, argument[1], ERousrData.Float);
rousr_buffer_write_val(in, argument[2], ERousrData.Float);
rousr_buffer_write_val(in, argument[3], ERousrData.Float);
rousr_buffer_write_val(in, argument[4], ERousrData.Float);
rousr_buffer_write_val(in, argument_count > 5 ? argument[5] :  -1, ERousrData.Int32);
rousr_buffer_write_val(in, argument_count > 6 ? argument[6] :   0, ERousrData.Int32);
_extImguiGML_input_float4();

var out = __Imgui_out;
var ret = array_create(5);
ret[@ 0] = buffer_read(out, buffer_s8) != 0;
ret[@ 1] = buffer_read(out, buffer_f32);
ret[@ 2] = buffer_read(out, buffer_f32);
ret[@ 3] = buffer_read(out, buffer_f32);
ret[@ 4] = buffer_read(out, buffer_f32);
return ret;


#define imguigml_input_int
///@function imguigml_input_int(_label, _val, [_step=1], [_step_fast=100], [_extra_flags=0])
///@desc keyboard input field float
///@param {String} _label
///@param {Real} _val
///@param {Real} [_step=1]
///@param {Real} [_step_fast=100]
///@param {Real:EImGui_InputTextFlags} [_extra_flags=0])
///@returns {Array:[_changed, _val]}
var in = __Imgui_in;
rousr_buffer_write_val(in, argument[0]);
rousr_buffer_write_val(in, argument[1], ERousrData.Int32);
rousr_buffer_write_val(in, argument_count > 2 ? argument[2] :   1, ERousrData.Int32);
rousr_buffer_write_val(in, argument_count > 3 ? argument[3] : 100, ERousrData.Int32);
rousr_buffer_write_val(in, argument_count > 4 ? argument[4] :   0, ERousrData.Int32);

_extImguiGML_input_int();

var out = __Imgui_out;
var ret = array_create(2);
ret[@ 0] = buffer_read(out, buffer_s8) != 0;
ret[@ 1] = buffer_read(out, buffer_s32);
return ret;

#define imguigml_input_int2
///@function imguigml_input_int2(_label, _val, _val2, [_extra_flags=0])
///@desc keyboard input field float
///@param {String} _label
///@param {Real} _val
///@param {Real} _val2
///@param {Real:EImGui_InputTextFlags} [_extra_flags=0])
///@returns {Array:[_changed, _val, _val2]}
var in = __Imgui_in;
rousr_buffer_write_val(in, argument[0]);
rousr_buffer_write_val(in, argument[1], ERousrData.Int32);
rousr_buffer_write_val(in, argument[2], ERousrData.Int32);
rousr_buffer_write_val(in, argument_count > 3 ? argument[3] :   0, ERousrData.Int32);
_extImguiGML_input_int2();

var out = __Imgui_out;
var ret = array_create(3);
ret[@ 0] = buffer_read(out, buffer_s8) != 0;
ret[@ 1] = buffer_read(out, buffer_s32);
ret[@ 2] = buffer_read(out, buffer_s32);
return ret;


#define imguigml_input_int3
///@function imguigml_input_int3(_label, _val, _val2, _val3, [_extra_flags=0])
///@desc keyboard input field float
///@param {String} _label
///@param {Real} _val
///@param {Real} _val2
///@param {Real} _val3
///@param {Real:EImGui_InputTextFlags} [_extra_flags=0])
///@returns {Array:[_changed, _val, _val2, _val3]}
var in = __Imgui_in;
rousr_buffer_write_val(in, argument[0]);
rousr_buffer_write_val(in, argument[1], ERousrData.Int32);
rousr_buffer_write_val(in, argument[2], ERousrData.Int32);
rousr_buffer_write_val(in, argument[3], ERousrData.Int32);
rousr_buffer_write_val(in, argument_count > 4 ? argument[4] :   0, ERousrData.Int32);
_extImguiGML_input_int3();


var out = __Imgui_out;
var ret = array_create(4);
ret[@ 0] = buffer_read(out, buffer_s8) != 0;
ret[@ 1] = buffer_read(out, buffer_s32);
ret[@ 2] = buffer_read(out, buffer_s32);
ret[@ 3] = buffer_read(out, buffer_s32);
return ret;


#define imguigml_input_int4
///@function imguigml_input_int4(_label, _val, _val2, _val3, _val4, [_extra_flags=0])
///@desc keyboard input field float
///@param {String} _label
///@param {Real} _val
///@param {Real} _val2
///@param {Real} _val3
///@param {Real} _val4
///@param {Real:EImGui_InputTextFlags} [_extra_flags=0])
///@returns {Array:[_changed, _val, _val2, _val3, _val4]}
var in = __Imgui_in;
rousr_buffer_write_val(in, argument[0]);
rousr_buffer_write_val(in, argument[1], ERousrData.Int32);
rousr_buffer_write_val(in, argument[2], ERousrData.Int32);
rousr_buffer_write_val(in, argument[3], ERousrData.Int32);
rousr_buffer_write_val(in, argument[4], ERousrData.Int32);
rousr_buffer_write_val(in, argument_count > 5 ? argument[5] :   0, ERousrData.Int32);
_extImguiGML_input_int3();
var out = __Imgui_out;
var ret = array_create(5);
ret[@ 0] = buffer_read(out, buffer_s8) != 0;
ret[@ 1] = buffer_read(out, buffer_s32);
ret[@ 2] = buffer_read(out, buffer_s32);
ret[@ 3] = buffer_read(out, buffer_s32);
ret[@ 4] = buffer_read(out, buffer_s32);
return ret;

#define imguigml_button
///@function imguigml_button(_label, [_size_x=0], [_size_y=0])
///@desc ImGui::Button()
///@param {String} _label        button label
///@param {Real} [_size_x=0.0]   width
///@param {Real} [_size_y=0.0]   height
///@returns {Boolean} pressed
var in = __Imgui_in;
rousr_buffer_write_val(in, string(argument[0]));                                   
rousr_buffer_write_val(in, argument_count > 2 ? argument[1] : 0.0, ERousrData.Float);
rousr_buffer_write_val(in, argument_count > 2 ? argument[2] : 0.0, ERousrData.Float);
_extImguiGML_button();
return buffer_read(__Imgui_out, buffer_s8) != 0;

#define imguigml_small_button
///@function imguigml_small_button(_label)
///@desc button with FramePadding=(0,0) to easily embed within text
///@param {String} _label   button label
///@returns {Boolean}
rousr_buffer_write_val(__Imgui_in, string(argument[0]));                                   
_extImguiGML_small_button();
return buffer_read(__Imgui_out, buffer_s8) != 0;

#define imguigml_invisible_button
///@function imguigml_invisible_button(_str_id, [_size_x=0], [_size_y=0])
///@desc ImGui::InvisibleButton()
///@param {String} _str_id       string id
///@param {Real} [_size_x=0.0]   width
///@param {Real} [_size_y=0.0]   height
///@returns {Boolean}
var in = __Imgui_in;
rousr_buffer_write_val(in, string(argument[0]));                                   
rousr_buffer_write_val(in, argument_count > 2 ? argument[1] : 0.0, ERousrData.Float);
rousr_buffer_write_val(in, argument_count > 2 ? argument[2] : 0.0, ERousrData.Float);
_extImguiGML_invisible_button();
return buffer_read(__Imgui_out, buffer_s8) != 0;

#define imguigml_image
///@function imguigml_image(_texture_id, _size_x, _size_y, [_u0=0.0], [_v0=0.0], [_u1=1.0], [_v1=1.0], [_tint_r=1.0], [_tint_g=1.0], [_tint_b=1.0], [_tint_a=1.0], [_border_r=0.0], [_border_g=0.0], [_border_b=0.0], [_border_a=0.0])
///@desc ImGui::Image()
///@param {Real} _texture_id       texture id
///@param {Real} _size_x           width
///@param {Real} _size_y           height
///@param {Real} [_u0=0.0]         texture u0
///@param {Real} [_v0=0.0]         texture v0
///@param {Real} [_u1=1.0]         texture u1
///@param {Real} [_v1=1.0]         texture v1
///@param {Real} [_tint_r=1.0]     tint color r
///@param {Real} [_tint_g=1.0]     tint color g
///@param {Real} [_tint_b=1.0]     tint color b
///@param {Real} [_tint_a=1.0]     tint color a
///@param {Real} [_border_r=0.0]   border color r
///@param {Real} [_border_g=0.0]   border color g
///@param {Real} [_border_b=0.0]   border color b
///@param {Real} [_border_a=0.0]   border color a
var in = __Imgui_in;
var texture_id = __imguigml_texture_id(argument[0]);
rousr_buffer_write_val(in, texture_id, ERousrData.Uint32);

// Size
rousr_buffer_write_val(in, argument[1], ERousrData.Float);
rousr_buffer_write_val(in, argument[2], ERousrData.Float);

// uv0
rousr_buffer_write_val(in, argument_count > 4 ? argument[3] : 0.0, ERousrData.Float);
rousr_buffer_write_val(in, argument_count > 4 ? argument[4] : 0.0, ERousrData.Float);

// uv0
rousr_buffer_write_val(in, argument_count > 6 ? argument[5] : 1.0, ERousrData.Float);
rousr_buffer_write_val(in, argument_count > 6 ? argument[6] : 1.0, ERousrData.Float);

// tint
rousr_buffer_write_val(in, argument_count > 10 ? argument[7]  : 1.0, ERousrData.Float);
rousr_buffer_write_val(in, argument_count > 10 ? argument[8]  : 1.0, ERousrData.Float);
rousr_buffer_write_val(in, argument_count > 10 ? argument[9]  : 1.0, ERousrData.Float);
rousr_buffer_write_val(in, argument_count > 10 ? argument[10] : 1.0, ERousrData.Float);

// border
rousr_buffer_write_val(in, argument_count > 14 ? argument[11] : 0.0, ERousrData.Float);
rousr_buffer_write_val(in, argument_count > 14 ? argument[12] : 0.0, ERousrData.Float);
rousr_buffer_write_val(in, argument_count > 14 ? argument[13] : 0.0, ERousrData.Float);
rousr_buffer_write_val(in, argument_count > 14 ? argument[14] : 0.0, ERousrData.Float);

_extImguiGML_image();

#define imguigml_image_button
///@function imguigml_image_button(_texture_id, _size_x, _size_y, [_u0=0.0], [_v0=0.0], [_u1=1.0], [_v1=1.0], [_tint_r=1.0], [_tint_g=1.0], [_tint_b=1.0], [_tint_a=1.0], [_border_r=0.0], [_border_g=0.0], [_border_b=0.0], [_border_a=0.0])
///@desc ImGui::ImageButton()
///@param {Real} _texture_id           texture id
///@param {Real} _size_x               width
///@param {Real} _size_y               height
///@param {Real} [_u0=0.0]             texture u0
///@param {Real} [_v0=0.0]             texture v0
///@param {Real} [_u1=1.0]             texture u1
///@param {Real} [_v1=1.0]             texture v1
///@param {Real} [_frame_padding=-1]   <0 frame_padding uses default frame padding settings. 0 for no padding
///@param {Real} [_bg_r=0.0]           border color r
///@param {Real} [_bg_g=0.0]           border color g
///@param {Real} [_bg_b=0.0]           border color b
///@param {Real} [_bg_a=0.0]           border color a
///@param {Real} [_tint_r=1.0]         tint color r 
///@param {Real} [_tint_g=1.0]         tint color g
///@param {Real} [_tint_b=1.0]         tint color b
///@param {Real} [_tint_a=1.0]         tint color a
///@returns {Boolean} _pressed
var in = __Imgui_in;
var texture_id = __imguigml_texture_id(argument[0]);
rousr_buffer_write_val(in, texture_id, ERousrData.Uint32);

// Size
rousr_buffer_write_val(in, argument[1], ERousrData.Float);
rousr_buffer_write_val(in, argument[2], ERousrData.Float);

// uv0
rousr_buffer_write_val(in, argument_count > 4 ? argument[3] : 0.0, ERousrData.Float);
rousr_buffer_write_val(in, argument_count > 4 ? argument[4] : 0.0, ERousrData.Float);

// uv0
rousr_buffer_write_val(in, argument_count > 6 ? argument[5] : 1.0, ERousrData.Float);
rousr_buffer_write_val(in, argument_count > 6 ? argument[6] : 1.0, ERousrData.Float);

// frame_padding
rousr_buffer_write_val(in, argument_count > 7 ? argument[7] : -1, ERousrData.Int32);

// bg
rousr_buffer_write_val(in, argument_count > 11 ? argument[8]  : 1.0, ERousrData.Float);
rousr_buffer_write_val(in, argument_count > 11 ? argument[9]  : 1.0, ERousrData.Float);
rousr_buffer_write_val(in, argument_count > 11 ? argument[10] : 1.0, ERousrData.Float);
rousr_buffer_write_val(in, argument_count > 11 ? argument[11] : 1.0, ERousrData.Float);

// tint
rousr_buffer_write_val(in, argument_count > 15 ? argument[12] : 0.0, ERousrData.Float);
rousr_buffer_write_val(in, argument_count > 15 ? argument[13] : 0.0, ERousrData.Float);
rousr_buffer_write_val(in, argument_count > 15 ? argument[14] : 0.0, ERousrData.Float);
rousr_buffer_write_val(in, argument_count > 15 ? argument[15] : 0.0, ERousrData.Float);

_extImguiGML_image_button();
return buffer_read(__Imgui_out, buffer_s8) != 0;


#define imguigml_checkbox
///@function imguigml_checkbox(_label, _val)
///@desc ImGui::Checkbox()
///@param {String}  _label    button label
///@param {Boolean} _val      checked    
///@returns {Boolean} checked
var in = __Imgui_in;
rousr_buffer_write_val(in, string(argument[0]));                                   
rousr_buffer_write_val(in, argument[1], ERousrData.Int8);
_extImguiGML_checkbox();
return buffer_read(__Imgui_out, buffer_s8) == 1;

#define imguigml_checkbox_flags
///@function imguigml_checkbox_flags(_label, _flags, _flag_val)
///@desc ImGui::CheckboxFlags()
///@param {String}  _label     button label
///@param {Real}    _flags     check flags
///@param {Real}    _flag_val  current value of flags
///@returns {Real} _flags result
var in = __Imgui_in;
rousr_buffer_write_val(in, string(argument[0]));                                   
rousr_buffer_write_val(in, argument[1], ERousrData.Uint32);
rousr_buffer_write_val(in, argument[2], ERousrData.Uint32);
_extImguiGML_checkbox_flags();
return buffer_read(__Imgui_out, buffer_u32);

#define imguigml_radio_button
///@function imguigml_radio_button(_label, [_activeOrVal], [_current_val])
///@desc ImGui::RadioButton()
///@param {String}  _label        button label
///@param {Real}    _activeOrVal  radio button value, or if this is checked
///@param {Real}    _current_val  current value of radio buttons
///@returns {Real} val result if _current_val passed
var in = __Imgui_in;
rousr_buffer_write_val(in, string(argument[0]));                                   

if (argument_count == 2) {
  rousr_buffer_write_val(in, argument[1] ? 1 : 0, ERousrData.Int8);
  _extImguiGML_radio_button();
} else if (argument_count == 3) {
  rousr_buffer_write_val(in, argument[1], ERousrData.Int32);
  rousr_buffer_write_val(in, argument[2], ERousrData.Int32);
  _extImguiGML_radio_button();
  return buffer_read(__Imgui_out, buffer_s32);
} 

#define imguigml_combo
///@function imguigml_combo(_label, _current_item, _items, [_height_in_items = -1]);
///@desc
///@param {String} _label
///@param {Real} _current_item
///@param {Array:String} _items   [string unsupported] if a string, separate each item with a 0
///@returns {Array:[_changed, current_item]
var in = __Imgui_in;
var _items = argument[2];
var num_items = array_length_1d(_items);
rousr_buffer_write_val(in, argument[0]);
rousr_buffer_write_val(in, argument[1], ERousrData.Int32);
rousr_buffer_write_val(in, num_items, ERousrData.Int32);
var i = 0; repeat(num_items) rousr_buffer_write_val(in, string(_items[i++]));
rousr_buffer_write_val(in, argument_count > 2 ? argument[2] : -1, ERousrData.Int32);
_extImguiGML_combo();

var out = __Imgui_out;
var ret = array_create(2);
ret[@ 0] = buffer_read(out, buffer_s8) != 0;
ret[@ 1] = buffer_read(out, buffer_s32);
return ret;


#define imguigml_plot_lines
///@function imguigml_plot_lines(_label, _values, [_values_offset=0], [_overlay=undefined], [_scale_min=undefined], [_scale_max=undefined], [_graph_size_x=0], [_graph_size_y=0], [_stride=sizeof(float)]
///@desc plot a line graph i guess
///@param {String} _label
///@param {Array}  _values
///@param {Real}   [_values_offset=0]
///@param {String} [_overlay=undefined]
///@param {Real}   [_scale_min=undefined]
///@param {Real}   [_scale_max=undefined]
///@param {Real}   [_graph_size_x=0]
///@param {Real}   [_graph_size_y=0]
///@param {Real}   [_stride=sizeof(float)]
var in = __Imgui_in;

var _label         = argument[0];
var _items         = argument[1];
var _values_offset = argument_count > 2 ? argument[2] : 0;
var _overlay       = argument_count > 3 ? argument[3] : undefined; if (!is_string(_overlay)) _overlay = 0;
var _scale_min     = argument_count > 4 ? argument[4] : undefined;
var _scale_max     = argument_count > 5 ? argument[5] : undefined;
var _graph_size_x  = argument_count > 6 ? argument[6] : 0;
var _graph_size_y  = argument_count > 7 ? argument[7] : 0;
var _stride        = argument_count > 8 ? argument[8] : 4;
var num_items = array_length_1d(_items);

rousr_buffer_write_val(in, _label);
rousr_buffer_write_val(in, num_items, ERousrData.Int32);
var i = 0; repeat(num_items) rousr_buffer_write_val(in, _items[i++], ERousrData.Float);
rousr_buffer_write_val(in, _values_offset, ERousrData.Int32);
rousr_buffer_write_val(in, _overlay   == undefined ? 0 : _overlay,   _overlay   == undefined ? ERousrData.Int8 : ERousrData.String);
rousr_buffer_write_val(in, _scale_min == undefined ? 0 : _scale_min, _scale_min == undefined ? ERousrData.Int8 : ERousrData.Float);
rousr_buffer_write_val(in, _scale_max == undefined ? 0 : _scale_max, _scale_max == undefined ? ERousrData.Int8 : ERousrData.Float);
rousr_buffer_write_val(in, _graph_size_x, ERousrData.Float);
rousr_buffer_write_val(in, _graph_size_y, ERousrData.Float);
rousr_buffer_write_val(in, _stride,       ERousrData.Float);
_extImguiGML_plot_lines();

#define imguigml_plot_histogram
///@function imguigml_plot_histogram(_label, _values, [_values_offset=0], [_overlay=undefined], [_scale_min=undefined], [_scale_max=undefined], [_graph_size_x=0], [_graph_size_y=0], [_stride=sizeof(float)]
///@desc plot a histogram graph i guess
///@param {String} _label
///@param {Array}  _values
///@param {Real}   [_values_offset=0]
///@param {String} [_overlay=undefined]
///@param {Real}   [_scale_min=undefined]
///@param {Real}   [_scale_max=undefined]
///@param {Real}   [_graph_size_x=0]
///@param {Real}   [_graph_size_y=0]
///@param {Real}   [_stride=sizeof(float)]
var in = __Imgui_in;

var _label         = argument[0];
var _items         = argument[1];
var _values_offset = argument_count > 2 ? argument[2] : 0;
var _overlay       = argument_count > 3 ? argument[3] : undefined; if (!is_string(_overlay)) _overlay = undefined;
var _scale_min     = argument_count > 4 ? argument[4] : undefined;
var _scale_max     = argument_count > 5 ? argument[5] : undefined;
var _graph_size_x  = argument_count > 6 ? argument[6] : 0;
var _graph_size_y  = argument_count > 7 ? argument[7] : 0;
var _stride        = argument_count > 8 ? argument[8] : 4;
var num_items = array_length_1d(_items);

rousr_buffer_write_val(in, _label);
rousr_buffer_write_val(in, num_items, ERousrData.Int32);
var i = 0; repeat(num_items) rousr_buffer_write_val(in, _items[i++], ERousrData.Float);
rousr_buffer_write_val(in, _values_offset, ERousrData.Int32);
rousr_buffer_write_val(in, _overlay   == undefined ? 0 : _overlay,   _overlay   == undefined ? ERousrData.Int8 : ERousrData.String);
rousr_buffer_write_val(in, _scale_min == undefined ? 0 : _scale_min, _scale_min == undefined ? ERousrData.Int8 : ERousrData.Float);
rousr_buffer_write_val(in, _scale_max == undefined ? 0 : _scale_max, _scale_max == undefined ? ERousrData.Int8 : ERousrData.Float);
rousr_buffer_write_val(in, _graph_size_x, ERousrData.Float);
rousr_buffer_write_val(in, _graph_size_y, ERousrData.Float);
rousr_buffer_write_val(in, _stride,       ERousrData.Float);
_extImguiGML_plot_histogram();

#define imguigml_progress_bar
///@function imguigml_progress_bar(_fraction, [_size_x=-1.0], [_size_y=0.0], [_overlay])
///@desc
///@param {String} _fraction
///@param {Real}   [_size_x=-1.0]              < 0.0f: align to end, 0.0f: auto, > 0.0f: specified size
///@param {Real}   [_size_y=0.0]               < 0.0f: align to end, 0.0f: auto, > 0.0f: specified size
///@param {String} [_overlay=undefined]
var in = __Imgui_in;
rousr_buffer_write_val(in, argument[0], ERousrData.Float);
rousr_buffer_write_val(in, argument_count > 2 ? argument[1] : -1.0, ERousrData.Float);
rousr_buffer_write_val(in, argument_count > 2 ? argument[2] :  0.0, ERousrData.Float);
if (argument_count > 3 && is_string(argument[3]))
  rousr_buffer_write_val(in, argument[3]);

_extImguiGML_progress_bar();

#define imguigml_sprite
///@function imguigml_sprite(sprite_index, _sub_img, _size_x, _size_y, [_tint_r=1.0], [_tint_g=1.0], [_tint_b=1.0], [_tint_a=1.0], [_border_r=0.0], [_border_g=0.0], [_border_b=0.0], [_border_a=0.0])
///@desc ImGui::Image()
///@param {Real} _sprite_index     sprite
///@param {Real} _sub_img
///@param {Real} _size_x           width
///@param {Real} _size_y           height
///@param {Real} [_tint_r=1.0]     tint color r
///@param {Real} [_tint_g=1.0]     tint color g
///@param {Real} [_tint_b=1.0]     tint color b
///@param {Real} [_tint_a=1.0]     tint color a
///@param {Real} [_border_r=0.0]   border color r
///@param {Real} [_border_g=0.0]   border color g
///@param {Real} [_border_b=0.0]   border color b
///@param {Real} [_border_a=0.0]   border color a
var uvs = sprite_get_uvs(argument[0], argument[1]);
imguigml_image(sprite_get_texture(argument[0], argument[1]), 
               argument[2], 
               argument[3],
               uvs[0],
               uvs[1],
               uvs[2],
               uvs[3],
               argument_count > 4  ? argument[4]  : 1.0,
               argument_count > 5  ? argument[5]  : 1.0,
               argument_count > 6  ? argument[6]  : 1.0,
               argument_count > 7  ? argument[7]  : 1.0,
               argument_count > 8  ? argument[8]  : 0,
               argument_count > 9  ? argument[9]  : 0,
               argument_count > 10 ? argument[10] : 0,
               argument_count > 11 ? argument[11] : 0);

#define imguigml_sprite_button
///@function imguigml_sprite_button(_sprite_index, _sub_img, _size_x, _size_y, [_tint_r=1.0], [_tint_g=1.0], [_tint_b=1.0], [_tint_a=1.0], [_border_r=0.0], [_border_g=0.0], [_border_b=0.0], [_border_a=0.0])
///@desc ImGui::ImageButton()
///@param {Real} _sprite_index         sprite
///@param {Real} _sub_img
///@param {Real} _size_x               width
///@param {Real} _size_y               height
///@param {Real} [_frame_padding=-1]   <0 frame_padding uses default frame padding settings. 0 for no padding
///@param {Real} [_bg_r=0.0]           border color r
///@param {Real} [_bg_g=0.0]           border color g
///@param {Real} [_bg_b=0.0]           border color b
///@param {Real} [_bg_a=0.0]           border color a
///@param {Real} [_tint_r=1.0]         tint color r
///@param {Real} [_tint_g=1.0]         tint color g
///@param {Real} [_tint_b=1.0]         tint color b
///@param {Real} [_tint_a=1.0]         tint color a
///@returns {Boolean} _pressed
var uvs = sprite_get_uvs(argument[0], argument[1]);
return imguigml_image_button(sprite_get_texture(argument[0], argument[1]), 
               argument[2], 
               argument[3],
               uvs[0],
               uvs[1],
               uvs[2],
               uvs[3],
               argument_count > 4  ? argument[4]  : -1,
               argument_count > 5  ? argument[5]  : 0.0,
               argument_count > 6  ? argument[6]  : 0.0,
               argument_count > 7  ? argument[7]  : 0.0,
               argument_count > 8  ? argument[8]  : 0.0,
               argument_count > 9  ? argument[9]  : 1.0,
               argument_count > 10 ? argument[10] : 1.0,
               argument_count > 11 ? argument[11] : 1.0,
               argument_count > 11 ? argument[12] : 1.0);

#define imguigml_text
///@function imguigml_text(_text)
///@desc simple formatted text
///@param {String} _text
var buff = __imguigml_wrapper_buffer();
rousr_buffer_write_val(buff, string(argument[0]));
_extImguiGML_text();

#define imguigml_text_colored
///@function imguigml_text_colored(_r, _g, _b, _a, _text)
///@desc shortcut for PushStyleColor(ImGuiCol_Text, style.Colors[ImGuiCol_TextDisabled]); Text(fmt, ...); PopStyleColor();
///@param {Real} _r
///@param {Real} _g
///@param {Real} _b
///@param {Real} _a
///@param {String} _text
var buff = __imguigml_wrapper_buffer();
rousr_buffer_write_val(buff, argument[0], ERousrData.Float);
rousr_buffer_write_val(buff, argument[1], ERousrData.Float);
rousr_buffer_write_val(buff, argument[2], ERousrData.Float);
rousr_buffer_write_val(buff, argument[3], ERousrData.Float);
rousr_buffer_write_val(buff, string(argument[4]));
_extImguiGML_text_colored();

#define imguigml_text_disabled
///@function imguigml_text_disabled(_text)
///@desc shortcut for PushStyleColor(ImGuiCol_Text, style.Colors[ImGuiCol_TextDisabled]); Text(fmt, ...); PopStyleColor();
///@param {String} _text
var buff = __imguigml_wrapper_buffer();
rousr_buffer_write_val(buff, string(argument[0]));
_extImguiGML_text_disabled();

#define imguigml_text_wrapped
///@function imguigml_text_wrapped(_text)
///@desc shortcut for `imguigml_push_text_wrap_pos(0.0f); imguigml_text(_text); imguigml_pop_text_wrap_pos();`. 
///@param {String} _text
///@Note: this won't work on an auto-resizing window if there's no other widgets to 
//         extend the window width, you may need to set a size using `imguigml_set_next_window_size()`
var buff = __imguigml_wrapper_buffer();
rousr_buffer_write_val(buff, string(argument[0]));
_extImguiGML_text_wrapped();

#define imguigml_label_text
///@function imguigml_label_text(_label, _text)
///@desc display text+label aligned the same way as value+label widgets
///@param {String} _label
///@param {String} _text
var buff = __imguigml_wrapper_buffer();
rousr_buffer_write_val(buff, string(argument[0]));
rousr_buffer_write_val(buff, string(argument[1]));
_extImguiGML_label_text();


#define imguigml_bullet_text
///@function imguigml_bullet_text(_text)
///@desc shortcut for Bullet()+Text()
///@param {String} _text
var buff = __imguigml_wrapper_buffer();
rousr_buffer_write_val(buff, string(argument[0]));
_extImguiGML_bullet_text();

#define imguigml_bullet
///@function imguigml_bullet()
///@desc draw a small circle and keep the cursor on the same line. 
///       advance cursor x position by GetTreeNodeToLabelSpacing(), same distance that TreeNode() uses
_extImguiGML_bullet();

#define imguigml_tree_node
///@function imguigml_tree_node()
///@desc
var in = __Imgui_in;
// _extImguiGML_
var out = __Imgui_out;
// return buffer_read(out, buffer_);

#define imguigml_tree_node_ex
///@function imguigml_tree_node_ex()
///@desc
var in = __Imgui_in;
// _extImguiGML_
var out = __Imgui_out;
// return buffer_read(out, buffer_);

#define imguigml_tree_push
///@function imguigml_tree_push()
///@desc 
var in = __Imgui_in;
// _extImguiGML_

#define imguigml_tree_pop
///@function imguigml_tree_pop()
///@desc ~ Unindent()+PopId()
_extImguiGML_tree_pop();

#define imguigml_tree_advance_to_label_pos
///@function imguigml_tree_advance_to_label_pos
///@desc advance cursor x position by GetTreeNodeToLabelSpacing()
_extImguiGML_tree_advance_to_label_pos();

#define imguigml_get_tree_node_to_label_spacing
///@function imguigml_get_tree_node_to_label_spacing()
///@des horizontal distance preceding label when using TreeNode*() or Bullet() == (g.FontSize + style.FramePadding.x*2) for a regular unframed TreeNode
///@returns {Real}
_extImguiGML_get_tree_node_to_label_spacing();
return buffer_read(__Imgui_out, buffer_f32);

#define imguigml_set_next_tree_node_open
///@function imguigml_set_next_tree_node_open(_is_open, [_cond=0])
///@desc set next TreeNode/CollapsingHeader open state.
///@param {Boolean} _is_open
///@param {Real:EImGui_Cond} [_cond=0]
var in = __Imgui_in;
rousr_buffer_write_val(in, argument[0] ? 1 : 0, ERousrData.Int8);
rousr_buffer_write_val(in, argument_count > 1 ? argument[1] : 0, ERousrData.Int32);
_extImguiGML_set_next_tree_node_open();

#define imguigml_collapsing_header
///@function imguigml_collapsing_header(_label, [_p_open=undefined], [_flags=0])
///@desc add a collapsing header
///@param {String}                    _label
///@param {Boolean}                   [_open=undefined]   when `open` isn't `undefined`, display an additional small close button on upper right of the header
///@param {Real:EImGui_TreeNodeFlags] [_flags=0]
///@returns {Array:[_collapsed, [_open]} if returning 'true' the header is open. doesn't indent nor push on ID stack. user doesn't have to call TreePop().
var in = __Imgui_in;
var _label = argument[0];
var _open  = argument_count > 1 ? argument[1] : undefined;
var _flags = argument_count > 2 ? argument[2] : 0;

rousr_buffer_write_val(in, _label);
rousr_buffer_write_val(in, _open == undefined ? 0 : _open, _open == undefined ? ERousrData.Float : ERousrData.Int8);
rousr_buffer_write_val(in, _flags, ERousrData.Int32);

_extImguiGML_collapsing_header();
var out = __Imgui_out;
var ret = [ ];
ret[@ 0] = buffer_read(out, buffer_s8) != 0;
if (_open != undefined)
  ret[@ 1] = buffer_read(out, buffer_s8) != 0;

return ret;

#define imguigml_begin
///@function imguigml_begin(_name, [_open=undefined], [_flags=0])
///@desc Push a new ImGui window to add widgets to.
///@param {String} _name                         title for window
///@param {Real} [_open=undefined]               pass true/false for if this window is open w/close button, undefined for no button
///@param {Real:EImGui_WindowFlags} [_flags=0]   window flags
///@returns {Array:[_collapsed, [_open]]}
var in = __Imgui_in;
var _name  = argument[0],
    _open  = argument_count > 1 ? argument[1] : undefined,
    _flags = argument_count > 2 ? argument[2] : 0;

if (_open != undefined) _open = _open ? 1 : 0;

rousr_buffer_write_val(in, _name);
rousr_buffer_write_val(in, _open == undefined ? 0 : _open, _open == undefined ? ERousrData.Float : ERousrData.Int8);
rousr_buffer_write_val(in, _flags, ERousrData.Int32);

_extImguiGML_begin();
var out = __Imgui_out;
var ret = [ buffer_read(out, buffer_s8) != 0 ];
if (_open != undefined)
  ret[@ 1] = buffer_read(out, buffer_s8) != 0;

return ret;

#define imguigml_end
///@function imguigml_end()
///@desc ImGui::End()
_extImguiGML_end();

#define imguigml_begin_child
///@function imguigml_begin_child(_id, [_size_x=0], [_size_y=0], [_border=false], [_extra_flags=0])
///@desc begin a scrolling region. each axis can use a different mode, e.g. ImVec2(0,400).
///@param {Real|String} _id    
///@param {Real}    [_size_x=0]    size==0.0f: use remaining window size, size<0.0f: use remaining window size minus abs(size). size>0.0f: fixed size. 
///@param {Real}    [_size_y=0]    size==0.0f: use remaining window size, size<0.0f: use remaining window size minus abs(size). size>0.0f: fixed size. 
///@param {Boolean} [_border=false]
///@param {Real:EImGui_WindowFlags} [_extra_flags=0]
///@returns {Boolean} false when collapsed
var in = __Imgui_in;
rousr_buffer_write_val(in, argument[0], is_string(argument[0]) ? ERousrData.String : ERousrData.Uint32);
rousr_buffer_write_val(in, argument_count > 1 ? argument[1] : 0, ERousrData.Float);
rousr_buffer_write_val(in, argument_count > 2 ? argument[2] : 0, ERousrData.Float);
rousr_buffer_write_val(in, argument_count > 3 ? argument[3] : 0, ERousrData.Int8);
rousr_buffer_write_val(in, argument_count > 4 ? argument[4] : 0, ERousrData.Int32);
_extImguiGML_begin_child();
var out = __Imgui_out;
return buffer_read(out, buffer_s8) != 0;

#define imguigml_end_child
///@function imguigml_end_child()
///@desc end a scrolling region
_extImguiGML_end_child();

#define imguigml_get_content_region_max
///@function imguigml_get_content_region_max()
///@desc current content boundaries (typically window boundaries including scrolling, or current column boundaries), in windows coordinates
///@returns {Array:EPos2D} boundaries
_extImguiGML_get_content_region_max();
var out = __Imgui_out;
var ret = array_create(2);
ret[@ 0] = buffer_read(out, buffer_f32);
ret[@ 1] = buffer_read(out, buffer_f32);
return ret;

#define imguigml_get_content_region_avail
///@function imguigml_get_content_region_avail
///@desc == GetContentRegionMax() - GetCursorPos()
///@returns {Array:EPos2D} region
_extImguiGML_get_content_region_avail();
var out = __Imgui_out;
var ret = array_create(2);
ret[@ 0] = buffer_read(out, buffer_f32);
ret[@ 1] = buffer_read(out, buffer_f32);
return ret;

#define imguigml_get_content_region_avail_width
///@function imguigml_get_content_region_avail_width
///@desc get available width
///@returns {Real} width
_extImguiGML_get_content_region_avail_width();
return buffer_read(__Imgui_out, buffer_f32);

#define imguigml_get_window_content_region_min
///@function imguigml_get_window_content_region_min
///@desc content boundaries min (roughly (0,0)-Scroll), in window coordinates
///@returns {Array:EPos2D} region
//_extImguiGML_();
_extImguiGML_get_window_content_region_min();
var out = __Imgui_out;
var ret = array_create(2);
ret[@ 0] = buffer_read(out, buffer_f32);
ret[@ 1] = buffer_read(out, buffer_f32);
return ret;

#define imguigml_get_window_content_region_max
///@function imguigml_get_window_content_region_max
///@desc content boundaries max (roughly (0,0)+Size-Scroll) where Size can be override with SetNextWindowContentSize(), in window coordinates
///@returns {Array:EPos2D}
_extImguiGML_get_window_content_region_max();
var out = __Imgui_out;
var ret = array_create(2);
ret[@ 0] = buffer_read(out, buffer_f32);
ret[@ 1] = buffer_read(out, buffer_f32);
return ret;

#define imguigml_get_window_content_region_width
///@function imguigml_get_window_content_region_width
///@desc content width in windows coordinates
///@returns {Real} content width
_extImguiGML_get_window_content_region_width();
return buffer_read(__Imgui_out, buffer_f32);

#define imguigml_get_window_pos
///@function imguigml_get_window_pos
///@desc get current window position in screen space (useful if you want to do your own drawing via the DrawList api)
///@returns {Array:EPos2D} window pos
_extImguiGML_get_window_pos();
var out = __Imgui_out;
var ret = array_create(2);
ret[@ 0] = buffer_read(out, buffer_f32);
ret[@ 1] = buffer_read(out, buffer_f32);
return ret;

#define imguigml_get_window_size
///@function imguigml_get_window_size
///@desc get current window size
///@returns {Array:E2D} size
_extImguiGML_get_window_size();
var out = __Imgui_out;
var ret = array_create(2);
ret[@ 0] = buffer_read(out, buffer_f32);
ret[@ 1] = buffer_read(out, buffer_f32);
return ret;

#define imguigml_get_window_width
///@function imguigml_get_window_width
///@desc get current window width
///@returns {Real} width
_extImguiGML_get_window_width();
return buffer_read(__Imgui_out, buffer_f32);

#define imguigml_get_window_height
///@function imguigml_get_window_height
///@desc get current window height
///@returns {Real} height
_extImguiGML_get_window_height();
return buffer_read(__Imgui_out, buffer_f32);

#define imguigml_is_window_collapsed
///@function imguigml_is_window_collapsed()
///@desc is current window collapsed
///@returns {Boolean} is current window collapsed
_extImguiGML_is_window_collapsed();
return buffer_read(__Imgui_out, buffer_s8) == 1;


#define imguigml_is_window_appearing
///@function imguigml_is_window_appearing()
///@desc is current window appearing
///@returns {Boolean} is current window appearing
_extImguiGML_is_window_appearing();
return buffer_read(__Imgui_out, buffer_s8) == 1;


#define imguigml_set_window_font_scale
///@function imguigml_set_window_font_scale(_scale)
///@desc per-window font scale. Adjust IO.FontGlobalScale if you want to scale all windows
///@param {Real} _scale   font scale for this window
var buff = __imguigml_wrapper_buffer();
rousr_buffer_write_val(buff, argument[0], ERousrData.Float);
_extImguiGML_set_window_font_scale();

#define imguigml_set_next_window_pos
///@function imguigml_set_next_window_pos(_pos_x, _pos_y, [_cond=0], [_pivot_x=0], [_pivot_y=0])
///@desc set next window position. call before Begin(). use pivot=(0.5f,0.5f) to center on given point, etc.
///@param {Real}             _x          pos x
///@param {Real}             _y          pos y
///@param {Real:EImGui_Cond} [_cond=0]   condition for setting (not a bit flag)
///@param {Real} [_pivot_x = 0]          used to center on a point
///@param {Real} [_pivot_y = 0]          used to center on a point
var in = __Imgui_in;
rousr_buffer_write_val(in,                      argument[0],       ERousrData.Float);
rousr_buffer_write_val(in,                      argument[1],       ERousrData.Float);
rousr_buffer_write_val(in, argument_count > 2 ? argument[2] : 0,   ERousrData.Int32);
rousr_buffer_write_val(in, argument_count > 4 ? argument[3] : 0.0, ERousrData.Float);
rousr_buffer_write_val(in, argument_count > 4 ? argument[4] : 0.0, ERousrData.Float);

_extImguiGML_set_next_window_pos();

#define imguigml_set_next_window_size
///@function imguigml_set_next_window_size(_size_x, _size_y, [_cond=0])
///@desc set next window size. set axis to 0.0f to force an auto-fit on this axis. call before Begin()
///@param {Real}             _x          size x
///@param {Real}             _y          size y
///@param {Real:EImGui_Cond} [_cond=0]   condition for setting (not a bit flag)
var in = __Imgui_in;
rousr_buffer_write_val(in,                      argument[0],       ERousrData.Float);
rousr_buffer_write_val(in,                      argument[1],       ERousrData.Float);
rousr_buffer_write_val(in, argument_count > 2 ? argument[2] : 0,   ERousrData.Int32);

_extImguiGML_set_next_window_size(); 

#define imguigml_set_next_window_size_constraints
///@function imguigml_set_next_window_size_constraints(_min_size_x, _min_size_y, _max_size_x, _max_size_y)
///@desc set next window size limits. use -1,-1 on either X/Y axis to preserve the current size. 
///@param {Real}             _min_x      min size x
///@param {Real}             _min_y      min size y
///@param {Real}             _max_x      max size x
///@param {Real}             _max_y      max size y
///@param {Real:EImGui_Cond} [_cond=0]   condition for setting (not a bit flag)
var buff = __imguigml_wrapper_buffer();
rousr_buffer_write_val(buff, argument[0], ERousrData.Float);
rousr_buffer_write_val(buff, argument[1], ERousrData.Float);
rousr_buffer_write_val(buff, argument[2], ERousrData.Float);
rousr_buffer_write_val(buff, argument[3], ERousrData.Float);
_extImguiGML_set_next_window_size_constraints();

#define imguigml_set_next_window_content_size
///@function imguigml_set_next_window_content_size(_size_x, _size_y)
///@desc set next window content size (enforce the range of scrollbars). set axis to 0.0f to leave it automatic. call before Begin()
///@param {Real} _size_x   width
///@param {Real} _size_y   height
var buff = __imguigml_wrapper_buffer();
rousr_buffer_write_val(buff, argument[0], ERousrData.Float);
rousr_buffer_write_val(buff, argument[1], ERousrData.Float);
_extImguiGML_set_next_window_content_size();


#define imguigml_set_next_window_content_width
///@function imguigml_set_next_window_content_width(_width)
///@desc set next window content width (enforce the range of horizontal scrollbar). call before Begin()
///@param {Real} _width   width
var in = __Imgui_in;
rousr_buffer_write_val(in, argument[0], ERousrData.Float);
_extImguiGML_set_next_window_content_width();


#define imguigml_set_next_window_collapsed
///@function imguigml_set_next_window_collapsed(_collapsed, [_cond=0])
///@desc set next window collapsed state. call before Begin()
///@param {Boolean} _collapsed           true if collapsed
///@param {Real:EImGui_Cond} [_cond=0]   condition for setting (not a bit flag)
var buff = __imguigml_wrapper_buffer();
rousr_buffer_write_val(buff, argument[0] ? 1 : 0, ERousrData.Int8);
rousr_buffer_write_val(buff, argument_count > 1 ? argument[1] : 0, ERousrData.Int32);
_extImguiGML_set_next_window_collapsed();

#define imguigml_set_next_window_focus
///@function imguigml_set_next_window_focus()
///@desc set next window to be focused / front-most. call before Begin()
_extImguiGML_set_next_window_focus();

#define imguigml_set_window_pos
///@function imguigml_set_window_pos(_name, _pos_x, _pos_y, [_cond=0])
///@desc set named window position.
///@param {String} _name                 name
///@param {Real}   _pos_x          pos x
///@param {Real}   _pos_y          pos y
///@param {Real:EImGui_Cond} [_cond=0]   condition for setting (not a bit flag)
var buff = __imguigml_wrapper_buffer();
rousr_buffer_write_val(buff,                      argument[0]);
rousr_buffer_write_val(buff,                      argument[1],     ERousrData.Float);
rousr_buffer_write_val(buff,                      argument[2],     ERousrData.Float);
rousr_buffer_write_val(buff, argument_count > 3 ? argument[3] : 0, ERousrData.Int32);
_extImguiGML_set_window_pos();

#define imguigml_set_window_size
///@function imguigml_set_window_size(_name, _size_x, _size_y, [_cond=0])
///@desc  set named window size. set axis to 0.0f to force an auto-fit on this axis.
///@param {String} _name                 name
///@param {Real}   _size_x               size x
///@param {Real}   _size_y               size y
///@param {Real:EImGui_Cond} [_cond=0]   condition for setting (not a bit flag)
var in = __Imgui_in;
rousr_buffer_write_val(in,                      argument[0]);
rousr_buffer_write_val(in,                      argument[1],     ERousrData.Float);
rousr_buffer_write_val(in,                      argument[2],     ERousrData.Float);
rousr_buffer_write_val(in, argument_count > 3 ? argument[3] : 0, ERousrData.Int32);
_extImguiGML_set_window_size();

#define imguigml_set_window_collapsed
///@function imguigml_set_window_collapsed(_name, _collapsed, [_cond=0])
///@desc set named window collapsed state
///@param {String} _name                 name
///@param {Boolean} _collapsed           true if collapsed
///@param {Real:EImGui_Cond} [_cond=0]   condition for setting (not a bit flag)
var in = __Imgui_in;
rousr_buffer_write_val(in, argument[0]);
rousr_buffer_write_val(in, argument[1] ? 1 : 0, ERousrData.Int8);
rousr_buffer_write_val(in, argument_count > 2 ? argument[2] : 0, ERousrData.Int32);
_extImguiGML_set_window_collapsed();

#define imguigml_set_window_focus
///@function imguigml_set_window_focus(_name)
///@desc set named window to be focused / front-most. use NULL to remove focus.
///@param {String} _name   named window
var in = __Imgui_in;
rousr_buffer_write_val(in, string(argument[0]));
_extImguiGML_set_window_focus();

#define imguigml_get_scroll_x
///@function imguigml_get_scroll_x()
///@desc get scrolling amount [0..GetScrollMaxX()]
///@returns {Real} [0..GetScrollMaxX()]
_extImguiGML_get_scroll_x();
return buffer_read(__Imgui_out, buffer_f32);

#define imguigml_get_scroll_y
///@function imguigml_get_scroll_y()
///@desc get scrolling amount [0..GetScrollMaxY()]
///@returns {Real} [0..GetScrollMaxY()]
_extImguiGML_get_scroll_y();
return buffer_read(__Imgui_out, buffer_f32);

#define imguigml_get_scroll_max_x
///@function imguigml_get_scroll_max_x()
///@desc get maximum scrolling amount ~~ ContentSize.X - WindowSize.X
///@returns {Real} scrolling amount ~~ ContentSize.X - WindowSize.X
_extImguiGML_get_scroll_max_x();
return buffer_read(__Imgui_out, buffer_f32);

#define imguigml_get_scroll_max_y
///@function imguigml_get_scroll_max_y()
///@desc get maximum scrolling amount ~~ ContentSize.Y - WindowSize.Y
///@returns {Real} scrolling amount ~~ ContentSize.Y - WindowSize.Y
_extImguiGML_get_scroll_max_y();
return buffer_read(__Imgui_out, buffer_f32);

#define imguigml_set_scroll_x
///@function imguigml_set_scroll_x(_scroll_x)
///@desc set scrolling amount [0..GetScrollMaxX()]
///@param {Real} _scroll_x   0..GetScrollMaxX()
var buff = __imguigml_wrapper_buffer();
rousr_buffer_write_val(buff, argument[0], ERousrData.Float);
_extImguiGML_set_scroll_x();

#define imguigml_set_scroll_y
///@function imguigml_set_scroll_y(_scroll_y)
///@desc set scrolling amount [0..GetScrollMaxY()]
///@param {Real} _scroll_y   0..GetScrollMaxY()
var in = __Imgui_in;
rousr_buffer_write_val(in, argument[0], ERousrData.Float);
_extImguiGML_set_scroll_y();

#define imguigml_set_scroll_here
///@function imguigml_set_scroll_here([_center_y_ratio=0.0])
///@desc  adjust scrolling amount to make current cursor position visible. 
///@param {Real} [_center_y_ratio=0.0]  top, 0.5: center, 1.0: bottom.
var buff = __imguigml_wrapper_buffer();
rousr_buffer_write_val(buff, argument_count > 0 ? argument[0] : 0.0, ERousrData.Float);
_extImguiGML_set_scroll_here();

#define imguigml_set_scroll_from_pos_y
///@function imguigml_set_scroll_from_pos_y(_pos_y, [_center_y_ratio=0.5])
///@desc adjust scrolling amount to make given position valid. use GetCursorPos() or GetCursorStartPos()+offset to get valid positions.
///@param {Real} [_center_y_ratio=0.0]  top, 0.5: center, 1.0: bottom.
var buff = __imguigml_wrapper_buffer();
rousr_buffer_write_val(buff, argument[0], ERousrData.Float);
rousr_buffer_write_val(buff, argument_count > 1 ? argument[1] : 0.0, ERousrData.Float);
_extImguiGML_set_scroll_from_pos_y();

#define imguigml_set_keyboard_focus_here
///@function imguigml_set_keyboard_focus_here([_offset=0])
///@desc focus keyboard on the next widget. 
///@param {Real} [_offset]   Use positive 'offset' to access sub components of a multiple component widget. Use -1 to access previous widget.
rousr_buffer_write_val(__Imgui_in, argument_count > 0 ? argument[0] : 0, ERousrData.Int32);
_extImguiGML_set_keyboard_focus_here();

#define imguigml_set_state_storage
///@function imguigml_set_state_storage(_tree)
///@desc replace tree state storage with our own (if you want to manipulate it yourself, typically clear subsection of it)
///@param {*} _tree   todo: implement

//var buff = __imguigml_wrapper_buffer();
//rousr_buffer_write_val(buff, <something>, <something);
//_extImguiGML_set_state_storage();

// todo: implement

#define imguigml_get_state_storage
///@function imguigml_get_state_storage(_tree)
///@desc replace tree state storage with our own (if you want to manipulate it yourself, typically clear subsection of it)
///@param {*} _tree   todo: implement

//_extImguiGML_get_state_storage();
//var buff = __imguigml_wrapper_buffer();

// todo: implement

#define imguigml_begin_child_frame
///@function imguigml_begin_child_frame(_guiID, [_size_x], [_size_y], [_extra_flags=0])
///@desc helper to create a child window / scrolling region that looks like a normal widget frame
///@param {Real}                    _guiID             ImGui ID
///@param {Real}                    _size_x            width
///@param {Real}                    _size_y            height
///@param {Real:EImGui_WindowFlags} [_extra_flags=0]   
rousr_buffer_write_val(__Imgui_in, argument_count > 0 ? argument[0] : 0, ERousrData.Int32);
_extImguiGML_begin_child_frame();

#define imguigml_end_child_frame
///@function imguigml_end_child_frame()
///@desc helper to create a child window / scrolling region that looks like a normal widget frame
///@param {Real} [_offset]   Use positive 'offset' to access sub components of a multiple component widget. Use -1 to access previous widget.
rousr_buffer_write_val(__Imgui_in, argument_count > 0 ? argument[0] : 0, ERousrData.Int32);
_extImguiGML_set_keyboard_focus_here();

#define imguigml_io_ini_saving_rate
///@function imguigml_io_ini_saving_rate([_time])
///@desc Maximum time between saving positions/sizes to .ini file, in seconds.
///@param {Real} [_time]  sets time to use if passed (= 5.0)
///@param returns { Real } current time to use 
if(argument_count > 0){
	var in = __Imgui_in;
	rousr_buffer_write_val(in, argument[0], ERousrData.Float);
	_extImguiGML_set_ini_saving_rate();
	return argument[0];
}

_extImguiGML_get_ini_saving_rate();
var out = __Imgui_out;
return buffer_read(out, buffer_f32);


#define imguigml_io_mouse_double_click_time
///@function imguigml_io_mouse_double_click_time([_time])
///@desc Time for a double-click, in seconds.
///@param {Real} [_time]  sets time to use if passed (= 0.30)
///@param returns { Real } current time to use 
if(argument_count > 0){
	var in = __Imgui_in;
	rousr_buffer_write_val(in, argument[0], ERousrData.Float);
	_extImguiGML_set_mouse_double_click_time();
	return argument[0];
}

_extImguiGML_get_mouse_double_click_time();
var out = __Imgui_out;
return buffer_read(out, buffer_f32);


#define imguigml_io_mouse_double_click_max_dist
///@function imguigml_io_mouse_double_click_max_dist([_distance])
///@desc Distance threshold to stay in to validate a double-click, in pixels.
///@param {Real} [_distance]  sets max distance if passed (= 6.0)
///@param returns { Real } current max distance
if(argument_count > 0){
	var in = __Imgui_in;
	rousr_buffer_write_val(in, argument[0], ERousrData.Float);
	_extImguiGML_set_mouse_double_click_max_dist();
	return argument[0];
}

_extImguiGML_get_mouse_double_click_max_dist();
var out = __Imgui_out;
return buffer_read(out, buffer_f32);


#define imguigml_io_mouse_drag_threshold
///@function imguigml_io_mouse_drag_threshold([_distance])
///@desc Distance threshold before considering we are dragging
///@param {Real} [_distance]  sets distance threshold if passed (= 6.0)
///@param returns { Real } current distance threshold
if(argument_count > 0){
	var in = __Imgui_in;
	rousr_buffer_write_val(in, argument[0], ERousrData.Float);
	_extImguiGML_set_mouse_drag_threshold();
	return argument[0];
}

_extImguiGML_get_mouse_drag_threshold();
var out = __Imgui_out;
return buffer_read(out, buffer_f32);

#define imguigml_io_key_repeat_delay
///@function imguigml_io_key_repeat_delay([_time])
///@desc When holding a key/button, time before it starts repeating, in seconds (for buttons in Repeat mode, etc.).
///@param {Real} [_time] sets time before repeating if passed (= 0.250)
///@param returns { Real } current time
if(argument_count > 0){
	var in = __Imgui_in;
	rousr_buffer_write_val(in, argument[0], ERousrData.Float);
	_extImguiGML_set_key_repeat_delay();
	return argument[0];
}

_extImguiGML_get_key_repeat_delay();
var out = __Imgui_out;
return buffer_read(out, buffer_f32);


#define imguigml_io_key_repeat_rate
///@function imguigml_io_key_repeat_rate([_time])
///@desc When holding a key/button, rate at which it repeats, in seconds.
///@param {Real} [_time] sets repeat rate if passed (0.050)
///@param returns { Real } current repeat rate
if(argument_count > 0){
	var in = __Imgui_in;
	rousr_buffer_write_val(in, argument[0], ERousrData.Float);
	_extImguiGML_set_key_repeat_rate();
	return argument[0];
}

_extImguiGML_get_key_repeat_rate();
var out = __Imgui_out;
return buffer_read(out, buffer_f32);


#define imguigml_io_font_global_scale
///@function imguigml_io_font_global_scale([_scale])
///@desc Global scale all fonts
///@param {Real} [_scale] sets scale for all fonts if passed (= 1.0)
///@param returns { Real } current font scale
if(argument_count > 0){
	var in = __Imgui_in;
	rousr_buffer_write_val(in, argument[0], ERousrData.Float);
	_extImguiGML_set_font_global_scale();
	return argument[0];
}

_extImguiGML_get_font_global_scale();
var out = __Imgui_out;
return buffer_read(out, buffer_f32);


#define imguigml_io_font_allow_user_scaling
///@function imguigml_io_font_allow_user_scaling([_boolean])
///@desc Allow user scaling text of individual window with CTRL+Wheel.
///@param {Boolean} [_boolean] sets allow user scaling if passed (=false)
///@param returns { Boolean } current value
if(argument_count > 0){
	var in = __Imgui_in;
	rousr_buffer_write_val(in, argument[0], ERousrData.Bool);
	_extImguiGML_set_font_allow_user_scaling();
	return argument[0];
}

_extImguiGML_get_font_allow_user_scaling();
var out = __Imgui_out;
return (buffer_read(out, buffer_s8) != 0);


#define imguigml_io_display_framebuffer_scaling
///@function imguigml_io_display_framebuffer_scaling([_x=1.0],[_y=1.0])
///@desc For retina display or other situations where window coordinates are different from framebuffer coordinates. User storage only, presently not used by ImGui.
///@param {Float} [_x=1.0] sets x value if passed
///@param {Float} [_y=1.0] sets y value if passed
///@param returns { Array } [x value, y value]
if(argument_count > 0){
	var in = __Imgui_in,
		_x = (argument_count > 0) ? argument[0] : 1.0,
		_y = (argument_count > 1) ? argument[1] : 1.0;
		
	rousr_buffer_write_val(in, _x, ERousrData.Float);
	rousr_buffer_write_val(in, _y, ERousrData.Float);
	_extImguiGML_set_display_framebuffer_scaling();
	return [_x, _y];
}

_extImguiGML_get_display_framebuffer_scaling();
var out = __Imgui_out;
var ret = array_create(2);
ret[@ 0] = buffer_read(out, buffer_f32);
ret[@ 1] = buffer_read(out, buffer_f32);
return ret;

#define imguigml_io_display_visible_min
///@function imguigml_io_display_visible_min([_x=undefined],[_y=undefined)
///@desc If you use DisplaySize as a virtual space larger than your screen, set DisplayVisibleMin/Max to the visible area.
///@param {Float} [_x] sets min size on x axis if passed
///@param {Float} [_y] sets min size on y axis if passed
///@param returns { Array } [x min, y min]
if(argument_count > 0){
	var in = __Imgui_in,
		_x = (argument_count) > 0 ? argument[0] : undefined,
		_y = (argument_count) > 1 ? argument[1] : undefined;
		
	rousr_buffer_write_val(in, _x, ERousrData.Float);
	rousr_buffer_write_val(in, _y, ERousrData.Float);
	_extImguiGML_set_display_visible_min();
	return [_x, _y];
}

_extImguiGML_get_display_visible_min();
var out = __Imgui_out;
var ret = array_create(2);
ret[@ 0] = buffer_read(out, buffer_f32);
ret[@ 1] = buffer_read(out, buffer_f32);
return ret;

#define imguigml_io_display_visible_max
///@function imguigml_io_display_visible_max([_x=undefined],[_y=undefined)
///@desc If the values are the same, we defaults to Min=(0.0f) and Max=DisplaySize
///@param {Float} [_x] sets max size on x axis if passed
///@param {Float} [_y] sets max size on y axis if passed
///@param returns { Array } [x max, y max]
if(argument_count > 0){
	var in = __Imgui_in,
		_x = (argument_count) > 0 ? argument[0] : undefined,
		_y = (argument_count) > 1 ? argument[1] : undefined;
		
	rousr_buffer_write_val(in, _x, ERousrData.Float);
	rousr_buffer_write_val(in, _y, ERousrData.Float);
	_extImguiGML_set_display_visible_max();
	return [_x, _y];
}

_extImguiGML_get_display_visible_max();
var out = __Imgui_out;
var ret = array_create(2);
ret[@ 0] = buffer_read(out, buffer_f32); 
ret[@ 1] = buffer_read(out, buffer_f32);
return ret;

#define imguigml_io_osx_behaviors
///@function imguigml_io_osx_behaviours([_boolean])
///@desc OS X style: Text editing cursor movement using Alt instead of Ctrl, Shortcuts using Cmd/Super instead of Ctrl, Line/Text Start 
/// and End using Cmd+Arrows instead of Home/End, ouble click selects by word instead of selecting whole text, 
/// Multi-selection in lists uses Cmd/Super instead of Ctrl
///@param {Boolean} [_boolean]  boolean (=IsApple)
///@param returns { Boolean } current value 
if(argument_count > 0){
	var in = __Imgui_in;
	rousr_buffer_write_val(in, argument[0] ? 1 : 0, ERousrData.Int8);
	_extImguiGML_set_osx_behaviors();
	return argument[0];
}

_extImguiGML_get_osx_behaviors();
var out = __Imgui_out;
return (buffer_read(out, buffer_s8)!=0);


#define imguigml_io_ini_filename
///@function imguigml_io_ini_filename([_path])
///@desc Path to .ini file. NULL to disable .ini saving.
///@param {String} [_filename]  sets ini filename if passed
///@returns {String} current ini filename
if (argument_count > 0) {
  var in = __Imgui_in;
  rousr_buffer_write_val(in, argument0, ERousrData.String);
  _extImguiGML_set_ini_filename();
  return argument0;
} 

_extImguiGML_get_ini_filename();
var out = __Imgui_out;
return buffer_read(out, buffer_string);

#define imguigml_io_log_filename
///@function imguigml_io_log_filename([_path])
///@desc Path to .log file - default parameter to ImGui::LogToFile when no file is specified. defaults to "imgui_log.txt
///@param {String} [_path]  sets path if passed
///@returns {String} current log filename path
if (argument_count > 0) {
  var in = __Imgui_in;
  rousr_buffer_write_val(in, argument0, ERousrData.String);
  _extImguiGML_set_log_filename();
  return argument0;
} 

_extImguiGML_get_log_filename();
var out = __Imgui_out;
return buffer_read(out, buffer_string); 

#define __imguigml_draw
///@function imguigml_draw()
///@desc draw the imgui
_extImguiGML_wait_for_render();
var vertex_index = 0;
var command_buffer = Render_buffer[0];
var vertex_buffer  = Render_buffer[1];

buffer_seek(command_buffer, buffer_seek_start, 0);
buffer_seek(vertex_buffer,  buffer_seek_start, 0);

shader_set(Imgui_shader);
while (buffer_read(command_buffer, buffer_u8) == 1) { 
  var tex_id     = buffer_read(command_buffer, buffer_u32);
  var elem_count = buffer_read(command_buffer, buffer_u32);
  
  var vbuff = vertex_create_buffer_from_buffer_ext(vertex_buffer, Imgui_vertex_fmt, vertex_index * Imgui_vertex_fmt_size, elem_count);
  vertex_index += elem_count;
  
  var tex = Textures[tex_id];
  tex = tex == undefined ? -1 : tex[EImGuiGML_Texture.TextureID];
  
  var clip_x1 = buffer_read(command_buffer, buffer_f32);
  var clip_y1 = buffer_read(command_buffer, buffer_f32);
  var clip_x2 = buffer_read(command_buffer, buffer_f32);
  var clip_y2 = buffer_read(command_buffer, buffer_f32);
  
  shader_set_uniform_f_array(Uniform_clip_rect, [ clip_x1, clip_y1, clip_x2, clip_y2 ]);
  
  vertex_submit(vbuff, pr_trianglelist, tex);  
  vertex_delete_buffer(vbuff);
}

shader_reset();

#define __imguigml_texture_id
///@function __imguigml_texture_id(_texture_ptr)
///@desc return an index for a texture id so we can render this properly
///@param {Ptr} _texture_ptr
///@returns {Real} _id for texture
var _texture_ptr = argument[0];
with (ImGuiGML) {
  var num_textures = array_length_1d(Textures);
  var i = 0; repeat (num_textures - 1) {
    var tex_data = Textures[i++];
    if (tex_data[0] == _texture_ptr)
      return i;
  }
    
  Textures[@ NextTextureID++] = [ _texture_ptr, undefined, false ];
  return NextTextureID - 1;
}

return undefined;

#define __imguigml_wrapper_buffer
///@function __imguigml_wrapper_buffer()
///@desc prepare the wrapper buffer for next use
///@returns {Real} buffer_index
gml_pragma("forceinline");

with (ImGuiGML) {
  buffer_seek(Wrapper_buffer, buffer_seek_start, 0);
  return Wrapper_buffer;
}

return undefined;

#define __imguigml_handle_text_callback
///@function __imguigml_handle_text_callback(_call_id, _callback)
///@desc handle text input callback functions, the script it supports is:
///      `real _text_input_callback({Array:EImguiGML_TextCallback}_data, [_user_data=_undefined])` - on CallbackCharFilter return 1 to discard. ignored elsewise.
///@param {Real} _call_id    id returned from a text input callback function
///@param {Real} _callback   script_index of callback script to execute
var _call_id = argument0,
    _callback = argument1,
    _user_data = argument2;

while (rousr_callstack_process(_call_id)) {
  if (_callback == noone)
    continue;
      
  var out = rousr_callstack_out();
  var flag      = buffer_read(out, buffer_s32),
      flags     = buffer_read(out, buffer_s32),
      read_only = buffer_read(out, buffer_s8) != 0;

  var callback_data = array_create(EImGui_TextCallbackData.Num);
  callback_data[@ EImGui_TextCallbackData.EventFlag] = flag;      
  callback_data[@ EImGui_TextCallbackData.Flags] = flags;
  callback_data[@ EImGui_TextCallbackData.ReadOnly] = read_only;
  
  var ret = 0;
  switch (flag) {
    case EImGui_InputTextFlags.CallbackAlways:      // Call user function every time. User code may query cursor position, modify text buffer.
    case EImGui_InputTextFlags.CallbackCompletion:  // Call user function on pressing TAB (for completion handling)
    case EImGui_InputTextFlags.CallbackHistory:     // Call user function on pressing Up/Down arrows (for history handling)
      callback_data[@ EImGui_TextCallbackData.Key]            = buffer_read(out, buffer_s32);
      callback_data[@ EImGui_TextCallbackData.Text]           = buffer_read(out, buffer_string);
      callback_data[@ EImGui_TextCallbackData.TextMaxLength]  = buffer_read(out, buffer_s32);
      callback_data[@ EImGui_TextCallbackData.CurPos]         = buffer_read(out, buffer_s32);
      callback_data[@ EImGui_TextCallbackData.SelectionStart] = buffer_read(out, buffer_s32);
      callback_data[@ EImGui_TextCallbackData.SelectionEnd]   = buffer_read(out, buffer_s32);
  
      script_execute(_callback, callback_data, _user_data);
      var in = rousr_callstack_in();
      rousr_buffer_write_val(in, ret, ERousrData.Int32);
      
      rousr_buffer_write_val(in, callback_data[EImGui_TextCallbackData.Text],           ERousrData.String);
      rousr_buffer_write_val(in, callback_data[EImGui_TextCallbackData.CurPos],         ERousrData.Int32);
      rousr_buffer_write_val(in, callback_data[EImGui_TextCallbackData.SelectionStart], ERousrData.Int32);
      rousr_buffer_write_val(in, callback_data[EImGui_TextCallbackData.SelectionEnd],   ERousrData.Int32);

    break;
      
    case EImGui_InputTextFlags.CallbackCharFilter: // Call user function to filter character. Modify data->EventChar to replace/filter input, or return 1 to discard character.
      var wc = buffer_read(out, buffer_u16);
      var char = chr(wc);
      
      var callback_data = array_create(EImGui_TextCallbackData.NumCharFilter);
      callback_data[@ EImGui_TextCallbackData.Char] = char;
      
      ret = script_execute(_callback, callback_data, _user_data);
      ret = clamp(ret, -1, 1);
      
      var out_char = callback_data[EImGui_TextCallbackData.Char];
      if (is_string(out_char))
        out_char = ord(string_char_at(out_char, 0));
      
      var in = rousr_callstack_in();
      rousr_buffer_write_val(in, ret, ERousrData.Int32);
      rousr_buffer_write_val(in, out_char, ERousrData.Uint16);
    break;
      
    default: break;
  }
};  


#define __imguigml_event_create
///@function __imguigml_event_create()
///@desc imguigml create event
gml_pragma("global", "global.__imguigml = noone;");
if (global.__imguigml != noone && instance_exists(global.__imguigml))
  instance_destroy(global.__imguigml);

global.__imguigml = id;

rousr_callstack_init();
_extImguiGML_init(display_get_width(), display_get_height());
__imguigml_init_rendering();
__imguigml_init_font();
__imguigml_init_input();
__imguigml_init_wrapper();

DrawGUI  = true;
NewFrame = false;

#define __imguigml_event_begin_step
///@function __imguigml_event_begin_step
///@desc imguigml begin step event

/////////////
#region Update Input
var mb     = global.__imgui_mouse_buttons; 
var num_mouse_buttons = global.__imgui_num_mouse_buttons;

var imkeys = global.__imgui_keys; 
var num_im_keys = global.__imgui_num_keys;

buffer_seek(Input_buffer, buffer_seek_start, 0);

buffer_write(Input_buffer, buffer_f32, window_mouse_get_x());
buffer_write(Input_buffer, buffer_f32, window_mouse_get_y());

for (var mouse_button_index = 0; mouse_button_index < num_mouse_buttons; ++mouse_button_index) {
  var but = mb[mouse_button_index];
  buffer_write(Input_buffer, buffer_u8, mouse_check_button(but) ? 1 : 0);
}

for (var key_index = 0; key_index < num_im_keys; ++key_index) {
  var key = imkeys[key_index];
  buffer_write(Input_buffer, buffer_u8, keyboard_check(key) ? 1 : 0);
}

var mousewheel = mouse_wheel_up() ? 1 : 0;
mousewheel = mouse_wheel_down() ? -1 : mousewheel;

buffer_write(Input_buffer, buffer_s8, mousewheel);
buffer_write(Input_buffer, buffer_u8, Draw_mouse_cursor ? 1 : 0);

_extImguiGML_update_input(buffer_get_address(Input_buffer));

if (WantTextInput) {
  if (DidWantTextInput && keyboard_string != "")
    _extImguiGML_update_character_input(keyboard_string);
  keyboard_string = "";
}

DidWantTextInput = WantTextInput;

#endregion

/////////////
#region begin the step (with delta time)
_extImguiGML_begin_step(delta_time/1000000);
#endregion


#region update io
_extImguiGML_get_io_outputs();
var outputs = __Imgui_out;
WantCaptureMouse      = rousr_buffer_read_val(outputs);
WantCaptureKeyboard   = rousr_buffer_read_val(outputs);
WantTextInput         = rousr_buffer_read_val(outputs);
WantMoveMouse         = rousr_buffer_read_val(outputs);
Framerate             = rousr_buffer_read_val(outputs); 
MetricsAllocs         = rousr_buffer_read_val(outputs); 
MetricsRenderVertices = rousr_buffer_read_val(outputs);
MetricsRenderIndices  = rousr_buffer_read_val(outputs);
MetricsActiveWindows  = rousr_buffer_read_val(outputs);
MouseDelta = [ ];
MouseDelta[0]         = rousr_buffer_read_val(outputs);
MouseDelta[1]         = rousr_buffer_read_val(outputs);

#endregion

NewFrame = true;

#define __imguigml_event_end_step
///@function __imguigml_end_step
///@desc imguigml end step event
if (!NewFrame)
  return;
  
_extImguiGML_end_step();

//If imgui is not rendering mouse cursor then
//set native gml cursor icon
if(!Draw_mouse_cursor){
	switch(imguigml_get_mouse_cursor()){
		case EImGui_MouseCursor.Arrow:
			window_set_cursor(cr_arrow);
		break;
		case EImGui_MouseCursor.Move:
			window_set_cursor(cr_size_all);
		break;
		case EImGui_MouseCursor.None:
			window_set_cursor(cr_none);
		break;
		case EImGui_MouseCursor.Num:
			window_set_cursor(cr_arrow);
		break;
		case EImGui_MouseCursor.ResizeEW:
			window_set_cursor(cr_size_we);
		break;
		case EImGui_MouseCursor.ResizeNESW:
			window_set_cursor(cr_size_nesw);
		break;
		case EImGui_MouseCursor.ResizeNS:
			window_set_cursor(cr_size_ns);
		break;
		case EImGui_MouseCursor.ResizeNWSE:
			window_set_cursor(cr_size_nwse);
		break;
		case EImGui_MouseCursor.TextInput:
			window_set_cursor(cr_beam);
		break;
	}
}

NewFrame = false;

#define __imguigml_event_clean_up
///@function __imguigml_event_clean_up()
///@desc imguigml clean up event
var num_textures = array_length_1d(Textures);
var i = 1;
repeat(num_textures - 1) {
  var tex = Textures[i++];
  if (tex[EImGuiGML_Texture.DeleteOnCleanUp])
    sprite_delete(tex[EImGuiGML_Texture.SpriteIndex]);
}
global.__imguigml = noone;

buffer_delete(Render_buffer[0]);
buffer_delete(Render_buffer[1]);
buffer_delete(Input_buffer);
buffer_delete(Wrapper_buffer);

vertex_format_delete(Imgui_vertex_fmt);

rousr_callstack_clean_up();
_extImguiGML_shutdown();


#define __imguigml_event_draw
///@function __imguigml_event_draw()
///@desc imguigml draw event
if (DrawGUI)
  return;
  
__imguigml_draw();

#define __imguigml_event_draw_gui
///@function __imguigml_event_draw_gui()
///@desc imguigml draw gui event
if (!DrawGUI)
  return;
  
__imguigml_draw();

#define __imguigml_init_rendering
///@function __imguigml_init_rendering()
///@desc called `with` imguigml - initialize the rendering
gml_pragma("forceinline");

enum EImGuiGML_Texture {
  TextureID = 0,
  SpriteIndex,
  DeleteOnCleanUp,
  
  Num
}

Render_buffer = [
  buffer_create(ImGuiGML_CommandBufferSize, buffer_fixed, 1), 
  buffer_create(ImGuiGML_VertexBufferSize, buffer_fixed, 1) 
];

_extImguiGML_set_render_buffer(
  buffer_get_address(Render_buffer[ImGuiGML_CommandBuffer]), ImGuiGML_CommandBufferSize, 
  buffer_get_address(Render_buffer[ImGuiGML_VertexBuffer]),  ImGuiGML_VertexBufferSize
); 

vertex_format_begin();  
vertex_format_add_position();
vertex_format_add_texcoord();
Imgui_vertex_fmt_size = 4 + 4            // Position
                      + 4 + 4;           // U,V

if (ImGuiGML_UseUByte4) {
  vertex_format_add_custom(vertex_type_ubyte4, vertex_usage_colour);
  Imgui_vertex_fmt_size += 4;            // Color
} else if (ImGuiGML_UseFloat) {
  vertex_format_add_custom(vertex_type_float4, vertex_usage_colour);
  Imgui_vertex_fmt_size += 4 + 4 + 4 + 4;  // Color
}

Imgui_vertex_fmt  = vertex_format_end();
Imgui_shader      = shd_imgui;
Uniform_clip_rect = shader_get_uniform(Imgui_shader, "Clip_rect");

Textures = array_create(1, [ undefined, noone, false ]);
NextTextureID = 1;

#define __imguigml_init_font
///@function __imguigml_init_font()
///@desc called `with` imguigml - load the font texture
gml_pragma("forceinline");
var arg_buffer = buffer_create(1024, buffer_fixed, 1);
_extImguiGML_create_font_texture(buffer_get_address(arg_buffer));

var font_width  = buffer_read(arg_buffer, buffer_u32);
var font_height = buffer_read(arg_buffer, buffer_u32);
var font_buffer = buffer_create(font_width * font_height * 4, buffer_fixed, 4);

_extImguiGML_get_font_texture(buffer_get_address(font_buffer));

var font_surface = surface_create(font_width, font_height);
buffer_set_surface(font_buffer, font_surface, 0, 0, 0);

var font_sprite = sprite_create_from_surface(font_surface, 0, 0, font_width, font_height, false, false, 0, 0);
Textures[@ NextTextureID++] = [ sprite_get_texture(font_sprite, 0), font_sprite, true ];

buffer_delete(arg_buffer);
buffer_delete(font_buffer);
surface_free(font_surface);

#define __imguigml_init_input
///@function __imguigml_init_input()
///@desc called `with` imguigml - initilaize the input stuff
gml_pragma("forceinline");
enum __ImGuiKey_ {
  Tab = 0,    // for tabbing through fields
  LeftArrow,  // for text edit
  RightArrow, // for text edit
  UpArrow,    // for text edit
  DownArrow,  // for text edit
  PageUp,     
  PageDown,   
  Home,       // for text edit
  End,        // for text edit
  Delete,     // for text edit
  Backspace,  // for text edit
  Enter,      // for text edit
  Escape,     // for text edit
  A,          // for text edit CTRL+A: select all
  C,          // for text edit CTRL+C: copy
  V,          // for text edit CTRL+V: paste
  X,          // for text edit CTRL+X: cut
  Y,          // for text edit CTRL+Y: redo
  Z,          // for text edit CTRL+Z: undo
  
  ImGuiCount,
  
  // Additional key checks (modifiers)
  Ctrl = __ImGuiKey_.ImGuiCount,
  Alt,
  Shift,
  //Super,
  
  Num
};

global.__imgui_num_mouse_buttons = 3;
global.__imgui_mouse_buttons = [ mb_left, mb_right, mb_middle ]; 

global.__imgui_num_keys = __ImGuiKey_.Num;
global.__imgui_keys = [ 
  vk_tab,
  vk_left,
  vk_right,
  vk_up,
  vk_down,
  vk_pageup,
  vk_pagedown,
  vk_home,
  vk_end,
  vk_delete,  
  vk_backspace,
  vk_enter,
  vk_escape,
  ord("A"),
  ord("C"),
  ord("V"),
  ord("X"),
  ord("Y"),
  ord("Z"),
  
  vk_control,
  vk_alt,
  vk_shift,
   // vk_super,
];

Input_buffer = buffer_create(ImGuiGML_InputBufferSize, buffer_fixed, buffer_u8);
Draw_mouse_cursor   = false;

DidWantTextInput    = false;
WantCaptureMouse    = false;  // When io.WantCaptureMouse is true, do not dispatch mouse input data to your main application. This is set by ImGui when it wants to use your mouse (e.g. unclicked mouse is hovering a window, or a widget is active). 
WantCaptureKeyboard = false;  // When io.WantCaptureKeyboard is true, do not dispatch keyboard input data to your main application. This is set by ImGui when it wants to use your keyboard inputs.
WantTextInput       = false;  // Mobile/console: when io.WantTextInput is true, you may display an on-screen keyboard. This is set by ImGui when it wants textual keyboard input to happen (e.g. when a InputText widget is active).
WantMoveMouse       = false;  // [BETA-NAV] MousePos has been altered, back-end should reposition mouse on next frame. Set only when 'NavMovesMouse=true'.
Framerate               = 0;  // Application framerate estimation, in frame per second. Solely for convenience. Rolling average estimation based on IO.DeltaTime over 120 frames
MetricsAllocs           = 0;  // Number of active memory allocations
MetricsRenderVertices   = 0;  // Vertices output during last call to Render()
MetricsRenderIndices    = 0;  // Indices output during last call to Render() = number of triangles * 3
MetricsActiveWindows    = 0;  // Number of visible root windows (exclude child windows)
MouseDelta       = [ 0, 0 ];  // Mouse delta. Note that this is zero if either current or previous position are invalid (undefined, undefined), so a disappearing/reappearing mouse won't have a huge delta.


#define __imguigml_init_wrapper
///@function __imguigml_init_wrapper()
///@desc called `with` imguigml - initialize wrapper buffer
gml_pragma("forceinline");
Wrapper_buffer = buffer_create(ImGuiGML_WrapperBufferSize, buffer_fixed, 1);
_extImguiGML_set_wrapper_buffer(buffer_get_address(Wrapper_buffer), ImGuiGML_WrapperBufferSize);

#define rousr_array
///@func rousr_array(_rousr_array, _index, [_val]) 
///@desc return an index, or set an index in a `_rousr_array`
///@param {Array} _rousr_array   rousr_array to read / write
///@param {Real}        _index   index to read or write to
///@param {*}           [_val]   if passed, value to set element to, same as insert.
#region Args

var _rousr_array = argument[0],
          _index = argument[1];
          
#endregion
#region definitions and enums

enum ERousrArray {
  Count = 0,
  Array,
  
  Last = ERousrArray.Array,
  
  // Synonyms
  Size = ERousrArray.Count, 
  Data = ERousrArray.Array,
  Num  = ERousrArray.Count  // special-case where I abuse `Num` 
};

#endregion
#region Set

if (argument_count > 2) {
  var _set = argument[2];
  
  var _size = rousr_array_size(_rousr_array);
  if (_index < _size ) {
    var _data = rousr_array_data(_rousr_array);
    _data[@ _index] = _set;
  } else
    rousr_array_insert(_rousr_array, _index, _set);
  return;
} 

#endregion
#region Get

var size = rousr_array_size(_rousr_array);
if (_index < size) {
  var data = rousr_array_data(_rousr_array);
  return data[_index];
}

#endregion

#define rousr_array_create
///@func rousr_array_create([_array], [_arraySize])
///@desc create a `rousr style` array, with the size as the first element, and the actual array as second
///@param {Array}    [_array]   array to wrap
///@param {Real} [_arraySize]   if `_array`s size is cached, pass it.
var _array     = argument_count > 0 ? argument[0] : [ ];
var _arraySize = argument_count > 1 ? argument[1] : array_length_1d(_array);
return [ 
  _arraySize, // ERousrArray.Count
  _array      // ERousrArray.Array
];

#define rousr_array_data
///@func rousr_array_data(_rousr_array)
///@desc return the data of the `rousr_array`
///@param _rousr_array - `rousr_array` to get the data from
///@returns {Array} data in the `rousr_array`
gml_pragma("forceinline");
var _rousr_array = argument0;
return _rousr_array[ERousrArray.Data]; 

#define rousr_array_destroy
///@func rousr_array_destroy(_array)
///@desc destroy a `rousr style` array - currently does nothing, but future proofing by including.
///@param {Array} _array  - array to destroy
gml_pragma("forceinline");
var _array = argument0;
_array[@ ERousrArray.Size]  = 0;
_array[@ ERousrArray.Array] = [ ];

#define rousr_array_find
///@func rousr_array_find(_rousr_array, _val, [_startIndex=0])
///@desc returns the first occurence of _val beginning at _startIndex
///@param {Array}   _rousr_array - rousr_array to search
///@param {*}               _val - value to search for
///@param {Real} [_startIndex=0] - index to start searching from
///@returns {Real} index or -1 if not found
gml_pragma("forceinline");

var _rousr_array =  argument[0],
            _val =  argument[1],
     _startIndex = (argument_count > 2 ? argument[2] : 0);

var _array = _rousr_array[ERousrArray.Array],
     _size = _rousr_array[ERousrArray.Size];

for (var i = _startIndex; i < _size; ++i)
  if (_array[i] == _val) return i;

return -1;

#define rousr_array_insert
///@func rousr_array_insert(_rousr_array, _index, _val)
///@desc insert a value into a rousr array
///@param {Array} _rousr_array  rousr array to insert value into
///@param {Real}        _index  index to insert value at
///@param {*}             _val  value to insert
///@returns {Boolean} true on success
gml_pragma("forceinline");

var _rousr_array = argument[0],
          _index = argument[1],
            _val = argument[2];

var _array = _rousr_array[ERousrArray.Array],
     _size = _rousr_array[ERousrArray.Size];

if (_index == 0) {
  return rousr_array_push_front(_rousr_array, _val) >= 0;
} else if (_index >= _size) {
  _array[@ _index] = _val;
  _rousr_array[@ ERousrArray.Size] = _index + 1;
  return true;
} else {
  var tmpArray = array_create(_size + 1);
  array_copy(tmpArray, 0, _array, 0, _index);
  array_copy(tmpArray, _index + 1, _array, _index, _size - _index)
  
  tmpArray[@ _index] = _val;
  
  _rousr_array[@ ERousrArray.Array] = tmpArray;
  _rousr_array[@ ERousrArray.Size]  = _size + 1;
  
  return true;
}

return false;


#define rousr_array_pop_back
///@func rousr_array_pop_back(_rousr_array)
///@desc pop the back of a rousr array and return it
///@param {Array} _rousr_array - rousr array to pop last value of
///@returns {*} back, or undefined on failure
gml_pragma("forceinline");

var _rousr_array = argument[0];
var _array = _rousr_array[ERousrArray.Array],
     _size = _rousr_array[ERousrArray.Size];

if (_size == 0)
  return undefined;

return rousr_array_remove(_array, _size - 1);

#define rousr_array_pop_front
///@func rousr_array_pop_front(_rousr_array)
///@desc pop the front of an array and return it
///@param {Array} _rousr_array - rousr array to pop last value of
///@returns {*} front or undefined
gml_pragma("forceinline");

var _rousr_array = argument[0];
var _array = _rousr_array[ERousrArray.Array],
     _size = _rousr_array[ERousrArray.Size];

if (_size == 0)
  return undefined;
  
return rousr_array_remove(_array, 0);

#define rousr_array_push_back
///@func rousr_array_push_back(_rousr_array, _val)
///@desc push a value on the end of a rousr_array
///@param {Array} _rousr_array - _rousr_array to push data to
///@param {*}       _val       - value to push onto the array
///@returns {Real} index pushed or -1 on error
gml_pragma("forceinline");

var _rousr_array = argument[0],
            _val = argument[1]; 
var       _array = _rousr_array[ERousrArray.Array],
           _size = _rousr_array[ERousrArray.Size];

var  index = _size;

_array[@ index]                  = _val;
_rousr_array[@ ERousrArray.Size] = index + 1;

return index;


#define rousr_array_push_front
///@func rousr_array_push_front(_rousr_array, _val)
///@desc push a value on the front of a rousr array
///@param {Array} _array      - rousr_array to push data to
///@param {*}       _val      - value to push onto the array
///@returns {Real} index pushed or -1 on error
gml_pragma("forceinline");

var _rousr_array = argument[0],
            _val = argument[1];
var _array = _rousr_array[ERousrArray.Array],
     _size = _rousr_array[ERousrArray.Size];

var index = 0;
var tmpArray = array_create(_size + 1);
tmpArray[@ index] = _val;
array_copy(tmpArray, 1, _array, 0, _size);

_rousr_array[@ ERousrArray.Array] = tmpArray;
_rousr_array[@ ERousrArray.Size] = _size + 1;

return index;

#define rousr_array_push_unique
///@func rousr_array_push_unique(_rousr_array, _val, [_returnIndexOnExists=false])
///@desc push a value on the end of a rousr array, but only if value isn't in the array already
///@param {Array}                   _rousr_array - rousr_array to push data to
///@param {*}                               _val - value to push onto the array
///@param {Boolean} [_returnIndexOnExists=false] - if true returns index if it already exists, otherwise returns undefined (to signal failure)
///@returns {Real} index pushed or -1 if it's not unique
gml_pragma("forceinline");

var _rousr_array = argument[0],
            _val = argument[1];
var _array = _rousr_array[ERousrArray.Array],
     _size = _rousr_array[ERousrArray.Size];
var _returnIndexOnExists = argument_count > 3 ? argument[3] : false;

var index = rousr_array_find(_array, _val, 0);
if (index < 0)
  return (_returnIndexOnExists ? index : -1);

index = _size;    

_array[@ index]                  = _val;
_rousr_array[@ ERousrArray.Size] = _size + 1;

return index;


#define rousr_array_remove
///@func rousr_array_remove(_rousr_array, _index)
///@desc generate a new array with _index removed from the `_rousr_array`
///@param {Array} _rousr_array - rousr_array to remove element at `_index` from
///@param {Real}        _index - index to remove from _array
///@returns {*} element at removed index, or undefined
gml_pragma("forceinline");
var _rousr_array = argument0,
          _index = argument1;
var  _size = _rousr_array[ERousrArray.Size],
    _array = _rousr_array[ERousrArray.Array];

if (_size == 0 || _index >= _size)
  return undefined;
  
var newSize = _size - 1;
var newArray = array_create(newSize);
var dstIndex = 0,
    srcIndex = 0;

if (_index != 0) {
  var cpySize = (_index - srcIndex); 
  array_copy(newArray, dstIndex, _array, srcIndex, cpySize);
  dstIndex += cpySize;
} 

srcIndex = _index + 1;
if (srcIndex < _size)
  array_copy(newArray, dstIndex, _array, srcIndex, _size - srcIndex);

_rousr_array[@ ERousrArray.Array] = newArray;
_rousr_array[@ ERousrArray.Size]  = newSize;

return _array[_index];

#define rousr_array_remove_multi
///@func rousr_array_remove_multi(_array, _index_array, [_index_array_size])
///@desc generate a new array with _index removed from the `_rousr_array`
///@param {Array}       _rousr_array  - rousr array to remove element at `_index` from
///@param {Real}        _index_array  - index to remove from _array (note: normal array)
///@param {Real}  [_index_array_size] - size of `_index_array` if you've already cached it.
///@returns {Array} removed values or undefined if error
gml_pragma("forceinline");
var _rousr_array = argument[0],
    _indices     = argument[1];
var _indexCount  = argument_count > 3 ? argument[3] : array_length_1d(_indices);
var  _size = _rousr_array[ERousrArray.Size],
    _array = _rousr_array[ERousrArray.Array];


if (_indexCount == 0 || _size == 0)
  return undefined;
  
var newSize = _size - _indexCount;
var removed = array_create(_indexCount);
var newArray = array_create(newSize);
var dstIndex = 0,
    srcIndex = 0;

for (var i = 0; i < _indexCount; ++i) {
  var index = _indices[i];
  removed[i] = _array[index];
  
  if (index != 0) {
    var cpySize = (index - srcIndex); 
    array_copy(newArray, dstIndex, _array, srcIndex, cpySize);
    dstIndex += cpySize;
  } 

  srcIndex = index + 1;
}

if (srcIndex < _size)
  array_copy(newArray, dstIndex, _array, srcIndex, _size - srcIndex);

_rousr_array[@ ERousrArray.Size] = newSize;
_rousr_array[@ ERousrArray.Data] = newArray;

return removed;

#define rousr_array_size
///@func rousr_array_size(_rousr_array, [_new_size])
///@desc return the size of the `rousr_array`
///@param _rousr_array       - `rousr_array` to get the size of
///@param {Real} [_new_size] - if passed, sets the size of the array to this new size
///@returns {Real} size of `rousr_array` (before it was set new, if `_new_size` is passed)
gml_pragma("forceinline");
var _rousr_array = argument[0];
var size = _rousr_array[ERousrArray.Size];

if (argument_count > 1) _rousr_array[@ ERousrArray.Size] = argument[1];

return size;

#define rousr_stack_array_create
///@func rousr_stack_array_create()
///@desc create a `rousr_stack_array` - a stack purely made of arrays
///@returns {Array} rousr_stack_array
///@see ERousrStackArray

enum ERousrStackArray {
  Stack,
  Top,
  
  Num,
};

var rousr_stack_array = array_create(ERousrStackArray.Num);
rousr_stack_array[@ ERousrStackArray.Stack] = [ ];
rousr_stack_array[@ ERousrStackArray.Top]   = -1;

return rousr_stack_array;

#define rousr_stack_array_destroy
///@func rousr_stack_array_destroy(_rousr_stack_array)
///@desc destroy a `rousr_stack_array` - since they're made up of arrays, this is unnecessary to call, but provided future API use or re-using stack arrays.
///@param {Array} _rousr_stack_array - `rousr_stack_array` to destroy
///@see ERousrStackArray
gml_pragma("forceinline");
var _rousr_stack_array = argument0;

_rousr_stack_array[@ ERousrStackArray.Stack] = [ ];
_rousr_stack_array[@ ERousrStackArray.Top]   = -1;

#define rousr_stack_array_empty
///@func rousr_stack_array_empty(_rousr_stack_array)
///@desc check if a stack is empty
///@param {Array} _rousr_stack_array - `rousr_stack_array` to check
///@returns {Boolean} true if `_rousr_stack_array` is empty
gml_pragma("forceinline");
var top = rousr_stack_array_top(argument0);
return top < 0;

#define rousr_stack_array_pop
///@func rousr_stack_array_pop(_rousr_stack_array)
///@desc pop the last `val`  from a `_rousr_stack_array`
///@param {Array} _rousr_stack_array - `rousr_stack_array` array object to pop
///@returns {*} the end of the stack, or undefined if empty
gml_pragma("forceinline");
var _rousr_stack_array = argument[0];

var top   = _rousr_stack_array[ERousrStackArray.Top];
var stack = _rousr_stack_array[ERousrStackArray.Stack];

if (top < 0) 
  return undefined;
  
var _val = stack[top--];
_rousr_stack_array[@ ERousrStackArray.Top] = top;

//todo: garbage collection pass
// flush the array if we've cleaned the stack out
//if (top < 0) _rousr_stack_array[@ ERousrStackArray.Stack] = [ ];

return _val;

#define rousr_stack_array_push
///@func rousr_stack_array_push(_rousr_stack_array, _val)
///@desc push a `_val` onto the stack of a `_rousr_stack_array`
///@param {Array} _rousr_stack_array - `rousr_stack_array` to push `_val` on to
///@param {*} _val                   - value to push on stack
///@returns {Real} new top index
var _rousr_stack_array = argument[0],
                  _val = argument[1];

var top   = _rousr_stack_array[ERousrStackArray.Top];
var stack = _rousr_stack_array[ERousrStackArray.Stack];

top++;
stack[@ top] = _val;
_rousr_stack_array[@ ERousrStackArray.Top] = top;

return top;

#define rousr_stack_array_top
///@func rousr_stack_array_top(_rousr_stack_array)
///@desc return the top index of a `rousr_stack_array`
///@param {Array} _rousr_stack_array - `rousr_stack_array` to get top index of
///@returns {Real} index of top, or -1 if empty
gml_pragma("forceinline");

var _rousr_stack_array = argument0;
var top = _rousr_stack_array[ERousrStackArray.Top];

return top;

#define rousr_buffer_defines
///@func rousr_buffer_definitions()
///@desc enums / macros for rousr buffer functions (no need to call)

// The ordering of this is consistent with rousr based DLLs, 
// so DO NOT CHANGE.
enum ERousrData {
	Byte = 0,
	Bool,

	Int8,
	Int16,
	Int32,
	Int64,

	Uint8,
	Uint16,
	Uint32,
	Uint64,
		
	Float,
	Double,
	String,

	Num,
  Invalid = ERousrData.Num
}; 
  

#define rousr_buffer_rousr_type_to_buffer_type
///@func rousr_buffer_rousr_type_to_buffer_type(_type)
///@desc return a buffer type from a luarousr data type
///@param {Real} _type - The ERousrData to get buffer_xx of
///@returns {Real} buffer_xx to use for this type when writing to a buffer
var _type = argument0;
var bdt = buffer_f64;
switch (_type) {
  case ERousrData.Bool:   bdt = buffer_s8; break;
  case ERousrData.Byte:   bdt = buffer_s8; break;
                                   
  case ERousrData.Int8:   bdt = buffer_s8; break;
  case ERousrData.Int16:  bdt = buffer_s16; break;
  case ERousrData.Int32:  bdt = buffer_s32; break;
  //case ERousrData.Int64:  bdt = buffer_s64; break; // Unsupported
                                   
  case ERousrData.Uint8:  bdt = buffer_u8; break;
  case ERousrData.Uint16: bdt = buffer_u16; break;
  case ERousrData.Uint32: bdt = buffer_u32; break;
  case ERousrData.Uint64: bdt = buffer_u64; break;
       
  //case __ELuaRousrDataTypeFloat16: bdt = buffer_f16; break; // Also unsupported (though buffer_f16 exists)
  case ERousrData.Float:  bdt = buffer_f32; break;
  case ERousrData.Double: bdt = buffer_f64; break;
  
  case ERousrData.String: bdt = buffer_string; break;

  default: bdt = undefined;
}

return bdt;

#define rousr_buffer_read_val
///@func rousr_buffer_read_val(_buffer)
///@desc Reads a value from a packed buffer, first reading data type to expect.
///@param {Real} _buffer - id of buffer we're reading the _next_ value from
///@returns {Real|String} return of the buffer read
var _buffer = argument0;

var dataType = buffer_read(_buffer, buffer_s8);
var bdt = rousr_buffer_rousr_type_to_buffer_type(dataType);
if (bdt == undefined)
  return undefined;
  
return buffer_read(_buffer, bdt);

#define rousr_buffer_write_val
///@func rousr_buffer_write_val(_buffer, _val, [_type=ERousrData.Invald])
///@desc writes a value to the buffer, but first writes the type
///@param {Real}                               _buffer - buffer id to write to
///@param {Real|String}                        _val    - val to write to the buffer
///@param {Real|String} [type=ERousrData.Invalid] - the forced type to use, can be string, or ERousrData
///@returns {Boolean} true on success
var _buffer = argument[0];
var _val    = argument[1];
var _type   = argument_count > 2 ? argument[2] : ERousrData.Invalid;

if (_type == undefined || _type == ERousrData.Invalid) {
  if (is_real(_val))        _type = ERousrData.Double;
  else if (is_string(_val)) _type = ERousrData.String;
  else if (is_bool(_val))   _type = ERousrData.Bool;
  else if (is_int32(_val) || is_int64(_val))  _type = ERousrData.Int32;
//else if (is_int64(_val))  _type = ERousrData.Int64; // int64 is unsupported
  else return false; // invalid type
} else if (!is_real(_val) && !is_bool(_val) && !is_string(_val) && !is_int32(_val) && !is_int64(_val)) {
  return false; // invalid type
}

if (_type != ERousrData.String && is_string(_val)) _type = ERousrData.String;
if (_type == ERousrData.Bool) _val = _val ? 1 : 0;

var bdt = rousr_buffer_rousr_type_to_buffer_type(_type);
if (bdt == undefined) 
  return false;

buffer_write(_buffer, buffer_s8, _type);
buffer_write(_buffer, bdt, _val);

// cap with a -1
var bend = buffer_tell(_buffer);
buffer_write(_buffer, buffer_s8, -1);
buffer_seek(_buffer, buffer_seek_start, bend);

return true;

#define rousr_callstack_defines
///@function rousr_callstack_defines()
///@desc (do not call) rousr callstack definitions and enums
enum ERousrCallStatus {
  Invalid = -2,
  Error   = -1,
   
  Done = 0,
  Init,
  Ready,
  Working,

  Num
};


enum ERousrCall {
  Id = 0,
  Buffer,
  BufferSize,
  BufferIndex,
  
  Num,
}

enum ERousrCallstack {
  Calls = 0,
  Free,  
  Buffers,
  QueueCleanUp,
  LastId,
  
  Num,
};

#define rousr_callstack_init
///@function _rousr_callstack_init()
///@desc Initial rousr_callstack data
global.__rousr_callstack = [
  rousr_array_create(),
  rousr_stack_array_create(),
  rousr_array_create(),
  false,
  undefined
];

_extRousrDLL_callstack_init();    

#define rousr_callstack_clean_up
///@function rousr_callstack_cleanup()
///@desc delete all the buffers in the rousr callstack system - call before you 'reset' anything using the callstacks
var callstacks_data = global.__rousr_callstack;
var calls   = callstacks_data[ERousrCallstack.Calls];
var buffers = callstacks_data[ERousrCallstack.Buffers];

// shouldn't be able to happen
if (rousr_array_size(calls) != 0) {
  show_debug_message("Warning: Queueing rousr_callstack clean up - calls are still active");
  callstacks_data[@ ERousrCallstack.QueueCleanUp] = true;
  return;
}

var num_buffers = rousr_array_size(buffers);
for (var i = 0; i < num_buffers; ++i) {
  var buffer_data = rousr_array(buffers, i);
  buffer_delete(buffer_data[0]);
}

global.__rousr_callstack = undefined;
_extRousrDLL_callstack_shutdown();

#define rousr_callstack_process
///@function rousr_callstack_process(_call_id)
///@desc allow passing back and forth between DLL and GML
///@param {Real} _call_id
///@returns {Boolean} returns false if there's nothing left to process for `_call_id`, if true, see `rousr_callstack_buffer` for extracting data from DLL
var _call_id = argument0;
if (_call_id >= 0) {
  var callstack_data = global.__rousr_callstack;
  var _call = _rousr_callstack_call(_call_id);
  
  var ret = _extRousrDLL_callstack_process(_call_id, buffer_get_address(_call[ERousrCall.Buffer]), _call[ERousrCall.BufferSize]);
  callstack_data[@ ERousrCallstack.LastId] = _call_id;
  
  switch (ret) {
    case ERousrCallStatus.Init: 
      return rousr_callstack_process(_call_id);
    
    case ERousrCallStatus.Invalid:
      show_debug_message("Warning: DLL unable to find call with id: " + string(_call_id)); 
    case ERousrCallStatus.Error: // intenional fall-through
    case ERousrCallStatus.Done:  // intenional fall-through
      var calls = callstack_data[ERousrCallstack.Calls];
      rousr_array_remove(calls, rousr_array_find(calls, _call));
      
      // return the buffer
      var free = callstack_data[ERousrCallstack.Free];
      rousr_stack_array_push(free, _call[ERousrCall.BufferIndex]);
      
      _call[@ ERousrCall.Buffer]      = undefined; 
      _call[@ ERousrCall.BufferSize]  = 0;
      _call[@ ERousrCall.BufferIndex] = undefined;
      
      if (callstack_data[ERousrCallstack.QueueCleanUp]) { 
        callstack_data[@ ERousrCallstack.QueueCleanUp] = false;
        rousr_callstack_clean_up();
      }      
      return false;
    
    default: 
    return true;
  }
}

return false;

#define rousr_callstack_out
///@function rousr_callstack_out([_call_id])
///@desc read data OUT of the DLL - get the output buffer for the `_call_id` 
///@param {Real} [_call_id=last id]   if not passed - uses the last call_id passed to `rousr_callstack_process` right before returning
///@return {Real} buffer_id seek'd to start - this is a rousr_buffer and can be used to read parameters in the order expected from the DLL
var _call = _rousr_callstack_call(argument_count > 0 ? argument[0] : global.__rousr_callstack[ERousrCallstack.LastId]);
var call_buffer = _call[ERousrCall.Buffer];
buffer_seek(call_buffer, buffer_seek_start, 0);
return call_buffer;

#define rousr_callstack_in
///@function rousr_callstack_in([_call_id])
///@desc write data IN to the DLL - get the input buffer for the `_call_id`
///      **NOTE:** Don't call this until after you're finished with `out` - they're the same buffer.
///@param {Real} [_call_id=last id]      if not passed - uses the last call_id passed to `rousr_callstack_process` right before returning
///@param {Boolean} [_seek_start=true]   by default, seek to the start
///@return {Real} rousr_buffer (at start) and should be written to using `rousr_buffer_write_val` 
var _call_id = argument_count > 0 && argument[0] != undefined && argument[0] != noone ? argument[0] : global.__rousr_callstack[ERousrCallstack.LastId];
if (_call_id == undefined) 
  return undefined;

var _call = _rousr_callstack_call(_call_id)
var call_buffer = _call[ERousrCall.Buffer];
if (argument_count < 2 || argument[1]) buffer_seek(call_buffer, buffer_seek_start, 0);
return call_buffer;

#define _rousr_callstack_call
///@function _rousr_callstack_call(_call_id)
///@desc return a call struct for a call id, if the id doesn't currently exist, assign it a buffer and return
///@param {Real} _call_id
///@returns {Array:ERousrCall}
var _call_id = argument0;

var callstacks_data = global.__rousr_callstack;
var calls = callstacks_data[ERousrCallstack.Calls];
var last = rousr_array_size(calls) - 1;
for (var i = last; i >= 0; --i) {
  var call = rousr_array(calls, i);
  if (call[ERousrCall.Id] == _call_id)
    return call;
}

var call = array_create(ERousrCall.Num);
call[@ ERousrCall.Id] = _call_id;

var free       = callstacks_data[ERousrCallstack.Free];
var buff_array = callstacks_data[ERousrCallstack.Buffers];
  
var buff_index = rousr_stack_array_pop(free);
if (buff_index == undefined) {
  var buffer = buffer_create(RousrCallBufferSize, buffer_fixed, 1);
  rousr_array_push_back(buff_array, [ buffer, RousrCallBufferSize ]);
  buff_index = rousr_array_size(buff_array) - 1;
}

var buff_data = rousr_array(buff_array, buff_index);
call[@ ERousrCall.Buffer]      = buff_data[0];
call[@ ERousrCall.BufferSize]  = buff_data[1];
call[@ ERousrCall.BufferIndex] = buff_index;

rousr_array_push_back(calls, call);
return call;


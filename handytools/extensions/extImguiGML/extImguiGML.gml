#define imguigml_activate
///@function imguigml_activate()
///@desc helper function to simply activate imguigml again
with (ImGuiGML) {
  return;
}

if (ImGuiGML != noone) 
  instance_activate_object(ImGuiGML);

#define imguigml_deactivate
///@function imguigml_deactivate()
///@desc helper function to simply deactivate imguigml again
with (ImGuiGML) {
  if (imguigml_ready())
    __imguigml_event_end_step();
    
  instance_deactivate_object(id);
}

global.__imguigml_payloads = [ 
	[ ],
	[ ],	
	0,	
];

#define imguigml_ready
///@function imguigml_ready()
///@desc returns true if imguigml is ready for commands to be called
///@returns {Boolean}
with (ImGuiGML)
  return NewFrame;

return false;

#define imguigml_color_convert_gml_to_u32
///@function imguigml_color_convert_gml_to_u32(_color, [_alpha=1.0])
///@desc get an ImGui color from a gml color
///@param {Real} _color
///@param {Real} [_alpha=1.0]   alpha value from 0 - 1
///@returns {Real} ImGui U32 color
var _col = argument[0],
    _alpha = argument_count > 1 ? argument[1] : 1;

var r = (_col >>  0) & $FF;
var g = (_col >>  8) & $FF;
var b = (_col >> 16) & $FF;
var a = round(_alpha * 255) & $FF; // normalize it

return r + (g << 8) + (b << 16) + (a << 24);


#define imguigml_color_convert_gml_to_float4
///@function imguigml_color_convert_gml_to_float4(_color, [_alpha=1.0]
///@desc get an ImGui color4 from a gml color 
///@param {Real} _color
///@param {Real} [_alpha=1.0]   alpha value from 0 - 1
///@returns {Array} [_r,_g,_b,_a]
var _color = argument[0],
	_alpha = (argument_count > 1) ? argument[1] : 1,
	_u32 = imguigml_color_convert_gml_to_u32(_color, _alpha);
	
return imguigml_color_convert_u32_to_float4(_u32);

#define imguigml_color_convert_float4_to_gml
///@function imguigml_color_convert_float4_to_gml(_r_or_array4, [_g=undefined], [_b=undefined], [_a=undefined])
///@desc get an gml color from a ImGui color4
///@param {Real} _r_or_array4
///@param {Real} [_g=undefined]
///@param {Real} [_b=undefined]
///@param {Real} [_a=undefined]
///@returns {Array} [gml_colour,_alpha]
var _argi = 0, _r, _g, _b, _a;

if(argument_count > 1){
	_r = argument[_argi++];
	_g = argument[_argi++];
	_b = argument[_argi++];
	_a = argument[_argi++]; 
}else{
	var _array = argument[0];
	_r = _array[_argi++];
	_g = _array[_argi++];
	_b = _array[_argi++];
	_a = _array[_argi++];	
}

return imguigml_color_convert_u32_to_gml(imguigml_color_convert_float4_to_u32(_r, _g, _b, _a));


#define imguigml_color_convert_u32_to_gml
///@function imguigml_color_convert_gml_to_u32(_color)
///@desc get an ImGui color from a gml color
///@param {Real} _color   u32 color from imgui
///@returns {Array:[ _gml_color, _alpha]}
gml_pragma("forceinline");
var _col = argument[0];
var _r = (_col >>  0) & $FF,
    _g = (_col >>  8) & $FF,
    _b = (_col >> 16) & $FF,
    _a = (_col >> 24) & $FF;
return [ make_color_rgb(_r, _g, _b), _a / 255 ];

#define imguigml_toggle_cursor
///@function imguigml_toggle_cursor([_force])
///@desc Toggle whether or not ImGui will touch the cursor or not
///@param {Boolean} [_force]   if passed, will set the cursor visibility accordingly
var _forced = argument_count > 1 ? argument[0] : undefined;

with (ImGuiGML) {
  if (_forced == undefined)
    _forced = !Should_update_cursor;
  
  Should_update_cursor = _forced;
}

#define imguigml_enable_depth
///@function imguigml_enable_depth([_enabled])
///@desc if enabled, setting the `depth` of the `imgui` instance will change the `z-value` imgui renders, otherwise it's at z=1.0
///@param {Boolean} [_enabled]   enable depth - if not passed, returns value currently set
///@returns {Boolean} _enabled
var _enabled = argument_count > 0 ? argument[0] : undefined;
with (ImGuiGML) {
	if (_enabled == undefined)
		_enabled = Use_depth;
	else
		Use_depth = _enabled;
	
	Imgui_shader = Use_depth ? _EImGuiShader.Depth : _EImGuiShader.Normal;
}

return _enabled;

#define imguigml_set_display_mode
///@function imguigml_set_display_mode(_display_mode, [_display_view=0])
///@desc set the imguigml display mode - this affects how the window is resized / handled.
///      currently there's the 3 display modes: 
///      *  GUIAspect     - ImGuiGML Draws on the GUI layer, but corrects for aspect ratio according to the viewport of view passed. **DEFAULT**
///      *  View          - ImGuiGML will Draw in a normal Draw call **NOT** Draw GUI, the mouse will scale to the view given. **Use if you want to Draw ImGuiGML during the Draw event (application surface).**
///      **NOTE: This should be set before or after `Begin Step` and `Draw` of the `imgui` object, 
///      it affects both mouse (Begin Step) and rendering (Draw)**
///      _If you're using `EImGui_DisplayMode.View` you may want to experiment with [imguigml_set_display_scale](#imguigml_set_display_scale)_
///@param {Real:EImGui_DisplayMode} _display_mode   display mode to set 
///@param {Real} [_display_view=0]                  which view imgui respects viewport aspect ratio - defaults to view 0.
var _display_mode = argument[0],
    _display_view = argument_count > 1 ? argument[1] : 0;
		
with (ImGuiGML) {
	Display_mode = _display_mode;
	Display_view = _display_view;
}

#define imguigml_get_display_mode
///@function imguigml_get_display_mode()
///@desc returns the current set display mode
///@returns {Real:EImGui_DisplayMode} ImGuIGML's current `Display_mode`
with (ImGuiGML)
	return Display_mode;

#define imguigml_get_display_view
///@function imguigml_get_display_view()
///@desc returns the current set display view - the view who's viewport we respect the aspect ratio of with using `EImGui_DisplayMode.GUIWindowSize` or `EImGui_DisplayMode.GUIAspect`
///@returns {Real:EImGui_DisplayMode} ImGuIGML's current `Display_mode`
with (ImGuiGML)
	return Display_view;

#define imguigml_set_display_scale
///@function imguigml_set_display_scale([_x], [_y])
///@desc set the imguigml display scaling - it will scale the mouse and the vertex buffer ImGui passes ImGuiGML by this much.
///      if you pass no arguments, Scale will no longer be overriden
///@param {Real} _x    width  (%) to scale (Default = 1.0)
///@param {Real} _y    height (%) to scale (Default = 1.0)
var _x = argument_count > 1 ? argument[0] : undefined,
    _y = argument_count > 1 ? argument[1] : undefined;
		
with (ImGuiGML) {
	Override_scale = _x != undefined;

	Scale_x = Override_scale ? _x : 1.0;
	Scale_y = Override_scale ? _y : 1.0;
}

#define imguigml_get_display_scale_width
///@function imguigml_get_display_scale_width()
///@desc get the scale % we scale the width of
///@returns {Real}
with (ImGuiGML)
	return Scale_x;

#define imguigml_get_display_scale_height
///@function imguigml_get_display_scale_height()
///@desc get the scale % we scale the height of
///@returns {Real}
with (ImGuiGML)
	return Scale_y;

#define imguigml_set_display_size
///@function imguigml_set_display_size([_width], [_height])
///@desc set the display size (how imgui will clamp windows). 
///      by default, ImGuiGML automatically sets the display size to the window size each step. using this function disables that behavior.
///      calling this fucntion with **NO** params, re-enables that functionality.
///@param {Real} [_width] 
///@param {Real} [_height]
with (ImGuiGML)
	Display_override = argument_count > 1;
		
if (argument_count < 2)
	return;

if (!__imguigml_ext_call(_extImguiGML_set_display_size(argument[0], argument[1])))
	return;

#define imguigml_get_display_size
///@function imguigml_get_display_size()
///@desc get the display size (how imgui will clamp windows)
///@returns {Array:[x, y]}
if (!__imguigml_ext_call(_extImguiGML_get_display_size()))
	return;
	
var out = __Imgui_out;
var ret = array_create(2)
ret[@ 0] = buffer_read(out, buffer_f32);
ret[@ 1] = buffer_read(out, buffer_f32);
return ret;

#define imguigml_separator
///@function imguigml_separator()
///@desc separator, generally horizontal. inside a menu bar or in horizontal layout mode, this becomes a vertical separator.
if (!__imguigml_ext_call(_extImguiGML_separator()))
	return;

#define imguigml_same_line
///@function imguigml_same_line([_pos_x=0.0], [_spacing_w=-1.0])
///@desc call between widgets or groups to layout them horizontally
///@param {Real} [_pos_x=0.0]
///@param {Real} [_spacing_w=-1.0]
var in = __Imgui_in;
sr_buffer_write_val(in, argument_count > 0 ? argument[0] : 0.0, ERousrData.Float);
sr_buffer_write_val(in, argument_count > 1 ? argument[1] : -1.0, ERousrData.Float);
if (!__imguigml_ext_call(_extImguiGML_same_line()))
	return;

#define imguigml_new_line
///@function imguigml_new_line()
///@desc undo a SameLine()
if (!__imguigml_ext_call(_extImguiGML_new_line))
	return;

#define imguigml_spacing
///@function imguigml_spacing()
///@desc add vertical spacing
if (!__imguigml_ext_call(_extImguiGML_spacing()))
	return;

#define imguigml_dummy
///@function imguigml_dummy(_size_x, _size_y)
///@desc add a dummy item of given size
///@param {Real} [_pos_x=0.0]
///@param {Real} [_spacing_w=-1.0]
var buff = __imguigml_wrapper_buffer();
sr_buffer_write_val(buff, argument_count > 0 ? argument[0] : 0.0, ERousrData.Float);
sr_buffer_write_val(buff, argument_count > 1 ? argument[1] : -1.0, ERousrData.Float);
if (!__imguigml_ext_call(_extImguiGML_same_line()))
	return;

#define imguigml_indent
///@function imguigml_indent([_index_w=0.0f])
///@desc move content position toward the right, by style.IndentSpacing or indent_w if >0
///@param {Real} [_index_w=0.0f]
sr_buffer_write_val(__Imgui_in, argument_count > 0 ? argument[0] : 0.0, ERousrData.Float);
if (!__imguigml_ext_call(_extImguiGML_indent()))
	return;

#define imguigml_unindent
///@function imguigml_indent([_index_w=0.0f])
///@desc move content position back to the left, by style.IndentSpacing or indent_w if >0
///@param {Real} [_index_w=0.0f]
var buff = __imguigml_wrapper_buffer();
sr_buffer_write_val(buff, argument_count > 0 ? argument[0] : 0.0, ERousrData.Float);
if (!__imguigml_ext_call(_extImguiGML_unindent()))
	return;

#define imguigml_begin_group
///@function imguigml_begin_group()
///@desc lock horizontal starting position + capture group bounding box into one "item" (so you can use IsItemHovered() or layout primitives such as SameLine() on whole group, etc.)
if (!__imguigml_ext_call(_extImguiGML_begin_group()))
	return;

#define imguigml_end_group
///@function imguigml_end_group()
///@desc end horizontal capture group 
if (!__imguigml_ext_call(_extImguiGML_end_group()))
	return;

#define imguigml_get_cursor_pos
///@function imguigml_get_cursor_pos()
///@desc cursor position is relative to window position
///@returns {Array:[x,y]}
if (!__imguigml_ext_call(_extImguiGML_get_cursor_pos()))
	return;
var out = __Imgui_out;
var ret = array_create(2);
ret[@ 0] = buffer_read(out, buffer_f32);
ret[@ 1] = buffer_read(out, buffer_f32);
return ret;


#define imguigml_get_cursor_pos_x
///@function imguigml_get_cursor_pos_x()
///@desc cursor position is relative to window position
///@returns {Real} x
if (!__imguigml_ext_call(_extImguiGML_get_cursor_pos_x()))
	return;
return buffer_read(__Imgui_out, buffer_f32);

#define imguigml_get_cursor_pos_y
///@function imguigml_get_cursor_pos_y()
///@desc cursor position is relative to window position
///@returns {Real} y
if (!__imguigml_ext_call(_extImguiGML_get_cursor_pos_y()))
	return;
var _buff = __imguigml_wrapper_buffer();
return buffer_read(_buff, buffer_f32);


#define imguigml_set_cursor_pos
///@function imguigml_set_cursor_pos(_x, _y)
///@desc set the imgui cursor position
///@param {Real} _x
///@param {Real} _y
var buff = __imguigml_wrapper_buffer();
sr_buffer_write_val(buff, argument[0], ERousrData.Float);
sr_buffer_write_val(buff, argument[1], ERousrData.Float);
if (!__imguigml_ext_call(_extImguiGML_set_cursor_pos()))
	return;

#define imguigml_set_cursor_pos_x
///@function imguigml_set_cursor_pos_x(_x)
///@desc set the imgui cursor position x
///@param {Real} _x
sr_buffer_write_val(__Imgui_in, argument[0], ERousrData.Float);
if (!__imguigml_ext_call(_extImguiGML_set_cursor_pos_x()))
	return;

#define imguigml_set_cursor_pos_y
///@function imguigml_set_cursor_pos_y(_y)
///@desc set the imgui cursor position y
///@param {Real} _y
var buff = __imguigml_wrapper_buffer();
sr_buffer_write_val(buff, argument[0], ERousrData.Float);
if (!__imguigml_ext_call(_extImguiGML_set_cursor_pos_y()))
	return;

#define imguigml_get_cursor_start_pos
///@function imguigml_get_cursor_start_pos()
///@desc initial cursor position
///@returns {Array:[x,y]}
if (!__imguigml_ext_call(_extImguiGML_get_cursor_start_pos()))
	return;
var out = __Imgui_out;
var ret = array_create(2);
ret[@ 0] = buffer_read(out, buffer_f32);
ret[@ 1] = buffer_read(out, buffer_f32);
return ret;

#define imguigml_get_cursor_screen_pos
///@function imguigml_get_cursor_screen_pos()
///@desc cursor position in absolute screen coordinates [0..io.DisplaySize] (useful to work with ImDrawList API)
///@returns {Array:[x,y]}
if (!__imguigml_ext_call(_extImguiGML_get_cursor_screen_pos()))
	return;

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
sr_buffer_write_val(buff, argument[0], ERousrData.Float);
sr_buffer_write_val(buff, argument[1], ERousrData.Float);
if (!__imguigml_ext_call(_extImguiGML_set_cursor_screen_pos()))
	return;

#define imguigml_align_text_to_frame_padding
///@function imguigml_align_text_to_frame_padding()
///@desc vertically align/lower upcoming text to FramePadding.y so that it will aligns to upcoming widgets (call if you have text on a line before regular widgets)
if (!__imguigml_ext_call(_extImguiGML_align_text_to_frame_padding()))
	return;

#define imguigml_get_text_line_height
///@function imguigml_get_text_line_height()
///@desc height of font == GetWindowFontSize()
///@returns {Real} height of font == GetWindowFontSize()
if (!__imguigml_ext_call(_extImguiGML_get_text_line_height()))
	return;
return buffer_read(__Imgui_out, buffer_f32);

#define imguigml_get_text_line_height_with_spacing
///@function imguigml_get_text_line_height_with_spacing()
///@desc distance (in pixels) between 2 consecutive lines of text == GetWindowFontSize() + GetStyle().ItemSpacing.y
///@returns {Real} distance (in pixels) between 2 consecutive lines of text == GetWindowFontSize() + GetStyle().ItemSpacing.y
if (!__imguigml_ext_call(_extImguiGML_get_text_line_height_with_spacing()))
	return;
return buffer_read(__Imgui_out, buffer_f32);

#define imguigml_get_frame_height
///@function imguigml_get_frame_height()
///@desc gets the height of the active frame [~ FontSize + style.FramePadding.y * 2]
///@returns {Real}
if (!__imguigml_ext_call(_extImguiGML_get_frame_height()))
	return;
return buffer_read(__Imgui_out, buffer_f32);

#define imguigml_get_frame_height_with_spacing
///@function imguigml_get_frame_height_with_spacing()
///@desc distance (in pixels) between 2 consecutive lines of standard height widgets == GetWindowFontSize() + GetStyle().FramePadding.y*2 + GetStyle().ItemSpacing.y
///@returns {Real} distance (in pixels) between 2 consecutive lines of standard height widgets == GetWindowFontSize() + GetStyle().FramePadding.y*2 + GetStyle().ItemSpacing.y
if (!__imguigml_ext_call(_extImguiGML_get_frame_height_with_spacing()))
	return;
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

sr_buffer_write_val(in, argument_count > 0 ? argument[0] : 1, ERousrData.Int32);
sr_buffer_write_val(in, _id)
sr_buffer_write_val(in, argument_count > 2 ? argument[2] : 1, ERousrData.Int8);

if (!__imguigml_ext_call(_extImguiGML_columns()))
	return;

#define imguigml_next_column
///@function imguigml_next_column()
///@desc next column, defaults to current row or next row if the current row is finished
if (!__imguigml_ext_call(_extImguiGML_next_column()))
	return;

#define imguigml_get_column_index
///@function imguigml_get_column_index()
///@desc get current column index
///@returns {Real} column_index
if (!__imguigml_ext_call(_extImguiGML_get_column_index()))
	return;
return buffer_read(__Imgui_out, buffer_s32);

#define imguigml_get_column_width
///@function imguigml_get_column_width([_column_index=-1])
///@desc get column width (in pixels). pass -1 to use current column
///@param {Real} [_column_index=-1]
///@returns {Real} _column_width
sr_buffer_write_val(__Imgui_in, argument_count > 0 ? argument[0] : -1, ERousrData.Int32);
if (!__imguigml_ext_call(_extImguiGML_get_column_width()))
	return;
return buffer_read(__Imgui_out, buffer_f32);

#define imguigml_set_column_width
///@function imguigml_set_column_width(_column_index, _width)
///@desc set column width (in pixels). pass -1 to use current column
///@param {Real} _column_index   column to set width of (-1 for current)
///@param {Real} _width          width in pixels to use
var buff = __Imgui_in;
sr_buffer_write_val(buff, argument[0], ERousrData.Int32);
sr_buffer_write_val(buff, argument[1], ERousrData.Float);
__imguigml_ext_call(_extImguiGML_set_column_width());

#define imguigml_get_column_offset
///@function imguigml_get_column_offset([_column_index=-1])
///@desc get position of column line (in pixels, from the left side of the contents region).
///@param {Real} [_column_index=-1]   pass -1 to use current column, otherwise 0..GetColumnsCount() inclusive. column 0 is typically 0.0f
var buff = __imguigml_wrapper_buffer();
sr_buffer_write_val(buff, argument_count > 0 ? argument[0] : -1, ERousrData.Int32);
if (!__imguigml_ext_call(_extImguiGML_get_column_offset()))
	return;
return buffer_read(__Imgui_out, buffer_f32);

#define imguigml_set_column_offset
///@function imguigml_set_column_offset(_column_index, _offset_x)
///@desc set position of column line (in pixels, from the left side of the contents region).
///@param {Real} _column_index   pass -1 to use current column
///@param {Real} _offset_x       offset in pixels from the left side of the contents
var in = __Imgui_in;
sr_buffer_write_val(in, argument[0], ERousrData.Int32);
sr_buffer_write_val(in, argument[1], ERousrData.Float);
if (!__imguigml_ext_call(_extImguiGML_set_column_offset()))
	return;

#define imguigml_get_columns_count
///@function imguigml_get_columns_count()
///@desc get amount of columns
///@returns {Real} columns count
if (!__imguigml_ext_call(_extImguiGML_get_columns_count()))
	return;
return buffer_read(__Imgui_out, buffer_s32);

#define imguigml_push_id
///@function imguigml_push_id(_id, [_end_id])
///@desc push identifier into the ID stack. IDs are hash of the entire stack!
///@param {Real|String} _id   string or real id to push
///@param {String} [_end_id]   last id to push
var _buff = __imguigml_wrapper_buffer();
var _id = argument[0];
if (argument_count > 1) {
  sr_buffer_write_val(_buff, string(_id));
  sr_buffer_write_val(_buff, string(argument[1]));
} else {
  if (is_real(_id) || is_int32(_id) || is_int64(_id))
    sr_buffer_write_val(_buff, _id, ERousrData.Int32);
  else 
    sr_buffer_write_val(_buff, string(_id));
}

__imguigml_ext_call(_extImguiGML_push_id());

#define imguigml_pop_id
///@function imguigml_pop_id()
///@desc pop identifier from ID stack
__imguigml_ext_call(_extImguiGML_pop_id());

#define imguigml_get_id
///@function imguigml_get_id(_id, [_end_id])
///@desc push identifier into the ID stack. IDs are hash of the entire stack!
///@param {Real|String} _id    string or real id to get
///@param {String} [_end_id]   last id to get
///@returns {Real} ImGuiID
var in = __imguigml_wrapper_buffer();
var _id = argument[0];
if (argument_count > 1) {
  sr_buffer_write_val(in, string(_id));
  sr_buffer_write_val(in, string(argument[1]));
} else {
  if (is_real(_id) || is_int32(_id) || is_int64(_id))
    sr_buffer_write_val(in, _id, ERousrData.Int32);
  else 
    sr_buffer_write_val(in, string(_id));
}
if (!__imguigml_ext_call(_extImguiGML_get_id()))
	return;

return buffer_read(__Imgui_out, buffer_u32);

#define imguigml_get_clipboard_text
///@function imguigml_get_clipboard_text()
///@desc get the clipboard text
///@return {String} clipboard text
if (!__imguigml_ext_call(_extImguiGML_get_clipboard_text()))
	return;
return buffer_read(__Imgui_out, buffer_string);

#define imguigml_set_clipboard_text
///@function imguigml_set_clipboard_text(_text)
///@desc set the clipboard text
var in = __Imgui_in;
sr_buffer_write_val(in, argument[0]);
__imguigml_ext_call(_extImguiGML_set_clipboard_text());

#define imguigml_get_key_index
///@function imguigml_get_key_index(_key_index)
///@desc get mapped index for imgui_key index, you really don't need this
///@param {Real:__ImGuiKey_} _key_index
///@returns {Real}
var in = __Imgui_in;
sr_buffer_write_val(in, argument[0], ERousrData.Int32);
if (!__imguigml_ext_call(_extImguiGML_get_key_index()))
	return;
return buffer_read(__Imgui_out, buffer_s32);

#define imguigml_is_key_down
///@function imguigml_is_key_down(_key_index)
///@desc is key being held. == io.KeysDown[user_key_index]. note that imgui doesn't know the semantic of each entry of io.KeyDown[]. Use your own indices/enums according to how your backend/engine stored them into KeyDown[]!
///@param {Real:__ImGuiKey_} _key_index
///@returns {Boolean}
var in = __Imgui_in;
sr_buffer_write_val(in, argument[0], ERousrData.Int32);
if (!__imguigml_ext_call(_extImguiGML_is_key_down()))
	return;
return buffer_read(__Imgui_out, buffer_s8) != 0;

#define imguigml_is_key_pressed
///@function imguigml_is_key_pressed(_key_index, [_repeat=true])
///@desc was key pressed (went from !Down to Down)
///@param {Real:__ImGuiKey_} _key_index
///@param {Boolean} [_repeat=true]        repeat=true, uses io.KeyRepeatDelay / KeyRepeatRate
///@returns {Boolean}
var in = __Imgui_in;
sr_buffer_write_val(in, argument[0], ERousrData.Int32);
if (!__imguigml_ext_call(_extImguiGML_is_key_pressed()))
	return;
	
return buffer_read(__Imgui_out, buffer_s8) != 0;

#define imguigml_is_key_released
///@function imguigml_is_key_released(_key_index)
///@desc is key released
///@param {Real:__ImGuiKey_} _key_index
///@returns {Boolean}
var in = __Imgui_in;
sr_buffer_write_val(in, argument[0], ERousrData.Int32);
if (!__imguigml_ext_call(_extImguiGML_is_key_released()))
	return;
return buffer_read(__Imgui_out, buffer_s8) != 0;

#define imguigml_get_key_pressed_amount
///@function imguigml_get_key_pressed_amount(_key_index, _repeat_delay, _rate);
///@desc uses provided repeat rate/delay. 
///@param {Real} _key_index
///@param {Real} _repeat_delay
///@param {Real} _rate
///@returns {Real} return a count, most often 0 or 1 but might be >1 if RepeatRate is small enough that DeltaTime > RepeatRate
var in = __Imgui_in;
sr_buffer_write_val(in, argument[0], ERousrData.Int32);
sr_buffer_write_val(in, argument[1], ERousrData.Float);
sr_buffer_write_val(in, argument[2], ERousrData.Float);
if (!__imguigml_ext_call(_extImguiGML_get_key_pressed_amount()))
	return;
return buffer_read(__Imgui_out, buffer_s32);

#define imguigml_is_mouse_down
///@function imguigml_is_mouse_down(_button)
///@desc is mouse button held
///@param {Real} _button
///@returns {Boolean}
var in = __Imgui_in;
sr_buffer_write_val(in, argument[0], ERousrData.Int32);
if (!__imguigml_ext_call(_extImguiGML_is_mouse_down()))
	return;
return buffer_read(__Imgui_out, buffer_s8) != 0;

#define imguigml_is_mouse_clicked
///@function imguigml_is_mouse_clicked(_button, [_repeat=false])
///@desc did mouse button clicked (went from !Down to Down)
///@param {Real} _button
///@param {Boolean} [_repeat=false]
///@returns {Boolean}
var in = __Imgui_in;
var _repeat = argument_count > 1 ? argument[1] : false;
sr_buffer_write_val(in, argument[0], ERousrData.Int32);
sr_buffer_write_val(in, _repeat ? 1 : 0, ERousrData.Int8);
if (!__imguigml_ext_call(_extImguiGML_is_mouse_clicked()))
	return;
return buffer_read(__Imgui_out, buffer_s8) != 0;

#define imguigml_is_mouse_double_clicked
///@function imguigml_is_mouse_double_clicked(_button)
///@desc did mouse button double-clicked. a double-click returns false in IsMouseClicked(). uses io.MouseDoubleClickTime.
///@param {Real} _button
///@returns {Boolean}
var in = __Imgui_in;
sr_buffer_write_val(in, argument[0], ERousrData.Int32);
if (!__imguigml_ext_call(_extImguiGML_is_mouse_double_clicked()))
	return;
return buffer_read(__Imgui_out, buffer_s8) != 0;

#define imguigml_is_mouse_released
///@function imguigml_is_mouse_released(_button)
///@desc did mouse button released (went from Down to !Down)
///@param {Real} _button
///@returns {Boolean}
var in = __Imgui_in;
sr_buffer_write_val(in, argument[0], ERousrData.Int32);
if (!__imguigml_ext_call(_extImguiGML_is_mouse_released()))
	return;
return buffer_read(__Imgui_out, buffer_s8) != 0;

#define imguigml_is_mouse_dragging
///@function imguigml_is_mouse_dragging([_button=0], [_lock_threadhold=-1.0])
///@desc is mouse dragging. 
///@param {Real} [_button=0]
///@param {Real} [_lock_threshold=-1.0]   if lock_threshold < -1.0f uses io.MouseDraggingThreshold
///@returns {Boolean}
var in = __Imgui_in;
sr_buffer_write_val(in, argument_count > 0 ? argument[0] :    0, ERousrData.Int32);
sr_buffer_write_val(in, argument_count > 1 ? argument[1] : -1.0, ERousrData.Float);
if (!__imguigml_ext_call(_extImguiGML_is_mouse_dragging()))
	return;
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

sr_buffer_write_val(in, argument[0], ERousrData.Float);
sr_buffer_write_val(in, argument[1], ERousrData.Float);
sr_buffer_write_val(in, argument[2], ERousrData.Float);
sr_buffer_write_val(in, argument[3], ERousrData.Float);
sr_buffer_write_val(in, clipped ? 1 : 0, ERousrData.Int8);
if (!__imguigml_ext_call(_extImguiGML_is_mouse_hovering_rect()))
	return;
return buffer_read(__Imgui_out, buffer_s8) != 0;

#define imguigml_is_mouse_pos_valid
///@function imguigml_is_mouse_pos_valid()
///@desc is the mouse position valid
///@returns {Boolean}
if (!__imguigml_ext_call(_extImguiGML_is_mouse_pos_valid))
	return;
return buffer_read(__Imgui_out, buffer_s8) == 1;

#define imguigml_get_mouse_pos
///@function imguigml_get_mouse_pos()
///@desc shortcut to ImGui::GetIO().MousePos provided by user, to be consistent with other calls
///@returns {Boolean}
if (!__imguigml_ext_call(_extImguiGML_get_mouse_pos()))
	return;

var out = __Imgui_out;
var ret = array_create(2);
ret[@ 0] = buffer_read(out, buffer_f32);
ret[@ 1] = buffer_read(out, buffer_f32);
return ret;


#define imguigml_get_mouse_pos_on_opening_current_popup
///@function imguigml_get_mouse_pos_on_opening_current_popup()
///@desc retrieve backup of mouse positioning at the time of opening popup we have BeginPopup() into
if (!__imguigml_ext_call(_extImguiGML_get_mouse_pos_on_opening_current_popup()))
	return;
	
var out = __Imgui_out;
var ret = array_create(2);
ret[@ 0] = buffer_read(out, buffer_f32);
ret[@ 1] = buffer_read(out, buffer_f32);
return ret;


#define imguigml_get_mouse_drag_delta
///@function imguigml_get_mouse_drag_delta()
///@desc retrieve backup of mouse positioning at the time of opening popup we have BeginPopup() into
var in = __Imgui_in;
sr_buffer_write_val(in, argument_count > 0 ? argument[0] :    0, ERousrData.Int32);
sr_buffer_write_val(in, argument_count > 1 ? argument[1] : -1.0, ERousrData.Float);
if (!__imguigml_ext_call(_extImguiGML_get_mouse_drag_delta()))
	return;
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
sr_buffer_write_val(in, argument_count > 0 ? argument[0] : 0, ERousrData.Int32);
if (!__imguigml_ext_call(_extImguiGML_reset_mouse_drag_delta()))
	return;

#define imguigml_get_mouse_cursor
///@function imguigml_get_mouse_cursor()
///@desc get desired cursor type, reset in ImGui::NewFrame(), this is updated during the frame. valid before Render(). If you use software rendering by setting io.MouseDrawCursor ImGui will render those for you
///@returns {Real:EImGui_MouseCursor} cursor id
if (!__imguigml_ext_call(_extImguiGML_get_mouse_cursor()))
	return;
return buffer_read(__Imgui_out, buffer_s32);

#define imguigml_set_mouse_cursor
///@function imguigml_set_mouse_cursor(_type)
///@desc set desired cursor type
///@param {Real:EImGui_MouseCursor} _type
var in = __Imgui_in;
sr_buffer_write_val(in, argument[0], ERousrData.Int32);
if (!__imguigml_ext_call(_extImguiGML_set_mouse_cursor()))
	return;

#define imguigml_capture_keyboard_from_app
///@function imguigml_capture_keyboard_from_app([_capture=true])
///@desc manually override io.WantCaptureKeyboard flag next frame (said flag is entirely left for your application handle). e.g. force capture keyboard when your widget is being hovered.
///@param {Boolean} [_capture=true]
var in = __Imgui_in;
var _capture = argument_count > 0 ? argument[0] : true;
sr_buffer_write_val(in, _capture ? 1 : 0, ERousrData.Int8);
if (!__imguigml_ext_call(_extImguiGML_capture_keyboard_from_app()))
	return;

#define imguigml_capture_mouse_from_app
///@function imguigml_capture_mouse_from_app([_capture=true])
///@desc manually override io.WantCaptureMouse flag next frame (said flag is entirely left for your application handle).
///@param {Boolean} [_capture=true]
var in = __Imgui_in;
var _capture = argument_count > 0 ? argument[0] : true;
sr_buffer_write_val(in, _capture ? 1 : 0, ERousrData.Int8);
if (!__imguigml_ext_call(_extImguiGML_capture_mouse_from_app()))
	return;

#define imguigml_log_to_tty
///@function imguigml_log_to_tty([_max_depth=-1])
///@desc start logging to tty
///@param {Real} [_max_depth=-1]
var in = __Imgui_in;
sr_buffer_write_val(in, argument_count > 0 ? argument[0] : -1, ERousrData.Int32);
__imguigml_ext_call(_extImguiGML_log_to_tty());

#define imguigml_log_to_file
///@function imguigml_log_to_file([_max_depth=-1], [_file_name=undefined])
///@desc start logging to file
///@param {Real}   [_max_depth=-1]          
///@param {String} [_file_name=undefined]   absolute path to log   
var in = __Imgui_in;
var _filename = argument_count > 1 ? argument[1] : undefined;
sr_buffer_write_val(in, argument_count > 0 ? argument[0] : -1, ERousrData.Int32);
if (is_string(_filename)) sr_buffer_write_val(in, _filename);
__imguigml_ext_call(_extImguiGML_log_to_tty());

#define imguigml_log_to_clipboard
///@function imguigml_log_to_clipboard([_max_depth=-1])
///@desc start logging to OS clipboard
///@param {Real} [_max_depth=-1]
var in = __Imgui_in;
sr_buffer_write_val(in, argument_count > 0 ? argument[0] : -1, ERousrData.Int32);
__imguigml_ext_call(_extImguiGML_log_to_clipboard());

#define imguigml_log_finish
///@function imguigml_log_finish
///@desc stop logging (close file, etc.)
if (!__imguigml_ext_call(_extImguiGML_log_finish()))
	return;

#define imguigml_log_buttons
///@function imguigml_log_buttons()
///@desc helper to display buttons for logging to tty/file/clipboard
if (!__imguigml_ext_call(_extImguiGML_log_buttons()))
	return;

#define imguigml_log_text
///@function imguigml_log_text(_text)
///@desc pass text data straight to log (without being displayed)
///@param {String} _text
var in = __Imgui_in;
sr_buffer_write_val(in, argument[0]);
__imguigml_ext_call(_extImguiGML_log_text());

#define imguigml_begin_main_menu_bar
///@function imguigml_begin_main_menu_bar()
///@desc create and append to a full screen menu-bar. only call EndMainMenuBar() if this returns true!
///@returns {Boolean}
if (!__imguigml_ext_call(_extImguiGML_begin_main_menu_bar()))
	return;
return buffer_read(__Imgui_out, buffer_s8) == 1;

#define imguigml_end_main_menu_bar
///@function imguigml_end_main_menu_bar()
///@desc end main menu bar
__imguigml_ext_call(_extImguiGML_end_main_menu_bar());

#define imguigml_begin_menu_bar
///@function imguigml_begin_menu_bar()
///@desc append to menu-bar of current window (requires ImGuiWindowFlags_MenuBar flag set on parent window). only call EndMenuBar() if this returns true!
///@returns {Boolean}
if (!__imguigml_ext_call(_extImguiGML_begin_menu_bar()))
	return;
return buffer_read(__Imgui_out, buffer_s8) == 1;

#define imguigml_end_menu_bar
///@function imguigml_end_menu_bar()
///@desc end menu bar
__imguigml_ext_call(_extImguiGML_end_menu_bar());

#define imguigml_begin_menu
///@function imguigml_begin_menu(_label, [_enabled=true]);
///@desc create a sub-menu entry. only call EndMenu() if this returns true!
///@param {String} _label          
///@param {Boolean} [_enabled=true]
///@returns {Boolean}
var in = __Imgui_in;
var _enabled = argument_count > 1 ? argument[1] : true;
sr_buffer_write_val(in, argument[0]);
sr_buffer_write_val(in, _enabled ? 1 : 0, ERousrData.Int8);
if (!__imguigml_ext_call(_extImguiGML_begin_menu()))
	return;
return buffer_read(__Imgui_out, buffer_s8) != 0;

#define imguigml_end_menu
///@function imguigml_end_menu()
///@desc end sub-menu entry
if (!__imguigml_ext_call(_extImguiGML_end_menu()))
	return;

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

sr_buffer_write_val(in, string(argument[0]));
sr_buffer_write_val(in, string(argument_count > 1 ? argument[1] : ""));
sr_buffer_write_val(in, _selected ? 1 : 0, ERousrData.Int8);
sr_buffer_write_val(in, _enabled ? 1 : 0, ERousrData.Int8);
if (!__imguigml_ext_call(_extImguiGML_menu_item()))
	return;
return buffer_read(__Imgui_out, buffer_s8) != 0;

#define imguigml_open_popup
///@function imguigml_open_popup(_str_id)
///@desc call to mark popup as open (don't call every frame!). popups are closed when user click outside, 
///      or if CloseCurrentPopup() is called within a BeginPopup()/EndPopup() block. By default, 
///      Selectable()/MenuItem() are calling CloseCurrentPopup(). Popup identifiers are relative to the 
///      current ID-stack (so OpenPopup and BeginPopup needs to be at the same level).
///@param {String} _str_id
var in = __Imgui_in;
sr_buffer_write_val(in, argument[0]);
if (!__imguigml_ext_call(_extImguiGML_open_popup()))
	return;

#define imguigml_open_popup_on_item_click
///@function imguigml_open_popup_on_item_click([_str_id=undefined], [_mouse_button=1])
///@desc helper to open popup when clicked on last item. 
///@param {String} [_str_id=undefined]
///@param {Real} [_mouse_button=1]
///@returns {Boolean} true when just opened.
var in = __Imgui_in;
var str_id = argument_count > 0 ? argument[0] : noone;
if (!is_string(str_id)) str_id = noone;
sr_buffer_write_val(in, str_id);
sr_buffer_write_val(in, argument_count > 1 ? argument[1] : 1, ERousrData.Int32);
if (!__imguigml_ext_call(_extImguiGML_open_popup_on_item_click()))
	return;
return buffer_read(__Imgui_out, buffer_s8) != 0;

#define imguigml_begin_popup
///@function imguigml_begin_popup(_str_id)
///@desc begin a pop up - only call EndPopup() if BeginPopup() returned true!
///@param {String} _str_id
///@returns {Boolean} true if the popup is open, and you can start outputting to it. 
var in = __Imgui_in;
sr_buffer_write_val(in, argument[0]);
if (!__imguigml_ext_call(_extImguiGML_begin_popup()))
	return;
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
sr_buffer_write_val(in, string(argument[0]));
if (_open != undefined)
  sr_buffer_write_val(in, _open ? 1 : 0, ERousrData.Int8)
else 
  sr_buffer_write_val(in, " ");
sr_buffer_write_val(in, argument_count > 2 ? argument[2] : 0, ERousrData.Int32);
if (!__imguigml_ext_call(_extImguiGML_begin_popup_modal()))
	return;
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

sr_buffer_write_val(in, str_id);
sr_buffer_write_val(in, argument_count > 1 ? argument[1] : 1, ERousrData.Int32);

if (!__imguigml_ext_call(_extImguiGML_begin_popup_context_item()))
	return;
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

sr_buffer_write_val(in, str_id);
sr_buffer_write_val(in, argument_count > 1 ? argument[1] : 1, ERousrData.Int32);
sr_buffer_write_val(in, also_over_items ? 1 : 0, ERousrData.Int8);
if (!__imguigml_ext_call(_extImguiGML_begin_popup_context_window()))
	return;
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
sr_buffer_write_val(in, str_id);
sr_buffer_write_val(in, argument_count > 1 ? argument[1] : 1, ERousrData.Int32);
if (!__imguigml_ext_call(_extImguiGML_begin_popup_context_void()))
	return;
return buffer_read(__Imgui_out, buffer_s8) != 0;

#define imguigml_end_popup
///@function imguigml_end_popup()
///@desc end the current pop up
if (!__imguigml_ext_call(_extImguiGML_end_popup()))
	return;

#define imguigml_is_popup_open
///@function imguigml_is_popup_open(_str_id)
///@desc return true if the popup is open
///@param {String} _str_id
///@returns {Boolean}
var in = __Imgui_in;
sr_buffer_write_val(in, string(argument[0]));
if (!__imguigml_ext_call(_extImguiGML_is_popup_open()))
	return;
return buffer_read(__Imgui_out, buffer_s8) != 0;

#define imguigml_close_current_popup
///@function imguigml_close_current_popup()
///@desc close the popup we have begin-ed into. clicking on a MenuItem or Selectable automatically close the current popup.
__imguigml_ext_call(_extImguiGML_close_current_popup());

#define imguigml_push_font
///@function imguigml_push_font(_font_index)
///@desc use undefined as a shortcut to push default font

//todo: implement font system
//if (!__imguigml_ext_call(_extImguiGML_push_font();

#define imguigml_pop_font
///@function imguigml_pop_font()
///@desc pop the font

//todo: implement font system
//if (!__imguigml_ext_call(_extImguiGML_pop_font();

#define imguigml_push_style_color
///@function imguigml_push_style_color(_idx, _colOrR, [_g], [_b], [_a])
///@desc
///@param {Real:EImGui_Col} _idx    
///@param {Real} _colOrR if passing a single color, treated as a U32 colors
///@param {Real} [_g]    
///@param {Real} [_b]    
///@param {Real} [_a]    
var in = __Imgui_in;
sr_buffer_write_val(in, argument[0], ERousrData.Int32);
if (argument_count == 2)
  sr_buffer_write_val(in, argument[1], ERousrData.Uint32);
else {
  sr_buffer_write_val(in, argument[1], ERousrData.Float);
  sr_buffer_write_val(in, argument[2], ERousrData.Float);
  sr_buffer_write_val(in, argument[3], ERousrData.Float);
  sr_buffer_write_val(in, argument[4], ERousrData.Float);
}

__imguigml_ext_call(_extImguiGML_push_style_color());

#define imguigml_pop_style_color
///@function imguigml_pop_style_color([_count=1])
///@desc pop style colors
///@param {Real} [_count=1]
var in = __Imgui_in;
sr_buffer_write_val(in, argument_count > 0 ? argument[0] : 1, ERousrData.Int32);
if (!__imguigml_ext_call(_extImguiGML_pop_style_color()))
	return;

#define imguigml_push_style_var
///@function imguigml_push_style_var
///@desc push a style var on the param stack
///@param {Real:EImGui_StyleVar} _idx 
///@param {Real} _valOrX  
///@param {Real} [_y]     if passed, treat the values as a vec2
var in = __Imgui_in;
sr_buffer_write_val(in, argument[0], ERousrData.Int32);
sr_buffer_write_val(in, argument[1], ERousrData.Float);
if (argument_count > 2)
  sr_buffer_write_val(in, argument[2], ERousrData.Float);

__imguigml_ext_call(_extImguiGML_push_style_var());

#define imguigml_pop_style_var
///@function imguigml_pop_style_var([_count=1])
///@desc pop style colors
///@param {Real} [_count=1]
var in = __Imgui_in;
sr_buffer_write_val(in, argument_count > 0 ? argument[0] : 1, ERousrData.Int32);
__imguigml_ext_call(_extImguiGML_pop_style_var());

#define imguigml_get_style_color_vec4
///@function imguigml_get_style_color_vec4(_idx)
///@desc retrieve style color as stored in ImGuiStyle structure. use to feed back into PushStyleColor(), otherwhise use GetColorU32() to get style color + style alpha.
///@param {Real:EImGui_Col} _idx    
///@returns {Array:[r,g,b,a]}
sr_buffer_write_val(__Imgui_in, argument[0], ERousrData.Int32);
if (!__imguigml_ext_call(_extImguiGML_get_style_color_vec4()))
	return;

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
//if (!__imguigml_ext_call(_extImguiGML_get_font();

#define imguigml_get_font_size
///@function imguigml_get_font_size()
///@desc get current font size (= height in pixels) of current font with current scale applied
///@returns {Real} current font size
if (!__imguigml_ext_call(_extImguiGML_get_font_size()))
	return;
return buffer_read(__Imgui_out, buffer_f32);

#define imguigml_get_font_tex_uv_white_pixel
///@function imguigml_get_font_tex_uv_white_pixel()
///@desc get UV coordinate for a while pixel, useful to draw custom shapes via the ImDrawList API
///@returns {Array:[u,v]}
if (!__imguigml_ext_call(_extImguiGML_get_font_tex_uv_white_pixel()))
	return;

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
  sr_buffer_write_val(in, argument[0], ERousrData.Uint32);
else {
  sr_buffer_write_val(in, argument[0], ERousrData.Float);
  sr_buffer_write_val(in, argument[1], ERousrData.Float);
  sr_buffer_write_val(in, argument[2], ERousrData.Float);
  sr_buffer_write_val(in, argument[3], ERousrData.Float);
}
if (!__imguigml_ext_call(_extImguiGML_get_color_u32()))
	return;
return buffer_read(__Imgui_out, buffer_u32);

#define imguigml_get_color_u32_from_idx
///@function imguigml_get_color_u32_from_idx(_idx, [_alpha_mul=1.0])
///@desc retrieve given style color with style alpha applied and optional extra alpha multiplier
///@param {Real:EImGui_Col} _idx
///@param {Real} [_alpha_mul=1.0]
var in = __Imgui_in;
sr_buffer_write_val(in, argument[0], ERousrData.Int32);
sr_buffer_write_val(in, argument_count > 1 ? argument[1] : 1.0, ERousrData.Float);
if (!__imguigml_ext_call(_extImguiGML_get_color_u32()))
	return;
return buffer_read(__Imgui_out, buffer_u32);

#define imguigml_push_item_width
///@function imguigml_push_item_width(_item_width)
///@desc width of items for the common item+label case, pixels. 
///@param {Real} _item_width   0.0f = default to ~2/3 of windows width, >0.0f: width in pixels, <0.0f align xx pixels to the right of window (so -1.0f always align width to the right side)
var in = __Imgui_in;
sr_buffer_write_val(in, argument[0], ERousrData.Float);
__imguigml_ext_call(_extImguiGML_push_item_width());

#define imguigml_pop_item_width
///@function imguigml_pop_item_width()
///@desc pop item width
__imguigml_ext_call(_extImguiGML_pop_item_width());

#define imguigml_calc_item_width
///@function imguigml_calc_item_width()
///@desc width of item given pushed settings and current cursor position
///@returns {Real}
if (!__imguigml_ext_call(_extImguiGML_calc_item_width()))
	return;
return buffer_read(__Imgui_out, buffer_f32);

#define imguigml_push_text_wrap_pos
///@function imguigml_push_text_wrap_pos([_wrap_pos_x=0.0])
///@desc word-wrapping for Text*() commands. 
///@param {Real} [_wrap_pos_x=0.0]    < 0.0f: no wrapping; 0.0f: wrap to end of window (or column); > 0.0f: wrap at 'wrap_pos_x' position in window local space
var in = __Imgui_in;
sr_buffer_write_val(in, argument_count > 0 ? argument[0] : 0.0, ERousrData.Float);
__imguigml_ext_call(_extImguiGML_push_text_wrap_pos());

#define imguigml_pop_text_wrap_pos
///@function imguigml_pop_text_wrap_pos()
///@desc pop text wrap pos
__imguigml_ext_call(_extImguiGML_pop_text_wrap_pos());

#define imguigml_push_allow_keyboard_focus
///@function imguigml_push_allow_keyboard_focus(_allow_keyboard_focus)
///@desc allow focusing using TAB/Shift-TAB, enabled by default but you can disable it for certain widgets
///@param {Boolean} _allow_keyboard_focus   
var in = __Imgui_in;
sr_buffer_write_val(in, argument[0] ? 1 : 0, ERousrData.Int8);
if (!__imguigml_ext_call(_extImguiGML_push_allow_keyboard_focus()))
	return;

#define imguigml_pop_allow_keyboard_focus
///@function imguigml_pop_allow_keyboard_focus()
///@desc pop allow keyboard focus
__imguigml_ext_call(_extImguiGML_pop_allow_keyboard_focus());

#define imguigml_push_button_repeat
///@function imguigml_push_button_repeat(_repeat)
///@desc in 'repeat' mode, Button*() functions return repeated true in a typematic manner (using io.KeyRepeatDelay/io.KeyRepeatRate setting). Note that you can call IsItemActive() after any Button() to tell if the button is held in the current frame.
///@param {Boolean} _repeat
var in = __Imgui_in;
sr_buffer_write_val(in, argument[0] ? 1 : 0, ERousrData.Int8);
if (!__imguigml_ext_call(_extImguiGML_push_button_repeat()))
	return;

#define imguigml_pop_button_repeat
///@function imguigml_pop_button_repeat()
///@desc pop repeat mode
__imguigml_ext_call(_extImguiGML_pop_button_repeat());

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

sr_buffer_write_val(in, string(argument[0]));
sr_buffer_write_val(in, _selected ? 1 : 0, ERousrData.Int8);
sr_buffer_write_val(in, argument_count > 2 ? argument[2] : 0, ERousrData.Int32);
sr_buffer_write_val(in, argument_count > 4 ? argument[3] : 0, ERousrData.Float);
sr_buffer_write_val(in, argument_count > 4 ? argument[4] : 0, ERousrData.Float);

if (!__imguigml_ext_call(_extImguiGML_selectable()))
	return;

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
///@returns {Array:[{Boolean} _changed, {Real} _selected_index]}
var in = __Imgui_in;
sr_buffer_write_val(in, argument[0]);
sr_buffer_write_val(in, argument[1], ERousrData.Int32);

var _items = argument[2];
var num_items = array_length_1d(_items);
sr_buffer_write_val(in, num_items, ERousrData.Int32);
for (var i = 0; i < num_items; ++i) 
  sr_buffer_write_val(in, string(_items[i]));

sr_buffer_write_val(in, argument_count > 3 ? argument[3] : -1, ERousrData.Int32);
if (!__imguigml_ext_call(_extImguiGML_list_box()))
	return;

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
sr_buffer_write_val(in, string(argument[0]));
sr_buffer_write_val(in, argument[1], ERousrData.Float);
sr_buffer_write_val(in, argument[2], ERousrData.Float);
if (!__imguigml_ext_call(_extImguiGML_list_box_header()))
	return;
return buffer_read(__Imgui_out, buffer_s8) != 0;

#define imguigml_list_box_header_items
///@function imguigml_list_box_header_items(_label, _items_count,  [_height_in_items=-1]);
///@desc use if you want to reimplement ListBox() will custom data or interactions. make sure to call ListBoxFooter() afterwards.
///@param {String} _label
///@param {Real} _items_count
///@param {Real} [_height_in_items=-1]
///@returns {Boolean}
var in = __Imgui_in;
sr_buffer_write_val(in, string(argument[0]));
sr_buffer_write_val(in, argument[1], ERousrData.Int32);
sr_buffer_write_val(in, argument_count > 2 ? argument[2] : -1, ERousrData.Int32);
if (!__imguigml_ext_call(_extImguiGML_list_box_header()))
	return;
return buffer_read(__Imgui_out, buffer_s8) != 0;

#define imguigml_list_box_footer
///@function imguigml_list_box_footer()
///@desc terminate the scrolling region
__imguigml_ext_call(_extImguiGML_list_box_footer());

#define imguigml_show_style_editor
///@function imguigml_show_style_editor()
///@desc add style editor block (not a window). you can pass in a reference ImGuiStyle structure to compare to, revert to and save to (else it uses the default style)
// todo: style index
if (!__imguigml_ext_call(_extImguiGML_show_style_editor()))
	return;

#define imguigml_style_colors_classic
///@function imguigml_style_colors_classic()
///@desc use classic colors
// todo: style index
if (!__imguigml_ext_call(_extImguiGML_style_colors_classic()))
	return;

#define imguigml_style_colors_dark
///@function imguigml_style_colors_dark()
///@desc use dark colors
// todo: style index
if (!__imguigml_ext_call(_extImguiGML_style_colors_dark()))
	return;

#define imguigml_style_colors_light
///@function if (!__imguigml_ext_call(_extImguiGML_style_colors_light()
///@desc use light colors
// todo: style index
if (!__imguigml_ext_call(_extImguiGML_style_colors_light()))
	return;

#define imguigml_show_style_selector
///@function imguigml_show_style_selector(_label)
///@desc show the style selector widget
///@param {String} _label
var _label = argument[0];
var in = __Imgui_in;
sr_buffer_write_val(in, _label, ERousrData.String);
if (!__imguigml_ext_call(_extImguiGML_show_style_selector()))
	return;

#define imguigml_set_tooltip
///@function imguigml_set_tooltip(_tooltip_text)
///@desc set text tooltip under mouse-cursor, typically use with ImGui::IsItemHovered(). overidde any previous call to SetTooltip().
///@param {String} _tooltip_text
var in = __Imgui_in;
sr_buffer_write_val(in, string(argument[0]));
__imguigml_ext_call(_extImguiGML_set_tooltip());

#define imguigml_begin_tooltip
///@function imguigml_begin_tooltip()
///@desc begin/append a tooltip window. to create full-featured tooltip (with any kind of contents).
__imguigml_ext_call(_extImguiGML_begin_tooltip());

#define imguigml_end_tooltip
///@function imguigml_end_tooltip()
///@desc end a tooltip window
__imguigml_ext_call(_extImguiGML_end_tooltip());

#define imguigml_value
///@function imguigml_value(_label, _val_type, _val, [_float_format])
///@desc Output single value in "name: value" format (tip: freely declare more in your code to handle your types. you can add functions to the ImGui namespace)
///@param {String}              _prefix           value prefix
///@param {Real:EImGui_ValType} _val_type         data type for value
///@param {Real}                _val              value to apss
///@param {String}              [_float_format]   (float value type only)
var in = __Imgui_in;

sr_buffer_write_val(in, string(argument[0]));                                   
switch(argument[1]) {
  case EImGui_ValType.Bool:        sr_buffer_write_val(in, argument[2] ? 1 : 0, ERousrData.Int8); break;
  case EImGui_ValType.Int:         sr_buffer_write_val(in, argument[2], ERousrData.Int32); break;
  case EImGui_ValType.UnsignedInt: sr_buffer_write_val(in, argument[2], ERousrData.Uint32); break;
  case EImGui_ValType.Float:
    sr_buffer_write_val(in, argument[2], ERousrData.Float); 
    if (argument_count > 3) sr_buffer_write_val(in, string(argument[3]));
  break;
}
__imguigml_ext_call(_extImguiGML_value());

#define imguigml_color_convert_u32_to_float4
///@function imguigml_color_convert_u32_to_float4(_color)
///@desc convert a u32 color to a float 4
///@param {Real} _color   u32 color
///@returns {Array:float4} _color
var buff = __imguigml_wrapper_buffer();
sr_buffer_write_val(buff, argument[0], ERousrData.Uint32);
if (!__imguigml_ext_call(_extImguiGML_color_convert_u32_to_float4()))
	return;
var out = __Imgui_out;
var ret = array_create(4);
ret[@ 0] = buffer_read(out, buffer_f32);
ret[@ 1] = buffer_read(out, buffer_f32);
ret[@ 2] = buffer_read(out, buffer_f32);
ret[@ 3] = buffer_read(out, buffer_f32);
return ret;


#define imguigml_color_convert_float4_to_u32
///@function imguigml_color_convert_float4_to_u32(_r_or_array4, [_g=undefined], [_b=undefined], [_a=undefined])
///@desc convert a float4 color to a u32
///@param {Real} _r_or_array4
///@param {Real} [_g=undefined]
///@param {Real} [_b=undefined]
///@param {Real} [_a=undefined]
///@returns {Real} _color
var in = __Imgui_in, argi=0;

if(argument_count > 1){
	sr_buffer_write_val(in, argument[argi++], ERousrData.Float);
	sr_buffer_write_val(in, argument[argi++], ERousrData.Float);
	sr_buffer_write_val(in, argument[argi++], ERousrData.Float);
	sr_buffer_write_val(in, argument[argi++], ERousrData.Float);	
}else{
	var _array = argument[0];
	sr_buffer_write_val(in, _array[argi++], ERousrData.Float);
	sr_buffer_write_val(in, _array[argi++], ERousrData.Float);
	sr_buffer_write_val(in, _array[argi++], ERousrData.Float);
	sr_buffer_write_val(in, _array[argi++], ERousrData.Float);
}

if (!__imguigml_ext_call(_extImguiGML_color_convert_float4_to_u32()))
	return;
return buffer_read(__Imgui_out, buffer_u32);

#define imguigml_color_convert_rgb_to_hsv
///@function imguigml_color_convert_rgb_to_hsv(_r, _g, _b)
///@desc convert rgb to hsv
///@param {Real} _r
///@param {Real} _g
///@param {Real} _b
///@returns {Array:[h,s,v]}
var buff = __imguigml_wrapper_buffer();
sr_buffer_write_val(buff, argument[0], ERousrData.Float);
sr_buffer_write_val(buff, argument[1], ERousrData.Float);
sr_buffer_write_val(buff, argument[2], ERousrData.Float);
if (!__imguigml_ext_call(_extImguiGML_color_convert_rgb_to_hsv()))
	return;

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
sr_buffer_write_val(buff, argument[0], ERousrData.Float);
sr_buffer_write_val(buff, argument[1], ERousrData.Float);
sr_buffer_write_val(buff, argument[2], ERousrData.Float);
if (!__imguigml_ext_call(_extImguiGML_color_convert_hsv_to_rgb()))
	return;

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
sr_buffer_write_val(in, argument_count > 0 ? argument[0] : 0, ERousrData.Int32);
if (!__imguigml_ext_call(_extImguiGML_is_item_hovered()))
	return;
return buffer_read(__Imgui_out, buffer_s8) != 0;

#define imguigml_is_item_active
///@function imguigml_is_item_active()
///@desc is the last item active? (e.g. button being held, text field being edited- items that don't interact will always return false)
///@returns {Boolean}
var in = __Imgui_in;
if (!__imguigml_ext_call(_extImguiGML_is_item_active()))
	return;
return buffer_read(__Imgui_out, buffer_s8) != 0;

#define imguigml_is_item_clicked
///@function imguigml_is_item_click([_button=0])
///@desc is the last item clicked? (e.g. button/node just clicked on)
///@param {Real} [_button=0]   mouse_button
///@returns {Boolean}
var in = __Imgui_in;
sr_buffer_write_val(in, argument_count > 0 ? argument[0] : 0, ERousrData.Int32);
if (!__imguigml_ext_call(_extImguiGML_is_item_clicked()))
	return;
return buffer_read(__Imgui_out, buffer_s8) != 0;

#define imguigml_is_item_visible
///@function imguigml_is_item_visible()
///@desc is the last item visible? (aka not out of sight due to clipping/scrolling.)
///@returns {Boolean}
var in = __Imgui_in;
if (!__imguigml_ext_call(_extImguiGML_is_item_visible()))
	return;
return buffer_read(__Imgui_out, buffer_s8) != 0;

#define imguigml_is_any_item_hovered
///@function imguigml_is_any_item_hovered()
///@desc are any items hovered
///@returns {Boolean}
var in = __Imgui_in;
if (!__imguigml_ext_call(_extImguiGML_is_any_item_hovered()))
	return;
return buffer_read(__Imgui_out, buffer_s8) != 0;

#define imguigml_is_any_item_active
///@function imguigml_is_any_item_active()
///@desc are any items active
///@returns {Boolean}
var in = __Imgui_in;
if (!__imguigml_ext_call(_extImguiGML_is_any_item_active()))
	return;
return buffer_read(__Imgui_out, buffer_s8) != 0;

#define imguigml_get_item_rect_min
///@function imguigml_get_item_rect_min()
///@desc get bounding rect of last item in screen space
///@returns {Array:[x,y]}
if (!__imguigml_ext_call(_extImguiGML_get_item_rect_min()))
	return;
var out = __Imgui_out;
var ret = array_create(2);
ret[@ 0] = buffer_read(out, buffer_f32);
ret[@ 1] = buffer_read(out, buffer_f32);
return ret;


#define imguigml_get_item_rect_max
///@function imguigml_get_item_rect_max()
///@desc get bounding rect of last item in screen space
///@returns {Array:[x,y]}
if (!__imguigml_ext_call(_extImguiGML_get_item_rect_max()))
	return;

var out = __Imgui_out;
var ret = array_create(2);
ret[@ 0] = buffer_read(out, buffer_f32);
ret[@ 1] = buffer_read(out, buffer_f32);
return ret;


#define imguigml_get_item_rect_size
///@function imguigml_get_item_rect_size()
///@desc get bounding rect of last item in screen space
///@returns {Array:[x,y]}
if (!__imguigml_ext_call(_extImguiGML_get_item_rect_size()))
	return;
var out = __Imgui_out;
var ret = array_create(2);
ret[@ 0] = buffer_read(out, buffer_f32);
ret[@ 1] = buffer_read(out, buffer_f32);
return ret;

#define imguigml_set_item_allow_overlap
///@function imguigml_set_item_allow_overlap
///@desc allow last item to be overlapped by a subsequent item. sometimes useful with invisible buttons, selectables, etc. to catch unused area.
__imguigml_ext_call(_extImguiGML_set_item_allow_overlap());

#define imguigml_is_window_focused
///@function imguigml_is_window_focused([_flags=0])
///@desc is current Begin()-ed window focused?
///@param {Real:EImGui_FocusedFlags} [_flags=0]
///@returns {Boolean}
var in = __Imgui_in;
sr_buffer_write_val(in, argument_count > 0 ? argument[0] : 0, ERousrData.Uint32);
if (!__imguigml_ext_call(_extImguiGML_is_window_focused()))
	return;
return buffer_read(__Imgui_out, buffer_s8) != 0;

#define imguigml_is_window_hovered
///@function imguigml_is_window_hovered([_flags=0])
///@desc is current Begin()-ed window hovered (and typically: not blocked by a popup/modal)?
///@param {Real:EImGui_HoveredFlags} [_flags=0]
///@returns {Boolean}
var in = __Imgui_in;
sr_buffer_write_val(in, argument_count > 0 ? argument[0] : 0, ERousrData.Int32);
if (!__imguigml_ext_call(_extImguiGML_is_window_hovered()))
	return;
return buffer_read(__Imgui_out, buffer_s8) != 0;

#define imguigml_is_any_window_hovered
///@function imguigml_is_any_window_hovered()
///@desc is mouse hovering any visible window
///@returns {Boolean}
if (!__imguigml_ext_call(_extImguiGML_is_any_window_hovered()))
	return;
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
sr_buffer_write_val(in, argument[0], ERousrData.Float);
sr_buffer_write_val(in, argument[1], ERousrData.Float);
if (argument_count > 2) {
  sr_buffer_write_val(in, argument[2], ERousrData.Float);
  sr_buffer_write_val(in, argument[3], ERousrData.Float);
}

if (!__imguigml_ext_call(_extImguiGML_is_rect_visible()))
	return;
return buffer_read(__Imgui_out, buffer_s8) != 0;

#define imguigml_get_time
///@function imguigml_get_time()
///@desc get the time
if (!__imguigml_ext_call(_extImguiGML_get_time()))
	return;
return buffer_read(__Imgui_out, buffer_f32);

#define imguigml_get_frame_count
///@function imguigml_get_frame_count()
///@desc get the time
if (!__imguigml_ext_call(_extImguiGML_get_frame_count()))
	return;
return buffer_read(__Imgui_out, buffer_s32);

#define imguigml_get_style_color_name
///@function imguigml_get_style_color_name(_idx)
///@desc get the style color's name
///@param {Real:EImGui_Col} _idx
///@returns {String} _color_name
var in = __Imgui_in;
sr_buffer_write_val(in, argument[0], ERousrData.Int32);
if (!__imguigml_ext_call(_extImguiGML_get_style_color_name()))
	return;
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
sr_buffer_write_val(in, argument[0], ERousrData.Float);
sr_buffer_write_val(in, argument[1], ERousrData.Float);
sr_buffer_write_val(in, _on_edge ? 1 : 0, ERousrData.Int8);
if (argument_count > 3)
  sr_buffer_write_val(in, argument[3], ERousrData.Float);
  
if (!__imguigml_ext_call(_extImguiGML_calc_item_rect_closest_point()))
	return;

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

sr_buffer_write_val(in, string(argument[0]));
sr_buffer_write_val(in, _text_end, !is_string(_text_end) ? ERousrData.Int8 : ERousrData.String);
sr_buffer_write_val(in, _hide_text_after_double_hash ? 1 : 0, ERousrData.Int8);
sr_buffer_write_val(in, argument_count > 3 ? argument[3] : -1.0, ERousrData.Float);
if (!__imguigml_ext_call(_extImguiGML_calc_text_size()))
	return;

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
sr_buffer_write_val(in, argument[0], ERousrData.Int32);
sr_buffer_write_val(in, argument[1], ERousrData.Float);
if (!__imguigml_ext_call(_extImguiGML_calc_list_clipping()))
	return;
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
sr_buffer_write_val(in, argument[0], ERousrData.Float);
sr_buffer_write_val(in, argument[1], ERousrData.Float);
sr_buffer_write_val(in, argument[2], ERousrData.Float);
sr_buffer_write_val(in, argument[3], ERousrData.Float);
sr_buffer_write_val(in, argument[4] ? 1 : 0, ERousrData.Int8);
if (!__imguigml_ext_call(_extImguiGML_push_clip_rect()))
	return;

#define imguigml_pop_clip_rect
///@function imguigml_pop_clip_rect
///@desc pop the clip rect
if (!__imguigml_ext_call(_extImguiGML_pop_clip_rect()))
	return;

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
sr_buffer_write_val(in, argument[0]);
sr_buffer_write_val(in, argument[1], ERousrData.Float);
sr_buffer_write_val(in, argument[2], ERousrData.Float);
sr_buffer_write_val(in, argument[3], ERousrData.Float);
sr_buffer_write_val(in, argument_count > 4 ? argument[4] : "%.3f");
sr_buffer_write_val(in, argument_count > 5 ? argument[5] : 1.0, ERousrData.Float);
if (!__imguigml_ext_call(_extImguiGML_slider_float()))
	return;

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
sr_buffer_write_val(in, argument[0]);
sr_buffer_write_val(in, argument[1], ERousrData.Float);
sr_buffer_write_val(in, argument[2], ERousrData.Float);
sr_buffer_write_val(in, argument[3], ERousrData.Float);
sr_buffer_write_val(in, argument[4], ERousrData.Float);
sr_buffer_write_val(in, argument_count > 5 ? argument[5] : "%.3f");
sr_buffer_write_val(in, argument_count > 6 ? argument[6] : 1.0, ERousrData.Float);
if (!__imguigml_ext_call(_extImguiGML_slider_float2()))
	return;

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
sr_buffer_write_val(in, argument[0]);
sr_buffer_write_val(in, argument[1], ERousrData.Float);
sr_buffer_write_val(in, argument[2], ERousrData.Float);
sr_buffer_write_val(in, argument[3], ERousrData.Float);
sr_buffer_write_val(in, argument[4], ERousrData.Float);
sr_buffer_write_val(in, argument[5], ERousrData.Float);
sr_buffer_write_val(in, argument_count > 6 ? argument[6] : "%.3f");
sr_buffer_write_val(in, argument_count > 7 ? argument[7] : 1.0, ERousrData.Float);
if (!__imguigml_ext_call(_extImguiGML_slider_float3()))
	return;
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
sr_buffer_write_val(in, argument[0]);
sr_buffer_write_val(in, argument[1], ERousrData.Float);
sr_buffer_write_val(in, argument[2], ERousrData.Float);
sr_buffer_write_val(in, argument[3], ERousrData.Float);
sr_buffer_write_val(in, argument[4], ERousrData.Float);
sr_buffer_write_val(in, argument[5], ERousrData.Float);
sr_buffer_write_val(in, argument[6], ERousrData.Float);
sr_buffer_write_val(in, argument_count > 7 ? argument[6] : "%.3f");
sr_buffer_write_val(in, argument_count > 8 ? argument[7] : 1.0, ERousrData.Float);
if (!__imguigml_ext_call(_extImguiGML_slider_float4()))
	return;

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
sr_buffer_write_val(in, argument[0])
sr_buffer_write_val(in, argument[1], ERousrData.Float);
sr_buffer_write_val(in, argument_count > 2 ? argument[2] : -360.0, ERousrData.Float);
sr_buffer_write_val(in, argument_count > 3 ? argument[3] : 360.0, ERousrData.Float);
if (!__imguigml_ext_call(_extImguiGML_slider_angle()))
	return;
	
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
sr_buffer_write_val(in, argument[0]);
sr_buffer_write_val(in, argument[1], ERousrData.Int32);
sr_buffer_write_val(in, argument[2], ERousrData.Int32);
sr_buffer_write_val(in, argument[3], ERousrData.Int32);
sr_buffer_write_val(in, argument_count > 4 ? argument[4] : "%.0f");

if (!__imguigml_ext_call(_extImguiGML_slider_int()))
	return;
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
sr_buffer_write_val(in, argument[0]);
sr_buffer_write_val(in, argument[1], ERousrData.Int32);
sr_buffer_write_val(in, argument[2], ERousrData.Int32);
sr_buffer_write_val(in, argument[3], ERousrData.Int32);
sr_buffer_write_val(in, argument[4], ERousrData.Int32);
sr_buffer_write_val(in, argument_count > 5 ? argument[5] : "%.0f");

if (!__imguigml_ext_call(_extImguiGML_slider_int2()))
	return;

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
sr_buffer_write_val(in, argument[0]);
sr_buffer_write_val(in, argument[1], ERousrData.Int32);
sr_buffer_write_val(in, argument[2], ERousrData.Int32);
sr_buffer_write_val(in, argument[3], ERousrData.Int32);
sr_buffer_write_val(in, argument[4], ERousrData.Int32);
sr_buffer_write_val(in, argument[5], ERousrData.Int32);
sr_buffer_write_val(in, argument_count > 6 ? argument[6] : "%.0f");

if (!__imguigml_ext_call(_extImguiGML_slider_int3()))
	return;

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
sr_buffer_write_val(in, argument[0]);
sr_buffer_write_val(in, argument[1], ERousrData.Int32);
sr_buffer_write_val(in, argument[2], ERousrData.Int32);
sr_buffer_write_val(in, argument[3], ERousrData.Int32);
sr_buffer_write_val(in, argument[4], ERousrData.Int32);
sr_buffer_write_val(in, argument[5], ERousrData.Int32);
sr_buffer_write_val(in, argument[6], ERousrData.Int32);
sr_buffer_write_val(in, argument_count > 7 ? argument[7] : "%.0f");

if (!__imguigml_ext_call(_extImguiGML_slider_int4()))
	return;

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
sr_buffer_write_val(in, argument[0]);
sr_buffer_write_val(in, argument[1], ERousrData.Float);
sr_buffer_write_val(in, argument[2], ERousrData.Float);
sr_buffer_write_val(in, argument[3], ERousrData.Float);
sr_buffer_write_val(in, argument[4], ERousrData.Float);
sr_buffer_write_val(in, argument[5], ERousrData.Float);
sr_buffer_write_val(in, argument_count > 6 ? argument[6] : "%.0f");
if (!__imguigml_ext_call(_extImguiGML_vslider_float()))
	return;

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
sr_buffer_write_val(in, argument[0]);
sr_buffer_write_val(in, argument[1], ERousrData.Int32);
sr_buffer_write_val(in, argument[2], ERousrData.Int32);
sr_buffer_write_val(in, argument[3], ERousrData.Int32);
sr_buffer_write_val(in, argument[4], ERousrData.Int32);
sr_buffer_write_val(in, argument[5], ERousrData.Int32);
sr_buffer_write_val(in, argument_count > 6 ? argument[6] : "%.0f");
if (!__imguigml_ext_call(_extImguiGML_vslider_int()))
	return;

var out = __Imgui_out;
var ret = array_create(2);
ret[@ 0] = buffer_read(out, buffer_s8) != 0;
ret[@ 1] = buffer_read(out, buffer_s32);
return ret; 


#define imguigml_color_edit3
///@function imguigml_color_edit3(_label, _r_or_array3, [_g=undefined], [_b=undefined], [_flags=0])
///@desc show a color edit field
///@param {String} _label
///@param {Real} _r_or_array3
///@param {Real} [_g=undefined]
///@param {Real} [_b=undefined]
///@param {Real:EImGui_ColorEditFlags} [_flags=0]
var in = __Imgui_in, argi = 0;

sr_buffer_write_val(in, argument[argi++], ERousrData.String);

if(argument_count > 2){
	sr_buffer_write_val(in, argument[argi++], ERousrData.Float);
	sr_buffer_write_val(in, argument[argi++], ERousrData.Float);
	sr_buffer_write_val(in, argument[argi++], ERousrData.Float);
}else{
	var _array = argument[1];
	argi--;
	sr_buffer_write_val(in, _array[argi++], ERousrData.Float);
	sr_buffer_write_val(in, _array[argi++], ERousrData.Float);
	sr_buffer_write_val(in, _array[argi++], ERousrData.Float);
	argi++;
}

sr_buffer_write_val(in, argument_count > 4 ? argument[argi++] : 0, ERousrData.Int32); 
if (!__imguigml_ext_call(_extImguiGML_color_edit3()))
	return;

var out = __Imgui_out, outi = 0;
var ret = array_create(4);
ret[@ outi++] = buffer_read(out, buffer_s8) != 0;
ret[@ outi++] = buffer_read(out, buffer_f32);
ret[@ outi++] = buffer_read(out, buffer_f32);
ret[@ outi++] = buffer_read(out, buffer_f32);
ret[@ outi++] = buffer_read(out, buffer_f32);
return ret; 


#define imguigml_color_edit4
///@function imguigml_color_edit4(_label, _r_or_array4, [_g=undefined], [_b=undefined], [_a=undefined], [_flags=0])
///@desc show a color edit field
///@param {String} _label
///@param {Real} _r_or_array4
///@param {Real} [_g=undefined]
///@param {Real} [_b=undefined]
///@param {Real} [_a=undefined]
///@param {Real:EImGui_ColorEditFlags} [_flags=0]
var in = __Imgui_in, argi = 0;

sr_buffer_write_val(in, argument[argi++], ERousrData.String);

if(argument_count > 2){
	sr_buffer_write_val(in, argument[argi++], ERousrData.Float);
	sr_buffer_write_val(in, argument[argi++], ERousrData.Float);
	sr_buffer_write_val(in, argument[argi++], ERousrData.Float);
	sr_buffer_write_val(in, argument[argi++], ERousrData.Float);
}else{
	var _array = argument[1];
	argi--;
	sr_buffer_write_val(in, _array[argi++], ERousrData.Float);
	sr_buffer_write_val(in, _array[argi++], ERousrData.Float);
	sr_buffer_write_val(in, _array[argi++], ERousrData.Float);
	sr_buffer_write_val(in, _array[argi++], ERousrData.Float);
	argi++;
}

sr_buffer_write_val(in, argument_count > 5 ? argument[argi++] : 0, ERousrData.Int32); 
if (!__imguigml_ext_call(_extImguiGML_color_edit4()))
	return;

var out = __Imgui_out, outi = 0;
var ret = array_create(5);
ret[@ outi++] = buffer_read(out, buffer_s8) != 0;
ret[@ outi++] = buffer_read(out, buffer_f32);
ret[@ outi++] = buffer_read(out, buffer_f32);
ret[@ outi++] = buffer_read(out, buffer_f32);
ret[@ outi++] = buffer_read(out, buffer_f32);
return ret;


#define imguigml_color_picker3
///@function imguigml_color_picker3(_label, _r_or_array4, [_g=undefined], [_b=undefined], [_flags=0])
///@desc show a color edit field
///@param {String} _label
///@param {Real} _r_or_array4
///@param {Real} [_g=undefined] 
///@param {Real} [_b=undefined]
///@param {Real:EImGui_ColorEditFlags} [_flags=0]
var in = __Imgui_in, argi = 0;

sr_buffer_write_val(in, argument[argi++], ERousrData.String);

if(argument_count > 2){
	sr_buffer_write_val(in, argument[argi++], ERousrData.Float);
	sr_buffer_write_val(in, argument[argi++], ERousrData.Float);
	sr_buffer_write_val(in, argument[argi++], ERousrData.Float);
}else{
	var _array = argument[1];
	argi--;
	sr_buffer_write_val(in, _array[argi++], ERousrData.Float);
	sr_buffer_write_val(in, _array[argi++], ERousrData.Float);
	sr_buffer_write_val(in, _array[argi++], ERousrData.Float);
	argi++;
}

sr_buffer_write_val(in, argument_count > 4 ? argument[argi++] : 0, ERousrData.Int32); 
if (!__imguigml_ext_call(_extImguiGML_color_picker3()))
	return;

var out = __Imgui_out, outi = 0;
var ret = array_create(4);
ret[@ outi++] = buffer_read(out, buffer_s8) != 0;
ret[@ outi++] = buffer_read(out, buffer_f32);
ret[@ outi++] = buffer_read(out, buffer_f32);
ret[@ outi++] = buffer_read(out, buffer_f32);
return ret;

#define imguigml_color_picker4
///@function imguigml_color_picker4(_label, _r_or_array4, [_g=undefined], [_b=undefined], [_a=undefined], [_flags=0])
///@desc show a color edit field
///@param {String} _label
///@param {Real} _r_or_array4
///@param {Real} [_g=undefined] 
///@param {Real} [_b=undefined]
///@param {Real} [_a=undefined]
///@param {Real:EImGui_ColorEditFlags} [_flags=0]
var in = __Imgui_in, argi = 0;

sr_buffer_write_val(in, argument[argi++], ERousrData.String);

if(argument_count > 2){
	sr_buffer_write_val(in, argument[argi++], ERousrData.Float);
	sr_buffer_write_val(in, argument[argi++], ERousrData.Float);
	sr_buffer_write_val(in, argument[argi++], ERousrData.Float);
	sr_buffer_write_val(in, argument[argi++], ERousrData.Float);
}else{
	var _array = argument[1];
	argi--;
	sr_buffer_write_val(in, _array[argi++], ERousrData.Float);
	sr_buffer_write_val(in, _array[argi++], ERousrData.Float);
	sr_buffer_write_val(in, _array[argi++], ERousrData.Float);
	sr_buffer_write_val(in, _array[argi++], ERousrData.Float);
	argi++;
}

sr_buffer_write_val(in, argument_count > 5 ? argument[argi++] : 0, ERousrData.Int32); 
if (!__imguigml_ext_call(_extImguiGML_color_picker4()))
	return;

var out = __Imgui_out, outi = 0;
var ret = array_create(5);
ret[@ outi++] = buffer_read(out, buffer_s8) != 0;
ret[@ outi++] = buffer_read(out, buffer_f32);
ret[@ outi++] = buffer_read(out, buffer_f32);
ret[@ outi++] = buffer_read(out, buffer_f32);
ret[@ outi++] = buffer_read(out, buffer_f32);
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
sr_buffer_write_val(in, argument[0]);
sr_buffer_write_val(in, argument[1], ERousrData.Float);
sr_buffer_write_val(in, argument[2], ERousrData.Float);
sr_buffer_write_val(in, argument[3], ERousrData.Float);
sr_buffer_write_val(in, argument[4], ERousrData.Float);
sr_buffer_write_val(in, argument_count > 5 ? argument[5] : 0, ERousrData.Int32);
sr_buffer_write_val(in, argument_count > 6 ? argument[6] : 0, ERousrData.Float);
sr_buffer_write_val(in, argument_count > 7 ? argument[7] : 0, ERousrData.Float);
if (!__imguigml_ext_call(_extImguiGML_color_button()))
	return;
return buffer_read(__Imgui_out, buffer_s8) != 0;

#define imguigml_set_color_edit_options
///@function imguigml_set_color_edit_options
///@desc initialize current options (generally on application startup) if you want to select a default format, picker type, etc. User will be able to change many settings, unless you pass the _NoOptions flag to your calls.
var in = __Imgui_in;
sr_buffer_write_val(in, argument[0], ERousrData.Int32);
__imguigml_ext_call(_extImguiGML_set_color_edit_options());

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
sr_buffer_write_val(in, argument[0]);
sr_buffer_write_val(in, argument[1], ERousrData.Float);
sr_buffer_write_val(in, argument[2], ERousrData.Float);
sr_buffer_write_val(in, argument[3], ERousrData.Float);
sr_buffer_write_val(in, argument[4], ERousrData.Float);
sr_buffer_write_val(in, argument_count > 5 ? argument[5] : "%.3f");
sr_buffer_write_val(in, argument_count > 6 ? argument[6] : 1.0, ERousrData.Float);

if (!__imguigml_ext_call(_extImguiGML_drag_float()))
	return;

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
sr_buffer_write_val(in, argument[0]);
sr_buffer_write_val(in, argument[1], ERousrData.Float);
sr_buffer_write_val(in, argument[2], ERousrData.Float);
sr_buffer_write_val(in, argument[3], ERousrData.Float);
sr_buffer_write_val(in, argument[4], ERousrData.Float);
sr_buffer_write_val(in, argument[5], ERousrData.Float);
sr_buffer_write_val(in, argument_count > 6 ? argument[6] : "%.3f");
sr_buffer_write_val(in, argument_count > 7 ? argument[7] : 1.0, ERousrData.Float);

if (!__imguigml_ext_call(_extImguiGML_drag_float2()))
	return;

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
sr_buffer_write_val(in, argument[0]);
sr_buffer_write_val(in, argument[1], ERousrData.Float);
sr_buffer_write_val(in, argument[2], ERousrData.Float);
sr_buffer_write_val(in, argument[3], ERousrData.Float);
sr_buffer_write_val(in, argument[4], ERousrData.Float);
sr_buffer_write_val(in, argument[5], ERousrData.Float);
sr_buffer_write_val(in, argument[6], ERousrData.Float);
sr_buffer_write_val(in, argument_count > 7 ? argument[7] : "%.3f");
sr_buffer_write_val(in, argument_count > 8 ? argument[8] : 1.0, ERousrData.Float);

if (!__imguigml_ext_call(_extImguiGML_drag_float3()))
	return;

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
sr_buffer_write_val(in, argument[0]);
sr_buffer_write_val(in, argument[1], ERousrData.Float);
sr_buffer_write_val(in, argument[2], ERousrData.Float);
sr_buffer_write_val(in, argument[3], ERousrData.Float);
sr_buffer_write_val(in, argument[4], ERousrData.Float);
sr_buffer_write_val(in, argument[5], ERousrData.Float);
sr_buffer_write_val(in, argument[6], ERousrData.Float);
sr_buffer_write_val(in, argument[7], ERousrData.Float);
sr_buffer_write_val(in, argument_count > 8 ? argument[8] : "%.3f");
sr_buffer_write_val(in, argument_count > 9 ? argument[9] : 1.0, ERousrData.Float);

if (!__imguigml_ext_call(_extImguiGML_drag_float4()))
	return;

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
sr_buffer_write_val(in, argument[0]);
sr_buffer_write_val(in, argument[1], ERousrData.Float);
sr_buffer_write_val(in, argument[2], ERousrData.Float);
sr_buffer_write_val(in, argument[3], ERousrData.Float);
sr_buffer_write_val(in, argument[4], ERousrData.Float);
sr_buffer_write_val(in, argument[5], ERousrData.Float);
sr_buffer_write_val(in, argument_count > 6 ? argument[6] : "%.0f");
if (argument_count > 7 && is_string(argument[7])) 
  sr_buffer_write_val(in, argument[7]);
else 
  sr_buffer_write_val(in, 0, ERousrData.Int8);
sr_buffer_write_val(in, argument_count > 8 ? argument[8] : 1.0, ERousrData.Float);

if (!__imguigml_ext_call(_extImguiGML_drag_float_range2()))
	return;
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
sr_buffer_write_val(in, argument[0]);
sr_buffer_write_val(in, argument[1], ERousrData.Int32);
sr_buffer_write_val(in, argument[2], ERousrData.Float);
sr_buffer_write_val(in, argument[3], ERousrData.Int32);
sr_buffer_write_val(in, argument[4], ERousrData.Int32);
sr_buffer_write_val(in, argument_count > 5 ? argument[5] : "%.0f");

if (!__imguigml_ext_call(_extImguiGML_drag_int()))
	return;

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
sr_buffer_write_val(in, argument[0]);
sr_buffer_write_val(in, argument[1], ERousrData.Int32);
sr_buffer_write_val(in, argument[2], ERousrData.Int32);
sr_buffer_write_val(in, argument[3], ERousrData.Float);
sr_buffer_write_val(in, argument[4], ERousrData.Int32);
sr_buffer_write_val(in, argument[5], ERousrData.Int32);
sr_buffer_write_val(in, argument_count > 6 ? argument[6] : "%.0f");

if (!__imguigml_ext_call(_extImguiGML_drag_int2()))
	return;

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
sr_buffer_write_val(in, argument[0]);
sr_buffer_write_val(in, argument[1], ERousrData.Int32);
sr_buffer_write_val(in, argument[2], ERousrData.Int32);
sr_buffer_write_val(in, argument[3], ERousrData.Int32);
sr_buffer_write_val(in, argument[4], ERousrData.Float);
sr_buffer_write_val(in, argument[5], ERousrData.Int32);
sr_buffer_write_val(in, argument[6], ERousrData.Int32);
sr_buffer_write_val(in, argument_count > 7 ? argument[7] : "%.0f");

if (!__imguigml_ext_call(_extImguiGML_drag_int3()))
	return;

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
sr_buffer_write_val(in, argument[0]);
sr_buffer_write_val(in, argument[1], ERousrData.Int32);
sr_buffer_write_val(in, argument[2], ERousrData.Int32);
sr_buffer_write_val(in, argument[3], ERousrData.Int32);
sr_buffer_write_val(in, argument[4], ERousrData.Int32);
sr_buffer_write_val(in, argument[5], ERousrData.Float);
sr_buffer_write_val(in, argument[6], ERousrData.Int32);
sr_buffer_write_val(in, argument[7], ERousrData.Int32);
sr_buffer_write_val(in, argument_count > 8 ? argument[8] : "%.0f");

if (!__imguigml_ext_call(_extImguiGML_drag_int4()))
	return;

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
sr_buffer_write_val(in, argument[0]);
sr_buffer_write_val(in, argument[1], ERousrData.Int32);
sr_buffer_write_val(in, argument[2], ERousrData.Int32);
sr_buffer_write_val(in, argument[3], ERousrData.Float);
sr_buffer_write_val(in, argument[4], ERousrData.Int32);
sr_buffer_write_val(in, argument[5], ERousrData.Int32);
sr_buffer_write_val(in, argument_count > 6 ? argument[6] : "%.0f");
if (argument_count > 7) 
  sr_buffer_write_val(in, argument[7]);
else 
  sr_buffer_write_val(in, 0, ERousrData.Int8);
if (!__imguigml_ext_call(_extImguiGML_drag_int_range2()))
	return;
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
sr_buffer_write_val(in, argument[0]);
sr_buffer_write_val(in, argument[1]);
sr_buffer_write_val(in, argument[2], ERousrData.Uint32);
sr_buffer_write_val(in, argument_count > 3 ? argument[3] : 0, ERousrData.Int32);
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
sr_buffer_write_val(in, argument[0]);
sr_buffer_write_val(in, argument[1]);
sr_buffer_write_val(in, argument[2], ERousrData.Uint32);
sr_buffer_write_val(in, argument[3], ERousrData.Float);
sr_buffer_write_val(in, argument[4], ERousrData.Float);
sr_buffer_write_val(in, argument_count > 5 ? argument[5] : 0, ERousrData.Int32);
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
sr_buffer_write_val(in, argument[0]);
sr_buffer_write_val(in, argument[1], ERousrData.Float);
sr_buffer_write_val(in, argument_count > 2 ? argument[2] : 0.0, ERousrData.Float);
sr_buffer_write_val(in, argument_count > 3 ? argument[3] : 0.0, ERousrData.Float);
sr_buffer_write_val(in, argument_count > 4 ? argument[4] :  -1, ERousrData.Int32);
sr_buffer_write_val(in, argument_count > 5 ? argument[5] :   0, ERousrData.Int32);

if (!__imguigml_ext_call(_extImguiGML_input_float()))
	return;

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
sr_buffer_write_val(in, argument[0]);
sr_buffer_write_val(in, argument[1], ERousrData.Float);
sr_buffer_write_val(in, argument[2], ERousrData.Float);
sr_buffer_write_val(in, argument_count > 3 ? argument[3] :  -1, ERousrData.Int32);
sr_buffer_write_val(in, argument_count > 4 ? argument[4] :   0, ERousrData.Int32);
if (!__imguigml_ext_call(_extImguiGML_input_float2()))
	return;

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
sr_buffer_write_val(in, argument[0]);
sr_buffer_write_val(in, argument[1], ERousrData.Float);
sr_buffer_write_val(in, argument[2], ERousrData.Float);
sr_buffer_write_val(in, argument[3], ERousrData.Float);
sr_buffer_write_val(in, argument_count > 4 ? argument[4] :  -1, ERousrData.Int32);
sr_buffer_write_val(in, argument_count > 5 ? argument[5] :   0, ERousrData.Int32);
if (!__imguigml_ext_call(_extImguiGML_input_float3()))
	return;

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
sr_buffer_write_val(in, argument[0]);
sr_buffer_write_val(in, argument[1], ERousrData.Float);
sr_buffer_write_val(in, argument[2], ERousrData.Float);
sr_buffer_write_val(in, argument[3], ERousrData.Float);
sr_buffer_write_val(in, argument[4], ERousrData.Float);
sr_buffer_write_val(in, argument_count > 5 ? argument[5] :  -1, ERousrData.Int32);
sr_buffer_write_val(in, argument_count > 6 ? argument[6] :   0, ERousrData.Int32);
if (!__imguigml_ext_call(_extImguiGML_input_float4()))
	return;

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
sr_buffer_write_val(in, argument[0]);
sr_buffer_write_val(in, argument[1], ERousrData.Int32);
sr_buffer_write_val(in, argument_count > 2 ? argument[2] :   1, ERousrData.Int32);
sr_buffer_write_val(in, argument_count > 3 ? argument[3] : 100, ERousrData.Int32);
sr_buffer_write_val(in, argument_count > 4 ? argument[4] :   0, ERousrData.Int32);

if (!__imguigml_ext_call(_extImguiGML_input_int()))
	return;

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
sr_buffer_write_val(in, argument[0]);
sr_buffer_write_val(in, argument[1], ERousrData.Int32);
sr_buffer_write_val(in, argument[2], ERousrData.Int32);
sr_buffer_write_val(in, argument_count > 3 ? argument[3] :   0, ERousrData.Int32);
if (!__imguigml_ext_call(_extImguiGML_input_int2()))
	return;

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
sr_buffer_write_val(in, argument[0]);
sr_buffer_write_val(in, argument[1], ERousrData.Int32);
sr_buffer_write_val(in, argument[2], ERousrData.Int32);
sr_buffer_write_val(in, argument[3], ERousrData.Int32);
sr_buffer_write_val(in, argument_count > 4 ? argument[4] :   0, ERousrData.Int32);
if (!__imguigml_ext_call(_extImguiGML_input_int3()))
	return;
	
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
sr_buffer_write_val(in, argument[0]);
sr_buffer_write_val(in, argument[1], ERousrData.Int32);
sr_buffer_write_val(in, argument[2], ERousrData.Int32);
sr_buffer_write_val(in, argument[3], ERousrData.Int32);
sr_buffer_write_val(in, argument[4], ERousrData.Int32);
sr_buffer_write_val(in, argument_count > 5 ? argument[5] :   0, ERousrData.Int32);
if (!__imguigml_ext_call(_extImguiGML_input_int3()))
	return;
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
sr_buffer_write_val(in, string(argument[0]));                                   
sr_buffer_write_val(in, argument_count > 1 ? argument[1] : 0.0, ERousrData.Float);
sr_buffer_write_val(in, argument_count > 2 ? argument[2] : 0.0, ERousrData.Float);
if (!__imguigml_ext_call(_extImguiGML_button()))
	return;
return buffer_read(__Imgui_out, buffer_s8) != 0;

#define imguigml_small_button
///@function imguigml_small_button(_label)
///@desc button with FramePadding=(0,0) to easily embed within text
///@param {String} _label   button label
///@returns {Boolean}
sr_buffer_write_val(__Imgui_in, string(argument[0]));                                   
if (!__imguigml_ext_call(_extImguiGML_small_button()))
	return;
return buffer_read(__Imgui_out, buffer_s8) != 0;

#define imguigml_invisible_button
///@function imguigml_invisible_button(_str_id, [_size_x=0], [_size_y=0])
///@desc ImGui::InvisibleButton()
///@param {String} _str_id       string id
///@param {Real} [_size_x=0.0]   width
///@param {Real} [_size_y=0.0]   height
///@returns {Boolean}
var in = __Imgui_in;
sr_buffer_write_val(in, string(argument[0]));                                   
sr_buffer_write_val(in, argument_count > 2 ? argument[1] : 0.0, ERousrData.Float);
sr_buffer_write_val(in, argument_count > 2 ? argument[2] : 0.0, ERousrData.Float);
if (!__imguigml_ext_call(_extImguiGML_invisible_button()))
	return;
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
var texture_id = __imguigml_texture_id(argument[0], EImGuiGML_TextureType.Texture);
__imguigml_image(texture_id, 
                  argument[1],
                  argument[2],
                  argument_count > 4  ? argument[3] : 0.0, 
                  argument_count > 4  ? argument[4] : 0.0, 
                  argument_count > 6  ? argument[5] : 1.0, 
                  argument_count > 6  ? argument[6] : 1.0, 
                  argument_count > 10 ? argument[7]  : 1.0, 
                  argument_count > 10 ? argument[8]  : 1.0, 
                  argument_count > 10 ? argument[9]  : 1.0, 
                  argument_count > 10 ? argument[10] : 1.0, 
                  argument_count > 14 ? argument[11] : 0.0, 
                  argument_count > 14 ? argument[12] : 0.0, 
                  argument_count > 14 ? argument[13] : 0.0, 
                  argument_count > 14 ? argument[14] : 0.0); 



#define imguigml_surface
///@function imguigml_surface(_surface, [width=undefined], [height=undefined], [_u0=0.0], [_v0=0.0], [_u1=1.0], [_v1=1.0], [_tint_r=1.0], [_tint_g=1.0], [_tint_b=1.0], [_tint_a=1.0], [_border_r=0.0], [_border_g=0.0], [_border_b=0.0], [_border_a=0.0])
///@desc ImGui::Image()
///@param {Real} _surface            surface
///@param {Real} [width=undefined]   width - will use surface_width if undefined
///@param {Real} [height=undefined]  height - will use surface_height if undefined
///@param {Real} [_u0=0.0]           texture u0
///@param {Real} [_v0=0.0]           texture v0
///@param {Real} [_u1=1.0]           texture u1
///@param {Real} [_v1=1.0]           texture v1
///@param {Real} [_tint_r=1.0]       tint color r
///@param {Real} [_tint_g=1.0]       tint color g
///@param {Real} [_tint_b=1.0]       tint color b
///@param {Real} [_tint_a=1.0]       tint color a
///@param {Real} [_border_r=0.0]     border color r
///@param {Real} [_border_g=0.0]     border color g
///@param {Real} [_border_b=0.0]     border color b
///@param {Real} [_border_a=0.0]     border color a
var in = __Imgui_in, argi=0,
	surface = argument[argi++],
	width = (argument_count > 1)  ? argument[argi++] : undefined,
	height = (argument_count > 2) ? argument[argi++] : undefined,
	texture_id = __imguigml_texture_id(surface, EImGuiGML_TextureType.Surface),
	_exists = surface_exists(surface);
	
if is_undefined(width)  width =  (_exists) ? surface_get_width(surface)  : 0;
if is_undefined(height) height = (_exists) ? surface_get_height(surface) : 0;


var texture_id = __imguigml_texture_id(argument[0], EImGuiGML_TextureType.Surface);
__imguigml_image(texture_id,
				  //Size 
                  width,
                  height,
				  //uv0
                  argument_count > 4  ? argument[argi++]  : 0.0, 
                  argument_count > 4  ? argument[argi++]  : 0.0, 
                  //uv1
				  argument_count > 6  ? argument[argi++]  : 1.0, 
                  argument_count > 6  ? argument[argi++]  : 1.0, 
                  //tint
				  argument_count > 10  ? argument[argi++]  : 1.0,
                  argument_count > 10  ? argument[argi++]  : 1.0, 
                  argument_count > 10  ? argument[argi++]  : 1.0, 
                  argument_count > 10  ? argument[argi++] : 1.0, 
				  //border
                  argument_count > 14 ? argument[argi++] : 0.0, 
                  argument_count > 14 ? argument[argi++] : 0.0, 
                  argument_count > 14 ? argument[argi++] : 0.0, 
                  argument_count > 14 ? argument[argi++] : 0.0); 



#define imguigml_sprite
///@function imguigml_sprite(_sprite_index, _sub_img, [_width=undefined], [_height=undefiend], [_tint_r=1.0], [_tint_g=1.0], [_tint_b=1.0], [_tint_a=1.0], [_border_r=0.0], [_border_g=0.0], [_border_b=0.0], [_border_a=0.0])
///@desc ImGui::Image()
///@param {Real} _sprite_index         sprite
///@param {Real} _sub_img              sprite_index
///@param {Real} [_width=undefined]    width will use sprite_get_width if undefined
///@param {Real} [_height=undefined]   height will use sprite_get_height if undefined
///@param {Real} [_tint_r=1.0]         tint color r
///@param {Real} [_tint_g=1.0]         tint color g
///@param {Real} [_tint_b=1.0]         tint color b
///@param {Real} [_tint_a=1.0]         tint color a
///@param {Real} [_border_r=0.0]       border color r
///@param {Real} [_border_g=0.0]       border color g
///@param {Real} [_border_b=0.0]       border color b
///@param {Real} [_border_a=0.0]       border color a
var argi = 0,
	sprite = argument[argi++],
	sub_img = argument[argi++],
	width = (argument_count > 2) ? argument[argi++] : undefined,
	height = (argument_count > 3) ? argument[argi++] : undefined,
	tintr = (argument_count > 4) ? argument[argi++] : 1.0, 
	tintg = (argument_count > 5) ? argument[argi++] : 1.0, 
	tintb = (argument_count > 6) ? argument[argi++] : 1.0, 
	tinta = (argument_count > 7) ? argument[argi++] : 1.0,
	borderr = (argument_count > 8)  ? argument[argi++] : 0,
	borderg = (argument_count > 9)  ? argument[argi++] : 0,
	borderb = (argument_count > 10) ? argument[argi++] : 0,
	bordera = (argument_count > 11) ? argument[argi++] : 0;
	
with(ImGuiGML) {
  var cached     = sr_sprite_cache_push_sprite(Sprite_cache, sprite, sub_img);
  var uvs        = sr_sprite_cache_get_uvs(Sprite_cache, cached);
  var texture_id = __imguigml_texture_id(sr_sprite_cache_get_surface(Sprite_cache, cached), EImGuiGML_TextureType.Surface);

  width  = is_undefined(width)  ? sprite_get_width(sprite)  : width;
  height = is_undefined(height) ? sprite_get_height(sprite) : height;
  
  var uv1 = uvs[0],
      uv2 = uvs[1];
			
  var u1 = uv1[0];
  var v1 = uv1[1];
  var u2 = uv2[0];
  var v2 = uv2[1];
  
	imguigml_push_id(string(sprite) + "_" + string(sub_img));
  __imguigml_image(texture_id, width, height, u1, v1, u2, v2, tintr, tintg, tintb, tinta, borderr, borderg, borderb, bordera);
	imguigml_pop_id();
}

#define imguigml_image_button
///@function imguigml_image_button(_texture_id, _size_x, _size_y, [_u0=0.0], [_v0=0.0], [_u1=1.0], [_v1=1.0], [_bg_r=0.0], [_bg_g=0.0], [_bg_b=0.0], [_bg_a=0.0], [_tint_r=1.0], [_tint_g=1.0], [_tint_b=1.0], [_tint_a=1.0])
///@desc ImGui::ImageButton()
///@param {Real} _texture_id           texture id
///@param {Real} _size_x               width
///@param {Real} _size_y               height
///@param {Real} [_u0=0.0]             texture u0
///@param {Real} [_v0=0.0]             texture v0
///@param {Real} [_u1=1.0]             texture u1
///@param {Real} [_v1=1.0]             texture v1
///@param {Real} [_frame_padding=-1]   <0 frame_padding uses default frame padding settings. 0 for no padding
///@param {Real} [_bg_r=0.0]           bg color r
///@param {Real} [_bg_g=0.0]           bg color g
///@param {Real} [_bg_b=0.0]           bg color b
///@param {Real} [_bg_a=0.0]           bg color a
///@param {Real} [_tint_r=1.0]         tint color r 
///@param {Real} [_tint_g=1.0]         tint color g
///@param {Real} [_tint_b=1.0]         tint color b
///@param {Real} [_tint_a=1.0]         tint color a
///@returns {Boolean} _pressed
var in = __Imgui_in;
var texture_id = __imguigml_texture_id(argument[0], EImGuiGML_TextureType.Texture);
return __imguigml_image_button(texture_id,
                  // Size
                  argument[1],
                  argument[2],
                  // uv0
                  argument_count > 4 ? argument[3] : 0.0, 
                  argument_count > 4 ? argument[4] : 0.0, 
                  // uv0
                  argument_count > 6 ? argument[5] : 1.0, 
                  argument_count > 6 ? argument[6] : 1.0, 
                  // frame_padding
                  argument_count > 7 ? argument[7] : -1,  
                  // bg
                  argument_count > 11 ? argument[8]  : 0.0, 
                  argument_count > 11 ? argument[9]  : 0.0, 
                  argument_count > 11 ? argument[10] : 0.0, 
                  argument_count > 11 ? argument[11] : 0.0, 
                  // tint
                  argument_count > 15 ? argument[12] : 1.0, 
                  argument_count > 15 ? argument[13] : 1.0, 
                  argument_count > 15 ? argument[14] : 1.0, 
                  argument_count > 15 ? argument[15] : 1.0);

#define imguigml_surface_button
///@function imguigml_surface_button(_surface, _size_x, _size_y, [_u0=0.0], [_v0=0.0], [_u1=1.0], [_v1=1.0], [_bg_r=0.0], [_bg_g=0.0], [_bg_b=0.0], [_bg_a=0.0], [_tint_r=1.0], [_tint_g=1.0], [_tint_b=1.0], [_tint_a=1.0])
///@desc Add an ImGui button that uses a surface for its appearance
///@param {Real} _surface              surface index
///@param {Real} [width=undefined]     width - will use surface_width if undefined
///@param {Real} [height=undefined]    height - will use surface_height if undefined
///@param {Real} [_u0=0.0]             texture u0
///@param {Real} [_v0=0.0]             texture v0
///@param {Real} [_u1=1.0]             texture u1
///@param {Real} [_v1=1.0]             texture v1
///@param {Real} [_frame_padding=-1]   <0 frame_padding uses default frame padding settings. 0 for no padding
///@param {Real} [_bg_r=0.0]           bg color r
///@param {Real} [_bg_g=0.0]           bg color g
///@param {Real} [_bg_b=0.0]           bg color b
///@param {Real} [_bg_a=0.0]           bg color a
///@param {Real} [_tint_r=1.0]         tint color r 
///@param {Real} [_tint_g=1.0]         tint color g
///@param {Real} [_tint_b=1.0]         tint color b
///@param {Real} [_tint_a=1.0]         tint color a
///@returns {Boolean} _pressed
var in = __Imgui_in, argi=0,
	surface = argument[argi++],
	width = (argument_count > 1)  ? argument[argi++] : undefined,
	height = (argument_count > 2) ? argument[argi++] : undefined,
	texture_id = __imguigml_texture_id(surface, EImGuiGML_TextureType.Surface),
	_exists = surface_exists(surface);
	
if is_undefined(width)  width =  (_exists) ? surface_get_width(surface)  : 0;
if is_undefined(height) height = (_exists) ? surface_get_height(surface) : 0;


return __imguigml_image_button(texture_id,
                   // Size
                   width,
				   height,
                   // uv0
                   argument_count > 4 ? argument[argi++] : 0.0, 
                   argument_count > 4 ? argument[argi++] : 0.0, 
                   // uv0
                   argument_count > 6 ? argument[argi++] : 1.0, 
                   argument_count > 6 ? argument[argi++] : 1.0, 
                   // frame_padding
                   argument_count > 7 ? argument[argi++] : -1,  
                   // bg
                   argument_count > 11 ? argument[argi++] : 0.0, 
                   argument_count > 11 ? argument[argi++] : 0.0, 
                   argument_count > 11 ? argument[argi++] : 0.0, 
                   argument_count > 11 ? argument[argi++] : 0.0, 
                   // tint
                   argument_count > 15 ? argument[argi++] : 1.0, 
                   argument_count > 15 ? argument[argi++] : 1.0, 
                   argument_count > 15 ? argument[argi++] : 1.0, 
                   argument_count > 15 ? argument[argi++] : 1.0);

#define imguigml_sprite_button
///@function imguigml_sprite_button(_sprite_index, _sub_img, [_width=undefined], [_height=undefiend], [_bg_r=0.0], [_bg_g=0.0], [_bg_b=0.0], [_bg_a=0.0], [_tint_r=1.0], [_tint_g=1.0], [_tint_b=1.0], [_tint_a=1.0])
///@desc ImGui::ImageButton()
///@param {Real} _sprite_index         sprite
///@param {Real} _sub_img              image_index
///@param {Real} [_width=undefined]    width will use sprite_get_width if undefined
///@param {Real} [_height=undefined]   height will use sprite_get_height if undefined
///@param {Real} [_frame_padding=-1]   <0 frame_padding uses default frame padding settings. 0 for no padding
///@param {Real} [_bg_r=0.0]           bg color r
///@param {Real} [_bg_g=0.0]           bg color g
///@param {Real} [_bg_b=0.0]           bg color b
///@param {Real} [_bg_a=0.0]           bg color a
///@param {Real} [_tint_r=1.0]         tint color r
///@param {Real} [_tint_g=1.0]         tint color g
///@param {Real} [_tint_b=1.0]         tint color b
///@param {Real} [_tint_a=1.0]         tint color a
///@returns {Boolean} _pressed
var argi = 0,
	sprite = argument[argi++],
	sub_img = argument[argi++],
	width = (argument_count > 2) ? argument[argi++] : undefined,
	height = (argument_count > 3) ? argument[argi++] : undefined,
	frame_padding = (argument_count > 4) ? argument[argi++] : -1,
	bgr = (argument_count > 5) ? argument[argi++] : 0,
	bgg = (argument_count > 6) ? argument[argi++] : 0,
	bgb = (argument_count > 7) ? argument[argi++] : 0,
	bga = (argument_count > 8) ? argument[argi++] : 0, 
	tintr = (argument_count > 9)  ? argument[argi++] : 1.0, 
	tintg = (argument_count > 10) ? argument[argi++] : 1.0, 
	tintb = (argument_count > 11) ? argument[argi++] : 1.0, 
	tinta = (argument_count > 12) ? argument[argi++] : 1.0,

if is_undefined(width) width = sprite_get_width(sprite);
if is_undefined(height) height = sprite_get_height(sprite);

var ret = false;
with(ImGuiGML) {
  var cached     = sr_sprite_cache_push_sprite(Sprite_cache, sprite, sub_img);
  var uvs        = sr_sprite_cache_get_uvs(Sprite_cache, cached);
  var texture_id = __imguigml_texture_id(sr_sprite_cache_get_surface(Sprite_cache, cached), EImGuiGML_TextureType.Surface);

  width  = is_undefined(width)  ? sprite_get_width(sprite)  : width;
  height = is_undefined(height) ? sprite_get_height(sprite) : height;
  
  var uv1 = uvs[0],
      uv2 = uvs[1];
		
  var u1 = uv1[0];
  var v1 = uv1[1];
  var u2 = uv2[0];
  var v2 = uv2[1];
  
	imguigml_push_id(string(sprite) + "_" + string(sub_img));
  ret = __imguigml_image_button(texture_id, width, height, u1, v1, u2, v2, frame_padding, bgr, bgg, bgb, bga, tintr, tintg, tintb, tinta);
	imguigml_pop_id();
}

return ret;

#define imguigml_checkbox
///@function imguigml_checkbox(_label, _val)
///@desc ImGui::Checkbox()
///@param {String}  _label    button label
///@param {Boolean} _val      checked    
///@returns {Array: [_changed, _val] } checked
var in = __Imgui_in;
sr_buffer_write_val(in, string(argument[0]));                                   
sr_buffer_write_val(in, argument[1], ERousrData.Int8);
if (!__imguigml_ext_call(_extImguiGML_checkbox()))
	return;
var out = __Imgui_out;
var ret = array_create(2);
ret[@ 0] = buffer_read(out, buffer_s8) != 0;
ret[@ 1] = buffer_read(out, buffer_s8) != 0;
return ret;

#define imguigml_checkbox_flags
///@function imguigml_checkbox_flags(_label, _flags, _flag_val)
///@desc Show a checkbox with multiple flags
///@param {String}  _label     button label
///@param {Real}    _flags     check flags
///@param {Real}    _flag_val  current value of flags
///@returns {Real} _flags result
var in = __Imgui_in;
sr_buffer_write_val(in, string(argument[0]));                                   
sr_buffer_write_val(in, argument[1], ERousrData.Uint32);
sr_buffer_write_val(in, argument[2], ERousrData.Uint32);
if (!__imguigml_ext_call(_extImguiGML_checkbox_flags()))
	return;
var out = __Imgui_out;
var ret = array_create(2);
ret[@ 0] = buffer_read(out, buffer_s8) != 0;
ret[@ 1] = buffer_read(out, buffer_u32) != 0;
return ret;

#define imguigml_radio_button
///@function imguigml_radio_button(_label, [_activeOrVal], [_current_val])
///@desc Show a radio button (multiple choice, single answer)
///@param {String}  _label        button label
///@param {Real}    _activeOrVal  radio button value, or if this is checked
///@param {Real}    _current_val  current value of radio buttons
///@returns {Real} val result if _current_val passed
var in = __Imgui_in;
sr_buffer_write_val(in, string(argument[0]));                                   

if (argument_count == 2) {
  sr_buffer_write_val(in, argument[1] ? 1 : 0, ERousrData.Int8);
  if (!__imguigml_ext_call(_extImguiGML_radio_button()))
		return;
} else if (argument_count == 3) {
  sr_buffer_write_val(in, argument[1], ERousrData.Int32);
  sr_buffer_write_val(in, argument[2], ERousrData.Int32);
  if (!__imguigml_ext_call(_extImguiGML_radio_button()))
		return;	
  return buffer_read(__Imgui_out, buffer_s32);
} 

#define imguigml_plot_lines
///@function imguigml_plot_lines(_label, _values, [_values_offset=0], [_overlay=undefined], [_scale_min=undefined], [_scale_max=undefined], [_graph_size_x=0], [_graph_size_y=0], [_stride=sizeof(float)]
///@desc Plots a line graph, index as x axis values for y
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

sr_buffer_write_val(in, _label);
sr_buffer_write_val(in, num_items, ERousrData.Int32);
var i = 0; repeat(num_items) sr_buffer_write_val(in, _items[i++], ERousrData.Float);
sr_buffer_write_val(in, _values_offset, ERousrData.Int32);
sr_buffer_write_val(in, _overlay   == undefined ? 0 : _overlay,   _overlay   == undefined ? ERousrData.Int8 : ERousrData.String);
sr_buffer_write_val(in, _scale_min == undefined ? 0 : _scale_min, _scale_min == undefined ? ERousrData.Int8 : ERousrData.Float);
sr_buffer_write_val(in, _scale_max == undefined ? 0 : _scale_max, _scale_max == undefined ? ERousrData.Int8 : ERousrData.Float);
sr_buffer_write_val(in, _graph_size_x, ERousrData.Float);
sr_buffer_write_val(in, _graph_size_y, ERousrData.Float);
sr_buffer_write_val(in, _stride,       ERousrData.Float);
__imguigml_ext_call(_extImguiGML_plot_lines());

#define imguigml_plot_histogram
///@function imguigml_plot_histogram(_label, _values, [_values_offset=0], [_overlay=undefined], [_scale_min=undefined], [_scale_max=undefined], [_graph_size_x=0], [_graph_size_y=0], [_stride=sizeof(float)]
///@desc Plots a histogram.
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

sr_buffer_write_val(in, _label);
sr_buffer_write_val(in, num_items, ERousrData.Int32);
var i = 0; repeat(num_items) sr_buffer_write_val(in, _items[i++], ERousrData.Float);
sr_buffer_write_val(in, _values_offset, ERousrData.Int32);
sr_buffer_write_val(in, _overlay   == undefined ? 0 : _overlay,   _overlay   == undefined ? ERousrData.Int8 : ERousrData.String);
sr_buffer_write_val(in, _scale_min == undefined ? 0 : _scale_min, _scale_min == undefined ? ERousrData.Int8 : ERousrData.Float);
sr_buffer_write_val(in, _scale_max == undefined ? 0 : _scale_max, _scale_max == undefined ? ERousrData.Int8 : ERousrData.Float);
sr_buffer_write_val(in, _graph_size_x, ERousrData.Float);
sr_buffer_write_val(in, _graph_size_y, ERousrData.Float);
sr_buffer_write_val(in, _stride,       ERousrData.Float);
__imguigml_ext_call(_extImguiGML_plot_histogram());

#define imguigml_progress_bar
///@function imguigml_progress_bar(_fraction, [_size_x=-1.0], [_size_y=0.0], [_overlay])
///@desc
///@param {String} _fraction
///@param {Real}   [_size_x=-1.0]              < 0.0f: align to end, 0.0f: auto, > 0.0f: specified size
///@param {Real}   [_size_y=0.0]               < 0.0f: align to end, 0.0f: auto, > 0.0f: specified size
///@param {String} [_overlay=undefined]
var in = __Imgui_in;
sr_buffer_write_val(in, argument[0], ERousrData.Float);
sr_buffer_write_val(in, argument_count > 2 ? argument[1] : -1.0, ERousrData.Float);
sr_buffer_write_val(in, argument_count > 2 ? argument[2] :  0.0, ERousrData.Float);
if (argument_count > 3 && is_string(argument[3]))
  sr_buffer_write_val(in, argument[3]);

__imguigml_ext_call(_extImguiGML_progress_bar());

#define __imguigml_image
///@function __imguigml_image(_texture_id, _size_x, _size_y, [_u0=0.0], [_v0=0.0], [_u1=1.0], [_v1=1.0], [_tint_r=1.0], [_tint_g=1.0], [_tint_b=1.0], [_tint_a=1.0], [_border_r=0.0], [_border_g=0.0], [_border_b=0.0], [_border_a=0.0])
///@desc internal imguigml  call to draw an image using the `_texture_id` texture
///@param {Real} _texture_id       texture id is a generated id from __imguigml_texture_id
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
///@extensionizer { "docs": false }
var in = __Imgui_in, argi = 0;
sr_buffer_write_val(in, argument[argi++], ERousrData.Uint32);

// Size
sr_buffer_write_val(in, argument[argi++], ERousrData.Float);
sr_buffer_write_val(in, argument[argi++], ERousrData.Float);

// uv0
sr_buffer_write_val(in, argument_count > argi ? argument[argi] : 0.0, ERousrData.Float); ++argi;
sr_buffer_write_val(in, argument_count > argi ? argument[argi] : 0.0, ERousrData.Float); ++argi;

// uv1
sr_buffer_write_val(in, argument_count > argi ? argument[argi] : 1.0, ERousrData.Float); ++argi;
sr_buffer_write_val(in, argument_count > argi ? argument[argi] : 1.0, ERousrData.Float); ++argi;

// tint
sr_buffer_write_val(in, argument_count > argi ? argument[argi] : 1.0, ERousrData.Float); ++argi;
sr_buffer_write_val(in, argument_count > argi ? argument[argi] : 1.0, ERousrData.Float); ++argi;
sr_buffer_write_val(in, argument_count > argi ? argument[argi] : 1.0, ERousrData.Float); ++argi;
sr_buffer_write_val(in, argument_count > argi ? argument[argi] : 1.0, ERousrData.Float); ++argi;

// border
sr_buffer_write_val(in, argument_count > argi ? argument[argi] : 0.0, ERousrData.Float);
sr_buffer_write_val(in, argument_count > argi ? argument[argi] : 0.0, ERousrData.Float);
sr_buffer_write_val(in, argument_count > argi ? argument[argi] : 0.0, ERousrData.Float);
sr_buffer_write_val(in, argument_count > argi ? argument[argi] : 0.0, ERousrData.Float);

__imguigml_ext_call(_extImguiGML_image());

#define __imguigml_image_button
///@function imguigml_image_button(_texture_id, _size_x, _size_y, [_u0=0.0], [_v0=0.0], [_u1=1.0], [_v1=1.0], [_tint_r=1.0], [_tint_g=1.0], [_tint_b=1.0], [_tint_a=1.0], [_border_r=0.0], [_border_g=0.0], [_border_b=0.0], [_border_a=0.0])
///@desc Add a button using the texture stored at `_texture_id` for the appearance
///@param {Real} _texture_id           texture id
///@param {Real} _size_x               width
///@param {Real} _size_y               height
///@param {Real} [_u0=0.0]             texture u0
///@param {Real} [_v0=0.0]             texture v0
///@param {Real} [_u1=1.0]             texture u1
///@param {Real} [_v1=1.0]             texture v1
///@param {Real} [_frame_padding=-1]   <0 frame_padding uses default frame padding settings. 0 for no padding
///@param {Real} [_bg_r=0.0]           backgruond color r
///@param {Real} [_bg_g=0.0]           backgruond color g
///@param {Real} [_bg_b=0.0]           backgruond color b
///@param {Real} [_bg_a=0.0]           backgruond color a
///@param {Real} [_tint_r=1.0]         tint color r 
///@param {Real} [_tint_g=1.0]         tint color g
///@param {Real} [_tint_b=1.0]         tint color b
///@param {Real} [_tint_a=1.0]         tint color a
///@returns {Boolean} _pressed
///@extensionizer { "docs": false }
var in = __Imgui_in;
sr_buffer_write_val(in, argument[0], ERousrData.Uint32);

// Size
sr_buffer_write_val(in, argument[1], ERousrData.Float);
sr_buffer_write_val(in, argument[2], ERousrData.Float);

// uv0
sr_buffer_write_val(in, argument_count > 4 ? argument[3] : 0.0, ERousrData.Float);
sr_buffer_write_val(in, argument_count > 4 ? argument[4] : 0.0, ERousrData.Float);

// uv0
sr_buffer_write_val(in, argument_count > 6 ? argument[5] : 1.0, ERousrData.Float);
sr_buffer_write_val(in, argument_count > 6 ? argument[6] : 1.0, ERousrData.Float);

// frame_padding
sr_buffer_write_val(in, argument_count > 7 ? argument[7] : -1, ERousrData.Int32);

// bg
sr_buffer_write_val(in, argument_count > 11 ? argument[8]  : 0.0, ERousrData.Float);
sr_buffer_write_val(in, argument_count > 11 ? argument[9]  : 0.0, ERousrData.Float);
sr_buffer_write_val(in, argument_count > 11 ? argument[10] : 0.0, ERousrData.Float);
sr_buffer_write_val(in, argument_count > 11 ? argument[11] : 0.0, ERousrData.Float);
  
// tint
sr_buffer_write_val(in, argument_count > 15 ? argument[12] : 1.0, ERousrData.Float);
sr_buffer_write_val(in, argument_count > 15 ? argument[13] : 1.0, ERousrData.Float);
sr_buffer_write_val(in, argument_count > 15 ? argument[14] : 1.0, ERousrData.Float);
sr_buffer_write_val(in, argument_count > 15 ? argument[15] : 1.0, ERousrData.Float);

if (!__imguigml_ext_call(_extImguiGML_image_button()))
	return;
return buffer_read(__Imgui_out, buffer_s8) != 0;

#define imguigml_text
///@function imguigml_text(_text)
///@desc simple formatted text
///@param {String} _text
var buff = __imguigml_wrapper_buffer();
sr_buffer_write_val(buff, string(argument[0]));
__imguigml_ext_call(_extImguiGML_text());

#define imguigml_text_colored
///@function imguigml_text_colored(_r, _g, _b, _a, _text)
///@desc shortcut for PushStyleColor(ImGuiCol_Text, style.Colors[ImGuiCol_TextDisabled]); Text(fmt, ...); PopStyleColor();
///@param {Real} _r
///@param {Real} _g
///@param {Real} _b
///@param {Real} _a
///@param {String} _text
var buff = __imguigml_wrapper_buffer();
sr_buffer_write_val(buff, argument[0], ERousrData.Float);
sr_buffer_write_val(buff, argument[1], ERousrData.Float);
sr_buffer_write_val(buff, argument[2], ERousrData.Float);
sr_buffer_write_val(buff, argument[3], ERousrData.Float);
sr_buffer_write_val(buff, string(argument[4]));
__imguigml_ext_call(_extImguiGML_text_colored());

#define imguigml_text_disabled
///@function imguigml_text_disabled(_text)
///@desc shortcut for PushStyleColor(ImGuiCol_Text, style.Colors[ImGuiCol_TextDisabled]); Text(fmt, ...); PopStyleColor();
///@param {String} _text
var buff = __imguigml_wrapper_buffer();
sr_buffer_write_val(buff, string(argument[0]));
__imguigml_ext_call(_extImguiGML_text_disabled());

#define imguigml_text_wrapped
///@function imguigml_text_wrapped(_text)
///@desc shortcut for `imguigml_push_text_wrap_pos(0.0f); imguigml_text(_text); imguigml_pop_text_wrap_pos();`. 
///@param {String} _text
///@Note: this won't work on an auto-resizing window if there's no other widgets to 
//         extend the window width, you may need to set a size using `imguigml_set_next_window_size()`
var buff = __imguigml_wrapper_buffer();
sr_buffer_write_val(buff, string(argument[0]));
__imguigml_ext_call(_extImguiGML_text_wrapped());

#define imguigml_label_text
///@function imguigml_label_text(_label, _text)
///@desc display text+label aligned the same way as value+label widgets
///@param {String} _label
///@param {String} _text
var buff = __imguigml_wrapper_buffer();
sr_buffer_write_val(buff, string(argument[0]));
sr_buffer_write_val(buff, string(argument[1]));
__imguigml_ext_call(_extImguiGML_label_text());


#define imguigml_bullet_text
///@function imguigml_bullet_text(_text)
///@desc shortcut for Bullet()+Text()
///@param {String} _text
var buff = __imguigml_wrapper_buffer();
sr_buffer_write_val(buff, string(argument[0]));
__imguigml_ext_call(_extImguiGML_bullet_text());

#define imguigml_bullet
///@function imguigml_bullet()
///@desc draw a small circle and keep the cursor on the same line. 
///       advance cursor x position by GetTreeNodeToLabelSpacing(), same distance that TreeNode() uses
__imguigml_ext_call(_extImguiGML_bullet());

#define imguigml_tree_node
///@function imguigml_tree_node(_labelOrId)
///@desc begin a tree node
///@param {String|Real} _labelOrId   a label or id to use - used as id if passed real
///@returns {Boolean} if returning 'true' the node is open and the tree id is pushed into the id stack. user is responsible for calling TreePop().
var in = __Imgui_in;
var _id = argument[0];
if (is_real(_id) || is_int32(_id) || is_int64(_id)) sr_buffer_write_val(in, _id, ERousrData.Int32);
else                                                sr_buffer_write_val(in, string(_id));
if (!__imguigml_ext_call(_extImguiGML_tree_node()))
	return;
var out = __Imgui_out;
return buffer_read(out, buffer_s8) != 0;;

#define imguigml_tree_node_ex
///@function imguigml_tree_node_ex(_labelOrId, [_flags=0])
///@desc begin a tree node
///@param {String|Real}               _labelOrId   a label or id to use - used as id if passed real
///@param {Real:EImGui_TreeNodeFlags} [_flags=0]
///@returns {Boolean} if returning 'true' the node is open and the tree id is pushed into the id stack. user is responsible for calling TreePop().
var in = __Imgui_in;
var _id = argument[0];
var _flags = argument_count > 1 ? argument[1] : 0;
if (is_real(_id) || is_int32(_id) || is_int64(_id)) sr_buffer_write_val(in, _id, ERousrData.Int32);
else                                                sr_buffer_write_val(in, string(_id));
sr_buffer_write_val(in, _flags, ERousrData.Int32);
if (!__imguigml_ext_call(_extImguiGML_tree_node_ex()))
	return;
var out = __Imgui_out;
return buffer_read(out, buffer_s8) != 0;;

#define imguigml_tree_push
///@function imguigml_tree_push(_labelOrId)
///@desc Indent()+PushId(). Already called by TreeNode() when returning true, but you can call Push/Pop yourself for layout purpose
///@param {String|Real} _labelOrId   a label or id to use - used as id if passed real
var in = __Imgui_in;
var _id = argument[0];
var _flags = argument_count > 1 ? argument[1] : 0;
if (is_real(_id) || is_int32(_id) || is_int64(_id)) sr_buffer_write_val(in, _id, ERousrData.Int32);
else                                                sr_buffer_write_val(in, string(_id));
__imguigml_ext_call(_extImguiGML_tree_push());

#define imguigml_tree_pop
///@function imguigml_tree_pop()
///@desc ~ Unindent()+PopId()
__imguigml_ext_call(_extImguiGML_tree_pop());

#define imguigml_tree_advance_to_label_pos
///@function imguigml_tree_advance_to_label_pos
///@desc advance cursor x position by GetTreeNodeToLabelSpacing()
__imguigml_ext_call(_extImguiGML_tree_advance_to_label_pos());

#define imguigml_get_tree_node_to_label_spacing
///@function imguigml_get_tree_node_to_label_spacing()
///@des horizontal distance preceding label when using TreeNode*() or Bullet() == (g.FontSize + style.FramePadding.x*2) for a regular unframed TreeNode
///@returns {Real}
if (!__imguigml_ext_call(_extImguiGML_get_tree_node_to_label_spacing()))
	return;
return buffer_read(__Imgui_out, buffer_f32);

#define imguigml_set_next_tree_node_open
///@function imguigml_set_next_tree_node_open(_is_open, [_cond=0])
///@desc set next TreeNode/CollapsingHeader open state.
///@param {Boolean} _is_open
///@param {Real:EImGui_Cond} [_cond=0]
var in = __Imgui_in;
sr_buffer_write_val(in, argument[0] ? 1 : 0, ERousrData.Int8);
sr_buffer_write_val(in, argument_count > 1 ? argument[1] : 0, ERousrData.Int32);
if (!__imguigml_ext_call(_extImguiGML_set_next_tree_node_open()))
	return;

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

sr_buffer_write_val(in, _label);
sr_buffer_write_val(in, _open == undefined ? 0 : _open, _open == undefined ? ERousrData.Float : ERousrData.Int8);
sr_buffer_write_val(in, _flags, ERousrData.Int32);

if (!__imguigml_ext_call(_extImguiGML_collapsing_header()))
	return;
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
///@returns {Array:[_expanded, [_open]]}
var in = __Imgui_in;
var _name  = argument[0],
    _open  = argument_count > 1 ? argument[1] : undefined,
    _flags = argument_count > 2 ? argument[2] : 0;

if (_open != undefined) _open = _open ? 1 : 0;

sr_buffer_write_val(in, _name);
sr_buffer_write_val(in, _open == undefined ? 0 : _open, _open == undefined ? ERousrData.Float : ERousrData.Int8);
sr_buffer_write_val(in, _flags, ERousrData.Int32);

if (!__imguigml_ext_call(_extImguiGML_begin()))
	return;
var out = __Imgui_out;
var ret = [ buffer_read(out, buffer_s8) != 0 ];
if (_open != undefined)
  ret[@ 1] = buffer_read(out, buffer_s8) != 0;

return ret;

#define imguigml_end
///@function imguigml_end()
///@desc ImGui::End()
__imguigml_ext_call(_extImguiGML_end());

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
sr_buffer_write_val(in, argument[0], is_string(argument[0]) ? ERousrData.String : ERousrData.Uint32);
sr_buffer_write_val(in, argument_count > 1 ? argument[1] : 0, ERousrData.Float);
sr_buffer_write_val(in, argument_count > 2 ? argument[2] : 0, ERousrData.Float);
sr_buffer_write_val(in, argument_count > 3 ? argument[3] : 0, ERousrData.Int8);
sr_buffer_write_val(in, argument_count > 4 ? argument[4] : 0, ERousrData.Int32);
if (!__imguigml_ext_call(_extImguiGML_begin_child()))
	return;
var out = __Imgui_out;
return buffer_read(out, buffer_s8) != 0;

#define imguigml_end_child
///@function imguigml_end_child()
///@desc end a scrolling region
__imguigml_ext_call(_extImguiGML_end_child());

#define imguigml_get_content_region_max
///@function imguigml_get_content_region_max()
///@desc current content boundaries (typically window boundaries including scrolling, or current column boundaries), in windows coordinates
///@returns {Array:EPos2D} boundaries
if (!__imguigml_ext_call(_extImguiGML_get_content_region_max()))
	return;
var out = __Imgui_out;
var ret = array_create(2);
ret[@ 0] = buffer_read(out, buffer_f32);
ret[@ 1] = buffer_read(out, buffer_f32);
return ret;

#define imguigml_get_content_region_avail
///@function imguigml_get_content_region_avail
///@desc == GetContentRegionMax() - GetCursorPos()
///@returns {Array:EPos2D} region
if (!__imguigml_ext_call(_extImguiGML_get_content_region_avail()))
	return;
var out = __Imgui_out;
var ret = array_create(2);
ret[@ 0] = buffer_read(out, buffer_f32);
ret[@ 1] = buffer_read(out, buffer_f32);
return ret;

#define imguigml_get_content_region_avail_width
///@function imguigml_get_content_region_avail_width
///@desc get available width
///@returns {Real} width
if (!__imguigml_ext_call(_extImguiGML_get_content_region_avail_width()))
	return;
return buffer_read(__Imgui_out, buffer_f32);

#define imguigml_get_window_content_region_min
///@function imguigml_get_window_content_region_min
///@desc content boundaries min (roughly (0,0)-Scroll), in window coordinates
///@returns {Array:EPos2D} region
//if (!__imguigml_ext_call(_extImguiGML_();
if (!__imguigml_ext_call(_extImguiGML_get_window_content_region_min()))
	return;
var out = __Imgui_out;
var ret = array_create(2);
ret[@ 0] = buffer_read(out, buffer_f32);
ret[@ 1] = buffer_read(out, buffer_f32);
return ret;

#define imguigml_get_window_content_region_max
///@function imguigml_get_window_content_region_max
///@desc content boundaries max (roughly (0,0)+Size-Scroll) where Size can be override with SetNextWindowContentSize(), in window coordinates
///@returns {Array:EPos2D}
if (!__imguigml_ext_call(_extImguiGML_get_window_content_region_max()))
	return;
var out = __Imgui_out;
var ret = array_create(2);
ret[@ 0] = buffer_read(out, buffer_f32);
ret[@ 1] = buffer_read(out, buffer_f32);
return ret;

#define imguigml_get_window_content_region_width
///@function imguigml_get_window_content_region_width
///@desc content width in windows coordinates
///@returns {Real} content width
if (!__imguigml_ext_call(_extImguiGML_get_window_content_region_width()))
	return;
return buffer_read(__Imgui_out, buffer_f32);

#define imguigml_get_window_pos
///@function imguigml_get_window_pos
///@desc get current window position in screen space (useful if you want to do your own drawing via the DrawList api)
///@returns {Array:EPos2D} window pos
if (!__imguigml_ext_call(_extImguiGML_get_window_pos()))
	return;
	
var out = __Imgui_out;
var ret = array_create(2);
ret[@ 0] = buffer_read(out, buffer_f32);
ret[@ 1] = buffer_read(out, buffer_f32);
return ret;

#define imguigml_get_window_size
///@function imguigml_get_window_size
///@desc get current window size
///@returns {Array:E2D} size
if (!__imguigml_ext_call(_extImguiGML_get_window_size()))
	return;
var out = __Imgui_out;
var ret = array_create(2);
ret[@ 0] = buffer_read(out, buffer_f32);
ret[@ 1] = buffer_read(out, buffer_f32);
return ret;

#define imguigml_get_window_width
///@function imguigml_get_window_width
///@desc get current window width
///@returns {Real} width
if (!__imguigml_ext_call(_extImguiGML_get_window_width()))
	return;
return buffer_read(__Imgui_out, buffer_f32);

#define imguigml_get_window_height
///@function imguigml_get_window_height
///@desc get current window height
///@returns {Real} height
if (!__imguigml_ext_call(_extImguiGML_get_window_height()))
	return;
return buffer_read(__Imgui_out, buffer_f32);

#define imguigml_is_window_collapsed
///@function imguigml_is_window_collapsed()
///@desc is current window collapsed
///@returns {Boolean} is current window collapsed
if (!__imguigml_ext_call(_extImguiGML_is_window_collapsed()))
	return;
return buffer_read(__Imgui_out, buffer_s8) == 1;


#define imguigml_is_window_appearing
///@function imguigml_is_window_appearing()
///@desc is current window appearing
///@returns {Boolean} is current window appearing
if (!__imguigml_ext_call(_extImguiGML_is_window_appearing()))
	return;
return buffer_read(__Imgui_out, buffer_s8) == 1;


#define imguigml_set_window_font_scale
///@function imguigml_set_window_font_scale(_scale)
///@desc per-window font scale. Adjust IO.FontGlobalScale if you want to scale all windows
///@param {Real} _scale   font scale for this window
var buff = __imguigml_wrapper_buffer();
sr_buffer_write_val(buff, argument[0], ERousrData.Float);
__imguigml_ext_call(_extImguiGML_set_window_font_scale());

#define imguigml_set_next_window_pos
///@function imguigml_set_next_window_pos(_pos_x, _pos_y, [_cond=0], [_pivot_x=0], [_pivot_y=0])
///@desc set next window position. call before Begin(). use pivot=(0.5f,0.5f) to center on given point, etc.
///@param {Real}             _x          pos x
///@param {Real}             _y          pos y
///@param {Real:EImGui_Cond} [_cond=0]   condition for setting (not a bit flag)
///@param {Real} [_pivot_x = 0]          used to center on a point
///@param {Real} [_pivot_y = 0]          used to center on a point
var in = __Imgui_in;
sr_buffer_write_val(in,                      argument[0],       ERousrData.Float);
sr_buffer_write_val(in,                      argument[1],       ERousrData.Float);
sr_buffer_write_val(in, argument_count > 2 ? argument[2] : 0,   ERousrData.Int32);
sr_buffer_write_val(in, argument_count > 4 ? argument[3] : 0.0, ERousrData.Float);
sr_buffer_write_val(in, argument_count > 4 ? argument[4] : 0.0, ERousrData.Float);

__imguigml_ext_call(_extImguiGML_set_next_window_pos());

#define imguigml_set_next_window_size
///@function imguigml_set_next_window_size(_size_x, _size_y, [_cond=0])
///@desc set next window size. set axis to 0.0f to force an auto-fit on this axis. call before Begin()
///@param {Real}             _x          size x
///@param {Real}             _y          size y
///@param {Real:EImGui_Cond} [_cond=0]   condition for setting (not a bit flag)
var in = __Imgui_in;
sr_buffer_write_val(in,                      argument[0],       ERousrData.Float);
sr_buffer_write_val(in,                      argument[1],       ERousrData.Float);
sr_buffer_write_val(in, argument_count > 2 ? argument[2] : 0,   ERousrData.Int32);

__imguigml_ext_call(_extImguiGML_set_next_window_size());

#define imguigml_set_next_window_size_constraints
///@function imguigml_set_next_window_size_constraints(_min_size_x, _min_size_y, _max_size_x, _max_size_y)
///@desc set next window size limits. use -1,-1 on either X/Y axis to preserve the current size. 
///@param {Real}             _min_x      min size x
///@param {Real}             _min_y      min size y
///@param {Real}             _max_x      max size x
///@param {Real}             _max_y      max size y
///@param {Real:EImGui_Cond} [_cond=0]   condition for setting (not a bit flag)
var buff = __imguigml_wrapper_buffer();
sr_buffer_write_val(buff, argument[0], ERousrData.Float);
sr_buffer_write_val(buff, argument[1], ERousrData.Float);
sr_buffer_write_val(buff, argument[2], ERousrData.Float);
sr_buffer_write_val(buff, argument[3], ERousrData.Float);
__imguigml_ext_call(_extImguiGML_set_next_window_size_constraints());

#define imguigml_set_next_window_content_size
///@function imguigml_set_next_window_content_size(_size_x, _size_y)
///@desc set next window content size (enforce the range of scrollbars). set axis to 0.0f to leave it automatic. call before Begin()
///@param {Real} _size_x   width
///@param {Real} _size_y   height
var buff = __imguigml_wrapper_buffer();
sr_buffer_write_val(buff, argument[0], ERousrData.Float);
sr_buffer_write_val(buff, argument[1], ERousrData.Float);
__imguigml_ext_call(_extImguiGML_set_next_window_content_size());


#define imguigml_set_next_window_collapsed
///@function imguigml_set_next_window_collapsed(_collapsed, [_cond=0])
///@desc set next window collapsed state. call before Begin()
///@param {Boolean} _collapsed           true if collapsed
///@param {Real:EImGui_Cond} [_cond=0]   condition for setting (not a bit flag)
var buff = __imguigml_wrapper_buffer();
sr_buffer_write_val(buff, argument[0] ? 1 : 0, ERousrData.Int8);
sr_buffer_write_val(buff, argument_count > 1 ? argument[1] : 0, ERousrData.Int32);
__imguigml_ext_call(_extImguiGML_set_next_window_collapsed());

#define imguigml_set_next_window_focus
///@function imguigml_set_next_window_focus()
///@desc set next window to be focused / front-most. call before Begin()
if (!__imguigml_ext_call(_extImguiGML_set_next_window_focus()))
	return;

#define imguigml_set_window_pos
///@function imguigml_set_window_pos(_name, _pos_x, _pos_y, [_cond=0])
///@desc set named window position.
///@param {String} _name                 name
///@param {Real}   _pos_x          pos x
///@param {Real}   _pos_y          pos y
///@param {Real:EImGui_Cond} [_cond=0]   condition for setting (not a bit flag)
var buff = __imguigml_wrapper_buffer();
sr_buffer_write_val(buff,                      argument[0]);
sr_buffer_write_val(buff,                      argument[1],     ERousrData.Float);
sr_buffer_write_val(buff,                      argument[2],     ERousrData.Float);
sr_buffer_write_val(buff, argument_count > 3 ? argument[3] : 0, ERousrData.Int32);
if (!__imguigml_ext_call(_extImguiGML_set_window_pos()))
	return;

#define imguigml_set_window_size
///@function imguigml_set_window_size(_name, _size_x, _size_y, [_cond=0])
///@desc  set named window size. set axis to 0.0f to force an auto-fit on this axis.
///@param {String} _name                 name
///@param {Real}   _size_x               size x
///@param {Real}   _size_y               size y
///@param {Real:EImGui_Cond} [_cond=0]   condition for setting (not a bit flag)
var in = __Imgui_in;
sr_buffer_write_val(in,                      argument[0]);
sr_buffer_write_val(in,                      argument[1],     ERousrData.Float);
sr_buffer_write_val(in,                      argument[2],     ERousrData.Float);
sr_buffer_write_val(in, argument_count > 3 ? argument[3] : 0, ERousrData.Int32);
__imguigml_ext_call(_extImguiGML_set_window_size());

#define imguigml_set_window_collapsed
///@function imguigml_set_window_collapsed(_name, _collapsed, [_cond=0])
///@desc set named window collapsed state
///@param {String} _name                 name
///@param {Boolean} _collapsed           true if collapsed
///@param {Real:EImGui_Cond} [_cond=0]   condition for setting (not a bit flag)
var in = __Imgui_in;
sr_buffer_write_val(in, argument[0]);
sr_buffer_write_val(in, argument[1] ? 1 : 0, ERousrData.Int8);
sr_buffer_write_val(in, argument_count > 2 ? argument[2] : 0, ERousrData.Int32);
__imguigml_ext_call(_extImguiGML_set_window_collapsed());

#define imguigml_set_window_focus
///@function imguigml_set_window_focus(_name)
///@desc set named window to be focused / front-most. use NULL to remove focus.
///@param {String} _name   named window
var in = __Imgui_in;
sr_buffer_write_val(in, string(argument[0]));
__imguigml_ext_call(_extImguiGML_set_window_focus());

#define imguigml_get_scroll_x
///@function imguigml_get_scroll_x()
///@desc get scrolling amount [0..GetScrollMaxX()]
///@returns {Real} [0..GetScrollMaxX()]
if (!__imguigml_ext_call(_extImguiGML_get_scroll_x()))
	return;
return buffer_read(__Imgui_out, buffer_f32);

#define imguigml_get_scroll_y
///@function imguigml_get_scroll_y()
///@desc get scrolling amount [0..GetScrollMaxY()]
///@returns {Real} [0..GetScrollMaxY()]
if (!__imguigml_ext_call(_extImguiGML_get_scroll_y()))
	return;
return buffer_read(__Imgui_out, buffer_f32);

#define imguigml_get_scroll_max_x
///@function imguigml_get_scroll_max_x()
///@desc get maximum scrolling amount ~~ ContentSize.X - WindowSize.X
///@returns {Real} scrolling amount ~~ ContentSize.X - WindowSize.X
if (!__imguigml_ext_call(_extImguiGML_get_scroll_max_x()))
	return;
return buffer_read(__Imgui_out, buffer_f32);

#define imguigml_get_scroll_max_y
///@function imguigml_get_scroll_max_y()
///@desc get maximum scrolling amount ~~ ContentSize.Y - WindowSize.Y
///@returns {Real} scrolling amount ~~ ContentSize.Y - WindowSize.Y
if (!__imguigml_ext_call(_extImguiGML_get_scroll_max_y()))
	return;
return buffer_read(__Imgui_out, buffer_f32);

#define imguigml_set_scroll_x
///@function imguigml_set_scroll_x(_scroll_x)
///@desc set scrolling amount [0..GetScrollMaxX()]
///@param {Real} _scroll_x   0..GetScrollMaxX()
var buff = __imguigml_wrapper_buffer();
sr_buffer_write_val(buff, argument[0], ERousrData.Float);
__imguigml_ext_call(_extImguiGML_set_scroll_x());

#define imguigml_set_scroll_y
///@function imguigml_set_scroll_y(_scroll_y)
///@desc set scrolling amount [0..GetScrollMaxY()]
///@param {Real} _scroll_y   0..GetScrollMaxY()
var in = __Imgui_in;
sr_buffer_write_val(in, argument[0], ERousrData.Float);
if (!__imguigml_ext_call(_extImguiGML_set_scroll_y()))
	return;

#define imguigml_set_scroll_here
///@function imguigml_set_scroll_here([_center_y_ratio=0.0])
///@desc  adjust scrolling amount to make current cursor position visible. 
///@param {Real} [_center_y_ratio=0.0]  top, 0.5: center, 1.0: bottom.
var buff = __imguigml_wrapper_buffer();
sr_buffer_write_val(buff, argument_count > 0 ? argument[0] : 0.0, ERousrData.Float);
if (!__imguigml_ext_call(_extImguiGML_set_scroll_here()))
	return;

#define imguigml_set_scroll_from_pos_y
///@function imguigml_set_scroll_from_pos_y(_pos_y, [_center_y_ratio=0.5])
///@desc adjust scrolling amount to make given position valid. use GetCursorPos() or GetCursorStartPos()+offset to get valid positions.
///@param {Real} [_center_y_ratio=0.0]  top, 0.5: center, 1.0: bottom.
var buff = __imguigml_wrapper_buffer();
sr_buffer_write_val(buff, argument[0], ERousrData.Float);
sr_buffer_write_val(buff, argument_count > 1 ? argument[1] : 0.0, ERousrData.Float);
__imguigml_ext_call(_extImguiGML_set_scroll_from_pos_y());

#define imguigml_set_keyboard_focus_here
///@function imguigml_set_keyboard_focus_here([_offset=0])
///@desc focus keyboard on the next widget. 
///@param {Real} [_offset]   Use positive 'offset' to access sub components of a multiple component widget. Use -1 to access previous widget.
sr_buffer_write_val(__Imgui_in, argument_count > 0 ? argument[0] : 0, ERousrData.Int32);
__imguigml_ext_call(_extImguiGML_set_keyboard_focus_here());

#define imguigml_set_state_storage
///@function imguigml_set_state_storage(_tree)
///@desc replace tree state storage with our own (if you want to manipulate it yourself, typically clear subsection of it)
///@param {*} _tree   todo: implement

//var buff = __imguigml_wrapper_buffer();
//sr_buffer_write_val(buff, <something>, <something);
//if (!__imguigml_ext_call(_extImguiGML_set_state_storage();

// todo: implement

#define imguigml_get_state_storage
///@function imguigml_get_state_storage(_tree)
///@desc replace tree state storage with our own (if you want to manipulate it yourself, typically clear subsection of it)
///@param {*} _tree   todo: implement

//if (!__imguigml_ext_call(_extImguiGML_get_state_storage();
//var buff = __imguigml_wrapper_buffer();

// todo: implement

#define imguigml_begin_child_frame
///@function imguigml_begin_child_frame(_guiID, [_size_x], [_size_y], [_extra_flags=0])
///@desc helper to create a child window / scrolling region that looks like a normal widget frame
///@param {Real}                    _guiID             ImGui ID
///@param {Real}                    _size_x            width
///@param {Real}                    _size_y            height
///@param {Real:EImGui_WindowFlags} [_extra_flags=0]   
sr_buffer_write_val(__Imgui_in, argument_count > 0 ? argument[0] : 0, ERousrData.Int32);
__imguigml_ext_call(_extImguiGML_begin_child_frame());

#define imguigml_end_child_frame
///@function imguigml_end_child_frame()
///@desc helper to create a child window / scrolling region that looks like a normal widget frame
///@param {Real} [_offset]   Use positive 'offset' to access sub components of a multiple component widget. Use -1 to access previous widget.
sr_buffer_write_val(__Imgui_in, argument_count > 0 ? argument[0] : 0, ERousrData.Int32);
__imguigml_ext_call(_extImguiGML_set_keyboard_focus_here());

#define imguigml_show_metrics_window
///@function imguigml_show_metrics_window([_open=undefined])
///@desc create metrics window. display ImGui internals: draw commands (with individual draw calls and vertices), window list, basic internal state, etc.
///@param {Bool} [_open=undefined]   if passed, gives the window a close button
///@returns {Array:[_expanded, [_open]]} (always expanded)
var in = __Imgui_in;
var _open  = argument_count > 0 ? argument[0] : undefined;

if (_open != undefined) _open = _open ? 1 : 0;
sr_buffer_write_val(in, _open == undefined ? 0 : _open, _open == undefined ? ERousrData.Float : ERousrData.Int8);

if (!__imguigml_ext_call(_extImguiGML_show_metrics_window()))
	return;
var out = __Imgui_out;
var ret = [ 1 ];
if (_open != undefined)
  ret[@ 1] = buffer_read(out, buffer_s8) != 0;

return ret;

#define imguigml_show_user_guide
///@function imguigml_show_user_guide()
///@desc add basic help/info block (not a window): how to manipulate ImGui as a end-user (mouse/keyboard controls).
__imguigml_ext_call(_extImguiGML_show_user_guide());

#define imguigml_show_demo_window
///@function imguigml_show_demo_window([_open=undefined])
///@desc create demo/test window (previously called ShowTestWindow). demonstrate most ImGui features. call this to learn about the library! try to make it always available in your application!
///@param {Bool} [_open=undefined]   if passed, gives the window a close button
///@returns {Array:[_expanded, [_open]]} (always expanded)
var in = __Imgui_in;
var _open  = argument_count > 0 ? argument[0] : undefined;

if (_open != undefined) _open = _open ? 1 : 0;
sr_buffer_write_val(in, _open == undefined ? 0 : _open, _open == undefined ? ERousrData.Float : ERousrData.Int8);

if (!__imguigml_ext_call(_extImguiGML_show_demo_window()))
	return;
var out = __Imgui_out;
var ret = [ 1 ];
if (_open != undefined)
  ret[@ 1] = buffer_read(out, buffer_s8) != 0;

return ret;

#define imguigml_show_font_selector
///@function imguigml_show_font_selector(_label)
///@desc show a font selector **NOTE:** Functionality is limited at this time until `ImGuiGML` has better font support
///@param {String} _label
var _label = argument[0];
var in = __Imgui_in;
sr_buffer_write_val(in, _label, ERousrData.String);
__imguigml_ext_call(_extImguiGML_show_font_selector());

#define imguigml_begin_drag_drop_source
///@function imguigml_begin_drag_drop_source([_flags=0], [_mouse_button=0])
///@desc call when the current item is active. If this return true, you can call imguigml_set_drag_drop_payload() + imguigml_end_drag_drop_target()
var _flags        = argument_count > 0 ? argument[0] : 0,
    _mouse_button = argument_count > 1 ? argument[1] : 0;

var in = __Imgui_in;
sr_buffer_write_val(in, _flags, ERousrData.Uint32);
sr_buffer_write_val(in, _mouse_button, ERousrData.Int32);
if (!__imguigml_ext_call(_extImguiGML_begin_drag_drop_source()))
	return;
var out = __Imgui_out;
return buffer_read(out, buffer_s8) != 0;

#define imguigml_set_drag_drop_payload
///@function imguigml_set_drag_drop_payload(_type, _payload_id, [_flags=0])
///@desc  pass an id to use to identify your payload data, or use the imgiugml_generate_payload / imguigml_set_payload_data / imguigml_release_payload_data helper functions
///@param {String} _type                  type of payload. limited to 8 characters, starting with "_" is reserved for ImGui
///@param {Real} _payload_id              id for your payload **NOTE: Converted to an integer, so don't use a floating point id**
///@param {Real:EImGui_Cond} [_flags=0]   
///@returns {Bool} to be quite frank, i'm not sure what it means
var _type       = argument[0],
    _payload_id = argument[1],
		_flags      = argument_count > 2 ? argument[2] : 0;
		
var in = __Imgui_in;
var type = string_copy(_type, 0, 8); // ensure 8 letters
sr_buffer_write_val(in, _type, ERousrData.String);
sr_buffer_write_val(in, _payload_id, ERousrData.Uint32);
if (!__imguigml_ext_call(_extImguiGML_set_drag_drop_payload()))
	return;
var out  = __Imgui_out;
return buffer_read(out, buffer_s8) != 0;

#define imguigml_end_drag_drop_source
///@function imguigml_end_drag_drop_source()
///@desc end the drag drop source
__imguigml_ext_call(_extImguiGML_end_drag_drop_source());

#define imguigml_begin_drop_target
///@function imguigml_end_drag_drop_source()
///@desc call after submitting an item that may receive an item. If this returns true, you can call AcceptDragDropPayload() + EndDragDropTarget()
__imguigml_ext_call(_extImguiGML_end_drag_drop_source());

#define imguigml_accept_drag_drop_payload
///@function imguigml_accept_drag_drop_payload(_type, [_flags=0])
///@desc accept contents of a given type. If ImGuiDragDropFlags_AcceptBeforeDelivery is set you can peek into the payload before the mouse button is released.
///@param {String} _type                  type of payload. limited to 8 characters, starting with "_" is reserved for ImGui
///@param {Real:EImGui_Cond} [_flags=0]   
///@returns {Array|undefined} undefined if no drop, else [ _payload, _is_preview, _is_delivery ] delivery is when we've released the mouse button, preview we are just hovering
if (!__imguigml_ext_call(_extImguiGML_accept_drag_drop_payload()))
	return;

var out = __Imgui_out, 
    ret = undefined;

var has_payload = buffer_read(out, buffer_s8) != 0;
if (has_payload) {
	var payload_id  = buffer_read(out, buffer_u32);
	var is_preview  = buffer_read(out, buffer_s8) != 0;
	var is_delivery = buffer_read(out, buffer_s8) != 0;

	ret = [ payload_id, is_preview, is_delivery ];
}

return ret;

#define imguigml_end_drag_drop_target
///@function imguigml_end_drag_drop_target()
///@desc end drag drop target
__imguigml_ext_call(_extImguiGML_end_drag_drop_target());

#define imguigml_payload
///@function imguigml_payload([_id], _payload_data)
///@desc if an id is passed, use this id when looking up the payload, otherwise, return a generated id.
///      these ids work by clearing each ImGui `NewFrame` and starting over again. generally, this should function fine, however, if you're having id misses in dragndrop,
///      try just using your own unique id. 
///@param {Real} [_id]   if a first param is passed, it's used as the id
///@param {*} _payload_data   payload data can be anything and is returned with a `imguigml_payload_get()`
///@returns {Real} _id to pass to dragdrop functions
var _id      = argument_count > 1 ? argument[0] : undefined,
    _payload = argument_count > 1 ? argument[1] : argument[0];
		
var payload_data = ImGuiGML_PayloadData;
var payloads = payload_data[EImGuiGML_PayloadData.Payloads];

var set_id = _id;
if (_id != undefined) {
	_id |= 1 << 31; // set the final bit to signify this is a user payload
	payloads = payload_data[EImGuiGML_PayloadData.UserPayloads];
} else {
	set_id = payload_data[EImGuiGML_PayloadData.PayloadID];
	payload_data[@ EImGuiGML_PayloadData.PayloadID] = set_id + 1;
}
 
payloads[@ set_id] = _payload;
return _id;

#define imguigml_payload_get
///@function imguigml_payload_get(_id)
///@desc return a payload given a passed _id.
///@param {Real} _id
///@returns {*} _payload_data 
var _id      = argument[0];
		
var payload_data = ImGuiGML_PayloadData;
var user_id = (_id & (1 << 31)) != 0;

var payloads = payload_data[EImGuiGML_PayloadData.Payloads];
if (user_id) {
	_id = _id & ~(1 << 31); // unset the final bit
	payloads = payload_data[EImGuiGML_PayloadData.UserPayloads];
} 

return payloads[@ _id];

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
sr_buffer_write_val(in, argument[0]);
sr_buffer_write_val(in, argument[1], ERousrData.Int32);
sr_buffer_write_val(in, num_items, ERousrData.Int32);
var i = 0; repeat(num_items) sr_buffer_write_val(in, string(_items[i++]));
sr_buffer_write_val(in, argument_count > 2 ? argument[2] : -1, ERousrData.Int32);
if (!__imguigml_ext_call(_extImguiGML_combo()))
	return;

var out = __Imgui_out;
var ret = array_create(2);
ret[@ 0] = buffer_read(out, buffer_s8) != 0;
ret[@ 1] = buffer_read(out, buffer_s32);
return ret;

#define imguigml_begin_combo
///@function imguigml_begin_combo(_label, _preview_value, [_flags=0])
///@desc begin a combo widget
///@param {String} _label
///@param {String} _preview_val
///@param {Real:EImGui_ComboFlags} [_flags=0]
///@returns {Bool} 
var _label = argument[0],
    _preview_val = argument[1],
		_flags = argument_count > 2 ? argument[2] : 0;
		
var in = __Imgui_in;
sr_buffer_write_val(in, _label,       ERousrData.String);
sr_buffer_write_val(in, _preview_val, ERousrData.String);
sr_buffer_write_val(in, _flags,       ERousrData.Uint32);
__imguigml_ext_call(_extImguiGML_begin_combo());

#define imguigml_end_combo
///@function imguigml_end_combo()
///@desc end a combo widget
__imguigml_ext_call(_extImguiGML_end_combo());

#define imguigml_io_ini_saving_rate
///@function imguigml_io_ini_saving_rate([_time])
///@desc Maximum time between saving positions/sizes to .ini file, in seconds.
///@param {Real} [_time]  sets time to use if passed (= 5.0)
///@param returns { Real } current time to use 
if(argument_count > 0){
	var in = __Imgui_in;
	sr_buffer_write_val(in, argument[0], ERousrData.Float);
	if (!__imguigml_ext_call(_extImguiGML_set_ini_saving_rate()))
		return;
	return argument[0];
}

if (!__imguigml_ext_call(_extImguiGML_get_ini_saving_rate()))
	return;
var out = __Imgui_out;
return buffer_read(out, buffer_f32);


#define imguigml_io_mouse_double_click_time
///@function imguigml_io_mouse_double_click_time([_time])
///@desc Time for a double-click, in seconds.
///@param {Real} [_time]  sets time to use if passed (= 0.30)
///@param returns { Real } current time to use 
if(argument_count > 0){
	var in = __Imgui_in;
	sr_buffer_write_val(in, argument[0], ERousrData.Float);
	if (!__imguigml_ext_call(_extImguiGML_set_mouse_double_click_time()))
		return;
	return argument[0];
}

if (!__imguigml_ext_call(_extImguiGML_get_mouse_double_click_time()))
	return;
var out = __Imgui_out;
return buffer_read(out, buffer_f32);


#define imguigml_io_mouse_double_click_max_dist
///@function imguigml_io_mouse_double_click_max_dist([_distance])
///@desc Distance threshold to stay in to validate a double-click, in pixels.
///@param {Real} [_distance]  sets max distance if passed (= 6.0)
///@param returns { Real } current max distance
if(argument_count > 0){
	var in = __Imgui_in;
	sr_buffer_write_val(in, argument[0], ERousrData.Float);
	if (!__imguigml_ext_call(_extImguiGML_set_mouse_double_click_max_dist()))
		return;
	return argument[0];
}

if (!__imguigml_ext_call(_extImguiGML_get_mouse_double_click_max_dist()))
	return;
var out = __Imgui_out;
return buffer_read(out, buffer_f32);


#define imguigml_io_mouse_drag_threshold
///@function imguigml_io_mouse_drag_threshold([_distance])
///@desc Distance threshold before considering we are dragging
///@param {Real} [_distance]  sets distance threshold if passed (= 6.0)
///@param returns { Real } current distance threshold
if(argument_count > 0){
	var in = __Imgui_in;
	sr_buffer_write_val(in, argument[0], ERousrData.Float);
	if (!__imguigml_ext_call(_extImguiGML_set_mouse_drag_threshold()))
		return;
	return argument[0];
}

if (!__imguigml_ext_call(_extImguiGML_get_mouse_drag_threshold()))
	return;
	
var out = __Imgui_out;
return buffer_read(out, buffer_f32);

#define imguigml_io_key_repeat_delay
///@function imguigml_io_key_repeat_delay([_time])
///@desc When holding a key/button, time before it starts repeating, in seconds (for buttons in Repeat mode, etc.).
///@param {Real} [_time] sets time before repeating if passed (= 0.250)
///@param returns { Real } current time
if(argument_count > 0){
	var in = __Imgui_in;
	sr_buffer_write_val(in, argument[0], ERousrData.Float);
	if (!__imguigml_ext_call(_extImguiGML_set_key_repeat_delay()))
		return;
	return argument[0];
}

if (!__imguigml_ext_call(_extImguiGML_get_key_repeat_delay()))
	return;	
var out = __Imgui_out;
return buffer_read(out, buffer_f32);


#define imguigml_io_key_repeat_rate
///@function imguigml_io_key_repeat_rate([_time])
///@desc When holding a key/button, rate at which it repeats, in seconds.
///@param {Real} [_time] sets repeat rate if passed (0.050)
///@param returns { Real } current repeat rate
if(argument_count > 0){
	var in = __Imgui_in;
	sr_buffer_write_val(in, argument[0], ERousrData.Float);
	if (!__imguigml_ext_call(_extImguiGML_set_key_repeat_rate()))
		return;
	return argument[0];
}

if (!__imguigml_ext_call(_extImguiGML_get_key_repeat_rate()))
	return;
var out = __Imgui_out;
return buffer_read(out, buffer_f32);


#define imguigml_io_font_global_scale
///@function imguigml_io_font_global_scale([_scale])
///@desc Global scale all fonts
///@param {Real} [_scale] sets scale for all fonts if passed (= 1.0)
///@param returns { Real } current font scale
if(argument_count > 0){
	var in = __Imgui_in;
	sr_buffer_write_val(in, argument[0], ERousrData.Float);
	if (!__imguigml_ext_call(_extImguiGML_set_font_global_scale()))
		return;
	return argument[0];
}

if (!__imguigml_ext_call(_extImguiGML_get_font_global_scale()))
	return;
var out = __Imgui_out;
return buffer_read(out, buffer_f32);


#define imguigml_io_font_allow_user_scaling
///@function imguigml_io_font_allow_user_scaling([_boolean])
///@desc Allow user scaling text of individual window with CTRL+Wheel.
///@param {Boolean} [_boolean] sets allow user scaling if passed (=false)
///@param returns { Boolean } current value
if(argument_count > 0){
	var in = __Imgui_in;
	sr_buffer_write_val(in, argument[0], ERousrData.Bool);
	if (!__imguigml_ext_call(_extImguiGML_set_font_allow_user_scaling()))
		return;
	return argument[0];
}

if (!__imguigml_ext_call(_extImguiGML_get_font_allow_user_scaling()))
	return;
var out = __Imgui_out;
return (buffer_read(out, buffer_s8) != 0);


#define imguigml_io_display_framebuffer_scaling
///@function imguigml_io_display_framebuffer_scaling([_x=1.0],[_y=1.0])
///@desc **NOTE: DOES NOTHING FOR NOW** For retina display or other situations where window coordinates are different from framebuffer coordinates. User storage only, presently not used by ImGui.
///@param {Float} [_x=1.0] sets x value if passed
///@param {Float} [_y=1.0] sets y value if passed
///@param returns { Array } [x value, y value]
if(argument_count > 0){
	var in = __Imgui_in,
		_x = (argument_count > 0) ? argument[0] : 1.0,
		_y = (argument_count > 1) ? argument[1] : 1.0;
		
	sr_buffer_write_val(in, _x, ERousrData.Float);
	sr_buffer_write_val(in, _y, ERousrData.Float);
	if (!__imguigml_ext_call(_extImguiGML_set_display_framebuffer_scaling()))
		return;
	return [_x, _y];
}

if (!__imguigml_ext_call(_extImguiGML_get_display_framebuffer_scaling()))
	return;
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
		
	sr_buffer_write_val(in, _x, ERousrData.Float);
	sr_buffer_write_val(in, _y, ERousrData.Float);
	if (!__imguigml_ext_call(_extImguiGML_set_display_visible_min()))
		return;
	return [_x, _y];
}

if (!__imguigml_ext_call(_extImguiGML_get_display_visible_min()))
	return;
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
		
	sr_buffer_write_val(in, _x, ERousrData.Float);
	sr_buffer_write_val(in, _y, ERousrData.Float);
	if (!__imguigml_ext_call(_extImguiGML_set_display_visible_max()))
		return;
	return [_x, _y];
}

if (!__imguigml_ext_call(_extImguiGML_get_display_visible_max()))
	return;
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
	sr_buffer_write_val(in, argument[0] ? 1 : 0, ERousrData.Int8);
	if (!__imguigml_ext_call(_extImguiGML_set_osx_behaviors()))
		return;
	return argument[0];
}

if (!__imguigml_ext_call(_extImguiGML_get_osx_behaviors()))
	return;
var out = __Imgui_out;
return (buffer_read(out, buffer_s8)!=0);


#define imguigml_io_ini_filename
///@function imguigml_io_ini_filename([_path])
///@desc Path to .ini file. NULL to disable .ini saving.
///@param {String} [_filename]  sets ini filename if passed
///@returns {String} current ini filename
if (argument_count > 0) {
  var in = __Imgui_in;
  sr_buffer_write_val(in, argument[0], ERousrData.String);
  if (!__imguigml_ext_call(_extImguiGML_set_ini_filename()))
		return;
  return argument[0];
} 

if (!__imguigml_ext_call(_extImguiGML_get_ini_filename()))
	return;
var out = __Imgui_out;
return buffer_read(out, buffer_string);

#define imguigml_io_log_filename
///@function imguigml_io_log_filename([_path])
///@desc Path to .log file - default parameter to ImGui::LogToFile when no file is specified. defaults to "imgui_log.txt
///@param {String} [_path]  sets path if passed
///@returns {String} current log filename path
if (argument_count > 0) {
  var in = __Imgui_in;
  sr_buffer_write_val(in, argument[0], ERousrData.String);
  if (!__imguigml_ext_call(_extImguiGML_set_log_filename()))
		return;
  return argument[0];
} 

if (!__imguigml_ext_call(_extImguiGML_get_log_filename()))
	return;
var out = __Imgui_out;
return buffer_read(out, buffer_string); 

#define imguigml_io_cursor_blink
///@function imguigml_io_cursor_blink([_enabled])
///@desc allow input currsors to blink
///@param {Bool} [_enabled]   if passed, sets cursor blink to `_enabled`
///@returns {Bool} 
if (argument_count > 0) {
  var in = __Imgui_in;
  sr_buffer_write_val(in, argument[0], ERousrData.Int8);
  if (!__imguigml_ext_call(_extImguiGML_set_cursor_blink()))
		return;
  return argument[0];
} 

if (!__imguigml_ext_call(_extImguiGML_get_cursor_blink()))
	return;
var out = __Imgui_out;
return buffer_read(out, buffer_string);

#define imguigml_drawlist_add_line
/// @function imguigml_draw_list_add_line(_x1, _y1, _x2, _y1, _color, [_thickness=1.0])
/// @desc adds a line to the draw list 
/// @param {Real} _x1 
/// @param {Real} _y1
/// @param {Real} _x2
/// @param {Real} _y2 
/// @param {Real} _color  
/// @param {Real} [_thickness = 1.0]
var in = __Imgui_in, argi = 0;

sr_buffer_write_val(in, argument[argi++], ERousrData.Float);
sr_buffer_write_val(in, argument[argi++], ERousrData.Float);
sr_buffer_write_val(in, argument[argi++], ERousrData.Float);
sr_buffer_write_val(in, argument[argi++], ERousrData.Float);
sr_buffer_write_val(in, argument[argi++], ERousrData.Uint32);

if(argument_count > argi){
	sr_buffer_write_val(in, argument[argi++], ERousrData.Float);
}else{
	sr_buffer_write_val(in, 1, ERousrData.Float);	
}

__imguigml_ext_call(_extImguiGML_drawlist_add_line());

#define imguigml_drawlist_add_rect
///@function imguigml_drawlist_add_rect(_x1, _y1, _x2, _y2, _col, [_rounding = 0.0], [_rounding_corner_flags = ~0], [_thickness = 1.0])
///@desc Adds a rectangle to the drawlist
///@param {Real} _x1
///@param {Real} _y1
///@param {Real} _x2
///@param {Real} _y2
///@param {Real} _col
///@param {Real} [_rounding=0.0]
///@param {Real:EImGui_DrawCornerFlags} [_rounding_corner_flags=-1]
///@param {Real} [_thickness=1.0]
var _in = __Imgui_in, argi = 0;
sr_buffer_write_val(_in, argument[argi++], ERousrData.Float);
sr_buffer_write_val(_in, argument[argi++], ERousrData.Float);
sr_buffer_write_val(_in, argument[argi++], ERousrData.Float);
sr_buffer_write_val(_in, argument[argi++], ERousrData.Float);
sr_buffer_write_val(_in, argument[argi++], ERousrData.Uint32);

sr_buffer_write_val(_in, argument_count > 5 ? argument[argi++] : 0,   ERousrData.Float);
sr_buffer_write_val(_in, argument_count > 6 ? argument[argi++] : -1,  ERousrData.Int32);
sr_buffer_write_val(_in, argument_count > 7 ? argument[argi++] : 1.0, ERousrData.Float);
__imguigml_ext_call(_extImguiGML_drawlist_add_rect());

#define imguigml_drawlist_add_rect_filled
///@function imguigml_drawlist_add_rect_filled(_x1, _y1, _x2, _y2, _col, [_rounding = 0.0], [_rounding_corner_flags = ~0])
///@desc Adds a filled rectangle to the drawlist
///@param {Real} _x1
///@param {Real} _y1
///@param {Real} _x2
///@param {Real} _y2
///@param {Real} _col
///@param {Real} [_rounding=0.0]
///@param {Real:EImGui_DrawCornerFlags} [_rounding_corner_flags=-1]
var _in = __Imgui_in, argi = 0;
sr_buffer_write_val(_in, argument[argi++], ERousrData.Float);
sr_buffer_write_val(_in, argument[argi++], ERousrData.Float);
sr_buffer_write_val(_in, argument[argi++], ERousrData.Float);
sr_buffer_write_val(_in, argument[argi++], ERousrData.Float);
sr_buffer_write_val(_in, argument[argi++], ERousrData.Uint32);

sr_buffer_write_val(_in, argument_count > 5 ? argument[argi++] : 0,   ERousrData.Float);
sr_buffer_write_val(_in, argument_count > 6 ? argument[argi++] : -1,  ERousrData.Int32);
__imguigml_ext_call(_extImguiGML_drawlist_add_rect_filled());

#define imguigml_drawlist_add_rect_filled_multicolor
///@function imguigml_drawlist_add_rect_filled_multicolor(_x1, _y1, _x2, _y2, _colUL, _colUR, _colBR, _colBL);
///@desc Adds a multicolored filled rectangle to the drawlist
///@param {Real} _x1
///@param {Real} _y1
///@param {Real} _x2
///@param {Real} _y2
///@param {Real} _colUL
///@param {Real} _colUR
///@param {Real} _colBR
///@param {Real} _colBL
var _in = __Imgui_in, argi=0;
sr_buffer_write_val(_in, argument[argi++], ERousrData.Float);
sr_buffer_write_val(_in, argument[argi++], ERousrData.Float);
sr_buffer_write_val(_in, argument[argi++], ERousrData.Float);
sr_buffer_write_val(_in, argument[argi++], ERousrData.Float);
sr_buffer_write_val(_in, argument[argi++], ERousrData.Uint32);
sr_buffer_write_val(_in, argument[argi++], ERousrData.Uint32);
sr_buffer_write_val(_in, argument[argi++], ERousrData.Uint32);
sr_buffer_write_val(_in, argument[argi++], ERousrData.Uint32);
__imguigml_ext_call(_extImguiGML_drawlist_add_rect_filled_multicolor());

#define imguigml_drawlist_add_quad
///@function imguigml_drawlist_add_quad(_x1, _y1, _x2, _y2, _x3, _y3, _x4, _y4, _col, [_thickness = 1.0])
///@desc Adds a quad to the drawlist
///@param {Real} _x1
///@param {Real} _y1
///@param {Real} _x2
///@param {Real} _y2
///@param {Real} _x3
///@param {Real} _y3
///@param {Real} _x4
///@param {Real} _y5
///@param {Real} _col
///@param {Real} [_thickness=1.0]
var _in = __Imgui_in;
sr_buffer_write_val(_in, argument[0], ERousrData.Float);
sr_buffer_write_val(_in, argument[1], ERousrData.Float);
sr_buffer_write_val(_in, argument[2], ERousrData.Float);
sr_buffer_write_val(_in, argument[3], ERousrData.Float);
sr_buffer_write_val(_in, argument[4], ERousrData.Float);
sr_buffer_write_val(_in, argument[5], ERousrData.Float);
sr_buffer_write_val(_in, argument[6], ERousrData.Float);
sr_buffer_write_val(_in, argument[7], ERousrData.Float);
sr_buffer_write_val(_in, argument[8], ERousrData.Uint32);
sr_buffer_write_val(_in, argument_count > 9 ? argument[9] : 1.0, ERousrData.Float);
__imguigml_ext_call(_extImguiGML_drawlist_add_quad());

#define imguigml_drawlist_add_quad_filled
///@function imguigml_drawlist_add_quad_filled(_x1, _y1, _x2, _y2, _x3, _y3, _x4, _y4, _col, [_thickness = 1.0])
///@desc Adds a filled quad to the draw list
///@param {Real} _x1
///@param {Real} _y1
///@param {Real} _x2
///@param {Real} _y2
///@param {Real} _x3
///@param {Real} _y3
///@param {Real} _x4
///@param {Real} _y5
///@param {Real} _col
///@param {Real} [_thickness=1.0]
var _in = __Imgui_in;
sr_buffer_write_val(_in, argument[0], ERousrData.Float);
sr_buffer_write_val(_in, argument[1], ERousrData.Float);
sr_buffer_write_val(_in, argument[2], ERousrData.Float);
sr_buffer_write_val(_in, argument[3], ERousrData.Float);
sr_buffer_write_val(_in, argument[4], ERousrData.Float);
sr_buffer_write_val(_in, argument[5], ERousrData.Float);
sr_buffer_write_val(_in, argument[6], ERousrData.Float);
sr_buffer_write_val(_in, argument[7], ERousrData.Float);
sr_buffer_write_val(_in, argument[8], ERousrData.Uint32);
sr_buffer_write_val(_in, argument_count > 9 ? argument[9] : 1.0, ERousrData.Float);
__imguigml_ext_call(_extImguiGML_drawlist_add_quad_filled());

#define imguigml_drawlist_add_triangle
///@function imguigml_drawlist_add_triangle(_x1, _y1, _x2, _y2, _x3, _y3, _col, [_thickness=1.0])
///@desc Adds a triangle to the draw list
///@param {Real} _x1
///@param {Real} _y1
///@param {Real} _x2
///@param {Real} _y2
///@param {Real} _x3
///@param {Real} _y3
///@param {Real} _col
///@param {Real} [_thickness=1.0]
var in = __Imgui_in;
sr_buffer_write_val(in, argument[0], ERousrData.Float);
sr_buffer_write_val(in, argument[1], ERousrData.Float);
sr_buffer_write_val(in, argument[2], ERousrData.Float);
sr_buffer_write_val(in, argument[3], ERousrData.Float);
sr_buffer_write_val(in, argument[4], ERousrData.Float);
sr_buffer_write_val(in, argument[5], ERousrData.Float);
sr_buffer_write_val(in, argument[6], ERousrData.Uint32);
sr_buffer_write_val(in, argument_count > 7 ? argument[7] : 1.0, ERousrData.Float);
__imguigml_ext_call(_extImguiGML_drawlist_add_triangle());

#define imguigml_drawlist_add_triangle_filled
///@function imguigml_drawlist_add_triangle_filled(_x1, _y1, _x2, _y2, _x3, _y3, _col)
///@desc Adds a filled triangle to the draw list
///@param {Real} _x1
///@param {Real} _y1
///@param {Real} _x2
///@param {Real} _y2
///@param {Real} _x3
///@param {Real} _y3
///@param {Real} _col
var in = __Imgui_in;
sr_buffer_write_val(in, argument[0], ERousrData.Float);
sr_buffer_write_val(in, argument[1], ERousrData.Float);
sr_buffer_write_val(in, argument[2], ERousrData.Float);
sr_buffer_write_val(in, argument[3], ERousrData.Float);
sr_buffer_write_val(in, argument[4], ERousrData.Float);
sr_buffer_write_val(in, argument[5], ERousrData.Float);
sr_buffer_write_val(in, argument[6], ERousrData.Uint32);
__imguigml_ext_call(_extImguiGML_drawlist_add_triangle_filled());

#define imguigml_drawlist_add_circle
///@function imguigml_drawlist_add_circle(_center_x, _center_y, _radius, _col, [_num_segments=12], [_thickness=1.0])
///@desc Adds a circle to the drawlist
///@param {Real} _center_x
///@param {Real} _center_y
///@param {Real} _radius
///@param {Real} _col
///@param {Real} [_num_segments=12]
///@param {Float} [_thickness = 1.0]
var in = __Imgui_in;
sr_buffer_write_val(in, argument[0], ERousrData.Float);
sr_buffer_write_val(in, argument[1], ERousrData.Float);
sr_buffer_write_val(in, argument[2], ERousrData.Float);
sr_buffer_write_val(in, argument[3], ERousrData.Uint32);
sr_buffer_write_val(in, argument_count > 4 ? argument[4] : 12, ERousrData.Int32);
sr_buffer_write_val(in, argument_count > 5 ? argument[5] : 1.0, ERousrData.Float);
if (!__imguigml_ext_call(_extImguiGML_drawlist_add_circle()))
	return;

#define imguigml_drawlist_add_circle_filled
///@function imguigml_drawlist_add_circle_filled(_center_x, _center_y, _radius, _col, [_num_segments=12])
///@desc Adds a circle to the drawlist
///@param {Real} _center_x
///@param {Real} _center_y
///@param {Real} _radius
///@param {Real} _col
///@param {Real} [_num_segments=12]
var in = __Imgui_in;
sr_buffer_write_val(in, argument[0], ERousrData.Float);
sr_buffer_write_val(in, argument[1], ERousrData.Float);
sr_buffer_write_val(in, argument[2], ERousrData.Float);
sr_buffer_write_val(in, argument[3], ERousrData.Uint32);
sr_buffer_write_val(in, argument_count > 4 ? argument[4] : 12, ERousrData.Int32);
__imguigml_ext_call(_extImguiGML_drawlist_add_circle_filled());

#define imguigml_drawlist_add_text
///@function imguigml_drawlist_add_text(_pos_x, _pos_y, _col, _text, _wrap_width) 
///@desc Adds text to the drawlist
///@param {Real} _pos_x
///@param {Real} _pos_y
///@param {Real} _col
///@param {String} _text
///@param {Real} _wrap_width
var in = __Imgui_in, argi = 0;
sr_buffer_write_val(in, argument[argi++], ERousrData.Float);
sr_buffer_write_val(in, argument[argi++], ERousrData.Float);
sr_buffer_write_val(in, argument[argi++], ERousrData.Uint32);
sr_buffer_write_val(in, argument[argi++], ERousrData.String);
sr_buffer_write_val(in, argument[argi++], ERousrData.Float);
__imguigml_ext_call(_extImguiGML_drawlist_add_text());

#define imguigml_drawlist_add_surface
///@function imguigml_drawlist_add_surface(_surface, _x, _y, [_width=undefined], [_height=undefined], [_u0=0.0], [_v0=0.0], [_u1=1.0], [_v1=1.0], [color=c_white])
///@param {Real} _surface             surface
///@param {Real} _x                   x
///@param {Real} _y                   y
///@param {Real} [_width=undefined]   width uses surface_get_width if undefined
///@param {Real} [_height=undefined]  height uses surface_get_height if undefined
///@param {Real} [_u0=0.0]            texture u0
///@param {Real} [_v0=0.0]            texture v0
///@param {Real} [_u1=1.0]            texture u1
///@param {Real} [_v1=1.0]            texture v1
///@param {Real} [_col=c_white]       image_blend
var in = __Imgui_in, argi = 0,
	surface = argument[argi++],
	x1 = argument[argi++],
	y1 = argument[argi++],
	x2 = x1,
	y2 = y1,
	width = (argument_count > 3) ? argument[argi++] : undefined,
	height = (argument_count > 4) ? argument[argi++] : undefined,
	texture_id = __imguigml_texture_id(surface, EImGuiGML_TextureType.Surface),
	_exists = surface_exists(surface);
	
if is_undefined(width)  width =  (_exists) ? surface_get_width(surface)  : 0;
if is_undefined(height) height = (_exists) ? surface_get_height(surface) : 0;

x2 += width;
y2 += height;

__imguigml_drawlist_add_image(texture_id,
				//Coords
				x1, y1, x2, y2,
				//UVs
				argument_count > 5 ? argument[argi++] : 0.0, 
				argument_count > 6 ? argument[argi++] : 0.0, 
				argument_count > 7 ? argument[argi++] : 1.0, 
				argument_count > 8 ? argument[argi++] : 1.0, 
				//Color
				argument_count > 9 ? argument[argi++] : 0xFFFFFFFF);


#define imguigml_drawlist_add_surface_quad
///@function imguigml_drawlist_add_surface_quad(surface, _x1, _y1, _x2, _y2, x3, _y3, _x4, _y4, [_u1=0], [_v1=0], [_u2=1], [_v2=0], [_u3=1], [_v3=1], [_u4=0], [_v4=1], [_col=c_white])
///@desc Adds an image quad to the draw list 
///@param {Real} _surface
///@param {Real} _x1 
///@param {Real} _y1 
///@param {Real} _x2 
///@param {Real} _y2
///@param {Real} _x3
///@param {Real} _y3
///@param {Real} _x4
///@param {Real} _y4
///@param {Real} [_col=c_white]
///@param {Real} [_u1=0] 
///@param {Real} [_v1=0] 
///@param {Real} [_u2=1] 
///@param {Real} [_v2=0]
///@param {Real} [_u3=1]
///@param {Real} [_v3=1]
///@param {Real} [_u4=0]
///@param {Real} [_v4=1]
var in = __Imgui_in, argi = 0,
	surface = argument[argi++],
	x1 = argument[argi++],
	y1 = argument[argi++],
	x2 = argument[argi++],
	y2 = argument[argi++],
	x3 = argument[argi++],
	y3 = argument[argi++],
	x4 = argument[argi++],
	y4 = argument[argi++],
	col = (argument_count > 9) ? argument[argi++] : 0xFFFFFFFF,
	u1 = (argument_count > 10) ? argument[argi++] : 0,
	v1 = (argument_count > 11) ? argument[argi++] : 0,
	u2 = (argument_count > 12) ? argument[argi++] : 1,
	v2 = (argument_count > 13) ? argument[argi++] : 0,
	u3 = (argument_count > 14) ? argument[argi++] : 1,
	v3 = (argument_count > 15) ? argument[argi++] : 1,
	u4 = (argument_count > 16) ? argument[argi++] : 0,
	v4 = (argument_count > 17) ? argument[argi++] : 1,
	texture_id = __imguigml_texture_id(surface, EImGuiGML_TextureType.Surface);

__imguigml_drawlist_add_image_quad(texture_id, x1, y1, x2, y2, x3, y3, x4, y4, u1, v1, u2, v2, u3, v3, u4, v4, col);


#define imguigml_drawlist_add_sprite
///@function imguigml_drawlist_add_sprite(_sprite_index, _sub_img, _x, _y, [_width=undefined], [_height=undefined], [_col=c_white])
///@desc Adds an image to the draw list 
///@param {Real} _sprite_index
///@param {Real} _image_index
///@param {Real} _x
///@param {Real} _y
///@param {Real} [_width=undefined]
///@param {Real} [_height=undefined] 
///@param {Real} [_col=c_white]

var in = __Imgui_in, argi = 0,
	sprite = argument[argi++],
	sub_img = argument[argi++],
	x1 = argument[argi++],
	y1 = argument[argi++],
	width = (argument_count > 4)  ? argument[argi++] : undefined,
	height = (argument_count > 5) ? argument[argi++] : undefined,
	color = (argument_count > 6) ? argument[argi++] : 0xFFFFFFFF,

with(ImGuiGML) {
  var cached     = sr_sprite_cache_push_sprite(Sprite_cache, sprite, sub_img);
  var uvs        = sr_sprite_cache_get_uvs(Sprite_cache, cached);
  var texture_id = __imguigml_texture_id(sr_sprite_cache_get_surface(Sprite_cache, cached), EImGuiGML_TextureType.Surface);
  
  width  = is_undefined(width)  ? sprite_get_width(sprite)  : width;
  height = is_undefined(height) ? sprite_get_height(sprite) : height;
  
  var uv1 = uvs[0],
      uv2 = uvs[1];
			
  var u1 = uv1[0];
  var v1 = uv1[1];
  var u2 = uv2[0];
  var v2 = uv2[1];
  
	var x2 = x1 + width,
      y2 = y1 + height; 

  __imguigml_drawlist_add_image(texture_id, x1, y1, x2, y2, u1, v1, u2, v2, color);
}

#define imguigml_drawlist_add_polyline
///@function imguigml_drawlist_add_polyline(_points, _col, [_closed=true], [_thickness=1.0], [_anti_aliased=true])
///@desc add a line in a polygonal shape to the draw list
///@param {Array:[_x, _y]} _points      an array of points, each point being an array: [x, y]
///@param {Real} _col                   
///@param {Real} [_closed=true]         is the shape closed?
///@param {Real} [_thickness=1.0]
var in = __Imgui_in, argi = 0;

//Points
var _points = argument[argi++],
	_num_points = array_length_1d(_points);

sr_buffer_write_val(in, _num_points, ERousrData.Int32);
for (var i = 0; i < _num_points; ++i) {
  var pt = _points[i];
  sr_buffer_write_val(in, pt[0], ERousrData.Float); 
  sr_buffer_write_val(in, pt[1], ERousrData.Float);
}

//Color
sr_buffer_write_val(in, argument[argi++], ERousrData.Uint32);

//Optionals
sr_buffer_write_val(in, argument_count > 2 ? argument[argi++] : true, ERousrData.Bool);
sr_buffer_write_val(in, argument_count > 3 ? argument[argi++] : 1.0, ERousrData.Float);

__imguigml_ext_call(_extImguiGML_drawlist_add_polyline());

#define imguigml_drawlist_add_convex_poly_filled
///@function imguigml_drawlist_add_convex_poly_filled(_points, _col, [_anti_aliased=true])
///@desc add filled convex polygonal shape to the draw list
///@param {Array:[_x,_y]} _points      an array of points, each point being an array: [x, y]
///@param {Real} _col                   
var in = __Imgui_in, argi = 0;
var _points = argument[argi++],
	_num_points = array_length_1d(_points);
	
//Points
sr_buffer_write_val(in, _num_points, ERousrData.Int32);
for (var i = 0; i < _num_points; ++i) {
  var pt = _points[i];
  sr_buffer_write_val(in, pt[0], ERousrData.Float); 
  sr_buffer_write_val(in, pt[1], ERousrData.Float);
}

//Color
sr_buffer_write_val(in, argument[argi++], ERousrData.Uint32);

//Optional AA
if(argument_count > argi){
	sr_buffer_write_val(in, argument[argi++], ERousrData.Bool);
}else{
	sr_buffer_write_val(in, 1, ERousrData.Bool);
}

__imguigml_ext_call(_extImguiGML_drawlist_add_convex_poly_filled());

#define imguigml_drawlist_add_bezier_curve
///@function imguigml_drawlist_add_bezier_curve(_pos_x1, _pos_y1, _curve_x1, _curve_y1, _curve_x2, _curve_y2, _pos_x2, _pos_y2, _col, _thickness, [_num_segments=0]) 
///@desc Adds a bezier curve to the drawlist
///@param {Real} _pos_x1
///@param {Real} _pos_y1
///@param {Real} _curve_x1
///@param {Real} _curve_y1
///@param {Real} _curve_x2
///@param {Real} _curve_y2
///@param {Real} _pos_x2
///@param {Real} _pos_y2
///@param {Real} _col
///@param {Real} _thickness
///@param {Real} [_num_segments=0])
var in = __Imgui_in, argi = 0;
sr_buffer_write_val(in, argument[argi++], ERousrData.Float);
sr_buffer_write_val(in, argument[argi++], ERousrData.Float);
sr_buffer_write_val(in, argument[argi++], ERousrData.Float);
sr_buffer_write_val(in, argument[argi++], ERousrData.Float);
sr_buffer_write_val(in, argument[argi++], ERousrData.Float);
sr_buffer_write_val(in, argument[argi++], ERousrData.Float);
sr_buffer_write_val(in, argument[argi++], ERousrData.Float);
sr_buffer_write_val(in, argument[argi++], ERousrData.Float);
sr_buffer_write_val(in, argument[argi++], ERousrData.Uint32);
sr_buffer_write_val(in, argument[argi++], ERousrData.Float);
sr_buffer_write_val(in, argument_count > argi ? argument[argi] : 0, ERousrData.Int32); argi++;
__imguigml_ext_call(_extImguiGML_drawlist_add_bezier_curve());

#define imguigml_drawlist_path_clear
///@function imguigml_drawlist_path_clear()
///@desc Clears the current path
__imguigml_ext_call(_extImguiGML_drawlist_path_clear());

#define imguigml_drawlist_path_line_to
///@function imguigml_drawlist_path_line_to(_x, _y)
///@desc add a line to the current path
///@param {Real} _x
///@param {Real} _y
var in = __Imgui_in;
sr_buffer_write_val(in, argument[0], ERousrData.Float);
sr_buffer_write_val(in, argument[1], ERousrData.Float);
__imguigml_ext_call(_extImguiGML_drawlist_path_line_to());

#define imguigml_drawlist_path_line_to_merge_duplicate
///@function imguigml_drawlist_path_line_to_merge_duplicate(_x, _y)
///@desc add a line to the current path, merging any duplicate lines this creates
///@param {Real} _x
///@param {Real} _y
var in = __Imgui_in;
sr_buffer_write_val(in, argument[0], ERousrData.Float);
sr_buffer_write_val(in, argument[1], ERousrData.Float);
__imguigml_ext_call(_extImguiGML_drawlist_path_line_to_merge_duplicate());

#define imguigml_drawlist_path_fill_convex
///@function imguigml_drawlist_path_fill_convex(_col)
///@desc add fill the current convex shape created bhy the path
///@param {Real} _col
var in = __Imgui_in;
sr_buffer_write_val(in, argument[0], ERousrData.Uint32);
__imguigml_ext_call(_extImguiGML_drawlist_path_fill_convex());

#define imguigml_drawlist_path_stroke
///@function imguigml_drawlist_path_stroke(_col, _closed, [_thickness=1.0])
///@desc set the stroke settings for drawing paths
///@param {Real} _col
///@param {Boolean} _closed
///@param {Real} [_thickness=1.0])
var in = __Imgui_in;
sr_buffer_write_val(in, argument[0], ERousrData.Uint32);
sr_buffer_write_val(in, argument[1], ERousrData.Bool);
sr_buffer_write_val(in, argument_count > 2 ? argument[2] : 1.0, ERousrData.Float);
__imguigml_ext_call(_extImguiGML_drawlist_path_stroke());

#define imguigml_drawlist_path_arc_to
///@function imguigml_drawlist_path_arc_to(_center_x, _center_y, _radius, _min, _max, [_num_segments=10])
///@desc Adds an arc to a path 
///@param {Real} _center_x 
///@param {Real} _center_y 
///@param {Real} _radius 
///@param {Real} _min 
///@param {Real} _max 
///@param {Real} [_num_segments=10]
var in = __Imgui_in;
var argi = 0;
sr_buffer_write_val(in, argument[argi++], ERousrData.Float);
sr_buffer_write_val(in, argument[argi++], ERousrData.Float);
sr_buffer_write_val(in, argument[argi++], ERousrData.Float);
sr_buffer_write_val(in, argument[argi++], ERousrData.Float);
sr_buffer_write_val(in, argument[argi++], ERousrData.Float);
sr_buffer_write_val(in, argument_count > argi ? argument[argi] : 10, ERousrData.Int32); argi++;
__imguigml_ext_call(_extImguiGML_drawlist_path_arc_to());


#define imguigml_drawlist_path_arc_to_fast
///@function imguigml_drawlist_path_arc_to_fast(_center_x, _center_y, _radius, _min_of_12, _max_of_12)
///@desc More performant path_arc
///@param {Real} _center_x 
///@param {Real} _center_y 
///@param {Real} _radius 
///@param {Real} _min_of_12 
///@param {Real} _max_of_12
var in = __Imgui_in;
var argi = 0;
sr_buffer_write_val(in, argument[argi++], ERousrData.Float);
sr_buffer_write_val(in, argument[argi++], ERousrData.Float);
sr_buffer_write_val(in, argument[argi++], ERousrData.Float);
sr_buffer_write_val(in, argument[argi++], ERousrData.Float);
sr_buffer_write_val(in, argument[argi++], ERousrData.Float);
__imguigml_ext_call(_extImguiGML_drawlist_path_arc_to_fast());


#define imguigml_drawlist_path_bezier_curve_to
///@function imguigml_drawlist_path_bezier_curve_to(_x1, _y1, _x2, _y2, _x3, _y3, [_num_segments=0])
///@desc Curve path to 
///@param {Real} _x1 
///@param {Real} _y1 
///@param {Real} _x2 
///@param {Real} _y2 
///@param {Real} _x3 
///@param {Real} _y3 
///@param {Real} [_num_segments=0]
var in = __Imgui_in, argi = 0;
sr_buffer_write_val(in, argument[argi++], ERousrData.Float);
sr_buffer_write_val(in, argument[argi++], ERousrData.Float);
sr_buffer_write_val(in, argument[argi++], ERousrData.Float);
sr_buffer_write_val(in, argument[argi++], ERousrData.Float);
sr_buffer_write_val(in, argument[argi++], ERousrData.Float);
sr_buffer_write_val(in, argument[argi++], ERousrData.Float);
sr_buffer_write_val(in, argument_count > argi ? argument[argi] : 0, ERousrData.Int32);
__imguigml_ext_call(_extImguiGML_drawlist_path_bezier_curve_to());

#define imguigml_drawlist_path_rect
///@function imguigml_drawlist_path_rect(_x1, _x2, _y1, _y2, [_rounding=0.0], [_rounding_corner_flags=-1])
///@desc draw a rect on the path 
///@param {Real} _min_x
///@param {Real} _min_y
///@param {Real} _max_x 
///@param {Real} _max_y 
///@param {Real} [_rounding=0]
///@param {Real:EImGui_DrawCornerFlags} [_round_corner_flags=-1
var in = __Imgui_in, argi = 0;
sr_buffer_write_val(in, argument[argi++], ERousrData.Float);
sr_buffer_write_val(in, argument[argi++], ERousrData.Float);
sr_buffer_write_val(in, argument[argi++], ERousrData.Float);
sr_buffer_write_val(in, argument[argi++], ERousrData.Float);
sr_buffer_write_val(in, argument_count > argi ? argument[argi] : 0.0, ERousrData.Float); argi++;
sr_buffer_write_val(in, argument_count > argi ? argument[argi] : 0, ERousrData.Int32); argi++;
if (!__imguigml_ext_call(_extImguiGML_drawlist_path_rect()))
	return;

#define imguigml_drawlist_channels_split
///@function imguigml_drawlist_channels_split(_channels_count)
///@desc merge channels
///      Channels:
///      - Use to simulate layers. By switching channels to can render out-of-order (e.g. submit foreground primitives before background primitives)
///      - Use to minimize draw calls (e.g. if going back-and-forth between multiple non-overlapping clipping rectangles, prefer to append into separate channels then merge at the end)
///@param {Real} _channels_count 
sr_buffer_write_val(__Imgui_in, argument[0], ERousrData.Int32);
__imguigml_ext_call(_extImguiGML_drawlist_channels_split());

#define imguigml_drawlist_channels_merge
///@function imguigml_drawlist_channels_merge()
///@desc merge channels
///      Channels:
///      - Use to simulate layers. By switching channels to can render out-of-order (e.g. submit foreground primitives before background primitives)
///      - Use to minimize draw calls (e.g. if going back-and-forth between multiple non-overlapping clipping rectangles, prefer to append into separate channels then merge at the end)
__imguigml_ext_call(_extImguiGML_drawlist_channels_merge());

#define imguigml_drawlist_channels_set_current
///@function imguigml_drawlist_channels_set_current(_channel_index)
///@desc merge channels
///      Channels:
///      - Use to simulate layers. By switching channels to can render out-of-order (e.g. submit foreground primitives before background primitives)
///      - Use to minimize draw calls (e.g. if going back-and-forth between multiple non-overlapping clipping rectangles, prefer to append into separate channels then merge at the end)
///@param {Real} _channel_index
var in = __Imgui_in;
sr_buffer_write_val(in, argument[0], ERousrData.Int32);
__imguigml_ext_call(_extImguiGML_drawlist_channels_set_current());

#define imguigml_drawlist_push_clip_rect
///@function imguigml_drawlist_push_clip_rect(_min_x, _min_y, _max_x, _max_y, [_intersect_with_clip_plane=false])
///@desc Render-level scissoring
///@param {Real} _min_x
///@param {Real} _min_y
///@param {Real} _max_x
///@param {Real} _max_y
///@param {Boolean} [_intersect_with_clip_plane=false]
var in = __Imgui_in;
sr_buffer_write_val(in, argument[0], ERousrData.Float);
sr_buffer_write_val(in, argument[1], ERousrData.Float);
sr_buffer_write_val(in, argument[2], ERousrData.Float);
sr_buffer_write_val(in, argument[3], ERousrData.Float);
sr_buffer_write_val(in, argument_count > 4 ? argument[4] : false, ERousrData.Bool);
if (!__imguigml_ext_call(_extImguiGML_drawlist_push_clip_rect()))
	return;

#define imguigml_drawlist_pop_clip_rect
///@function imguigml_drawlist_pop_clip_rect()
///@desc End Render-level scissoring
__imguigml_ext_call(_extImguiGML_drawlist_pop_clip_rect());

#define imguigml_drawlist_push_clip_rect_fullscreen
///@function imguigml_drawlist_push_clip_rect_fullscreen()
///@desc Push the clip rect for the fullscreen 
if (!__imguigml_ext_call(_extImguiGML_drawlist_push_clip_rect_fullscreen()))
	return;

#define imguigml_drawlist_get_clip_rect_min
///@function imguigml_drawlist_get_clip_rect_min()
///@desc Gets the max pos of clipping rectangle
///@returns {Array:[ _min_x, _min_y ]
if (!__imguigml_ext_call(_extImguiGML_drawlist_get_clip_rect_min()))
	return;
var out = __Imgui_out, ret = array_create(2);
ret[@ 0] = buffer_read(out, buffer_f32);
ret[@ 1] = buffer_read(out, buffer_f32);
return ret;

#define imguigml_drawlist_get_clip_rect_max
///@function imguigml_drawlist_get_clip_rect_max()
///@desc Gets the max pos of clipping rectangle
///@returns {Array:[ _max_x, _max_y ]
if (!__imguigml_ext_call(_extImguiGML_drawlist_get_clip_rect_max()))
	return;
var out = __Imgui_out, ret = array_create(2);
ret[@ 0] = buffer_read(out, buffer_f32);
ret[@ 1] = buffer_read(out, buffer_f32);
return ret;

#define imguigml_drawlist_push_texture_id
///@function imguigml_drawlist_push_texture_id(_tex_id)
///@desc Pushes a texture to the drawlist 
///@param {Real} _tex_id
var texture_id = __imguigml_texture_id(argument[0]);
sr_buffer_write_val(__Imgui_in, texture_id, ERousrData.Uint32);
__imguigml_ext_call(_extImguiGML_drawlist_push_texture_id());

#define imguigml_drawlist_pop_texture_id
///@function imguigml_drawlist_pop_texture_id()
///@desc Pops texture from drawlist 
__imguigml_ext_call(_extImguiGML_drawlist_pop_texture_id());

#define imguigml_drawlist_set_flags
///@function imguigml_drawlist_set_flags(_flags)
///@desc set the antialising flags [per primitive]
///@param {Real:EImGui_DrawListFlags} _flags
var in = __Imgui_in;
sr_buffer_write_val(in, argument0, ERousrData.Uint32);
__imguigml_ext_call(_extImguiGML_drawlist_set_flags());

#define imguigml_drawlist_get_flags
///@function imguigml_drawlist_get_flags()
///@desc get the antialising flags [per primitive]
///@returns {Real:EImGui_DrawListFlags} _flags
if (!__imguigml_ext_call(_extImguiGML_drawlist_set_flags()))
	return;
return buffer_read(__Imgui_out, buffer_u32);

#define imguigml_drawlist_use_overlay
///@function imguigml_drawlist_use_overlay()
///@desc use imgui's overlay drawlist ontop of the screen
_extImguiGML_drawlist_use_overlay();

#define imguigml_drawlist_use_window
///@function imguigml_drawlist_use_window()
///@desc use imgui's active window drawlist with drawlist functions
_extImguiGML_drawlist_use_window();

#define __imguigml_drawlist_add_image_quad
///@function imguigml_drawlist_add_image_quad(_texture_id, _x1, _y1, _x2, _y2, x3, _y3, _x4, _y4, [_u1=0], [_v1=0], [_u2=1], [_v2=0], [_u3=1], [_v3=1], [_u4=0], [_v4=1], [_col=c_white])
///@desc Adds an image quad to the draw list 
///@param {Real} _texture_id created from _imguigml_texture_id
///@param {Real} _x1 
///@param {Real} _y1 
///@param {Real} _x2 
///@param {Real} _y2
///@param {Real} _x3
///@param {Real} _y3
///@param {Real} _x4
///@param {Real} _y4
///@param {Real} [_u1=0] 
///@param {Real} [_v1=0] 
///@param {Real} [_u2=1] 
///@param {Real} [_v2=1]
///@param {Real} [_u3=1]
///@param {Real} [_v3=1]
///@param {Real} [_u4=0]
///@param {Real} [_v4=1]
///@param {Real} [_col=c_white]
///@extensionizer { "docs": false }
var in = __Imgui_in, argi = 0;

//Texture
sr_buffer_write_val(in, argument[argi++], ERousrData.Uint32);

//Top Left
sr_buffer_write_val(in, argument[argi++], ERousrData.Float);
sr_buffer_write_val(in, argument[argi++], ERousrData.Float);

//Top Right
sr_buffer_write_val(in, argument[argi++], ERousrData.Float);
sr_buffer_write_val(in, argument[argi++], ERousrData.Float);

//Bottom Right
sr_buffer_write_val(in, argument[argi++], ERousrData.Float);
sr_buffer_write_val(in, argument[argi++], ERousrData.Float);

//Bottom Left
sr_buffer_write_val(in, argument[argi++], ERousrData.Float);
sr_buffer_write_val(in, argument[argi++], ERousrData.Float);

//Top Left UV
sr_buffer_write_val(in, argument_count > 9  ? argument[argi++] : 0.0, ERousrData.Float);
sr_buffer_write_val(in, argument_count > 10 ? argument[argi++] : 0.0, ERousrData.Float);

//Top Right UV
sr_buffer_write_val(in, argument_count > 11 ? argument[argi++] : 1.0, ERousrData.Float);
sr_buffer_write_val(in, argument_count > 12 ? argument[argi++] : 0.0, ERousrData.Float);

//Bottom Right UV
sr_buffer_write_val(in, argument_count > 13 ? argument[argi++] : 1.0, ERousrData.Float);
sr_buffer_write_val(in, argument_count > 14 ? argument[argi++] : 1.0, ERousrData.Float);

//Bottom Left UV
sr_buffer_write_val(in, argument_count > 15 ? argument[argi++] : 0.0, ERousrData.Float);
sr_buffer_write_val(in, argument_count > 16 ? argument[argi++] : 1.0, ERousrData.Float);

//Colour
sr_buffer_write_val(in, argument_count > argi ? argument[argi] : 0xFFFFFFFF, ERousrData.Uint32);

__imguigml_ext_call(_extImguiGML_drawlist_add_image_quad());

#define __imguigml_drawlist_add_image
///@function imguigml_drawlist_add_image(_texture_id, _x1, _y1, _x2, _y2, [_u1=0], [_v1=0], [_u2=1], [_v2=1], [_col=c_white])
///@desc Adds an image to the draw list 
///@param {Real} _texture_id   texture id is a generated id from __imguigml_texture_id
///@param {Real} _x1 
///@param {Real} _y1 
///@param {Real} _x2  
///@param {Real} _y2 
///@param {Real} [_u1=0] 
///@param {Real} [_v1=0] 
///@param {Real} [_u2=1] 
///@param {Real} [_v2=1] 
///@param {Real} [_col=c_white]
///@extensionizer { "docs": false }
var in = __Imgui_in, argi = 0;

//Texture
sr_buffer_write_val(in, argument[argi++], ERousrData.Uint32);

//Coords 
sr_buffer_write_val(in, argument[argi++], ERousrData.Float);
sr_buffer_write_val(in, argument[argi++], ERousrData.Float);
sr_buffer_write_val(in, argument[argi++], ERousrData.Float);
sr_buffer_write_val(in, argument[argi++], ERousrData.Float);

//UVs
sr_buffer_write_val(in, argument_count > 5 ? argument[argi++] : 0.0, ERousrData.Float);
sr_buffer_write_val(in, argument_count > 6 ? argument[argi++] : 0.0, ERousrData.Float);
sr_buffer_write_val(in, argument_count > 7 ? argument[argi++] : 1.0, ERousrData.Float);
sr_buffer_write_val(in, argument_count > 8 ? argument[argi++] : 1.0, ERousrData.Float);

//Colour
sr_buffer_write_val(in, argument_count > 9 ? argument[argi++] : 0xFFFFFFFF, ERousrData.Uint32);
__imguigml_ext_call(_extImguiGML_drawlist_add_image());

#define __imguigml_draw
///@function __imguigml_draw()
///@desc draw the imgui
///@extensionizer { "docs": false }
_extImguiGML_wait_for_render();

sr_sprite_cache_flush(Sprite_cache);  // draw any new things

var vertex_index = 0;
var command_buffer = Render_buffer[0];
var vertex_buffer  = Render_buffer[1];

buffer_seek(command_buffer, buffer_seek_start, 0);
buffer_seek(vertex_buffer,  buffer_seek_start, 0);

var shader = Imgui_Shaders[Imgui_shader];
shader_set(shader[_EImGuiShader.Shader]);
while (buffer_read(command_buffer, buffer_u8) == 1) { 
  var tex_id     = buffer_read(command_buffer, buffer_u32);
  var elem_count = buffer_read(command_buffer, buffer_u32);
  
  var vbuff = vertex_create_buffer_from_buffer_ext(vertex_buffer, Imgui_vertex_fmt, vertex_index * Imgui_vertex_fmt_size, elem_count);
  vertex_index += elem_count;
  
  var tex = Textures[tex_id];
  if (tex == undefined) tex = - 1;
  else switch (tex[EImGuiGML_Texture.Type]) {
    case EImGuiGML_TextureType.Surface: 
      tex = tex[EImGuiGML_Texture.TextureID]; 
	  tex = surface_get_texture(tex);
      //tex = surface_exists(tex) ? surface_get_texture(tex) : -1;
		//tex = surface_get_texture(tex);
		//show_message("Was surface!");
	break;
    case EImGuiGML_TextureType.Sprite:  
      tex = tex[EImGuiGML_Texture.TextureID]; 
      tex = sprite_get_texture(tex[0], tex[1]);
    break;
    
    case EImGuiGML_TextureType.Texture: tex = tex[EImGuiGML_Texture.TextureID]; break;
    default: tex = -1; break;
  };

	if (tex == -1) 
		continue;
		
  var clip_x1 = buffer_read(command_buffer, buffer_f32);
  var clip_y1 = buffer_read(command_buffer, buffer_f32);
  var clip_x2 = buffer_read(command_buffer, buffer_f32);
  var clip_y2 = buffer_read(command_buffer, buffer_f32);
  
  shader_set_uniform_f_array(shader[_EImGuiShader.ClipRect], [ clip_x1, clip_y1, clip_x2, clip_y2 ]);
  shader_set_uniform_f_array(shader[_EImGuiShader.Scale],    [ Scale_x, Scale_y ]);
	if (Use_depth) 
		shader_set_uniform_f(shader[_EImGuiShader.DepthVal], depth);
		
  vertex_submit(vbuff, pr_trianglelist, tex);  
  vertex_delete_buffer(vbuff);
}

shader_reset();

#define __imguigml_texture_id
///@function __imguigml_texture_id(_id, _texture_type_or_sub_img, [_texture_type])
///@desc return an index for a texture id so we can render this properly
///@param {Real}                            _id						              sprite index, surface id, or texture ptr
///@param {Real|Real:EImGuiGML_TextureType} _texture_type_or_sub_img    what type `_id` should be treated as, or a sub image if we're the sprite type.
///@param {Real:EImGuiGML_TextureType}      [_texture_type]             what type `_id` should be treated as (or a sprite, really, if 3 passed)
///@returns {Real} _id for texture
///@extensionizer { "docs": false }
var _id      = argument[0],
    _sub_img = argument[1],
    _type    = argument[1];

if (argument_count > 2) _type = EImGuiGML_TextureType.Sprite; // 3 params is only acceptable for a sprite, deal with it.

with (ImGuiGML) {
  var num_textures = array_length_1d(Textures);
  for (var i = 0; i < num_textures; ++i) {
		var tex_data = Textures[i];
		if (tex_data[EImGuiGML_Texture.Type] == _type) {
      var tex_id = tex_data[EImGuiGML_Texture.TextureID];
      
      // special handling
      switch (_type) {
      case EImGuiGML_TextureType.Sprite:  
        if (_id == tex_id[0] && _sub_img == tex_id[1]) return i;      
      break;
      default: if (_id == tex_id) return i;
      }
    }
  }
    
  var new_texture = [ _id , _id, false, _type ];
  
  // special handling
  switch (_type) {
   case EImGuiGML_TextureType.Sprite:  new_texture[@ EImGuiGML_Texture.TextureID] = [ _id, _sub_img ]; break;
   default: break; 
  }
  
  Textures[@ Next_texture_id++] = new_texture;
  return Next_texture_id - 1;
}

return undefined;

#define __imguigml_wrapper_buffer
///@function __imguigml_wrapper_buffer()
///@desc prepare the wrapper buffer for next use
///@returns {Real} buffer_index
///@extensionizer { "docs": false }
gml_pragma("forceinline");

with (ImGuiGML) {
  buffer_seek(Wrapper_buffer, buffer_seek_start, 0);
  return Wrapper_buffer;
}

return undefined;

#define __imguigml_handle_text_callback
///@function __imguigml_handle_text_callback(_call_id, _callback, _user_data)
///@desc handle text input callback functions, the script it supports is:
///      `real _text_input_callback({Array:EImguiGML_TextCallback}_data, [_user_data=_undefined])` - on CallbackCharFilter return 1 to discard. ignored elsewise.
///@param {Real} _call_id    id returned from a text input callback function
///@param {Real} _callback   script_index of callback script to execute
///@extensionizer { "docs": false }
var _call_id = argument[0],
    _callback = argument[1],
    _user_data = argument_count > 2 ? argument[2] : undefined;

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
      sr_buffer_write_val(in, ret, ERousrData.Int32);
      
      sr_buffer_write_val(in, callback_data[EImGui_TextCallbackData.Text],           ERousrData.String);
      sr_buffer_write_val(in, callback_data[EImGui_TextCallbackData.CurPos],         ERousrData.Int32);
      sr_buffer_write_val(in, callback_data[EImGui_TextCallbackData.SelectionStart], ERousrData.Int32);
      sr_buffer_write_val(in, callback_data[EImGui_TextCallbackData.SelectionEnd],   ERousrData.Int32);

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
      sr_buffer_write_val(in, ret, ERousrData.Int32);
      sr_buffer_write_val(in, out_char, ERousrData.Uint16);
    break;
      
    default: break;
  }
};  


#define __imguigml_ext_call
///@function __imguigml_ext_call(_extImguiGML_func_ret)
///@desc wrap a _extImguiGML call in this, handle returns or checking immediately after a call
///@extensionizer { "docs": "false" }
var _ret_val = argument_count > 0 ? argument[0] : 1.0;

// check if there's any debug messages, return if there are?
with (ImGuiGML) {
	if (buffer_peek(Debug_buffer, 0, buffer_u32) > 0) {
		var count = buffer_read(Debug_buffer, buffer_u32);
		var msg = "";
		for (var i = 0; i < count; ++i)
			msg += buffer_read(Debug_buffer, buffer_string) + "\n";
		show_error(msg, true);
		
		buffer_seek(Debug_buffer, buffer_seek_start, 0);
		_extImGuiGML_flush_debug_buffer();
	}	
}

// handle input copying.

// no errors, so continue execution. 
return true;

#define __imguigml_event_create
///@function __imguigml_event_create()
///@desc imguigml create event
///@extensionizer { "docs": false }
gml_pragma("global", "global.__imguigml = noone;");
if (global.__imguigml != noone && instance_exists(global.__imguigml))
  instance_destroy(global.__imguigml);

global.__imguigml = id;
global.__imguigml_payloads = [ 
		[ ],
		[ ],	
		0,	
];
	
memory = ds_map_create();

rousr_callstack_init();
_extImguiGML_init();
__imguigml_init_debug();
__imguigml_init_rendering();
__imguigml_init_font();
__imguigml_init_input();
__imguigml_init_wrapper();

Display_mode = EImGui_DisplayMode.GUIAspect;
Display_view = 0;	
DrawGUI  = true;
NewFrame = false;
	
Override_scale = false;
Scale_x = 1;
Scale_y = 1;
_Display_scale_x = 1;
_Display_scale_y = 1;

Last_set_cursor = window_get_cursor();


#define __imguigml_event_begin_step
///@function __imguigml_event_begin_step
///@desc imguigml begin step event
///@extensionizer { "docs": false }
 
/////////////
#region Update Input
var mb     = global.__imgui_mouse_buttons; 
var num_mouse_buttons = global.__imgui_num_mouse_buttons;

var imkeys = global.__imgui_keys; 
var num_im_keys = global.__imgui_num_keys;

var mx = 0,
    my = 0;

DrawGUI = Display_mode >= EImGui_DisplayMode.GUIModesStart && Display_mode <= EImGui_DisplayMode.GUIModesEnd;

if (Display_mode == EImGui_DisplayMode.GUIAspect) {
	var 
		//_wport = view_wport[Display_view],
	    //_hport = view_hport[Display_view],
	    _wport = surface_get_width(application_surface),
		_hport = surface_get_height(application_surface),
		_next_width  = window_get_width(),
	    _next_height = window_get_height();
    
	if (_next_width / _wport > _next_height/ _hport) {
		var _ratio = _wport / _hport;
		_next_width = _next_height * _ratio;
	} else {
		var _ratio = _hport / _wport;
		_next_height = _next_width * _ratio;
	}
	
	if(_next_width & 1){
		++_next_width;	
	}
	
	if(_next_height & 1){
		++_next_height;	
	}

	_Display_scale_x = _next_width;
	_Display_scale_y = _next_height;
}

__imguigml_ext_call(_extImguiGML_set_display_size(window_get_width(), window_get_height()));

if (Should_update_cursor) {
	switch (Display_mode) {
		case EImGui_DisplayMode.GUIAspect: 
		  mx = window_mouse_get_x() / Scale_x;
			my = window_mouse_get_y() / Scale_y;
			
			var pos = application_get_position();
			mx -= pos[0];
			my -= pos[1];
			
			break;
		case EImGui_DisplayMode.View:
			mx = window_view_mouse_get_x(Display_view) / Scale_x;
			my = window_view_mouse_get_y(Display_view) / Scale_y;
			break;
		
		default: break;
	}
}

buffer_seek(Input_buffer, buffer_seek_start, 0);

buffer_write(Input_buffer, buffer_f32, mx);
buffer_write(Input_buffer, buffer_f32, my);

for (var mouse_button_index = 0; mouse_button_index < num_mouse_buttons; ++mouse_button_index) {
  var but = mb[mouse_button_index];
  buffer_write(Input_buffer, buffer_u8, Should_update_cursor && mouse_check_button(but) ? 1 : 0);
}

for (var key_index = 0; key_index < num_im_keys; ++key_index) {
  var key = imkeys[key_index];
  buffer_write(Input_buffer, buffer_u8, keyboard_check(key) ? 1 : 0);
}

var mousewheel = mouse_wheel_up() ? 1 : 0;
mousewheel = mouse_wheel_down() ? -1 : mousewheel;

if (!Should_update_cursor) mousewheel = 0;

buffer_write(Input_buffer, buffer_s8, mousewheel);
buffer_write(Input_buffer, buffer_u8, (!Using_GM_cursor) ? 1 : 0);

_extImguiGML_update_input(buffer_get_address(Input_buffer));

if (WantTextInput || WantCaptureKeyboard) {
  if (DidWantTextInput) {
    if (keyboard_string != "")
      _extImguiGML_update_character_input(keyboard_string);
     if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_return))
      _extImguiGML_update_character_input("\n");
  }
  keyboard_string = "";
}
DidWantTextInput = WantTextInput || WantCaptureKeyboard;

#endregion

/////////////
#region begin the step (with delta time)
_extImguiGML_begin_step(delta_time/1000000);
#endregion


#region update io
_extImguiGML_get_io_outputs();
	
var outputs = __Imgui_out;
WantCaptureMouse      = sr_buffer_read_val(outputs);
WantCaptureKeyboard   = sr_buffer_read_val(outputs);
WantTextInput         = sr_buffer_read_val(outputs);
WantMoveMouse         = sr_buffer_read_val(outputs);
Framerate             = sr_buffer_read_val(outputs); 
MetricsAllocs         = sr_buffer_read_val(outputs); 
MetricsRenderVertices = sr_buffer_read_val(outputs);
MetricsRenderIndices  = sr_buffer_read_val(outputs);
MetricsActiveWindows  = sr_buffer_read_val(outputs);
MouseDelta = [ ];
MouseDelta[0]         = sr_buffer_read_val(outputs);
MouseDelta[1]         = sr_buffer_read_val(outputs);

#endregion

NewFrame = true;

#region update payloads
var payload_data = ImGuiGML_PayloadData;
payload_data[@ EImGuiGML_PayloadData.PayloadID] = 0;
#endregion

#define __imguigml_event_end_step
///@function __imguigml_end_step
///@desc imguigml end step event
///@extensionizer { "docs": false }

if (!NewFrame)
  return;
  
_extImguiGML_end_step();

NewFrame = false;

//If imgui is not rendering mouse cursor then
//set native gml cursor icon
if (Should_update_cursor && Using_GM_cursor) {

	var new_cursor = Last_set_cursor;
	switch (imguigml_get_mouse_cursor()) {
		case EImGui_MouseCursor.Arrow:      new_cursor = cr_arrow;     break;
		case EImGui_MouseCursor.Move:       new_cursor = cr_size_all;  break;
		case EImGui_MouseCursor.None:       new_cursor = cr_none;      break;
		case EImGui_MouseCursor.ResizeEW:	  new_cursor = cr_size_we;   break;
		case EImGui_MouseCursor.ResizeNESW: new_cursor = cr_size_nesw; break;
		case EImGui_MouseCursor.ResizeNS:   new_cursor = cr_size_ns;   break;
		case EImGui_MouseCursor.ResizeNWSE: new_cursor = cr_size_nwse; break;
		case EImGui_MouseCursor.TextInput:  new_cursor = cr_beam;      break;
		default: new_cursor = cr_arrow; break;
	}
		
	if (new_cursor != Last_set_cursor) {
		Last_set_cursor = new_cursor;
		window_set_cursor(new_cursor);
	}
}


#define __imguigml_event_clean_up
///@function __imguigml_event_clean_up()
///@desc imguigml clean up event
///@extensionizer { "docs": false }

var num_textures = array_length_1d(Textures);
var i = 1;
repeat(num_textures - 1) {
  var tex = Textures[i++];
  if (tex[EImGuiGML_Texture.DeleteOnCleanUp])
    sprite_delete(tex[EImGuiGML_Texture.TextureID]);
}
global.__imguigml = noone;

buffer_delete(Render_buffer[0]);
buffer_delete(Render_buffer[1]);
buffer_delete(Input_buffer);
buffer_delete(Wrapper_buffer);
buffer_delete(Debug_buffer);

vertex_format_delete(Imgui_vertex_fmt);
ds_map_destroy(memory);
rousr_callstack_clean_up();
_extImguiGML_texteditors_cleanup();
_extImguiGML_shutdown();

#define __imguigml_event_draw
///@function __imguigml_event_draw()
///@desc imguigml draw event
///@extensionizer { "docs": false }

if (DrawGUI)
  return;
  
__imguigml_draw();

#define __imguigml_event_draw_gui
///@function __imguigml_event_draw_gui()
///@desc imguigml draw gui event
///@extensionizer { "docs": false }
if (!DrawGUI)
  return;

var ox = display_get_gui_width(), oy = display_get_gui_height();
display_set_gui_size(_Display_scale_x, _Display_scale_y);
__imguigml_draw();
display_set_gui_size(ox, oy);

#define __imguigml_init_rendering
///@function __imguigml_init_rendering()
///@desc called `with` imguigml - initialize the rendering
///@extensionizer { "docs": false }
gml_pragma("forceinline");

enum EImGuiGML_Texture {
  TextureID = 0,
  OwnerID,
  DeleteOnCleanUp,
  Type,
	
  Num
};


enum EImGuiGML_TextureType {
	Invalid = -1,
	
	Sprite = 0,
	Surface,
	Texture,
	
	Num
};

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

enum _EImGuiShader {
	Normal = 0,
	Depth,
	
	Num,
	
	// Shader array
	Shader   = 0, // Shader
	U1,           // Uniforms
	U2, 
	U3,
	
	// labelled uniforms
	ClipRect = _EImGuiShader.U1,     
	Scale    = _EImGuiShader.U2,
	DepthVal = _EImGuiShader.U3,
	
	Params,
};

Imgui_Shaders = [
	[ shd_imgui,       shader_get_uniform(shd_imgui,       "u_vClip_rect"), shader_get_uniform(shd_imgui,       "u_vScale"), undefined ],
	[ shd_imgui_depth, shader_get_uniform(shd_imgui_depth, "u_vClip_rect"), shader_get_uniform(shd_imgui_depth, "u_vScale"), shader_get_uniform(shd_imgui_depth, "u_fDepth") ]
];

Imgui_shader       = _EImGuiShader.Normal;

Textures      = [ ];
Next_texture_id = 0;

Offset_x  = 0;
Offset_y  = 0;
Use_depth = false;

Sprite_cache = sr_sprite_cache_create();

__imguigml_ext_call(_extImguiGML_set_display_size(window_get_width(), window_get_height()));

#define __imguigml_init_font
///@function __imguigml_init_font()
///@desc called `with` imguigml - load the font texture
///@extensionizer { "docs": false }
gml_pragma("forceinline");
var arg_buffer = buffer_create(1024, buffer_fixed, 1);
if (!__imguigml_ext_call(_extImguiGML_create_font_texture(Next_texture_id, buffer_get_address(arg_buffer))))
	return;

var font_width  = buffer_read(arg_buffer, buffer_u32);
var font_height = buffer_read(arg_buffer, buffer_u32);
var font_buffer = buffer_create(font_width * font_height * 4, buffer_fixed, 4);

if (!__imguigml_ext_call(_extImguiGML_get_font_texture(buffer_get_address(font_buffer))))
	return;

var font_surface = surface_create(font_width, font_height);
buffer_set_surface(font_buffer, font_surface, 0, 0, 0);

var font_sprite = sprite_create_from_surface(font_surface, 0, 0, font_width, font_height, false, false, 0, 0);
Textures[@ Next_texture_id++] = [ [ font_sprite, 0 ], font_sprite, true, EImGuiGML_TextureType.Sprite ];

buffer_delete(arg_buffer);
buffer_delete(font_buffer);
surface_free(font_surface);

#define __imguigml_init_input
///@function __imguigml_init_input()
///@desc called `with` imguigml - initilaize the input stuff
///@extensionizer { "docs": false }
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
  Insert,     
  
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
  vk_insert,
  
  vk_control,
  vk_alt,
  vk_shift,
   // vk_super,
];
  
Input_buffer = buffer_create(ImGuiGML_InputBufferSize, buffer_fixed, buffer_u8);
Using_GM_cursor      = Use_GM_cursor;
Should_update_cursor = Show_ImGui_cursor;

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
///@extensionizer { "docs": false }
gml_pragma("forceinline");
Wrapper_buffer = buffer_create(ImGuiGML_WrapperBufferSize, buffer_fixed, 1);
_extImguiGML_set_wrapper_buffer(buffer_get_address(Wrapper_buffer), ImGuiGML_WrapperBufferSize);

#define __imguigml_init_debug
///@function __imguigml_init_debug()
///@desc called `with` imguigml - initialize debug buffer
///@extensionizer { "docs": false }
gml_pragma("forceinline");
Debug_buffer = buffer_create(ImGuiGML_DebugBufferSize, buffer_fixed, 1);
_extImGuiGML_set_debug_buffer(buffer_get_address(Debug_buffer), ImGuiGML_WrapperBufferSize);

#define imguigml_mem
/// @function imguigml_mem(key, [default_value])
/// @desc Get a value from the memory map
/// @param {String} key
/// @param {Real|String} [default_value] 
/// @returns {Real|String|undefined}
var _key = argument[0],
	_default_value = (argument_count > 1) ? argument[1] : false,
	_value = global.__imguigml.memory[? _key];

if(is_undefined(_value) && argument_count > 1){
	global.__imguigml.memory[? _key] = _default_value;
	return _default_value;
}else{
	return _value;	
}

#define imguigml_memset
/// @function imguigml_memset(_key, _val)
/// @desc Sets a value in the memory map
/// @param {String} key  
/// @param {*} _val
/// @returns {*} _val
var _key = argument[0],
	_value = argument[1];

global.__imguigml.memory[? _key] = _value;
return _value;

#define imguigml_secure_save_mem
/// @function imguigml_secure_save_mem(filename)
/// @desc saves imguigml memory onto the filesystem
/// @param filename {String} the path to use 
ds_map_secure_save(global.__imguigml.memory, argument0);

#define imguigml_secure_load_mem
/// @function imguigml_secure_save_mem(filename)
/// @desc loads imguigml memory from the filesystem
/// @param filename {String} the path to use 
if(file_exists(argument0)){
	ds_map_destroy(global.__imguigml.memory);
	global.__imguigml.memory = ds_map_secure_load(argument0);
} 

#define imguigml_begin_tab_bar
///@function imguigml_begin_tab_bar(_std_id, [_flags=0])
///@desc start a tab bar
///@param {String} _std_id
///@param {Real:EImGui_TabBarFlags} [_flags=0]
var in = __Imgui_in;
sr_buffer_write_val(in, argument[0], ERousrData.String);
sr_buffer_write_val(in, argument_count > 1 ? argument[1] : 0, ERousrData.Int32);
__imguigml_ext_call(_extImguiGML_extra_begin_tab_bar());

#define imguigml_end_tab_bar
///@function imguigml_end_tab_bar()
///@desc finish a tab bar
__imguigml_ext_call(_extImguiGML_extra_end_tab_bar());

#define imguigml_tab_item
///@function imguigml_tab_item(_name, [_open=undefined], [_flags=0])
///@desc create a tab item
///@param {String} _name                         name for tab item
///@param {Real} [_open=undefined]               pass true/false for if this window is open w/close button, undefined for no button
///@param {Real:EImGui_TabItemFlags} [_flags=0]  tab item flags
///@returns {Array:[_selected, [_is_open])
var in = __Imgui_in;
var _name  = argument[0],
    _open  = argument_count > 1 ? argument[1] : undefined,
    _flags = argument_count > 2 ? argument[2] : 0;

if (_open != undefined) _open = _open ? 1 : 0;

sr_buffer_write_val(in, _name);
sr_buffer_write_val(in, _open == undefined ? 0 : _open, _open == undefined ? ERousrData.Float : ERousrData.Int8);
sr_buffer_write_val(in, _flags, ERousrData.Int32);

if (!__imguigml_ext_call(_extImguiGML_extra_tab_item()))
	return;
	
var out = __Imgui_out;
var ret = [ buffer_read(out, buffer_s8) != 0 ];
if (_open != undefined)
  ret[@ 1] = buffer_read(out, buffer_s8) != 0;

return ret;

#define imguigml_set_tab_item_closed
///@function imguigml_set_tab_item_closed(_name)
///@desc set a tab item as closed
///@param {String} _name
var in = __Imgui_in;
sr_buffer_write_val(in, argument[0]);
__imguigml_ext_call(_extImguiGML_extra_set_tab_item_closed());

#define imguigml_set_tab_item_selected
///@function imguigml_set_tab_item_selected(_name)
///@desc set a tab item as selected
///@param {String} _name
var in = __Imgui_in;
sr_buffer_write_val(in, argument[0]);
if (!__imguigml_ext_call(_extImguiGML_extra_set_tab_item_selected()))
	return;

#define imguigml_show_tabs_demo
///@function imguigml_show_tabs_demo(_name, [_open=undefined])
///@desc show the tabs demo
///@param {String} _name                         name for demo win
///@param {Real} [_open=undefined]               pass true/false for if this window is open w/close button, undefined for no button
///@returns {Boolean} [_is_open] returned if _open passed
var in = __Imgui_in;
var _name  = argument[0],
    _open  = argument_count > 1 ? argument[1] : undefined;
if (_open != undefined) _open = _open ? 1 : 0;

sr_buffer_write_val(in, _name);
sr_buffer_write_val(in, _open == undefined ? 0 : _open, _open == undefined ? ERousrData.Float : ERousrData.Int8);

__imguigml_ext_call(_extImguiGML_extra_show_tabs_demo());
if (_open != undefined)
  return buffer_read(__Imgui_out, buffer_s8) != 0;

#define imguigml_show_tabs_debug
///@function imguigml_show_tabs_debug()
///@desc show tabs debug pane
__imguigml_ext_call(_extImguiGML_extra_show_tabs_debug());

#define imguigml_texteditor_create
///@function imguigml_texteditor_create()
///@desc create a new texteditor
if (!__imguigml_ext_call(_extImguiGML_texteditor_create()))
	return;
var out = __Imgui_out;
return buffer_read(out, buffer_f64);

#define imguigml_texteditor_destroy
///@function imguigml_texteditor_destroy(_editor)
///@desc destroy a texteditor
///@param {Real} _editor_index
///@returns {undefined} so you can chain calls
var in = __Imgui_in, argi=0;
sr_buffer_write_val(in, argument[argi], ERousrData.Double);
if (!__imguigml_ext_call(_extImguiGML_texteditor_destroy()))
	return;
return undefined;

#define imguigml_texteditor_set_language_definition
///@function imguigml_texteditor_set_language_definition(_editor_index)
///@desc Sets the current text editor language definition
///@param {Real} _editor_index 
///@param {String} _lang         can be "CPlusPlus", "HLSL", "GLSL", "C", "SQL", or "Lua"
var in = __Imgui_in;
sr_buffer_write_val(in, argument[0], ERousrData.Uint32);
sr_buffer_write_val(in, argument[1]);
var ret = _extImguiGML_texteditor_set_language_definition();
if (ret == -3) 
  show_debug_message("imguigml_texteditor_set_language_definition: couldn't find lang: " + string(argument[1]));

#define imguigml_texteditor_get_language_definition
///@function imguigml_texteditor_get_language_definition(_editor_index)
///@desc Gets the current text editor language definition
///@param {Real} _editor_index 
///@returns {String} lang def
var in = __Imgui_in;
sr_buffer_write_val(in, argument[0], ERousrData.Int32);
if (!__imguigml_ext_call(_extImguiGML_texteditor_get_language_definition()))
	return;
return buffer_read(__Imgui_out, buffer_string);


#define imguigml_texteditor_get_palette
///@function imguigml_texteditor_get_palette(_editor_index)
///@desc Gets the palette of the current text editor
///@param {Real} _editor_index 
///@returns {Array:EImGuiText_Palette} filled in array with current palette colors
var in = __Imgui_in;
sr_buffer_write_val(in, argument[0], ERousrData.Uint32);
if (!__imguigml_ext_call(_extImguiGML_texteditor_get_palette()))
	return;
var out = __Imgui_out;
var palette = array_create(EImGuiText_Palette.Num, 0);
var i = 0; repeat(EImGuiText_Palette.Num)
  palette[@i++] = buffer_read(out, buffer_u8);
return palette;

#define imguigml_texteditor_set_palette
///@function imguigml_texteditor_set_palette(_editor_index, _palette)
///@desc Sets the palette of the current text editor
///@param {Real} _editor_index 
///@param {Array:EImGuiText_Palette} _palette   note - GetDark/Light palette will give you basic one
var in = __Imgui_in;
sr_buffer_write_val(in, argument[0], ERousrData.Uint32);
var palette = array_create(EImGuiText_Palette.Num, 0);
var i = 0; repeat(EImGuiText_Palette.Num)
  sr_buffer_write_val(in, palette[i], buffer_u8);

if (!__imguigml_ext_call(_extImguiGML_texteditor_set_palette()))
	return;

#define imguigml_texteditor_render
///@function imguigml_texteditor_render(_editor_index, _label, [_size_x=0], [_size_y=0], [_border=false])
///@desc Renders the text editor
///@param {Real} _editor_index 
///@param {String} _label
///@param {Real} [_size_x=0]
///@param {Real} [_size_y=0]
///@param {Boolean} [_border=false]
var in = __Imgui_in, argi=0;
sr_buffer_write_val(in, argument[argi++], ERousrData.Int32);
sr_buffer_write_val(in, argument[argi++], ERousrData.String);
sr_buffer_write_val(in, argument_count > argi ? argument[argi] : 0, ERousrData.Float); argi++;
sr_buffer_write_val(in, argument_count > argi ? argument[argi] : 0, ERousrData.Float); argi++;
sr_buffer_write_val(in, argument_count > argi ? argument[argi] : false, ERousrData.Bool);  argi++;
if (!__imguigml_ext_call(_extImguiGML_texteditor_render()))
	return;

#define imguigml_texteditor_set_text
///@function imguigml_texteditor_set_text(_editor_index, _text)
///@desc Sets the text of the current editor 
///@param {Real} _editor_index 
///@param {String} _text
__imguigml_ext_call(_extImguiGML_texteditor_set_text(argument0, argument1)); // special case, we just use the DLL API since buffers can be HUGE!

#define imguigml_texteditor_get_text
///@function imguigml_texteditor_get_text(_editor_index)
///@desc Gets the text from the current editor 
///@param {Real} _editor_index 
///@returns {String} 
return _extImguiGML_texteditor_get_text(argument0); // special case - text buffers can be huge so we just use the direct DLL API.


#define imguigml_texteditor_get_selected_text
///@function imguigml_texteditor_get_selected_text(_editor_index)
///@desc Gets the selected text of the current editor 
///@param {Real} _editor_index 
///@returns {String}
var in = __Imgui_in, argi=0;
sr_buffer_write_val(in, argument[argi++], ERousrData.Int32);
if (!__imguigml_ext_call(_extImguiGML_texteditor_get_selected_text()))
	return;
var out = __Imgui_out;
return buffer_read(out, buffer_string);

#define imguigml_texteditor_get_total_lines
///@function imguigml_texteditor_get_total_lines(_editor_index)
///@desc Gets the total lines from the current text editor
///@param {Real} _editor_index 
///@returns {Real}
var in = __Imgui_in, argi=0;
sr_buffer_write_val(in, argument[argi++], ERousrData.Int32);
if (!__imguigml_ext_call(_extImguiGML_texteditor_get_total_lines()))
	return;
var out = __Imgui_out;
return buffer_read(out, buffer_s32);

#define imguigml_texteditor_is_overwrite
///@function imguigml_texteditor_is_overwrite(_editor_index)
///@desc Checks if current text editor is in overwrite mode
///@param {Real} _editor_index 
///@returns {Boolean}
var in = __Imgui_in, argi=0;
sr_buffer_write_val(in, argument[argi++], ERousrData.Int32);
if (!__imguigml_ext_call(_extImguiGML_texteditor_is_overwrite()))
	return;
var out = __Imgui_out;
return buffer_read(out, buffer_s8) != 0;

#define imguigml_texteditor_set_readonly
///@function imguigml_texteditor_set_readonly(_editor_index, _value)
///@desc Sets the text editor to read only
///@param {Real} _editor_index 
///@param {Boolean} _value
var in = __Imgui_in, argi=0;
sr_buffer_write_val(in, argument[argi++], ERousrData.Int32);
sr_buffer_write_val(in, argument[argi++], ERousrData.Bool);
if (!__imguigml_ext_call(_extImguiGML_texteditor_set_read_only()))
	return;


#define imguigml_texteditor_is_readonly
///@function imguigml_texteditor_is_readonly(_editor_index)
///@desc Checks if the current editor is read only
///@param {Real} _editor_index 
///@returns {Boolean}
var in = __Imgui_in, argi=0;
sr_buffer_write_val(in, argument[argi++], ERousrData.Int32);
if (!__imguigml_ext_call(_extImguiGML_texteditor_is_read_only()))
	return;
var out = __Imgui_out;
return buffer_read(out, buffer_s8) != 0;


#define imguigml_texteditor_set_cursor_position
///@function imguigml_texteditor_set_cursor_position(_editor_index, _line, _col)
///@desc Sets the cursor position using line and column
///@param {Real} _editor_index 
///@param {Real} _line
///@param {Real} _col
var in = __Imgui_in, argi=0;
sr_buffer_write_val(in, argument[argi++], ERousrData.Int32);
sr_buffer_write_val(in, argument[argi++], ERousrData.Int32);
sr_buffer_write_val(in, argument[argi++], ERousrData.Int32);
__imguigml_ext_call(_extImguiGML_texteditor_set_cursor_position());


#define imguigml_texteditor_get_cursor_position
///@function imguigml_texteditor_get_cursor_position(_editor_index)
///@desc Gets the line and column from the current text editor 
///@param {Real} _editor_index 
///@returns {Array:[_line, _col]}
var in = __Imgui_in, argi=0;
sr_buffer_write_val(in, argument[argi++], ERousrData.Int32);
if (!__imguigml_ext_call(_extImguiGML_texteditor_get_cursor_position()))
	return;
var out = __Imgui_out;
var ret = array_create(2);
ret[@ 0] = buffer_read(out, buffer_u32);
ret[@ 1] = buffer_read(out, buffer_u32);
return ret;

#define imguigml_texteditor_insert_text
///@function imguigml_texteditor_insert_text(_editor_index, _text)
///@desc Inserts text at position in the current text editor
///@param {Real} _editor_index 
///@param {String} _text
var in = __Imgui_in, argi=0;
sr_buffer_write_val(in, argument[argi++], ERousrData.Int32);
sr_buffer_write_val(in, argument[argi++], ERousrData.String);
__imguigml_ext_call(_extImguiGML_texteditor_insert_text());


#define imguigml_texteditor_move_up
///@function imguigml_texteditor_move_up(_editor_index, _amount, [_select = false])
///@desc Moves up  lines in the text editor
///@param {Real} _editor_index 
///@param {Real} _amount
///@param {Real} [_select = false]
var in = __Imgui_in, argi=0;
sr_buffer_write_val(in, argument[argi++], ERousrData.Int32);
sr_buffer_write_val(in, argument[argi++], ERousrData.Int32);
sr_buffer_write_val(in, argument_count > argi ? argument[argi] : false, ERousrData.Bool); argi++;
__imguigml_ext_call(_extImguiGML_texteditor_move_up());


#define imguigml_texteditor_move_down
///@function imguigml_texteditor_move_down(_editor_index, _amount, [_select = false])
///@desc Moves down  lines in the text editor
///@param {Real} _editor_index 
///@param {Real} _amount
///@param {Real} [_select = false]
var in = __Imgui_in, argi=0;
sr_buffer_write_val(in, argument[argi++], ERousrData.Int32);
sr_buffer_write_val(in, argument[argi++], ERousrData.Int32);
sr_buffer_write_val(in, argument_count > argi ? argument[argi] : false, ERousrData.Bool); argi++;
__imguigml_ext_call(_extImguiGML_texteditor_move_down());


#define imguigml_texteditor_move_left
///@function imguigml_texteditor_move_left(_editor_index, _amount, [_select = false])
///@desc Moves left  lines in the text editor
///@param {Real} _editor_index 
///@param {Real} _amount
///@param {Real} [_select = false]
var in = __Imgui_in, argi=0;
sr_buffer_write_val(in, argument[argi++], ERousrData.Int32);
sr_buffer_write_val(in, argument[argi++], ERousrData.Int32);
sr_buffer_write_val(in, argument_count > argi ? argument[argi] : false, ERousrData.Bool); argi++;
__imguigml_ext_call(_extImguiGML_texteditor_move_left());


#define imguigml_texteditor_move_right
///@function imguigml_texteditor_move_right(_editor_index, _amount, [_select = false])
///@desc Moves right  lines in the text editor
///@param {Real} _editor_index 
///@param {Real} _amount
///@param {Real} [_select = false]
var in = __Imgui_in, argi=0;
sr_buffer_write_val(in, argument[argi++], ERousrData.Int32);
sr_buffer_write_val(in, argument[argi++], ERousrData.Int32);
sr_buffer_write_val(in, argument_count > argi ? argument[argi] : false, ERousrData.Bool); argi++;
__imguigml_ext_call(_extImguiGML_texteditor_move_right());


#define imguigml_texteditor_move_top
///@function imguigml_texteditor_move_top(_editor_index, [_select = false])
///@desc Skips to top of current editor 
///@param {Real} _editor_index 
///@param {Real} [_select = false]
var in = __Imgui_in, argi=0;
sr_buffer_write_val(in, argument[argi++], ERousrData.Int32);
sr_buffer_write_val(in, argument_count > argi ? argument[argi] : false, ERousrData.Bool); argi++;
__imguigml_ext_call(_extImguiGML_texteditor_move_top());


#define imguigml_texteditor_move_bottom
///@function imguigml_texteditor_move_bottom(_editor_index, [_select = false])
///@desc Skips to bottom of current editor 
///@param {Real} _editor_index 
///@param {Real} [_select = false]
var in = __Imgui_in, argi=0;
sr_buffer_write_val(in, argument[argi++], ERousrData.Int32);
sr_buffer_write_val(in, argument_count > argi ? argument[argi] : false, ERousrData.Bool); argi++;
__imguigml_ext_call(_extImguiGML_texteditor_move_bottom());


#define imguigml_texteditor_move_home
///@function imguigml_texteditor_move_home(_editor_index, [_select = false])
///@desc Moves to the home position of the current editor
///@param {Real} _editor_index 
///@param {Real} [_select = false]
var in = __Imgui_in, argi=0;
sr_buffer_write_val(in, argument[argi++], ERousrData.Int32);
sr_buffer_write_val(in, argument_count > argi ? argument[argi] : false, ERousrData.Bool); argi++;
__imguigml_ext_call(_extImguiGML_texteditor_move_home());


#define imguigml_texteditor_move_end
///@function imguigml_texteditor_move_end(_editor_index, [_select = false])
///@desc Moves to the end position of the current editor
///@param {Real} _editor_index 
///@param {Real} [_select = false]
var in = __Imgui_in, argi=0;
sr_buffer_write_val(in, argument[argi++], ERousrData.Int32);
sr_buffer_write_val(in, argument_count > argi ? argument[argi] : false, ERousrData.Bool); argi++;
if (!__imguigml_ext_call(_extImguiGML_texteditor_move_end()))
	return;


#define imguigml_texteditor_set_selection_start
///@function imguigml_texteditor_set_selection_start(_editor_index, _line, _col)
///@desc Sets the start select position in the current editor
///@param {Real} _editor_index 
///@param {Real} _line
///@param {Real} _col
var in = __Imgui_in, argi=0;
sr_buffer_write_val(in, argument[argi++], ERousrData.Int32);
sr_buffer_write_val(in, argument[argi++], ERousrData.Int32);
sr_buffer_write_val(in, argument[argi++], ERousrData.Int32);
__imguigml_ext_call(_extImguiGML_texteditor_set_selection_start());


#define imguigml_texteditor_set_selection_end
///@function imguigml_texteditor_set_selection_end(_editor_index, _line, _col)
///@desc Sets the end select position in the current editor
///@param {Real} _editor_index 
///@param {Real} _line
///@param {Real} _col
var in = __Imgui_in, argi=0;
sr_buffer_write_val(in, argument[argi++], ERousrData.Int32);
sr_buffer_write_val(in, argument[argi++], ERousrData.Int32);
sr_buffer_write_val(in, argument[argi++], ERousrData.Int32);
__imguigml_ext_call(_extImguiGML_texteditor_set_selection_end());


#define imguigml_texteditor_set_selection
///@function imguigml_texteditor_set_selection(_editor_index, _line1, _col1, _line2, _col2, [word_mode = false])
///@desc Sets selection value in current editor
///@param {Real} _editor_index 
///@param {Real} _line1
///@param {Real} _col1
///@param {Real} _line2
///@param {Real} _col2
///@param {Boolean} [word_mode = false]
var in = __Imgui_in, argi=0;
sr_buffer_write_val(in, argument[argi++], ERousrData.Int32);
sr_buffer_write_val(in, argument[argi++], ERousrData.Int32);
sr_buffer_write_val(in, argument[argi++], ERousrData.Int32);
sr_buffer_write_val(in, argument[argi++], ERousrData.Int32);
sr_buffer_write_val(in, argument[argi++], ERousrData.Int32);
sr_buffer_write_val(in, argument_count > argi ? argument[argi] : false, ERousrData.Bool); argi++;
__imguigml_ext_call(_extImguiGML_texteditor_set_selection());


#define imguigml_texteditor_select_word_under_cursor
///@function imguigml_texteditor_select_word_under_cursor(_editor_index)
///@desc Selects the word under the mouse cursor in the current editor
///@param {Real} _editor_index 
var in = __Imgui_in, argi=0;
sr_buffer_write_val(in, argument[argi++], ERousrData.Int32);
__imguigml_ext_call(_extImguiGML_texteditor_select_word_under_cursor());


#define imguigml_texteditor_has_selection
///@function imguigml_texteditor_has_selection(_editor_index)
///@desc Checks if current editor has selected text 
///@param {Real} _editor_index 
///@returns {Boolean}
var in = __Imgui_in, argi=0;
sr_buffer_write_val(in, argument[argi++], ERousrData.Int32);
if (!__imguigml_ext_call(_extImguiGML_texteditor_has_selection()))
	return;
var out = __Imgui_out;
return buffer_read(out, buffer_s8) != 0;

#define imguigml_texteditor_copy
///@function imguigml_texteditor_copy(_editor_index)
///@desc Copies the selected tex
///@param {Real} _editor_index
var in = __Imgui_in, argi=0;
sr_buffer_write_val(in, argument[argi++], ERousrData.Int32);
__imguigml_ext_call(_extImguiGML_texteditor_copy());

#define imguigml_texteditor_cut
///@function imguigml_texteditor_cut(_editor_index)
///@desc Cuts the selected text
///@param {Real} _editor_index 
var in = __Imgui_in, argi=0;
sr_buffer_write_val(in, argument[argi++], ERousrData.Int32);
__imguigml_ext_call(_extImguiGML_texteditor_cut());

#define imguigml_texteditor_paste
///@function imguigml_texteditor_paste(_editor_index)
///@desc pastes the selected text
///@param {Real} _editor_index 
var in = __Imgui_in, argi=0;
sr_buffer_write_val(in, argument[argi++], ERousrData.Int32);
__imguigml_ext_call(_extImguiGML_texteditor_paste());

#define imguigml_texteditor_delete
///@function imguigml_texteditor_delete(_editor_index)
///@desc deletes the selected text
///@param {Real} _editor_index 
var in = __Imgui_in, argi=0;
sr_buffer_write_val(in, argument[argi++], ERousrData.Int32);
__imguigml_ext_call(_extImguiGML_texteditor_delete());

#define imguigml_texteditor_can_undo
///@function imguigml_texteditor_can_undo(_editor_index)
///@desc Check if there is undo history
///@param {Real} _editor_index 
///@returns {Boolean}
var in = __Imgui_in, argi=0;
sr_buffer_write_val(in, argument[argi++], ERousrData.Int32);
if (!__imguigml_ext_call(_extImguiGML_texteditor_can_undo()))
	return;
var out = __Imgui_out;
return buffer_read(out, buffer_s8) != 0;


#define imguigml_texteditor_can_redo
///@function imguigml_texteditor_can_redo(_editor_index)
///@desc Check if there is redo history
///@param {Real} _editor_index 
///@returns {Boolean}
var in = __Imgui_in, argi=0;
sr_buffer_write_val(in, argument[argi++], ERousrData.Int32);
if (!__imguigml_ext_call(_extImguiGML_texteditor_can_redo()))
	return;
var out = __Imgui_out;
return buffer_read(out, buffer_s8) != 0;

#define imguigml_texteditor_get_dark_palette
///@function imguigml_texteditor_get_dark_palette(_editor_index)
///@desc Gets the dark palette that may be used with editor 
///@param {Real} _editor_index 
///@returns {Array} 
var in = __Imgui_in, argi=0;
sr_buffer_write_val(in, argument[argi++], ERousrData.Int32);
if (!__imguigml_ext_call(_extImguiGML_texteditor_get_dark_palette()))
	return;
var out = __Imgui_out;
var palette = array_create(EImGuiText_Palette.Num, 0);
var i = 0; repeat(EImGuiText_Palette.Num)
  palette[@i++] = buffer_read(out, buffer_u8);
return palette;


#define imguigml_texteditor_get_light_palette
///@function imguigml_texteditor_get_light_palette(_editor_index)
///@desc Gets the light palette that may be used with editor 
///@param {Real} _editor_index 
///@returns {Array} 
var in = __Imgui_in, argi=0;
sr_buffer_write_val(in, argument[argi++], ERousrData.Int32);
if (!__imguigml_ext_call(_extImguiGML_texteditor_get_light_palette()))
	return;
var out = __Imgui_out;
var palette = array_create(EImGuiText_Palette.Num, 0);
var i = 0; repeat(EImGuiText_Palette.Num)
  palette[@i++] = buffer_read(out, buffer_u8);
return palette;

#define rousr_callstack_init
///@function _rousr_callstack_init()
///@desc Initial rousr_callstack data
///@extensionizer { "docs": false }
global.__rousr_callstack = [
  sr_array_create(),
  sr_stack_array_create(),
  sr_array_create(),
  false,
  undefined
];

_extRousrDLL_callstack_init();    

#define rousr_callstack_clean_up
///@function rousr_callstack_cleanup()
///@desc delete all the buffers in the rousr callstack system - call before you 'reset' anything using the callstacks
///@extensionizer { "docs": false }
var callstacks_data = global.__rousr_callstack;
var calls   = callstacks_data[ERousrCallstack.Calls];
var buffers = callstacks_data[ERousrCallstack.Buffers];

// shouldn't be able to happen
if (sr_array_size(calls) != 0) {
  show_debug_message("Warning: Queueing rousr_callstack clean up - calls are still active");
  callstacks_data[@ ERousrCallstack.QueueCleanUp] = true;
  return;
}

var num_buffers = sr_array_size(buffers);
for (var i = 0; i < num_buffers; ++i) {
  var buffer_data = sr_array(buffers, i);
  buffer_delete(buffer_data[0]);
}

global.__rousr_callstack = undefined;
_extRousrDLL_callstack_shutdown();

#define rousr_callstack_process
///@function rousr_callstack_process(_call_id)
///@desc allow passing back and forth between DLL and GML
///@param {Real} _call_id
///@returns {Boolean} returns false if there's nothing left to process for `_call_id`, if true, see `rousr_callstack_buffer` for extracting data from DLL
///@extensionizer { "docs": false }
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
      sr_array_remove(calls, sr_array_find(calls, _call));
      
      // return the buffer
      var free = callstack_data[ERousrCallstack.Free];
      sr_stack_array_push(free, _call[ERousrCall.BufferIndex]);
      
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
///@return {Real} buffer_id seek'd to start - this is a sr_buffer and can be used to read parameters in the order expected from the DLL
///@extensionizer { "docs": false }
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
///@return {Real} sr_buffer (at start) and should be written to using `sr_buffer_write_val` 
///@extensionizer { "docs": false }
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
///@extensionizer { "docs": false }
var _call_id = argument0;

var callstacks_data = global.__rousr_callstack;
var calls = callstacks_data[ERousrCallstack.Calls];
var last = sr_array_size(calls) - 1;
for (var i = last; i >= 0; --i) {
  var call = sr_array(calls, i);
  if (call[ERousrCall.Id] == _call_id)
    return call;
}

var call = array_create(ERousrCall.Num);
call[@ ERousrCall.Id] = _call_id;

var free       = callstacks_data[ERousrCallstack.Free];
var buff_array = callstacks_data[ERousrCallstack.Buffers];
  
var buff_index = sr_stack_array_pop(free);
if (buff_index == undefined) {
  var buffer = buffer_create(RousrCallBufferSize, buffer_fixed, 1);
  sr_array_push_back(buff_array, [ buffer, RousrCallBufferSize ]);
  buff_index = sr_array_size(buff_array) - 1;
}

var buff_data = sr_array(buff_array, buff_index);
call[@ ERousrCall.Buffer]      = buff_data[0];
call[@ ERousrCall.BufferSize]  = buff_data[1];
call[@ ERousrCall.BufferIndex] = buff_index;

sr_array_push_back(calls, call);
return call;

#define sr_sprite_cache_create
///@function sr_sprite_cache_create([_width=2048], [_height=2048])
///@desc create a new sprite cache
///@param {Real} [_width=2048]
///@param {Real} [_height=2048]
///@returns {Array:ERousrSpriteCache} a sprite cache object
///@extensionizer { "docs": false }
var _width  = argument_count > 0 ? argument[0] : 2048,
    _height = argument_count > 1 ? argument[1] : 2048;

return [
	ds_map_create(),         // SpriteMap
	sr_array_create(),       // SpriteList
	sr_stack_array_create(), // New Sprites this Flush
	sr_array_create(),       // AtlasList
											     
	_width,                  // Max dimensions
	_height							     // Max dimensions
];

#define sr_sprite_cache_destroy
///@function sr_sprite_cache_destroy(_cache)
///@desc clean up a sprite cache
///@param {Array:ERousrSpriteCache} _cache
///@returns {undefined}
///@extensionizer { "docs": false }
var _cache = argument[0];
ds_map_destroy(_cache[ERousrSpriteCache.SpriteMap]);
var atlas_list = _cache[ERousrSpriteCache.AtlasList];
var num_atlas = sr_array_size(atlas_list);
for (var i = 0; i < num_atlas; ++i) {
	var atlas = sr_array(atlas_list, i);
	sr_sprite_atlas_flush(atlas);
}

return undefined;

#define sr_sprite_cache_push_sprite
///@function sr_sprite_cache_push_sprite(_sprite_cache, _sprite, _image_index)
///@desc push a sprite onto the sprite cache, returns an id for the packed sprite
///@param {Array:ERousrSpriteCache} _sprite_cache   sprite cache to pushs sprite to
///@param {Real} _sprite                            `sprite_index` of sprite to cache on the texture
///@param {Real} _image_index                       `image_index` to draw
///@returns {Array:ERousrCachedSprite}
///@extensionizer { "docs": false }
var _sprite_cache = argument[0],
    _sprite       = argument[1],
    _image_index  = argument[2];

var spr_map = _sprite_cache[ERousrSpriteCache.SpriteMap];
var sl = _sprite_cache[ERousrSpriteCache.SpriteList];
var ss = _sprite_cache[ERousrSpriteCache.SpriteStack];

var key        = string(_sprite) + "_" + string(_image_index);
var in_map = spr_map[? key]
if (in_map != undefined) {
  return sr_array(sl, in_map);
} 

var atlas_list = _sprite_cache[ERousrSpriteCache.AtlasList];
var atlas_index = -1;
var num_atlases = sr_array_size(atlas_list);
var sprite_atlas_index = num_atlases - 1;

if (sprite_atlas_index < 0) {
	sr_array_push_back(atlas_list, sr_sprite_atlas_create(_sprite_cache[ERousrSpriteCache.Width], _sprite_cache[ERousrSpriteCache.Height]));
	sprite_atlas_index++;
	num_atlases++;
}

var atlas   = sr_array(atlas_list, sprite_atlas_index);
atlas_index = sr_sprite_atlas_pack(atlas, _sprite, _image_index);
if (atlas_index < 0) {
	// feed the new one into the stack so it'll auto-add to an atlas
	var cache_sprite = array_create(ERousrCachedSprite.Num);
	cache_sprite[@ ERousrCachedSprite.SpriteIndex] = _sprite;
	cache_sprite[@ ERousrCachedSprite.ImageIndex]  = _image_index;
	sr_stack_array_push(ss, cache_sprite);
	var new_cache = cache_sprite;
	
	// atlas was full, clear sprites that haven't been requeued
	for (var i = 0; i < num_atlases; ++i) {
		atlas = sr_array(atlas_list, i);
		sr_sprite_atlas_clear(atlas);
	}
	
	ds_map_clear(spr_map);
	sr_array_clear(sl);
	
	// repack just sprites added since last flush
	var top = sr_stack_array_top(ss);
	var stack = ss[ERousrStackArray.Stack];
	for (var i = 0; i <= top; ++i) {
		atlas_index = -1;
		if (i >= num_atlases) {
			sr_array_push_back(atlas_list, sr_sprite_atlas_create(_sprite_cache[ERousrSpriteCache.Width], _sprite_cache[ERousrSpriteCache.Height]));
			num_atlases++;
		}
		
		var atlas = sr_array(atlas_list, i);
		while(atlas_index == -1) {
			cache_sprite = ss[i];
			var spr = cache_sprite[ERousrCachedSprite.SpriteIndex];
			var img = cache_sprite[ERousrCachedSprite.ImageIndex];

			atlas_index = sr_sprite_atlas_pack(atlas, spr, img);
			atlas_sprite = sr_sprite_atlas_get(atlas, atlas_index);
			
			cache_sprite[@ ERousrCachedSprite.AtlasIndex]  = atlas_index;
			cache_sprite[@ ERousrCachedSprite.UVs]         = atlas_sprite[ERousrAtlasSprite.UVs];
		}
	}
	
	cache_sprite = new_cache;
} else {

	var atlas_sprite = sr_sprite_atlas_get(atlas, atlas_index);
	var cache_sprite = array_create(ERousrCachedSprite.Num);

	cache_sprite[@ ERousrCachedSprite.SpriteIndex] = _sprite;
	cache_sprite[@ ERousrCachedSprite.ImageIndex]  = _image_index;
	cache_sprite[@ ERousrCachedSprite.AtlasIndex]  = atlas_index;
	cache_sprite[@ ERousrCachedSprite.UVs]         = atlas_sprite[ERousrAtlasSprite.UVs];
	
	sr_stack_array_push(ss, cache_sprite);
}
 
return cache_sprite; 

#define sr_sprite_cache_flush
///@function sr_sprite_cache_flush(_cache)
///@desc flush the sprites to a texture
///@param {Array:ERousrLazyBin} _bin   
///@extensionizer { "docs": false }
var _cache = argument[0];

var atlas_list = _cache[ERousrSpriteCache.AtlasList];
var num_atlas = sr_array_size(atlas_list);
for (var i = 0; i < num_atlas; ++i) {
	var atlas = sr_array(atlas_list, i);
	sr_sprite_atlas_flush(atlas);
}

var ss = _cache[ERousrSpriteCache.SpriteStack];
if (!sr_stack_array_empty(ss)) {
	var spr_map = _cache[ERousrSpriteCache.SpriteMap];
	var sl = _cache[ERousrSpriteCache.SpriteList];
	
	while (!sr_stack_array_empty(ss)) {
		var spr = sr_stack_array_pop(ss);
		sr_array_push_back(sl, spr);

		var _sprite    = spr[ERousrCachedSprite.SpriteIndex];
		var _img       = spr[ERousrCachedSprite.ImageIndex]
		var key        = string(_sprite) + "_" + string(_img);
		spr_map[? key] = sr_array_size(sl) - 1;
	}
}

#define sr_sprite_cache_get_uvs
///@function sr_sprite_cache_get_uvs(_cache, _packed_id)
///@desc returns uvs (0-1) for each of the four corner
///@extensionizer { "docs": false }
var _cache  = argument[0],
    _cached = argument[1];

// todo: most likely will need to use imguigml_quad instead, internally, if i allow packers to flip the rects
return _cached[ERousrCachedSprite.UVs];

#define sr_sprite_cache_get_surface
///@function sr_sprite_cache_get_surface(_cache, _cached_sprite)
///@desc get the surface for the cached sprite
///@param {Array:ERousrSpriteCache}  _cache
///@param {Array:ERousrCachedSprite} _cached_sprite
///@extensionizer { "docs": false }
var _cache  = argument[0],
    _cached = argument[1];

var sprite_atlas = _cached[ERousrCachedSprite.ParentAtlas];
var atlas_list   = _cache[ERousrSpriteCache.AtlasList];
sprite_atlas = sr_array(atlas_list, sprite_atlas);

return sprite_atlas[ERousrSpriteAtlas.Surface];

#define sr_lazy_bin_create
///@function sr_lazy_bin_create(_width, _height)
///@desc creaete a lazy bin packer bin
///@param {Real} _width
///@param {Real} _height
///@returns {Array:ERousrLazyBin} _lazy_bin
///@extensionizer { "docs": false }
var _width  = argument[0],
    _height = argument[1];
		
return [
	sr_array_create(),
	_width,
	_height
];

#define sr_lazy_bin_destroy
///@function sr_lazy_bin_destroy(_bin)
///@desc clean up a lazy bin
///@param {Array:ERousrLazyBin} _bin   bin to destroy
///@returns {undefined} always & forever
///@extensionizer { "docs": false }
var _bin;

// nothing to do here really

return undefined;

#define sr_lazy_bin_pack
///@function sr_lazy_bin_pack(_bin, _width, _height)
///@desc just try to fit a rectangle next to this one, if it fits :confetti:
///@param {Array:ERousrLazyBin} _bin
///@param {Real} _width
///@param {Real} _height
///@returns {Real} _index of packed rect or -1 if can't fit
///@extensionizer { "docs": false }
var _bin    = argument[0],
    _width  = argument[1],
		_height = argument[2];

var rects = _bin[ERousrLazyBin.Rects];
var bin_width  = _bin[ERousrLazyBin.Width];
var bin_height = _bin[ERousrLazyBin.Height];

var num_rects = sr_array_size(rects);

var x1 = 0, y1 = 0, x2 = _width, y2 = _height;
var found = true;
var new_rect = [
	[ x1, y1 ],
	[ x2, y2 ],
];
	

// todo: this is dumb actually
while(found) {
  found = false;
	for (var rect_index = 0; !found && rect_index < num_rects; ++rect_index) {
		var rect = sr_array(rects, rect_index);
	
		var r_min = rect[ERousrBinRect.Min],
		    r_max = rect[ERousrBinRect.Max];
	
		found = rectangle_in_rectangle(x1, y1, x2, y2, r_min[0], r_min[1], r_max[0], r_max[1]);
	}
	
	if (found) {
		x1 += _width;
		x2 += _width;
		if (!__h_RLBP_RectInBin) {
			y1 += _height; y2 += _height;
			x1  = 0;       x2  = _width;
			
      if (!__h_RLBP_RectInBin) { // no space availalble 
         found = false;
         new_rect = undefined;
         break;
      }
		}
 
    new_rect = [
      [ x1, y1 ],
      [ x2, y2 ]
    ]
  }
}

if (is_array(new_rect)) {
  sr_array_push_back(rects, new_rect);
  return num_rects;
}
  
return -1;

#define sr_lazy_bin_get
///@function sr_lazy_bin_get(_bin, _packed_id)
///@desc return the rect at the id given
///@param {Array:ERousrLazyBin} _bin
///@param {Real} _packed_id
///@returns {Array:ERousrBinRect} 
///@extensionizer { "docs": false }
gml_pragma("forceinline");
var _bin    = argument[0],
    _packed = argument[1];
		
var rects = _bin[ERousrLazyBin.Rects];
return sr_array(rects, _packed);

#define sr_lazy_bin_width
///@function sr_lazy_bin_width(_bin)
///@desc return the rect at the id given
///@param {Array:ERousrLazyBin} _bin
///@returns {Real} width of the bin packer [total width, not used width]
///@extensionizer { "docs": false }
gml_pragma("forceinline");
var _bin = argument[0];
return _bin[ERousrLazyBin.Width];


#define sr_lazy_bin_height
///@function sr_lazy_bin_height(_bin)
///@desc return the rect at the id given
///@param {Array:ERousrLazyBin} _bin
///@returns {Real} height of the bin packer [total height, not used height]
///@extensionizer { "docs": false }
gml_pragma("forceinline");
var _bin = argument[0];
return _bin[ERousrLazyBin.Height];


#define sr_lazy_bin_clear
///@function sr_lazy_bin_clear(_bin_pack)
///@desc clear a lazy bin packer
///@param {Array:ERousrLazyBin} _bin_pack
///@returns {Array:ERousrLazyBin} _bin_pack
///@extensionizer { "docs": false }
var _bin_pack = argument[0];
sr_array_clear(_bin_pack[ERousrLazyBin.Rects]);
return _bin_pack;

#define sr_sprite_atlas_create
///@function sr_sprite_atlas_create(_width, _height)
///@desc create a sprite atlas
///@param {Real} _width
///@param {Real} _height
///@returns {Array:ERousrSpriteAtlas} 
///@extensionizer { "docs": false }
var _width  = argument[0],
    _height = argument[1];
		
var bin = sr_lazy_bin_create(_width, _height);
return [
	sr_array_create(),
	sr_stack_array_create(),
	bin,
	-1
];


#define sr_sprite_atlas_destroy
///@function sr_sprite_atlas_destroy(_sprite_atlas)
///@desc free resources used by `_sprite_atlas`
///@parma {Array:ERousrSpriteAtlas} _sprite_atlas
///@returns {undefined} 
///@extensionizer { "docs": false }
var _sprite_atlas = argument[0];
if (surface_exists(_sprite_atlas[ERousrSpriteAtlas.Surface])) {
	surface_free(_sprite_atlas[ERousrSpriteAtlas.Surface]);
}

return undefined;

#define sr_sprite_atlas_pack
///@function sr_sprite_atlas_pack(_sprite_atlas, _sprite, [_image_num=0])
///@desc pack a sprite - note that this just packs a sprite and returns an id, duplicates are allowed, etc.
///@param {Array} _sprite_atlas
///@param {Real} _sprite
///@param {Real} [_image_num=0]
///@returns {Real} sprite atlas id or -1 if it didn't fit
///@extensionizer { "docs": false }
var _sprite_atlas = argument[0],
    _sprite = argument[1],
		_image  = argument_count > 2 ? argument[2] : 0;

var ss  = _sprite_atlas[ERousrSpriteAtlas.SpriteStack];
var bin = _sprite_atlas[ERousrSpriteAtlas.BinPack];

var sw = sprite_get_width(_sprite);
var sh = sprite_get_height(_sprite);
var packed_id = sr_lazy_bin_pack(bin, sw, sh);

if (packed_id == -1)
	return -1;
	
var prect = sr_lazy_bin_get(bin, packed_id),
    w     = sr_lazy_bin_width(bin),
		h     = sr_lazy_bin_height(bin);
		
// if (is_flipped) // this si why we quad
var pmin = prect[0],
    pmax = prect[1];
		
var uvs = [
	[ pmin[0] / w, pmin[1] / h ],
	[ pmax[0] / w, pmax[1] / h ]
];

var atlas_sprite = [
	_sprite, _image, packed_id, prect, uvs 
];

var sl =_sprite_atlas[ERousrSpriteAtlas.SpriteList];
sr_stack_array_push(ss, atlas_sprite);
sr_array_push_back(sl, atlas_sprite);

return sr_array_size(sl) - 1;

#define sr_sprite_atlas_get
///@function sr_sprite_atlas_get(_sprite_atlas, _atlas_index)
///@desc return an atlas sprite
///@param {Array:ERousrSpriteAtlas} _sprite_atlas
///@param {Real} _atlas_index
///@returns {Array:ERousrAtlasSprite}
///@extensionizer { "docs": false }
var _sprite_atlas = argument[0],
    _atlas_index = argument[1];
		
var sl = _sprite_atlas[ERousrSpriteAtlas.SpriteList];
return sr_array(sl, _atlas_index);

#define sr_sprite_atlas_flush
///@function sr_sprite_atlas_flush(_sprite_atlas)
///@desc draw all the added sprites to the surface
///@param {Array} _sprite_atlas
///@extensionizer { "docs": false }
var _sprite_atlas = argument[0];

var sprites  = _sprite_atlas[ERousrSpriteAtlas.SpriteStack];
var bin      = _sprite_atlas[ERousrSpriteAtlas.BinPack];
var surf     = _sprite_atlas[ERousrSpriteAtlas.Surface];

var draw_all = false;
if (!surface_exists(surf)) {
	surf = surface_create(sr_lazy_bin_width(bin), sr_lazy_bin_height(bin));
  _sprite_atlas[@ ERousrSpriteAtlas.Surface] = surf;
	draw_all = true;
}

if (!draw_all && sr_stack_array_empty(sprites))
  return;

var spr_list = _sprite_atlas[ERousrSpriteAtlas.SpriteList];

surface_set_target(surf);
if (draw_all) {
  draw_clear_alpha(c_black, 0);
	var num_sprites = sr_array_size(spr_list);
	for (var i = 0; i < num_sprites; ++i) {
		var s = sr_array(spr_list, i);
		
		var spr    = s[ERousrAtlasSprite.Sprite];
		var img    = s[ERousrAtlasSprite.Image];
		var packed = s[ERousrAtlasSprite.PackedRect];
		var r_min = packed[0];
		
		draw_sprite(spr, img, r_min[0] + sprite_get_xoffset(spr), r_min[1] + sprite_get_yoffset(spr));	
	}
} else {

	while (!sr_stack_array_empty(sprites)) {
		var s = sr_stack_array_pop(sprites);
	
		var spr    = s[ERousrAtlasSprite.Sprite];
		var img    = s[ERousrAtlasSprite.Image];
		var packed = s[ERousrAtlasSprite.PackedRect];
		var r_min = packed[0];
		
		draw_sprite(spr, img, r_min[0] + sprite_get_xoffset(spr), r_min[1] + sprite_get_yoffset(spr));	
	}
}

surface_reset_target();	

#define sr_sprite_atlas_clear
///@function sr_sprite_atlas_clear(_sprite_atlas)
///@desc clear all the sprites from an atlas
///@param {Array:ERousrSpriteAtlas} _sprite_atlas
///@returns {Array:ERousrSpriteAtlas} _sprite_atlas
///@extensionizer { "docs": false }
var _sprite_atlas = argument[0];

var sl = _sprite_atlas[ERousrSpriteAtlas.SpriteList];
var ss = _sprite_atlas[ERousrSpriteAtlas.SpriteStack];
var surf = _sprite_atlas[ERousrSpriteAtlas.Surface];

if (surface_exists(surf))
	surface_free(surf);
	
_sprite_atlas[@ ERousrSpriteAtlas.Surface] = -1;

sr_array_clear(sl);
while (!sr_stack_array_empty(ss))
	sr_stack_array_pop(ss);
	
return _sprite_atlas;

#define __extimguigml_script_index
///@function __extimguigml_script_index(ext_script_index)
///@desc Returns the actual runtime script index because YYG doesn't know how to do that apparently
///@param {Real} ext_script_index
///@extensionizer { "docs": false, "export": true} 
///@returns {Real} script_index
gml_pragma("forceinline")
gml_pragma("global", "global.__extimguigml_script_index_lookup = array_create(0);global.__extimguigml_script_index_lookup[@ imguigml_activate] = asset_get_index(\"imguigml_activate\");global.__extimguigml_script_index_lookup[@ imguigml_deactivate] = asset_get_index(\"imguigml_deactivate\");global.__extimguigml_script_index_lookup[@ imguigml_ready] = asset_get_index(\"imguigml_ready\");global.__extimguigml_script_index_lookup[@ imguigml_color_convert_gml_to_u32] = asset_get_index(\"imguigml_color_convert_gml_to_u32\");global.__extimguigml_script_index_lookup[@ imguigml_color_convert_gml_to_float4] = asset_get_index(\"imguigml_color_convert_gml_to_float4\");global.__extimguigml_script_index_lookup[@ imguigml_color_convert_float4_to_gml] = asset_get_index(\"imguigml_color_convert_float4_to_gml\");global.__extimguigml_script_index_lookup[@ imguigml_color_convert_u32_to_gml] = asset_get_index(\"imguigml_color_convert_u32_to_gml\");global.__extimguigml_script_index_lookup[@ imguigml_toggle_cursor] = asset_get_index(\"imguigml_toggle_cursor\");global.__extimguigml_script_index_lookup[@ imguigml_enable_depth] = asset_get_index(\"imguigml_enable_depth\");global.__extimguigml_script_index_lookup[@ imguigml_set_display_mode] = asset_get_index(\"imguigml_set_display_mode\");global.__extimguigml_script_index_lookup[@ imguigml_get_display_mode] = asset_get_index(\"imguigml_get_display_mode\");global.__extimguigml_script_index_lookup[@ imguigml_get_display_view] = asset_get_index(\"imguigml_get_display_view\");global.__extimguigml_script_index_lookup[@ imguigml_set_display_scale] = asset_get_index(\"imguigml_set_display_scale\");global.__extimguigml_script_index_lookup[@ imguigml_get_display_scale_width] = asset_get_index(\"imguigml_get_display_scale_width\");global.__extimguigml_script_index_lookup[@ imguigml_get_display_scale_height] = asset_get_index(\"imguigml_get_display_scale_height\");global.__extimguigml_script_index_lookup[@ imguigml_set_display_size] = asset_get_index(\"imguigml_set_display_size\");global.__extimguigml_script_index_lookup[@ imguigml_get_display_size] = asset_get_index(\"imguigml_get_display_size\");global.__extimguigml_script_index_lookup[@ imguigml_separator] = asset_get_index(\"imguigml_separator\");global.__extimguigml_script_index_lookup[@ imguigml_same_line] = asset_get_index(\"imguigml_same_line\");global.__extimguigml_script_index_lookup[@ imguigml_new_line] = asset_get_index(\"imguigml_new_line\");global.__extimguigml_script_index_lookup[@ imguigml_spacing] = asset_get_index(\"imguigml_spacing\");global.__extimguigml_script_index_lookup[@ imguigml_dummy] = asset_get_index(\"imguigml_dummy\");global.__extimguigml_script_index_lookup[@ imguigml_indent] = asset_get_index(\"imguigml_indent\");global.__extimguigml_script_index_lookup[@ imguigml_unindent] = asset_get_index(\"imguigml_unindent\");global.__extimguigml_script_index_lookup[@ imguigml_begin_group] = asset_get_index(\"imguigml_begin_group\");global.__extimguigml_script_index_lookup[@ imguigml_end_group] = asset_get_index(\"imguigml_end_group\");global.__extimguigml_script_index_lookup[@ imguigml_get_cursor_pos] = asset_get_index(\"imguigml_get_cursor_pos\");global.__extimguigml_script_index_lookup[@ imguigml_get_cursor_pos_x] = asset_get_index(\"imguigml_get_cursor_pos_x\");global.__extimguigml_script_index_lookup[@ imguigml_get_cursor_pos_y] = asset_get_index(\"imguigml_get_cursor_pos_y\");global.__extimguigml_script_index_lookup[@ imguigml_set_cursor_pos] = asset_get_index(\"imguigml_set_cursor_pos\");global.__extimguigml_script_index_lookup[@ imguigml_set_cursor_pos_x] = asset_get_index(\"imguigml_set_cursor_pos_x\");global.__extimguigml_script_index_lookup[@ imguigml_set_cursor_pos_y] = asset_get_index(\"imguigml_set_cursor_pos_y\");global.__extimguigml_script_index_lookup[@ imguigml_get_cursor_start_pos] = asset_get_index(\"imguigml_get_cursor_start_pos\");global.__extimguigml_script_index_lookup[@ imguigml_get_cursor_screen_pos] = asset_get_index(\"imguigml_get_cursor_screen_pos\");global.__extimguigml_script_index_lookup[@ imguigml_set_cursor_screen_pos] = asset_get_index(\"imguigml_set_cursor_screen_pos\");global.__extimguigml_script_index_lookup[@ imguigml_align_text_to_frame_padding] = asset_get_index(\"imguigml_align_text_to_frame_padding\");global.__extimguigml_script_index_lookup[@ imguigml_get_text_line_height] = asset_get_index(\"imguigml_get_text_line_height\");global.__extimguigml_script_index_lookup[@ imguigml_get_text_line_height_with_spacing] = asset_get_index(\"imguigml_get_text_line_height_with_spacing\");global.__extimguigml_script_index_lookup[@ imguigml_get_frame_height] = asset_get_index(\"imguigml_get_frame_height\");global.__extimguigml_script_index_lookup[@ imguigml_get_frame_height_with_spacing] = asset_get_index(\"imguigml_get_frame_height_with_spacing\");global.__extimguigml_script_index_lookup[@ imguigml_columns] = asset_get_index(\"imguigml_columns\");global.__extimguigml_script_index_lookup[@ imguigml_next_column] = asset_get_index(\"imguigml_next_column\");global.__extimguigml_script_index_lookup[@ imguigml_get_column_index] = asset_get_index(\"imguigml_get_column_index\");global.__extimguigml_script_index_lookup[@ imguigml_get_column_width] = asset_get_index(\"imguigml_get_column_width\");global.__extimguigml_script_index_lookup[@ imguigml_set_column_width] = asset_get_index(\"imguigml_set_column_width\");global.__extimguigml_script_index_lookup[@ imguigml_get_column_offset] = asset_get_index(\"imguigml_get_column_offset\");global.__extimguigml_script_index_lookup[@ imguigml_set_column_offset] = asset_get_index(\"imguigml_set_column_offset\");global.__extimguigml_script_index_lookup[@ imguigml_get_columns_count] = asset_get_index(\"imguigml_get_columns_count\");global.__extimguigml_script_index_lookup[@ imguigml_push_id] = asset_get_index(\"imguigml_push_id\");global.__extimguigml_script_index_lookup[@ imguigml_pop_id] = asset_get_index(\"imguigml_pop_id\");global.__extimguigml_script_index_lookup[@ imguigml_get_id] = asset_get_index(\"imguigml_get_id\");global.__extimguigml_script_index_lookup[@ imguigml_get_clipboard_text] = asset_get_index(\"imguigml_get_clipboard_text\");global.__extimguigml_script_index_lookup[@ imguigml_set_clipboard_text] = asset_get_index(\"imguigml_set_clipboard_text\");global.__extimguigml_script_index_lookup[@ imguigml_get_key_index] = asset_get_index(\"imguigml_get_key_index\");global.__extimguigml_script_index_lookup[@ imguigml_is_key_down] = asset_get_index(\"imguigml_is_key_down\");global.__extimguigml_script_index_lookup[@ imguigml_is_key_pressed] = asset_get_index(\"imguigml_is_key_pressed\");global.__extimguigml_script_index_lookup[@ imguigml_is_key_released] = asset_get_index(\"imguigml_is_key_released\");global.__extimguigml_script_index_lookup[@ imguigml_get_key_pressed_amount] = asset_get_index(\"imguigml_get_key_pressed_amount\");global.__extimguigml_script_index_lookup[@ imguigml_is_mouse_down] = asset_get_index(\"imguigml_is_mouse_down\");global.__extimguigml_script_index_lookup[@ imguigml_is_mouse_clicked] = asset_get_index(\"imguigml_is_mouse_clicked\");global.__extimguigml_script_index_lookup[@ imguigml_is_mouse_double_clicked] = asset_get_index(\"imguigml_is_mouse_double_clicked\");global.__extimguigml_script_index_lookup[@ imguigml_is_mouse_released] = asset_get_index(\"imguigml_is_mouse_released\");global.__extimguigml_script_index_lookup[@ imguigml_is_mouse_dragging] = asset_get_index(\"imguigml_is_mouse_dragging\");global.__extimguigml_script_index_lookup[@ imguigml_is_mouse_hovering_rect] = asset_get_index(\"imguigml_is_mouse_hovering_rect\");global.__extimguigml_script_index_lookup[@ imguigml_is_mouse_pos_valid] = asset_get_index(\"imguigml_is_mouse_pos_valid\");global.__extimguigml_script_index_lookup[@ imguigml_get_mouse_pos] = asset_get_index(\"imguigml_get_mouse_pos\");global.__extimguigml_script_index_lookup[@ imguigml_get_mouse_pos_on_opening_current_popup] = asset_get_index(\"imguigml_get_mouse_pos_on_opening_current_popup\");global.__extimguigml_script_index_lookup[@ imguigml_get_mouse_drag_delta] = asset_get_index(\"imguigml_get_mouse_drag_delta\");global.__extimguigml_script_index_lookup[@ imguigml_reset_mouse_drag_delta] = asset_get_index(\"imguigml_reset_mouse_drag_delta\");global.__extimguigml_script_index_lookup[@ imguigml_get_mouse_cursor] = asset_get_index(\"imguigml_get_mouse_cursor\");global.__extimguigml_script_index_lookup[@ imguigml_set_mouse_cursor] = asset_get_index(\"imguigml_set_mouse_cursor\");global.__extimguigml_script_index_lookup[@ imguigml_capture_keyboard_from_app] = asset_get_index(\"imguigml_capture_keyboard_from_app\");global.__extimguigml_script_index_lookup[@ imguigml_capture_mouse_from_app] = asset_get_index(\"imguigml_capture_mouse_from_app\");global.__extimguigml_script_index_lookup[@ imguigml_log_to_tty] = asset_get_index(\"imguigml_log_to_tty\");global.__extimguigml_script_index_lookup[@ imguigml_log_to_file] = asset_get_index(\"imguigml_log_to_file\");global.__extimguigml_script_index_lookup[@ imguigml_log_to_clipboard] = asset_get_index(\"imguigml_log_to_clipboard\");global.__extimguigml_script_index_lookup[@ imguigml_log_finish] = asset_get_index(\"imguigml_log_finish\");global.__extimguigml_script_index_lookup[@ imguigml_log_buttons] = asset_get_index(\"imguigml_log_buttons\");global.__extimguigml_script_index_lookup[@ imguigml_log_text] = asset_get_index(\"imguigml_log_text\");global.__extimguigml_script_index_lookup[@ imguigml_begin_main_menu_bar] = asset_get_index(\"imguigml_begin_main_menu_bar\");global.__extimguigml_script_index_lookup[@ imguigml_end_main_menu_bar] = asset_get_index(\"imguigml_end_main_menu_bar\");global.__extimguigml_script_index_lookup[@ imguigml_begin_menu_bar] = asset_get_index(\"imguigml_begin_menu_bar\");global.__extimguigml_script_index_lookup[@ imguigml_end_menu_bar] = asset_get_index(\"imguigml_end_menu_bar\");global.__extimguigml_script_index_lookup[@ imguigml_begin_menu] = asset_get_index(\"imguigml_begin_menu\");global.__extimguigml_script_index_lookup[@ imguigml_end_menu] = asset_get_index(\"imguigml_end_menu\");global.__extimguigml_script_index_lookup[@ imguigml_menu_item] = asset_get_index(\"imguigml_menu_item\");global.__extimguigml_script_index_lookup[@ imguigml_open_popup] = asset_get_index(\"imguigml_open_popup\");global.__extimguigml_script_index_lookup[@ imguigml_open_popup_on_item_click] = asset_get_index(\"imguigml_open_popup_on_item_click\");global.__extimguigml_script_index_lookup[@ imguigml_begin_popup] = asset_get_index(\"imguigml_begin_popup\");global.__extimguigml_script_index_lookup[@ imguigml_begin_popup_modal] = asset_get_index(\"imguigml_begin_popup_modal\");global.__extimguigml_script_index_lookup[@ imguigml_begin_popup_context_item] = asset_get_index(\"imguigml_begin_popup_context_item\");global.__extimguigml_script_index_lookup[@ imguigml_begin_popup_context_window] = asset_get_index(\"imguigml_begin_popup_context_window\");global.__extimguigml_script_index_lookup[@ imguigml_begin_popup_context_void] = asset_get_index(\"imguigml_begin_popup_context_void\");global.__extimguigml_script_index_lookup[@ imguigml_end_popup] = asset_get_index(\"imguigml_end_popup\");global.__extimguigml_script_index_lookup[@ imguigml_is_popup_open] = asset_get_index(\"imguigml_is_popup_open\");global.__extimguigml_script_index_lookup[@ imguigml_close_current_popup] = asset_get_index(\"imguigml_close_current_popup\");global.__extimguigml_script_index_lookup[@ imguigml_push_font] = asset_get_index(\"imguigml_push_font\");global.__extimguigml_script_index_lookup[@ imguigml_pop_font] = asset_get_index(\"imguigml_pop_font\");global.__extimguigml_script_index_lookup[@ imguigml_push_style_color] = asset_get_index(\"imguigml_push_style_color\");global.__extimguigml_script_index_lookup[@ imguigml_pop_style_color] = asset_get_index(\"imguigml_pop_style_color\");global.__extimguigml_script_index_lookup[@ imguigml_push_style_var] = asset_get_index(\"imguigml_push_style_var\");global.__extimguigml_script_index_lookup[@ imguigml_pop_style_var] = asset_get_index(\"imguigml_pop_style_var\");global.__extimguigml_script_index_lookup[@ imguigml_get_style_color_vec4] = asset_get_index(\"imguigml_get_style_color_vec4\");global.__extimguigml_script_index_lookup[@ imguigml_get_font] = asset_get_index(\"imguigml_get_font\");global.__extimguigml_script_index_lookup[@ imguigml_get_font_size] = asset_get_index(\"imguigml_get_font_size\");global.__extimguigml_script_index_lookup[@ imguigml_get_font_tex_uv_white_pixel] = asset_get_index(\"imguigml_get_font_tex_uv_white_pixel\");global.__extimguigml_script_index_lookup[@ imguigml_get_color_u32] = asset_get_index(\"imguigml_get_color_u32\");global.__extimguigml_script_index_lookup[@ imguigml_get_color_u32_from_idx] = asset_get_index(\"imguigml_get_color_u32_from_idx\");global.__extimguigml_script_index_lookup[@ imguigml_push_item_width] = asset_get_index(\"imguigml_push_item_width\");global.__extimguigml_script_index_lookup[@ imguigml_pop_item_width] = asset_get_index(\"imguigml_pop_item_width\");global.__extimguigml_script_index_lookup[@ imguigml_calc_item_width] = asset_get_index(\"imguigml_calc_item_width\");global.__extimguigml_script_index_lookup[@ imguigml_push_text_wrap_pos] = asset_get_index(\"imguigml_push_text_wrap_pos\");global.__extimguigml_script_index_lookup[@ imguigml_pop_text_wrap_pos] = asset_get_index(\"imguigml_pop_text_wrap_pos\");global.__extimguigml_script_index_lookup[@ imguigml_push_allow_keyboard_focus] = asset_get_index(\"imguigml_push_allow_keyboard_focus\");global.__extimguigml_script_index_lookup[@ imguigml_pop_allow_keyboard_focus] = asset_get_index(\"imguigml_pop_allow_keyboard_focus\");global.__extimguigml_script_index_lookup[@ imguigml_push_button_repeat] = asset_get_index(\"imguigml_push_button_repeat\");global.__extimguigml_script_index_lookup[@ imguigml_pop_button_repeat] = asset_get_index(\"imguigml_pop_button_repeat\");global.__extimguigml_script_index_lookup[@ imguigml_selectable] = asset_get_index(\"imguigml_selectable\");global.__extimguigml_script_index_lookup[@ imguigml_list_box] = asset_get_index(\"imguigml_list_box\");global.__extimguigml_script_index_lookup[@ imguigml_list_box_header] = asset_get_index(\"imguigml_list_box_header\");global.__extimguigml_script_index_lookup[@ imguigml_list_box_header_items] = asset_get_index(\"imguigml_list_box_header_items\");global.__extimguigml_script_index_lookup[@ imguigml_list_box_footer] = asset_get_index(\"imguigml_list_box_footer\");global.__extimguigml_script_index_lookup[@ imguigml_show_style_editor] = asset_get_index(\"imguigml_show_style_editor\");global.__extimguigml_script_index_lookup[@ imguigml_style_colors_classic] = asset_get_index(\"imguigml_style_colors_classic\");global.__extimguigml_script_index_lookup[@ imguigml_style_colors_dark] = asset_get_index(\"imguigml_style_colors_dark\");global.__extimguigml_script_index_lookup[@ imguigml_style_colors_light] = asset_get_index(\"imguigml_style_colors_light\");global.__extimguigml_script_index_lookup[@ imguigml_show_style_selector] = asset_get_index(\"imguigml_show_style_selector\");global.__extimguigml_script_index_lookup[@ imguigml_set_tooltip] = asset_get_index(\"imguigml_set_tooltip\");global.__extimguigml_script_index_lookup[@ imguigml_begin_tooltip] = asset_get_index(\"imguigml_begin_tooltip\");global.__extimguigml_script_index_lookup[@ imguigml_end_tooltip] = asset_get_index(\"imguigml_end_tooltip\");global.__extimguigml_script_index_lookup[@ imguigml_value] = asset_get_index(\"imguigml_value\");global.__extimguigml_script_index_lookup[@ imguigml_color_convert_u32_to_float4] = asset_get_index(\"imguigml_color_convert_u32_to_float4\");global.__extimguigml_script_index_lookup[@ imguigml_color_convert_float4_to_u32] = asset_get_index(\"imguigml_color_convert_float4_to_u32\");global.__extimguigml_script_index_lookup[@ imguigml_color_convert_rgb_to_hsv] = asset_get_index(\"imguigml_color_convert_rgb_to_hsv\");global.__extimguigml_script_index_lookup[@ imguigml_color_convert_hsv_to_rgb] = asset_get_index(\"imguigml_color_convert_hsv_to_rgb\");global.__extimguigml_script_index_lookup[@ imguigml_is_item_hovered] = asset_get_index(\"imguigml_is_item_hovered\");global.__extimguigml_script_index_lookup[@ imguigml_is_item_active] = asset_get_index(\"imguigml_is_item_active\");global.__extimguigml_script_index_lookup[@ imguigml_is_item_clicked] = asset_get_index(\"imguigml_is_item_clicked\");global.__extimguigml_script_index_lookup[@ imguigml_is_item_visible] = asset_get_index(\"imguigml_is_item_visible\");global.__extimguigml_script_index_lookup[@ imguigml_is_any_item_hovered] = asset_get_index(\"imguigml_is_any_item_hovered\");global.__extimguigml_script_index_lookup[@ imguigml_is_any_item_active] = asset_get_index(\"imguigml_is_any_item_active\");global.__extimguigml_script_index_lookup[@ imguigml_get_item_rect_min] = asset_get_index(\"imguigml_get_item_rect_min\");global.__extimguigml_script_index_lookup[@ imguigml_get_item_rect_max] = asset_get_index(\"imguigml_get_item_rect_max\");global.__extimguigml_script_index_lookup[@ imguigml_get_item_rect_size] = asset_get_index(\"imguigml_get_item_rect_size\");global.__extimguigml_script_index_lookup[@ imguigml_set_item_allow_overlap] = asset_get_index(\"imguigml_set_item_allow_overlap\");global.__extimguigml_script_index_lookup[@ imguigml_is_window_focused] = asset_get_index(\"imguigml_is_window_focused\");global.__extimguigml_script_index_lookup[@ imguigml_is_window_hovered] = asset_get_index(\"imguigml_is_window_hovered\");global.__extimguigml_script_index_lookup[@ imguigml_is_any_window_hovered] = asset_get_index(\"imguigml_is_any_window_hovered\");global.__extimguigml_script_index_lookup[@ imguigml_is_rect_visible] = asset_get_index(\"imguigml_is_rect_visible\");global.__extimguigml_script_index_lookup[@ imguigml_get_time] = asset_get_index(\"imguigml_get_time\");global.__extimguigml_script_index_lookup[@ imguigml_get_frame_count] = asset_get_index(\"imguigml_get_frame_count\");global.__extimguigml_script_index_lookup[@ imguigml_get_style_color_name] = asset_get_index(\"imguigml_get_style_color_name\");global.__extimguigml_script_index_lookup[@ imguigml_calc_item_rect_closest_point] = asset_get_index(\"imguigml_calc_item_rect_closest_point\");global.__extimguigml_script_index_lookup[@ imguigml_calc_text_size] = asset_get_index(\"imguigml_calc_text_size\");global.__extimguigml_script_index_lookup[@ imguigml_calc_list_clipping] = asset_get_index(\"imguigml_calc_list_clipping\");global.__extimguigml_script_index_lookup[@ imguigml_push_clip_rect] = asset_get_index(\"imguigml_push_clip_rect\");global.__extimguigml_script_index_lookup[@ imguigml_pop_clip_rect] = asset_get_index(\"imguigml_pop_clip_rect\");global.__extimguigml_script_index_lookup[@ imguigml_slider_float] = asset_get_index(\"imguigml_slider_float\");global.__extimguigml_script_index_lookup[@ imguigml_slider_float2] = asset_get_index(\"imguigml_slider_float2\");global.__extimguigml_script_index_lookup[@ imguigml_slider_float3] = asset_get_index(\"imguigml_slider_float3\");global.__extimguigml_script_index_lookup[@ imguigml_slider_float4] = asset_get_index(\"imguigml_slider_float4\");global.__extimguigml_script_index_lookup[@ imguigml_slider_angle] = asset_get_index(\"imguigml_slider_angle\");global.__extimguigml_script_index_lookup[@ imguigml_slider_int] = asset_get_index(\"imguigml_slider_int\");global.__extimguigml_script_index_lookup[@ imguigml_slider_int2] = asset_get_index(\"imguigml_slider_int2\");global.__extimguigml_script_index_lookup[@ imguigml_slider_int3] = asset_get_index(\"imguigml_slider_int3\");global.__extimguigml_script_index_lookup[@ imguigml_slider_int4] = asset_get_index(\"imguigml_slider_int4\");global.__extimguigml_script_index_lookup[@ imguigml_vslider_float] = asset_get_index(\"imguigml_vslider_float\");global.__extimguigml_script_index_lookup[@ imguigml_vslider_int] = asset_get_index(\"imguigml_vslider_int\");global.__extimguigml_script_index_lookup[@ imguigml_color_edit3] = asset_get_index(\"imguigml_color_edit3\");global.__extimguigml_script_index_lookup[@ imguigml_color_edit4] = asset_get_index(\"imguigml_color_edit4\");global.__extimguigml_script_index_lookup[@ imguigml_color_picker3] = asset_get_index(\"imguigml_color_picker3\");global.__extimguigml_script_index_lookup[@ imguigml_color_picker4] = asset_get_index(\"imguigml_color_picker4\");global.__extimguigml_script_index_lookup[@ imguigml_color_button] = asset_get_index(\"imguigml_color_button\");global.__extimguigml_script_index_lookup[@ imguigml_set_color_edit_options] = asset_get_index(\"imguigml_set_color_edit_options\");global.__extimguigml_script_index_lookup[@ imguigml_drag_float] = asset_get_index(\"imguigml_drag_float\");global.__extimguigml_script_index_lookup[@ imguigml_drag_float2] = asset_get_index(\"imguigml_drag_float2\");global.__extimguigml_script_index_lookup[@ imguigml_drag_float3] = asset_get_index(\"imguigml_drag_float3\");global.__extimguigml_script_index_lookup[@ imguigml_drag_float4] = asset_get_index(\"imguigml_drag_float4\");global.__extimguigml_script_index_lookup[@ imguigml_drag_float_range2] = asset_get_index(\"imguigml_drag_float_range2\");global.__extimguigml_script_index_lookup[@ imguigml_drag_int] = asset_get_index(\"imguigml_drag_int\");global.__extimguigml_script_index_lookup[@ imguigml_drag_int2] = asset_get_index(\"imguigml_drag_int2\");global.__extimguigml_script_index_lookup[@ imguigml_drag_int3] = asset_get_index(\"imguigml_drag_int3\");global.__extimguigml_script_index_lookup[@ imguigml_drag_int4] = asset_get_index(\"imguigml_drag_int4\");global.__extimguigml_script_index_lookup[@ imguigml_drag_int_range2] = asset_get_index(\"imguigml_drag_int_range2\");global.__extimguigml_script_index_lookup[@ imguigml_input_text] = asset_get_index(\"imguigml_input_text\");global.__extimguigml_script_index_lookup[@ imguigml_input_text_multiline] = asset_get_index(\"imguigml_input_text_multiline\");global.__extimguigml_script_index_lookup[@ imguigml_input_float] = asset_get_index(\"imguigml_input_float\");global.__extimguigml_script_index_lookup[@ imguigml_input_float2] = asset_get_index(\"imguigml_input_float2\");global.__extimguigml_script_index_lookup[@ imguigml_input_float3] = asset_get_index(\"imguigml_input_float3\");global.__extimguigml_script_index_lookup[@ imguigml_input_float4] = asset_get_index(\"imguigml_input_float4\");global.__extimguigml_script_index_lookup[@ imguigml_input_int] = asset_get_index(\"imguigml_input_int\");global.__extimguigml_script_index_lookup[@ imguigml_input_int2] = asset_get_index(\"imguigml_input_int2\");global.__extimguigml_script_index_lookup[@ imguigml_input_int3] = asset_get_index(\"imguigml_input_int3\");global.__extimguigml_script_index_lookup[@ imguigml_input_int4] = asset_get_index(\"imguigml_input_int4\");global.__extimguigml_script_index_lookup[@ imguigml_button] = asset_get_index(\"imguigml_button\");global.__extimguigml_script_index_lookup[@ imguigml_small_button] = asset_get_index(\"imguigml_small_button\");global.__extimguigml_script_index_lookup[@ imguigml_invisible_button] = asset_get_index(\"imguigml_invisible_button\");global.__extimguigml_script_index_lookup[@ imguigml_image] = asset_get_index(\"imguigml_image\");global.__extimguigml_script_index_lookup[@ imguigml_surface] = asset_get_index(\"imguigml_surface\");global.__extimguigml_script_index_lookup[@ imguigml_sprite] = asset_get_index(\"imguigml_sprite\");global.__extimguigml_script_index_lookup[@ imguigml_image_button] = asset_get_index(\"imguigml_image_button\");global.__extimguigml_script_index_lookup[@ imguigml_surface_button] = asset_get_index(\"imguigml_surface_button\");global.__extimguigml_script_index_lookup[@ imguigml_sprite_button] = asset_get_index(\"imguigml_sprite_button\");global.__extimguigml_script_index_lookup[@ imguigml_checkbox] = asset_get_index(\"imguigml_checkbox\");global.__extimguigml_script_index_lookup[@ imguigml_checkbox_flags] = asset_get_index(\"imguigml_checkbox_flags\");global.__extimguigml_script_index_lookup[@ imguigml_radio_button] = asset_get_index(\"imguigml_radio_button\");global.__extimguigml_script_index_lookup[@ imguigml_plot_lines] = asset_get_index(\"imguigml_plot_lines\");global.__extimguigml_script_index_lookup[@ imguigml_plot_histogram] = asset_get_index(\"imguigml_plot_histogram\");global.__extimguigml_script_index_lookup[@ imguigml_progress_bar] = asset_get_index(\"imguigml_progress_bar\");global.__extimguigml_script_index_lookup[@ __imguigml_image] = asset_get_index(\"__imguigml_image\");global.__extimguigml_script_index_lookup[@ __imguigml_image_button] = asset_get_index(\"__imguigml_image_button\");global.__extimguigml_script_index_lookup[@ imguigml_text] = asset_get_index(\"imguigml_text\");global.__extimguigml_script_index_lookup[@ imguigml_text_colored] = asset_get_index(\"imguigml_text_colored\");global.__extimguigml_script_index_lookup[@ imguigml_text_disabled] = asset_get_index(\"imguigml_text_disabled\");global.__extimguigml_script_index_lookup[@ imguigml_text_wrapped] = asset_get_index(\"imguigml_text_wrapped\");global.__extimguigml_script_index_lookup[@ imguigml_label_text] = asset_get_index(\"imguigml_label_text\");global.__extimguigml_script_index_lookup[@ imguigml_bullet_text] = asset_get_index(\"imguigml_bullet_text\");global.__extimguigml_script_index_lookup[@ imguigml_bullet] = asset_get_index(\"imguigml_bullet\");global.__extimguigml_script_index_lookup[@ imguigml_tree_node] = asset_get_index(\"imguigml_tree_node\");global.__extimguigml_script_index_lookup[@ imguigml_tree_node_ex] = asset_get_index(\"imguigml_tree_node_ex\");global.__extimguigml_script_index_lookup[@ imguigml_tree_push] = asset_get_index(\"imguigml_tree_push\");global.__extimguigml_script_index_lookup[@ imguigml_tree_pop] = asset_get_index(\"imguigml_tree_pop\");global.__extimguigml_script_index_lookup[@ imguigml_tree_advance_to_label_pos] = asset_get_index(\"imguigml_tree_advance_to_label_pos\");global.__extimguigml_script_index_lookup[@ imguigml_get_tree_node_to_label_spacing] = asset_get_index(\"imguigml_get_tree_node_to_label_spacing\");global.__extimguigml_script_index_lookup[@ imguigml_set_next_tree_node_open] = asset_get_index(\"imguigml_set_next_tree_node_open\");global.__extimguigml_script_index_lookup[@ imguigml_collapsing_header] = asset_get_index(\"imguigml_collapsing_header\");global.__extimguigml_script_index_lookup[@ imguigml_begin] = asset_get_index(\"imguigml_begin\");global.__extimguigml_script_index_lookup[@ imguigml_end] = asset_get_index(\"imguigml_end\");global.__extimguigml_script_index_lookup[@ imguigml_begin_child] = asset_get_index(\"imguigml_begin_child\");global.__extimguigml_script_index_lookup[@ imguigml_end_child] = asset_get_index(\"imguigml_end_child\");global.__extimguigml_script_index_lookup[@ imguigml_get_content_region_max] = asset_get_index(\"imguigml_get_content_region_max\");global.__extimguigml_script_index_lookup[@ imguigml_get_content_region_avail] = asset_get_index(\"imguigml_get_content_region_avail\");global.__extimguigml_script_index_lookup[@ imguigml_get_content_region_avail_width] = asset_get_index(\"imguigml_get_content_region_avail_width\");global.__extimguigml_script_index_lookup[@ imguigml_get_window_content_region_min] = asset_get_index(\"imguigml_get_window_content_region_min\");global.__extimguigml_script_index_lookup[@ imguigml_get_window_content_region_max] = asset_get_index(\"imguigml_get_window_content_region_max\");global.__extimguigml_script_index_lookup[@ imguigml_get_window_content_region_width] = asset_get_index(\"imguigml_get_window_content_region_width\");global.__extimguigml_script_index_lookup[@ imguigml_get_window_pos] = asset_get_index(\"imguigml_get_window_pos\");global.__extimguigml_script_index_lookup[@ imguigml_get_window_size] = asset_get_index(\"imguigml_get_window_size\");global.__extimguigml_script_index_lookup[@ imguigml_get_window_width] = asset_get_index(\"imguigml_get_window_width\");global.__extimguigml_script_index_lookup[@ imguigml_get_window_height] = asset_get_index(\"imguigml_get_window_height\");global.__extimguigml_script_index_lookup[@ imguigml_is_window_collapsed] = asset_get_index(\"imguigml_is_window_collapsed\");global.__extimguigml_script_index_lookup[@ imguigml_is_window_appearing] = asset_get_index(\"imguigml_is_window_appearing\");global.__extimguigml_script_index_lookup[@ imguigml_set_window_font_scale] = asset_get_index(\"imguigml_set_window_font_scale\");global.__extimguigml_script_index_lookup[@ imguigml_set_next_window_pos] = asset_get_index(\"imguigml_set_next_window_pos\");global.__extimguigml_script_index_lookup[@ imguigml_set_next_window_size] = asset_get_index(\"imguigml_set_next_window_size\");global.__extimguigml_script_index_lookup[@ imguigml_set_next_window_size_constraints] = asset_get_index(\"imguigml_set_next_window_size_constraints\");global.__extimguigml_script_index_lookup[@ imguigml_set_next_window_content_size] = asset_get_index(\"imguigml_set_next_window_content_size\");global.__extimguigml_script_index_lookup[@ imguigml_set_next_window_collapsed] = asset_get_index(\"imguigml_set_next_window_collapsed\");global.__extimguigml_script_index_lookup[@ imguigml_set_next_window_focus] = asset_get_index(\"imguigml_set_next_window_focus\");global.__extimguigml_script_index_lookup[@ imguigml_set_window_pos] = asset_get_index(\"imguigml_set_window_pos\");global.__extimguigml_script_index_lookup[@ imguigml_set_window_size] = asset_get_index(\"imguigml_set_window_size\");global.__extimguigml_script_index_lookup[@ imguigml_set_window_collapsed] = asset_get_index(\"imguigml_set_window_collapsed\");global.__extimguigml_script_index_lookup[@ imguigml_set_window_focus] = asset_get_index(\"imguigml_set_window_focus\");global.__extimguigml_script_index_lookup[@ imguigml_get_scroll_x] = asset_get_index(\"imguigml_get_scroll_x\");global.__extimguigml_script_index_lookup[@ imguigml_get_scroll_y] = asset_get_index(\"imguigml_get_scroll_y\");global.__extimguigml_script_index_lookup[@ imguigml_get_scroll_max_x] = asset_get_index(\"imguigml_get_scroll_max_x\");global.__extimguigml_script_index_lookup[@ imguigml_get_scroll_max_y] = asset_get_index(\"imguigml_get_scroll_max_y\");global.__extimguigml_script_index_lookup[@ imguigml_set_scroll_x] = asset_get_index(\"imguigml_set_scroll_x\");global.__extimguigml_script_index_lookup[@ imguigml_set_scroll_y] = asset_get_index(\"imguigml_set_scroll_y\");global.__extimguigml_script_index_lookup[@ imguigml_set_scroll_here] = asset_get_index(\"imguigml_set_scroll_here\");global.__extimguigml_script_index_lookup[@ imguigml_set_scroll_from_pos_y] = asset_get_index(\"imguigml_set_scroll_from_pos_y\");global.__extimguigml_script_index_lookup[@ imguigml_set_keyboard_focus_here] = asset_get_index(\"imguigml_set_keyboard_focus_here\");global.__extimguigml_script_index_lookup[@ imguigml_set_state_storage] = asset_get_index(\"imguigml_set_state_storage\");global.__extimguigml_script_index_lookup[@ imguigml_get_state_storage] = asset_get_index(\"imguigml_get_state_storage\");global.__extimguigml_script_index_lookup[@ imguigml_begin_child_frame] = asset_get_index(\"imguigml_begin_child_frame\");global.__extimguigml_script_index_lookup[@ imguigml_end_child_frame] = asset_get_index(\"imguigml_end_child_frame\");global.__extimguigml_script_index_lookup[@ imguigml_show_metrics_window] = asset_get_index(\"imguigml_show_metrics_window\");global.__extimguigml_script_index_lookup[@ imguigml_show_user_guide] = asset_get_index(\"imguigml_show_user_guide\");global.__extimguigml_script_index_lookup[@ imguigml_show_demo_window] = asset_get_index(\"imguigml_show_demo_window\");global.__extimguigml_script_index_lookup[@ imguigml_show_font_selector] = asset_get_index(\"imguigml_show_font_selector\");global.__extimguigml_script_index_lookup[@ imguigml_begin_drag_drop_source] = asset_get_index(\"imguigml_begin_drag_drop_source\");global.__extimguigml_script_index_lookup[@ imguigml_set_drag_drop_payload] = asset_get_index(\"imguigml_set_drag_drop_payload\");global.__extimguigml_script_index_lookup[@ imguigml_end_drag_drop_source] = asset_get_index(\"imguigml_end_drag_drop_source\");global.__extimguigml_script_index_lookup[@ imguigml_begin_drop_target] = asset_get_index(\"imguigml_begin_drop_target\");global.__extimguigml_script_index_lookup[@ imguigml_accept_drag_drop_payload] = asset_get_index(\"imguigml_accept_drag_drop_payload\");global.__extimguigml_script_index_lookup[@ imguigml_end_drag_drop_target] = asset_get_index(\"imguigml_end_drag_drop_target\");global.__extimguigml_script_index_lookup[@ imguigml_payload] = asset_get_index(\"imguigml_payload\");global.__extimguigml_script_index_lookup[@ imguigml_payload_get] = asset_get_index(\"imguigml_payload_get\");global.__extimguigml_script_index_lookup[@ imguigml_combo] = asset_get_index(\"imguigml_combo\");global.__extimguigml_script_index_lookup[@ imguigml_begin_combo] = asset_get_index(\"imguigml_begin_combo\");global.__extimguigml_script_index_lookup[@ imguigml_end_combo] = asset_get_index(\"imguigml_end_combo\");global.__extimguigml_script_index_lookup[@ imguigml_io_ini_saving_rate] = asset_get_index(\"imguigml_io_ini_saving_rate\");global.__extimguigml_script_index_lookup[@ imguigml_io_mouse_double_click_time] = asset_get_index(\"imguigml_io_mouse_double_click_time\");global.__extimguigml_script_index_lookup[@ imguigml_io_mouse_double_click_max_dist] = asset_get_index(\"imguigml_io_mouse_double_click_max_dist\");global.__extimguigml_script_index_lookup[@ imguigml_io_mouse_drag_threshold] = asset_get_index(\"imguigml_io_mouse_drag_threshold\");global.__extimguigml_script_index_lookup[@ imguigml_io_key_repeat_delay] = asset_get_index(\"imguigml_io_key_repeat_delay\");global.__extimguigml_script_index_lookup[@ imguigml_io_key_repeat_rate] = asset_get_index(\"imguigml_io_key_repeat_rate\");global.__extimguigml_script_index_lookup[@ imguigml_io_font_global_scale] = asset_get_index(\"imguigml_io_font_global_scale\");global.__extimguigml_script_index_lookup[@ imguigml_io_font_allow_user_scaling] = asset_get_index(\"imguigml_io_font_allow_user_scaling\");global.__extimguigml_script_index_lookup[@ imguigml_io_display_framebuffer_scaling] = asset_get_index(\"imguigml_io_display_framebuffer_scaling\");global.__extimguigml_script_index_lookup[@ imguigml_io_display_visible_min] = asset_get_index(\"imguigml_io_display_visible_min\");global.__extimguigml_script_index_lookup[@ imguigml_io_display_visible_max] = asset_get_index(\"imguigml_io_display_visible_max\");global.__extimguigml_script_index_lookup[@ imguigml_io_osx_behaviors] = asset_get_index(\"imguigml_io_osx_behaviors\");global.__extimguigml_script_index_lookup[@ imguigml_io_ini_filename] = asset_get_index(\"imguigml_io_ini_filename\");global.__extimguigml_script_index_lookup[@ imguigml_io_log_filename] = asset_get_index(\"imguigml_io_log_filename\");global.__extimguigml_script_index_lookup[@ imguigml_io_cursor_blink] = asset_get_index(\"imguigml_io_cursor_blink\");global.__extimguigml_script_index_lookup[@ imguigml_drawlist_add_line] = asset_get_index(\"imguigml_drawlist_add_line\");global.__extimguigml_script_index_lookup[@ imguigml_drawlist_add_rect] = asset_get_index(\"imguigml_drawlist_add_rect\");global.__extimguigml_script_index_lookup[@ imguigml_drawlist_add_rect_filled] = asset_get_index(\"imguigml_drawlist_add_rect_filled\");global.__extimguigml_script_index_lookup[@ imguigml_drawlist_add_rect_filled_multicolor] = asset_get_index(\"imguigml_drawlist_add_rect_filled_multicolor\");global.__extimguigml_script_index_lookup[@ imguigml_drawlist_add_quad] = asset_get_index(\"imguigml_drawlist_add_quad\");global.__extimguigml_script_index_lookup[@ imguigml_drawlist_add_quad_filled] = asset_get_index(\"imguigml_drawlist_add_quad_filled\");global.__extimguigml_script_index_lookup[@ imguigml_drawlist_add_triangle] = asset_get_index(\"imguigml_drawlist_add_triangle\");global.__extimguigml_script_index_lookup[@ imguigml_drawlist_add_triangle_filled] = asset_get_index(\"imguigml_drawlist_add_triangle_filled\");global.__extimguigml_script_index_lookup[@ imguigml_drawlist_add_circle] = asset_get_index(\"imguigml_drawlist_add_circle\");global.__extimguigml_script_index_lookup[@ imguigml_drawlist_add_circle_filled] = asset_get_index(\"imguigml_drawlist_add_circle_filled\");global.__extimguigml_script_index_lookup[@ imguigml_drawlist_add_text] = asset_get_index(\"imguigml_drawlist_add_text\");global.__extimguigml_script_index_lookup[@ imguigml_drawlist_add_surface] = asset_get_index(\"imguigml_drawlist_add_surface\");global.__extimguigml_script_index_lookup[@ imguigml_drawlist_add_surface_quad] = asset_get_index(\"imguigml_drawlist_add_surface_quad\");global.__extimguigml_script_index_lookup[@ imguigml_drawlist_add_sprite] = asset_get_index(\"imguigml_drawlist_add_sprite\");global.__extimguigml_script_index_lookup[@ imguigml_drawlist_add_polyline] = asset_get_index(\"imguigml_drawlist_add_polyline\");global.__extimguigml_script_index_lookup[@ imguigml_drawlist_add_convex_poly_filled] = asset_get_index(\"imguigml_drawlist_add_convex_poly_filled\");global.__extimguigml_script_index_lookup[@ imguigml_drawlist_add_bezier_curve] = asset_get_index(\"imguigml_drawlist_add_bezier_curve\");global.__extimguigml_script_index_lookup[@ imguigml_drawlist_path_clear] = asset_get_index(\"imguigml_drawlist_path_clear\");global.__extimguigml_script_index_lookup[@ imguigml_drawlist_path_line_to] = asset_get_index(\"imguigml_drawlist_path_line_to\");global.__extimguigml_script_index_lookup[@ imguigml_drawlist_path_line_to_merge_duplicate] = asset_get_index(\"imguigml_drawlist_path_line_to_merge_duplicate\");global.__extimguigml_script_index_lookup[@ imguigml_drawlist_path_fill_convex] = asset_get_index(\"imguigml_drawlist_path_fill_convex\");global.__extimguigml_script_index_lookup[@ imguigml_drawlist_path_stroke] = asset_get_index(\"imguigml_drawlist_path_stroke\");global.__extimguigml_script_index_lookup[@ imguigml_drawlist_path_arc_to] = asset_get_index(\"imguigml_drawlist_path_arc_to\");global.__extimguigml_script_index_lookup[@ imguigml_drawlist_path_arc_to_fast] = asset_get_index(\"imguigml_drawlist_path_arc_to_fast\");global.__extimguigml_script_index_lookup[@ imguigml_drawlist_path_bezier_curve_to] = asset_get_index(\"imguigml_drawlist_path_bezier_curve_to\");global.__extimguigml_script_index_lookup[@ imguigml_drawlist_path_rect] = asset_get_index(\"imguigml_drawlist_path_rect\");global.__extimguigml_script_index_lookup[@ imguigml_drawlist_channels_split] = asset_get_index(\"imguigml_drawlist_channels_split\");global.__extimguigml_script_index_lookup[@ imguigml_drawlist_channels_merge] = asset_get_index(\"imguigml_drawlist_channels_merge\");global.__extimguigml_script_index_lookup[@ imguigml_drawlist_channels_set_current] = asset_get_index(\"imguigml_drawlist_channels_set_current\");global.__extimguigml_script_index_lookup[@ imguigml_drawlist_push_clip_rect] = asset_get_index(\"imguigml_drawlist_push_clip_rect\");global.__extimguigml_script_index_lookup[@ imguigml_drawlist_pop_clip_rect] = asset_get_index(\"imguigml_drawlist_pop_clip_rect\");global.__extimguigml_script_index_lookup[@ imguigml_drawlist_push_clip_rect_fullscreen] = asset_get_index(\"imguigml_drawlist_push_clip_rect_fullscreen\");global.__extimguigml_script_index_lookup[@ imguigml_drawlist_get_clip_rect_min] = asset_get_index(\"imguigml_drawlist_get_clip_rect_min\");global.__extimguigml_script_index_lookup[@ imguigml_drawlist_get_clip_rect_max] = asset_get_index(\"imguigml_drawlist_get_clip_rect_max\");global.__extimguigml_script_index_lookup[@ imguigml_drawlist_push_texture_id] = asset_get_index(\"imguigml_drawlist_push_texture_id\");global.__extimguigml_script_index_lookup[@ imguigml_drawlist_pop_texture_id] = asset_get_index(\"imguigml_drawlist_pop_texture_id\");global.__extimguigml_script_index_lookup[@ imguigml_drawlist_set_flags] = asset_get_index(\"imguigml_drawlist_set_flags\");global.__extimguigml_script_index_lookup[@ imguigml_drawlist_get_flags] = asset_get_index(\"imguigml_drawlist_get_flags\");global.__extimguigml_script_index_lookup[@ imguigml_drawlist_use_overlay] = asset_get_index(\"imguigml_drawlist_use_overlay\");global.__extimguigml_script_index_lookup[@ imguigml_drawlist_use_window] = asset_get_index(\"imguigml_drawlist_use_window\");global.__extimguigml_script_index_lookup[@ __imguigml_drawlist_add_image_quad] = asset_get_index(\"__imguigml_drawlist_add_image_quad\");global.__extimguigml_script_index_lookup[@ __imguigml_drawlist_add_image] = asset_get_index(\"__imguigml_drawlist_add_image\");global.__extimguigml_script_index_lookup[@ __imguigml_draw] = asset_get_index(\"__imguigml_draw\");global.__extimguigml_script_index_lookup[@ __imguigml_texture_id] = asset_get_index(\"__imguigml_texture_id\");global.__extimguigml_script_index_lookup[@ __imguigml_wrapper_buffer] = asset_get_index(\"__imguigml_wrapper_buffer\");global.__extimguigml_script_index_lookup[@ __imguigml_handle_text_callback] = asset_get_index(\"__imguigml_handle_text_callback\");global.__extimguigml_script_index_lookup[@ __imguigml_ext_call] = asset_get_index(\"__imguigml_ext_call\");global.__extimguigml_script_index_lookup[@ __imguigml_event_create] = asset_get_index(\"__imguigml_event_create\");global.__extimguigml_script_index_lookup[@ __imguigml_event_begin_step] = asset_get_index(\"__imguigml_event_begin_step\");global.__extimguigml_script_index_lookup[@ __imguigml_event_end_step] = asset_get_index(\"__imguigml_event_end_step\");global.__extimguigml_script_index_lookup[@ __imguigml_event_clean_up] = asset_get_index(\"__imguigml_event_clean_up\");global.__extimguigml_script_index_lookup[@ __imguigml_event_draw] = asset_get_index(\"__imguigml_event_draw\");global.__extimguigml_script_index_lookup[@ __imguigml_event_draw_gui] = asset_get_index(\"__imguigml_event_draw_gui\");global.__extimguigml_script_index_lookup[@ __imguigml_init_rendering] = asset_get_index(\"__imguigml_init_rendering\");global.__extimguigml_script_index_lookup[@ __imguigml_init_font] = asset_get_index(\"__imguigml_init_font\");global.__extimguigml_script_index_lookup[@ __imguigml_init_input] = asset_get_index(\"__imguigml_init_input\");global.__extimguigml_script_index_lookup[@ __imguigml_init_wrapper] = asset_get_index(\"__imguigml_init_wrapper\");global.__extimguigml_script_index_lookup[@ __imguigml_init_debug] = asset_get_index(\"__imguigml_init_debug\");global.__extimguigml_script_index_lookup[@ imguigml_mem] = asset_get_index(\"imguigml_mem\");global.__extimguigml_script_index_lookup[@ imguigml_memset] = asset_get_index(\"imguigml_memset\");global.__extimguigml_script_index_lookup[@ imguigml_secure_save_mem] = asset_get_index(\"imguigml_secure_save_mem\");global.__extimguigml_script_index_lookup[@ imguigml_secure_load_mem] = asset_get_index(\"imguigml_secure_load_mem\");global.__extimguigml_script_index_lookup[@ imguigml_begin_tab_bar] = asset_get_index(\"imguigml_begin_tab_bar\");global.__extimguigml_script_index_lookup[@ imguigml_end_tab_bar] = asset_get_index(\"imguigml_end_tab_bar\");global.__extimguigml_script_index_lookup[@ imguigml_tab_item] = asset_get_index(\"imguigml_tab_item\");global.__extimguigml_script_index_lookup[@ imguigml_set_tab_item_closed] = asset_get_index(\"imguigml_set_tab_item_closed\");global.__extimguigml_script_index_lookup[@ imguigml_set_tab_item_selected] = asset_get_index(\"imguigml_set_tab_item_selected\");global.__extimguigml_script_index_lookup[@ imguigml_show_tabs_demo] = asset_get_index(\"imguigml_show_tabs_demo\");global.__extimguigml_script_index_lookup[@ imguigml_show_tabs_debug] = asset_get_index(\"imguigml_show_tabs_debug\");global.__extimguigml_script_index_lookup[@ imguigml_texteditor_create] = asset_get_index(\"imguigml_texteditor_create\");global.__extimguigml_script_index_lookup[@ imguigml_texteditor_destroy] = asset_get_index(\"imguigml_texteditor_destroy\");global.__extimguigml_script_index_lookup[@ imguigml_texteditor_set_language_definition] = asset_get_index(\"imguigml_texteditor_set_language_definition\");global.__extimguigml_script_index_lookup[@ imguigml_texteditor_get_language_definition] = asset_get_index(\"imguigml_texteditor_get_language_definition\");global.__extimguigml_script_index_lookup[@ imguigml_texteditor_get_palette] = asset_get_index(\"imguigml_texteditor_get_palette\");global.__extimguigml_script_index_lookup[@ imguigml_texteditor_set_palette] = asset_get_index(\"imguigml_texteditor_set_palette\");global.__extimguigml_script_index_lookup[@ imguigml_texteditor_render] = asset_get_index(\"imguigml_texteditor_render\");global.__extimguigml_script_index_lookup[@ imguigml_texteditor_set_text] = asset_get_index(\"imguigml_texteditor_set_text\");global.__extimguigml_script_index_lookup[@ imguigml_texteditor_get_text] = asset_get_index(\"imguigml_texteditor_get_text\");global.__extimguigml_script_index_lookup[@ imguigml_texteditor_get_selected_text] = asset_get_index(\"imguigml_texteditor_get_selected_text\");global.__extimguigml_script_index_lookup[@ imguigml_texteditor_get_total_lines] = asset_get_index(\"imguigml_texteditor_get_total_lines\");global.__extimguigml_script_index_lookup[@ imguigml_texteditor_is_overwrite] = asset_get_index(\"imguigml_texteditor_is_overwrite\");global.__extimguigml_script_index_lookup[@ imguigml_texteditor_set_readonly] = asset_get_index(\"imguigml_texteditor_set_readonly\");global.__extimguigml_script_index_lookup[@ imguigml_texteditor_is_readonly] = asset_get_index(\"imguigml_texteditor_is_readonly\");global.__extimguigml_script_index_lookup[@ imguigml_texteditor_set_cursor_position] = asset_get_index(\"imguigml_texteditor_set_cursor_position\");global.__extimguigml_script_index_lookup[@ imguigml_texteditor_get_cursor_position] = asset_get_index(\"imguigml_texteditor_get_cursor_position\");global.__extimguigml_script_index_lookup[@ imguigml_texteditor_insert_text] = asset_get_index(\"imguigml_texteditor_insert_text\");global.__extimguigml_script_index_lookup[@ imguigml_texteditor_move_up] = asset_get_index(\"imguigml_texteditor_move_up\");global.__extimguigml_script_index_lookup[@ imguigml_texteditor_move_down] = asset_get_index(\"imguigml_texteditor_move_down\");global.__extimguigml_script_index_lookup[@ imguigml_texteditor_move_left] = asset_get_index(\"imguigml_texteditor_move_left\");global.__extimguigml_script_index_lookup[@ imguigml_texteditor_move_right] = asset_get_index(\"imguigml_texteditor_move_right\");global.__extimguigml_script_index_lookup[@ imguigml_texteditor_move_top] = asset_get_index(\"imguigml_texteditor_move_top\");global.__extimguigml_script_index_lookup[@ imguigml_texteditor_move_bottom] = asset_get_index(\"imguigml_texteditor_move_bottom\");global.__extimguigml_script_index_lookup[@ imguigml_texteditor_move_home] = asset_get_index(\"imguigml_texteditor_move_home\");global.__extimguigml_script_index_lookup[@ imguigml_texteditor_move_end] = asset_get_index(\"imguigml_texteditor_move_end\");global.__extimguigml_script_index_lookup[@ imguigml_texteditor_set_selection_start] = asset_get_index(\"imguigml_texteditor_set_selection_start\");global.__extimguigml_script_index_lookup[@ imguigml_texteditor_set_selection_end] = asset_get_index(\"imguigml_texteditor_set_selection_end\");global.__extimguigml_script_index_lookup[@ imguigml_texteditor_set_selection] = asset_get_index(\"imguigml_texteditor_set_selection\");global.__extimguigml_script_index_lookup[@ imguigml_texteditor_select_word_under_cursor] = asset_get_index(\"imguigml_texteditor_select_word_under_cursor\");global.__extimguigml_script_index_lookup[@ imguigml_texteditor_has_selection] = asset_get_index(\"imguigml_texteditor_has_selection\");global.__extimguigml_script_index_lookup[@ imguigml_texteditor_copy] = asset_get_index(\"imguigml_texteditor_copy\");global.__extimguigml_script_index_lookup[@ imguigml_texteditor_cut] = asset_get_index(\"imguigml_texteditor_cut\");global.__extimguigml_script_index_lookup[@ imguigml_texteditor_paste] = asset_get_index(\"imguigml_texteditor_paste\");global.__extimguigml_script_index_lookup[@ imguigml_texteditor_delete] = asset_get_index(\"imguigml_texteditor_delete\");global.__extimguigml_script_index_lookup[@ imguigml_texteditor_can_undo] = asset_get_index(\"imguigml_texteditor_can_undo\");global.__extimguigml_script_index_lookup[@ imguigml_texteditor_can_redo] = asset_get_index(\"imguigml_texteditor_can_redo\");global.__extimguigml_script_index_lookup[@ imguigml_texteditor_get_dark_palette] = asset_get_index(\"imguigml_texteditor_get_dark_palette\");global.__extimguigml_script_index_lookup[@ imguigml_texteditor_get_light_palette] = asset_get_index(\"imguigml_texteditor_get_light_palette\");global.__extimguigml_script_index_lookup[@ rousr_callstack_init] = asset_get_index(\"rousr_callstack_init\");global.__extimguigml_script_index_lookup[@ rousr_callstack_clean_up] = asset_get_index(\"rousr_callstack_clean_up\");global.__extimguigml_script_index_lookup[@ rousr_callstack_process] = asset_get_index(\"rousr_callstack_process\");global.__extimguigml_script_index_lookup[@ rousr_callstack_out] = asset_get_index(\"rousr_callstack_out\");global.__extimguigml_script_index_lookup[@ rousr_callstack_in] = asset_get_index(\"rousr_callstack_in\");global.__extimguigml_script_index_lookup[@ _rousr_callstack_call] = asset_get_index(\"_rousr_callstack_call\");global.__extimguigml_script_index_lookup[@ sr_sprite_cache_create] = asset_get_index(\"sr_sprite_cache_create\");global.__extimguigml_script_index_lookup[@ sr_sprite_cache_destroy] = asset_get_index(\"sr_sprite_cache_destroy\");global.__extimguigml_script_index_lookup[@ sr_sprite_cache_push_sprite] = asset_get_index(\"sr_sprite_cache_push_sprite\");global.__extimguigml_script_index_lookup[@ sr_sprite_cache_flush] = asset_get_index(\"sr_sprite_cache_flush\");global.__extimguigml_script_index_lookup[@ sr_sprite_cache_get_uvs] = asset_get_index(\"sr_sprite_cache_get_uvs\");global.__extimguigml_script_index_lookup[@ sr_sprite_cache_get_surface] = asset_get_index(\"sr_sprite_cache_get_surface\");global.__extimguigml_script_index_lookup[@ sr_lazy_bin_create] = asset_get_index(\"sr_lazy_bin_create\");global.__extimguigml_script_index_lookup[@ sr_lazy_bin_destroy] = asset_get_index(\"sr_lazy_bin_destroy\");global.__extimguigml_script_index_lookup[@ sr_lazy_bin_pack] = asset_get_index(\"sr_lazy_bin_pack\");global.__extimguigml_script_index_lookup[@ sr_lazy_bin_get] = asset_get_index(\"sr_lazy_bin_get\");global.__extimguigml_script_index_lookup[@ sr_lazy_bin_width] = asset_get_index(\"sr_lazy_bin_width\");global.__extimguigml_script_index_lookup[@ sr_lazy_bin_height] = asset_get_index(\"sr_lazy_bin_height\");global.__extimguigml_script_index_lookup[@ sr_lazy_bin_clear] = asset_get_index(\"sr_lazy_bin_clear\");global.__extimguigml_script_index_lookup[@ sr_sprite_atlas_create] = asset_get_index(\"sr_sprite_atlas_create\");global.__extimguigml_script_index_lookup[@ sr_sprite_atlas_destroy] = asset_get_index(\"sr_sprite_atlas_destroy\");global.__extimguigml_script_index_lookup[@ sr_sprite_atlas_pack] = asset_get_index(\"sr_sprite_atlas_pack\");global.__extimguigml_script_index_lookup[@ sr_sprite_atlas_get] = asset_get_index(\"sr_sprite_atlas_get\");global.__extimguigml_script_index_lookup[@ sr_sprite_atlas_flush] = asset_get_index(\"sr_sprite_atlas_flush\");global.__extimguigml_script_index_lookup[@ sr_sprite_atlas_clear] = asset_get_index(\"sr_sprite_atlas_clear\");");

var _index = argument0;return global.__extimguigml_script_index_lookup[@ _index];

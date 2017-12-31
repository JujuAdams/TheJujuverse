/// @description ImGUI definitions

// easy access to ImGui
#macro ImGuiGML (global.__imguigml)

#region EImGui_Cond
// Condition for imguigml_set_window_**(), imguigml_set_next_window***(), imguigml_set_next_tree_node***() functions
// All those functions treat 0 as a shortcut to EImGui_Cond.Always. 
//   Note: From the point of view of the user use this as an enum (don't combine multiple values into flags).
enum EImGui_Cond
{
    Always        = 1 << 0,   // Set the variable
    Once          = 1 << 1,   // Set the variable once per runtime session (only the first call with succeed)
    FirstUseEver  = 1 << 2,   // Set the variable if the window has no saved data (if doesn't exist in the .ini file)
    Appearing     = 1 << 3    // Set the variable if the window is appearing after being hidden/inactive (or the first time)
};
#endregion
#region EImGui_WindowFlags
enum EImGui_WindowFlags {
    // Default: 0
    NoTitleBar                = 1 << 0,   // Disable title-bar
    NoResize                  = 1 << 1,   // Disable user resizing with the lower-right grip
    NoMove                    = 1 << 2,   // Disable user moving the window
    NoScrollbar               = 1 << 3,   // Disable scrollbars (window can still scroll with mouse or programatically)
    NoScrollWithMouse         = 1 << 4,   // Disable user vertically scrolling with mouse wheel
    NoCollapse                = 1 << 5,   // Disable user collapsing window by double-clicking on it
    AlwaysAutoResize          = 1 << 6,   // Resize every window to its content every frame
    ShowBorders               = 1 << 7,   // Show borders around windows and items
    NoSavedSettings           = 1 << 8,   // Never load/save settings in .ini file
    NoInputs                  = 1 << 9,   // Disable catching mouse or keyboard inputs, hovering test with pass through.
    MenuBar                   = 1 << 10,  // Has a menu-bar
    HorizontalScrollbar       = 1 << 11,  // Allow horizontal scrollbar to appear (off by default). You may use SetNextWindowContentSize(ImVec2(width,0.0f)); prior to calling Begin() to specify width. Read code in imgui_demo in the "Horizontal Scrolling" section.
    NoFocusOnAppearing        = 1 << 12,  // Disable taking focus when transitioning from hidden to visible state
    NoBringToFrontOnFocus     = 1 << 13,  // Disable bringing window to front when taking focus (e.g. clicking on it or programatically giving it focus)
    AlwaysVerticalScrollbar   = 1 << 14,  // Always show vertical scrollbar (even if ContentSize.y < Size.y)
    AlwaysHorizontalScrollbar = 1 << 15,  // Always show horizontal scrollbar (even if ContentSize.x < Size.x)
    AlwaysUseWindowPadding    = 1 << 16,  // Ensure child windows without border uses style.WindowPadding (ignored by default for non-bordered child windows, because more convenient)
    
    // [Internal]
    ChildWindow            = 1 << 22,  // Don't use! For internal use by BeginChild()
    ComboBox               = 1 << 23,  // Don't use! For internal use by ComboBox()
    Tooltip                = 1 << 24,  // Don't use! For internal use by BeginTooltip()
    Popup                  = 1 << 25,  // Don't use! For internal use by BeginPopup()
    Modal                  = 1 << 26,  // Don't use! For internal use by BeginPopupModal()
    ChildMenu              = 1 << 27   // Don't use! For internal use by BeginMenu()
};
#endregion
#region EImGui_ValType
enum EImGui_ValType {
  Bool = 0,
  Int,
  UnsignedInt,
  Float,
  
  Num
};
#endregion
#region EImGui_InputTextFlags
// Flags for ImGui::InputText()
enum EImGui_InputTextFlags {
    // Default: 0
    CharsDecimal        = 1 << 0,   // Allow 0123456789.+-*/
    CharsHexadecimal    = 1 << 1,   // Allow 0123456789ABCDEFabcdef
    CharsUppercase      = 1 << 2,   // Turn a..z into A..Z
    CharsNoBlank        = 1 << 3,   // Filter out spaces, tabs
    AutoSelectAll       = 1 << 4,   // Select entire text when first taking mouse focus
    EnterReturnsTrue    = 1 << 5,   // Return 'true' when Enter is pressed (as opposed to when the value was modified)
    CallbackCompletion  = 1 << 6,   // Call user function on pressing TAB (for completion handling)
    CallbackHistory     = 1 << 7,   // Call user function on pressing Up/Down arrows (for history handling)
    CallbackAlways      = 1 << 8,   // Call user function every time. User code may query cursor position, modify text buffer.
    CallbackCharFilter  = 1 << 9,   // Call user function to filter character. Modify data->EventChar to replace/filter input, or return 1 to discard character.
    AllowTabInput       = 1 << 10,  // Pressing TAB input a '\t' character into the text field
    CtrlEnterForNewLine = 1 << 11,  // In multi-line mode, unfocus with Enter, add new line with Ctrl+Enter (default is opposite: unfocus with Ctrl+Enter, add line with Enter).
    NoHorizontalScroll  = 1 << 12,  // Disable following the cursor horizontally
    AlwaysInsertMode    = 1 << 13,  // Insert mode
    ReadOnly            = 1 << 14,  // Read-only mode
    Password            = 1 << 15,  // Password mode, display all characters as '*'
    
    // [Internal]
    Multiline           = 1 << 20   // For internal use by InputTextMultiline()
};
#endregion
#region EImGui_TreeNodeFlags
// Flags for ImGui::TreeNodeEx(), ImGui::CollapsingHeader*()
enum EImGui_TreeNodeFlags {
    Selected             = 1 << 0,   // Draw as selected
    Framed               = 1 << 1,   // Full colored frame (e.g. for CollapsingHeader)
    AllowOverlapMode     = 1 << 2,   // Hit testing to allow subsequent widgets to overlap this one
    NoTreePushOnOpen     = 1 << 3,   // Don't do a TreePush() when open (e.g. for CollapsingHeader) = no extra indent nor pushing on ID stack
    NoAutoOpenOnLog      = 1 << 4,   // Don't automatically and temporarily open node when Logging is active (by default logging will automatically open tree nodes)
    DefaultOpen          = 1 << 5,   // Default node to be open
    OpenOnDoubleClick    = 1 << 6,   // Need double-click to open node
    OpenOnArrow          = 1 << 7,   // Only open when clicking on the arrow part. If ImGuiTreeNodeFlags_OpenOnDoubleClick is also set, single-click arrow or double-click all box to open.
    Leaf                 = 1 << 8,   // No collapsing, no arrow (use as a convenience for leaf nodes). 
    Bullet               = 1 << 9,   // Display a bullet instead of arrow
    FramePadding         = 1 << 10,  // Use FramePadding (even for an unframed text node) to vertically align text baseline to regular widget height. Equivalent to calling AlignTextToFramePadding().
    //SpanAllAvailWidth  = 1 << 11,  // FIXME: TODO: Extend hit box horizontally even if not framed
    //NoScrollOnOpen     = 1 << 12,  // FIXME: TODO: Disable automatic scroll on TreePop() if node got just open and contents is not visible
    
    CollapsingHeader     = EImGui_TreeNodeFlags.Framed | EImGui_TreeNodeFlags.NoAutoOpenOnLog
};
#endregion
#region EImGui_SelectableFlags
// Flags for ImGui::Selectable()
// ImGuiSelectableFlags
enum EImGui_SelectableFlags {
    // Default: 0
    DontClosePopups    = 1 << 0,   // Clicking this don't close parent popup window
    SpanAllColumns     = 1 << 1,   // Selectable frame can span all columns (text will still fit in current column)
    AllowDoubleClick   = 1 << 2    // Generate press events on double clicks too
};
#endregion 
#region EImGui_HoveredFlags
// Flags for ImGui::IsItemHovered(), ImGui::IsWindowHovered()
// ImGuiHoveredFlags
enum EImGui_HoveredFlags
{
    Default                       = 0,        // Return true if directly over the item/window, not obstructed by another window, not obstructed by an active popup or modal blocking inputs under them.
    AllowWhenBlockedByPopup       = 1 << 0,   // Return true even if a popup window is normally blocking access to this item/window
    //AllowWhenBlockedByModal     = 1 << 1,   // Return true even if a modal popup window is normally blocking access to this item/window. FIXME-TODO: Unavailable yet.
    AllowWhenBlockedByActiveItem  = 1 << 2,   // Return true even if an active item is blocking access to this item/window
    AllowWhenOverlapped           = 1 << 3,   // Return true even if the position is overlapped by another window
    FlattenChilds                 = 1 << 4,   // Treat all child windows as the same window (for IsWindowHovered())
    
    RectOnly                      = EImGui_HoveredFlags.AllowWhenBlockedByPopup | EImGui_HoveredFlags.AllowWhenBlockedByActiveItem | EImGui_HoveredFlags.AllowWhenOverlapped
};
#endregion
#region EImGui_Col
//enum ImGuiCol_
enum EImGui_Col {
  Text = 0,
  TextDisabled,
  WindowBg,              // Background of normal windows
  ChildWindowBg,         // Background of child windows
  PopupBg,               // Background of popups, menus, tooltips windows
  Border,
  BorderShadow,
  FrameBg,               // Background of checkbox, radio button, plot, slider, text input
  FrameBgHovered,
  FrameBgActive,
  TitleBg,
  TitleBgActive,
  TitleBgCollapsed,
  MenuBarBg,
  ScrollbarBg,
  ScrollbarGrab,
  ScrollbarGrabHovered,
  ScrollbarGrabActive,
  ComboBg,
  CheckMark,
  SliderGrab,
  SliderGrabActive,
  Button,
  ButtonHovered,
  ButtonActive,
  Header,
  HeaderHovered,
  HeaderActive,
  Separator,
  SeparatorHovered,
  SeparatorActive,
  ResizeGrip,
  ResizeGripHovered,
  ResizeGripActive,
  CloseButton,
  CloseButtonHovered,
  CloseButtonActive,
  PlotLines,
  PlotLinesHovered,
  PlotHistogram,
  PlotHistogramHovered,
  TextSelectedBg,
  ModalWindowDarkening,  // darken entire screen when a modal window is active
 
  Num
};
#endregion
#region EImGui_StyleVar
// ImGuiStyleVar
enum EImGui_StyleVar
{
    // Enum name ......................// Member in ImGuiStyle structure (see ImGuiStyle for descriptions)
    Alpha = 0,               // float     Alpha
    WindowPadding,       // ImVec2    WindowPadding
    WindowRounding,      // float     WindowRounding
    WindowMinSize,       // ImVec2    WindowMinSize
    ChildWindowRounding, // float     ChildWindowRounding
    FramePadding,        // ImVec2    FramePadding
    FrameRounding,       // float     FrameRounding
    ItemSpacing,         // ImVec2    ItemSpacing
    ItemInnerSpacing,    // ImVec2    ItemInnerSpacing
    IndentSpacing,       // float     IndentSpacing
    GrabMinSize,         // float     GrabMinSize
    ButtonTextAlign,     // ImVec2    ButtonTextAlign
    
    Num
};
#endregion
#region EImGui_ColorEditFlags
// Enumeration for ColorEdit3() / ColorEdit4() / ColorPicker3() / ColorPicker4() / ColorButton()
enum EImGui_ColorEditFlags
{
    NoAlpha         = 1 << 1,   //              // ColorEdit, ColorPicker, ColorButton: ignore Alpha component (read 3 components from the input pointer).
    NoPicker        = 1 << 2,   //              // ColorEdit: disable picker when clicking on colored square.
    NoOptions       = 1 << 3,   //              // ColorEdit: disable toggling options menu when right-clicking on inputs/small preview.
    NoSmallPreview  = 1 << 4,   //              // ColorEdit, ColorPicker: disable colored square preview next to the inputs. (e.g. to show only the inputs)
    NoInputs        = 1 << 5,   //              // ColorEdit, ColorPicker: disable inputs sliders/text widgets (e.g. to show only the small preview colored square).
    NoTooltip       = 1 << 6,   //              // ColorEdit, ColorPicker, ColorButton: disable tooltip when hovering the preview.
    NoLabel         = 1 << 7,   //              // ColorEdit, ColorPicker: disable display of inline text label (the label is still forwarded to the tooltip and picker).
    NoSidePreview   = 1 << 8,   //              // ColorPicker: disable bigger color preview on right side of the picker, use small colored square preview instead.
    // User Options (right-click on widget to change some of them). You can set application defaults using SetColorEditOptions(). The idea is that you probably don't want to override them in most of your calls, let the user choose and/or call SetColorEditOptions() during startup.
    AlphaBar        = 1 << 9,   //              // ColorEdit, ColorPicker: show vertical alpha bar/gradient in picker.
    AlphaPreview    = 1 << 10,  //              // ColorEdit, ColorPicker, ColorButton: display preview as a transparent color over a checkerboard, instead of opaque.
    AlphaPreviewHalf= 1 << 11,  //              // ColorEdit, ColorPicker, ColorButton: display half opaque / half checkerboard, instead of opaque.
    HDR             = 1 << 12,  //              // (WIP) ColorEdit: Currently only disable 0.0f..1.0f limits in RGBA edition (note: you probably want to use ImGuiColorEditFlags_Float flag as well).
    RGB             = 1 << 13,  // [Inputs]     // ColorEdit: choose one among RGB/HSV/HEX. ColorPicker: choose any combination using RGB/HSV/HEX.
    HSV             = 1 << 14,  // [Inputs]     // "
    HEX             = 1 << 15,  // [Inputs]     // "
    Uint8           = 1 << 16,  // [DataType]   // ColorEdit, ColorPicker, ColorButton: _display_ values formatted as 0..255. 
    Float           = 1 << 17,  // [DataType]   // ColorEdit, ColorPicker, ColorButton: _display_ values formatted as 0.0f..1.0f floats instead of 0..255 integers. No round-trip of value via integers.
    PickerHueBar    = 1 << 18,  // [PickerMode] // ColorPicker: bar for Hue, rectangle for Sat/Value.
    PickerHueWheel  = 1 << 19,  // [PickerMode] // ColorPicker: wheel for Hue, triangle for Sat/Value.
    // Internals/Masks
    _InputsMask     = EImGui_ColorEditFlags.RGB            | EImGui_ColorEditFlags.HSV | EImGui_ColorEditFlags.HEX,
    _DataTypeMask   = EImGui_ColorEditFlags.Uint8          | EImGui_ColorEditFlags.Float,
    _PickerMask     = EImGui_ColorEditFlags.PickerHueWheel | EImGui_ColorEditFlags.PickerHueBar,
    _OptionsDefault = EImGui_ColorEditFlags.Uint8          | EImGui_ColorEditFlags.RGB | EImGui_ColorEditFlags.PickerHueBar    // Change application default using SetColorEditOptions()
};
#endregion
#region EImGui_MouseCursor
// Enumeration for GetMouseCursor()
enum EImGui_MouseCursor
{
    None = -1,
    Arrow = 0,
    TextInput,         // When hovering over InputText, etc.
    Move,              // Unused
    ResizeNS,          // Unused
    ResizeEW,          // When hovering over a column
    ResizeNESW,        // Unused
    ResizeNWSE,        // When hovering over the bottom-right corner of a window
    
    Num
};
#endregion
#region EImGui_TextCallbackData
// Array Passed to the Text Callback, the Writeable params will be re-written back to ImGui!
enum EImGui_TextCallbackData {
  EventFlag = 0,
  Flags,
  ReadOnly,
  
  StartData,
  
  // Always, History, and Completion Data
  Key = EImGui_TextCallbackData.StartData,
  Text,         
  TextMaxLength,     
  CurPos,     
  SelectionStart,
  SelectionEnd,
  
  Num,
  
  // Charfilter
  Char = EImGui_TextCallbackData.StartData,
  
  NumCharFilter,
};
#endregion
#region EImGui_Key
enum EImGui_Key {
    Tab,       // for tabbing through fields
    LeftArrow, // for text edit
    RightArrow,// for text edit
    UpArrow,   // for text edit
    DownArrow, // for text edit
    PageUp,
    PageDown,
    Home,      // for text edit
    End,       // for text edit
    Delete,    // for text edit
    Backspace, // for text edit
    Enter,     // for text edit
    Escape,    // for text edit
    A,         // for text edit CTRL+A: select all
    C,         // for text edit CTRL+C: copy
    V,         // for text edit CTRL+V: paste
    X,         // for text edit CTRL+X: cut
    Y,         // for text edit CTRL+Y: redo
    Z,         // for text edit CTRL+Z: undo
    
    Num
};
#endregion

#region InternalMacros
#macro ImGuiGML_CommandBuffer        (0)
#macro ImGuiGML_VertexBuffer         (1)

#macro _RousrDefaultBufferSize (4096)
#macro RousrCallBufferSize (4096)

#macro __Imgui_in (__imguigml_wrapper_buffer())
#macro __Imgui_out (__imguigml_wrapper_buffer())
#endregion
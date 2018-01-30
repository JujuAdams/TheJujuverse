///@function imguigml_config()
///@desc imguigml configuration

#macro IMGUI_TRANSPARENCY 1.1

/// Input configuration
#macro Imguigml_Show_ImGui_cursor            (true)  // if this is false, we won't touch the GMS cursor while ImGui is active.
#macro Imguigml_User_override                (true)  // if this is true, ImGuiGML will not call `window_set_cursor()` at the end of the step.

/// Debug Configuration
#macro Show_Error_on_ImGui_error    (true)  // use a `show_error()` call when an error occurs 
#macro Abort_on_ImGui_error         (true)  // if true, passed "true" to exit game on imgui error
#macro Show_message_on_ImGui_error  (false) // use a `show_message()` call when an error occurs 
#macro Call_script_on_ImGui_error   (noone) // call the script passed, passing it a string on error.

#region Advanced
// these can be adjusted to give ImGuiGML less / more memory / cpu
// (generally, leave it alone though)

#macro ImGuiGML_MaxVerts                 (65535)
#macro ImGuiGML_MaxCommands              (255)

#macro ImGuiGML_WrapperBufferSize        (4096)
#macro ImGuiGML_DebugBufferSize          (4096) * 4

#macro ImGuiGML_VertexBufferSize_Ubyte4  ((8 + 8 + 4) * ImGuiGML_MaxVerts)
#macro ImGuiGML_VertexBufferSize_Float   ((8 + 8 + 4 + 4 + 4 + 4 ) * ImGuiGML_MaxVerts)

#macro ImGuiGML_VertexBufferSize         (ImGuiGML_VertexBufferSize_Float)
#macro ImGuiGML_CommandBufferSize        ((1 + 4 + 4 + 4 + 4 + 4 + 4) * ImGuiGML_MaxCommands)

#macro ImGuiGML_InputBufferSize          (1024)

#macro ImGuiGML_UseUByte4                (false)
#macro ImGuiGML_UseFloat                 (!ImGuiGML_UseUByte4)

// ImGui can draw a cursor itself, which is almost never desired.
#macro Imguigml_Use_GM_cursor            (true)

#endregion

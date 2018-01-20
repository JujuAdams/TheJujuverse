///@function imguigml_config()
///@desc imguigml configuration

#macro IMGUI_TRANSPARENCY 1.15

/// Input configuration
#macro Show_ImGui_cursor            (true)  // if this is false, we won't touch the GMS cursor while ImGui is active.

/// Debug Configuration (wip: not implemented)
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
#macro Use_GM_cursor                     (true)

#endregion
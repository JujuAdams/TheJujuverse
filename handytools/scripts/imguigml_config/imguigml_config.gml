// (c) @babyjeans Nov 2017

#macro IMGUI_TRANSPARENCY 1.30

//No idea what all this does... go ask babyjeans...
#macro ImGuiGML_MaxVerts                 (65535)
#macro ImGuiGML_MaxCommands              (255)
#macro ImGuiGML_WrapperBufferSize        (4096)
#macro ImGuiGML_VertexBufferSize_Ubyte4  ((8 + 8 + 4) * ImGuiGML_MaxVerts)
#macro ImGuiGML_VertexBufferSize_Float   ((8 + 8 + 4 + 4 + 4 + 4 ) * ImGuiGML_MaxVerts)
#macro ImGuiGML_VertexBufferSize         (ImGuiGML_VertexBufferSize_Float)
#macro ImGuiGML_CommandBufferSize        ((1 + 4 + 4 + 4 + 4 + 4 + 4) * ImGuiGML_MaxCommands)
#macro ImGuiGML_InputBufferSize          (1024)
#macro ImGuiGML_UseUByte4                (false)
#macro ImGuiGML_UseFloat                 (!ImGuiGML_UseUByte4)
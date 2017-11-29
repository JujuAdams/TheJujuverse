{
    "id": "a6dced37-cc0f-4b20-81b3-d6cf39a2c09d",
    "modelName": "GMExtension",
    "mvc": "1.0",
    "name": "extImguiGML",
    "IncludedResources": [
        
    ],
    "androidPermissions": [
        
    ],
    "androidProps": false,
    "androidactivityinject": "",
    "androidclassname": "",
    "androidinject": "",
    "androidmanifestinject": "",
    "androidsourcedir": "",
    "author": "",
    "classname": "",
    "copyToTargets": 35184372089026,
    "date": "2017-43-20 08:11:26",
    "description": "",
    "extensionName": "",
    "files": [
        {
            "id": "95a23c09-ee3b-446c-9f12-1e9ceca2ce21",
            "modelName": "GMExtensionFile",
            "mvc": "1.0",
            "ProxyFiles": [
                
            ],
            "constants": [
                
            ],
            "copyToTargets": 194,
            "filename": "Imguigml.dll",
            "final": "_extImguiGML_shutdown",
            "functions": [
                {
                    "id": "503ddcce-1b60-4ed9-b965-cc17c236cc8e",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        2,
                        2
                    ],
                    "externalName": "Init",
                    "help": "initialze imguigml (_display_width, _display_height)",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_init",
                    "returnType": 2
                },
                {
                    "id": "a5f87da5-63cf-4597-848b-4cebf77f3f1b",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "Shutdown",
                    "help": "Shutdown imguigml",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_shutdown",
                    "returnType": 2
                },
                {
                    "id": "90eb82d9-1e00-4bdf-b7f3-f9998dc32e33",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1,
                        2
                    ],
                    "externalName": "SetWrapperBuffer",
                    "help": "set the buffer for wrapper params \/ returns (_buffer, _size)",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_set_wrapper_buffer",
                    "returnType": 2
                },
                {
                    "id": "48035199-16c7-49d6-814d-66e46cb564f1",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        2
                    ],
                    "externalName": "BeginStep",
                    "help": "Call to begin a new imgui frame (_delta_time)",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_begin_step",
                    "returnType": 2
                },
                {
                    "id": "4b157507-376f-4011-9ade-77396a510fe7",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1,
                        2,
                        1,
                        2
                    ],
                    "externalName": "SetRenderBuffer",
                    "help": "set buffers for a renderuse (_cmd_buffer_address, _cmd_buffer_size, _vertex_buffer_address, _vertex_buffer_size)",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_set_render_buffer",
                    "returnType": 2
                },
                {
                    "id": "181ac5f1-1462-4b4e-a3d3-f2c7627ed0e6",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "WaitForRender",
                    "help": "wait for the next ready buffer",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_wait_for_render",
                    "returnType": 2
                },
                {
                    "id": "4637674c-bd6d-4fee-be1a-b727139ddd51",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "EndStep",
                    "help": "call imgui's render and start processing the draw list",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_end_step",
                    "returnType": 2
                },
                {
                    "id": "01795a0e-924f-44e1-8388-87fa5c313d05",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "CreateFontTexture",
                    "help": "create the font texture, and pack the size into the buffer (_arg_buffer)",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_create_font_texture",
                    "returnType": 2
                },
                {
                    "id": "856b3e7b-abc7-40a6-9199-703030492772",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "GetFontTexture",
                    "help": "fill the passed buffer with the font texture (_font_buffer)",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_get_font_texture",
                    "returnType": 2
                },
                {
                    "id": "6d9bdf06-ca3d-4283-b546-95576222db5a",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "UpdateInput",
                    "help": "pass a buffer of this step's input data (_input_buffer)",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_update_input",
                    "returnType": 2
                },
                {
                    "id": "7beb6b3f-44b5-43af-a43d-3b432d7accf8",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "DoTest",
                    "help": "run the test ui",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_demo",
                    "returnType": 2
                },
                {
                    "id": "30255a72-f7c9-453f-a7cd-6998498c1082",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "End",
                    "help": "ImGui::End ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_end",
                    "returnType": 2
                },
                {
                    "id": "2a665a4d-08c8-478a-85b4-73a073f290f2",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "BeginChild",
                    "help": "ImGui::BeginChild(const char* str_id, const ImVec2& size = ImVec2(0, 0), bool border = false, ImGuiWindowFlags extra_flags = 0) or (ImGuiID id, const ImVec2& size = ImVec2(0, 0), bool border = false, ImGuiWindowFlags extra_flags = 0)",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_begin_child",
                    "returnType": 2
                },
                {
                    "id": "84f9df6d-ad55-448d-ba04-22ed906d61b8",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "EndChild",
                    "help": "ImgGui::EndChild()",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_end_child",
                    "returnType": 2
                },
                {
                    "id": "8405dca5-8817-432c-af10-c6a2a9aaa166",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "GetContentRegionMax",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_get_content_region_max",
                    "returnType": 2
                },
                {
                    "id": "f7f0cd67-f8a4-4f8d-9aa3-bca25a2273e3",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "GetContentRegionAvail",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_get_content_region_avail",
                    "returnType": 2
                },
                {
                    "id": "c2348eea-dcc3-450a-b2ad-92d8e923ebb8",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "GetContentRegionAvailWidth",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_get_content_region_avail_width",
                    "returnType": 2
                },
                {
                    "id": "4f8e8b42-8c7a-4d8d-a733-6f6fe328fe92",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "GetWindowContentRegionMin",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_get_window_content_region_min",
                    "returnType": 2
                },
                {
                    "id": "4463d887-8f6f-4125-83b5-fe4ee4c0601c",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "Begin",
                    "help": "ImGui::Begin (_name, [_open=-1.0], [_flags=0])",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_begin",
                    "returnType": 2
                },
                {
                    "id": "f1e7180d-9ad4-4df0-a977-9e6b168eb693",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1,
                        1,
                        1,
                        1
                    ],
                    "externalName": "RegisterCallbacks",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_registerCallbacks",
                    "returnType": 1
                },
                {
                    "id": "d738832a-a8ae-44a8-bf0e-80d82ed0007b",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "GetWindowContentRegionMax",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_get_window_content_region_max",
                    "returnType": 2
                },
                {
                    "id": "94213695-6e65-425c-8900-8d594df0de3a",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "GetWindowContentRegionWidth",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_get_window_content_region_width",
                    "returnType": 2
                },
                {
                    "id": "04bd5ba4-f5be-4af4-9c91-fc0796d764ee",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "GetWindowPos",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_get_window_pos",
                    "returnType": 2
                },
                {
                    "id": "6a257779-4fb3-41f9-b241-48b15e8717c1",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "GetWindowSize",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_get_window_size",
                    "returnType": 1
                },
                {
                    "id": "47cccd33-e68e-49a8-882c-b57e4921e710",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "GetWindowWidth",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_get_window_width",
                    "returnType": 2
                },
                {
                    "id": "4b291416-e194-4d2c-b58a-9a1f04bc6b01",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "GetWindowHeight",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_get_window_height",
                    "returnType": 2
                },
                {
                    "id": "1a6ddf8a-0d96-4cbf-9cd4-c9f5c2979e86",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "IsWindowCollapsed",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_is_window_collapsed",
                    "returnType": 2
                },
                {
                    "id": "2f021fcd-bbbe-4ef9-b03b-bb5158faaae8",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "IsWindowAppearing",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_is_window_appearing",
                    "returnType": 2
                },
                {
                    "id": "30e417e7-7986-46a4-92ea-46668f7f7aba",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "SetWindowFontScale",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_set_window_font_scale",
                    "returnType": 2
                },
                {
                    "id": "85486f19-c5f6-4b18-b255-deb5c2c7d91d",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "SetNextWindowPos",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_set_next_window_pos",
                    "returnType": 2
                },
                {
                    "id": "9c240008-d053-42b3-9782-825966d96ea5",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "SetNextWindowSize",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_set_next_window_size",
                    "returnType": 2
                },
                {
                    "id": "8ae05abe-b68a-4bb6-b830-ea8db831be64",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "SetNextWindowSizeConstraints",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_set_next_window_size_constraints",
                    "returnType": 2
                },
                {
                    "id": "103b9a16-b1bd-4a4b-9cf1-0d0fb9b8d76c",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "SetNextWindowContentSize",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_set_next_window_content_size",
                    "returnType": 2
                },
                {
                    "id": "97d9e43b-605f-4350-ac22-7820884917f3",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "SetNextWindowContentWidth",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_set_next_window_content_width",
                    "returnType": 2
                },
                {
                    "id": "3432aae9-76be-48b3-a705-3a60c928ebde",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "SetNextWindowCollapsed",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_set_next_window_collapsed",
                    "returnType": 2
                },
                {
                    "id": "73fed998-e2f4-4dac-8a3c-d1ab232f9f73",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "SetNextWindowFocus",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_set_next_window_focus",
                    "returnType": 2
                },
                {
                    "id": "c6e27bfb-beb5-413f-9709-fae29b553833",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "ImGuiSetWindowPos",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_set_window_pos",
                    "returnType": 2
                },
                {
                    "id": "78b51cf2-d62d-4b80-817e-4ac9849b34f5",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "SetWindowSize",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_set_window_size",
                    "returnType": 2
                },
                {
                    "id": "7040d4d3-08a5-4eda-859a-58e67ad33d1c",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "SetWindowCollapsed",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_set_window_collapsed",
                    "returnType": 2
                },
                {
                    "id": "d5a0534b-f076-4ec2-93d5-960e1ee7895b",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "SetWindowFocus",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_set_window_focus",
                    "returnType": 2
                },
                {
                    "id": "c225d5d2-6dcb-4cc9-98f2-5fe525942cdb",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "GetScrollX",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_get_scroll_x",
                    "returnType": 2
                },
                {
                    "id": "37077e37-26e1-40c9-be85-4a7f7e743016",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "GetScrollY",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_get_scroll_y",
                    "returnType": 2
                },
                {
                    "id": "133cc5f3-e8d6-45ec-ae47-c6c24ba9222b",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "GetScrollMaxX",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_get_scroll_max_x",
                    "returnType": 2
                },
                {
                    "id": "c6495484-0b5a-4567-bbe3-e1d5c35e1847",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "GetScrollMaxY",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_get_scroll_max_y",
                    "returnType": 2
                },
                {
                    "id": "66c7cead-b94e-481d-a155-f3738ed18164",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "SetScrollX",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_set_scroll_x",
                    "returnType": 2
                },
                {
                    "id": "d6892057-2cae-4766-9c8a-e6731feea8f6",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "SetScrollY",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_set_scroll_y",
                    "returnType": 2
                },
                {
                    "id": "637fdfc3-3ce9-49c4-9db1-bb5ef8da6cc8",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "SetScrollHere",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_set_scroll_here",
                    "returnType": 2
                },
                {
                    "id": "5f6c0611-c2e7-4fd0-80e2-182d0562e9ec",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "SetScrollFromPosY",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_set_scroll_from_pos_y",
                    "returnType": 2
                },
                {
                    "id": "a454413a-9339-473b-83d6-be21695414d5",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "SetKeyboardFocusHere",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_set_keyboard_focus_here",
                    "returnType": 2
                },
                {
                    "id": "efb51fb6-2f8f-4778-9c69-72858b9b8fd6",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "SetStateStorage",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_set_state_storage",
                    "returnType": 2
                },
                {
                    "id": "f28da0e9-9549-4201-ab1d-d9913dbc535f",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "GetStateStorage",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_get_state_storage",
                    "returnType": 2
                },
                {
                    "id": "f90e2c18-caf9-48f3-a6e1-4311832d947c",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "Button",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_button",
                    "returnType": 2
                },
                {
                    "id": "bcb288ec-2e92-4350-ae10-bfbeb98b74f6",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "SmallButton",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_small_button",
                    "returnType": 2
                },
                {
                    "id": "1ba66d79-c2af-4cfe-998f-8f44777d7799",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "InvisibleButton",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_invisible_button",
                    "returnType": 2
                },
                {
                    "id": "90613df2-7acd-4985-b591-2b1b93180ac9",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "Image",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_image",
                    "returnType": 2
                },
                {
                    "id": "e89f4af8-61ab-448a-94ae-9e1a9e885c7a",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "ImageButton",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_image_button",
                    "returnType": 2
                },
                {
                    "id": "36363f5b-b1fc-4768-830e-3dccc6a42c29",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "Checkbox",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_checkbox",
                    "returnType": 2
                },
                {
                    "id": "fbb8dc88-70df-4b63-99f1-598e72103986",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "CheckboxFlags",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_checkbox_flags",
                    "returnType": 2
                },
                {
                    "id": "34c637e8-a187-4a33-8289-e3612c192af0",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "RadioButton",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_radio_button",
                    "returnType": 2
                },
                {
                    "id": "02ccb8a1-6311-4a64-806b-88a0a1dec9e3",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "Combo",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_combo",
                    "returnType": 2
                },
                {
                    "id": "c7c08178-eb0a-40cc-b45d-0b033a64b0a5",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "PlotLines",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_plot_lines",
                    "returnType": 2
                },
                {
                    "id": "d4ca090f-97f6-4681-a735-56dd460ecd3f",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "PlotHistogram",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_plot_histogram",
                    "returnType": 2
                },
                {
                    "id": "9308330d-da41-42ea-afb5-947a339a504a",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "ProgressBar",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_progress_bar",
                    "returnType": 2
                },
                {
                    "id": "65503f6a-7d10-4025-9058-204083a9b013",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "Value",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_value",
                    "returnType": 2
                },
                {
                    "id": "f6066083-3aab-440e-8ab5-38c33bd80cb5",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "BeginChildFrame",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_begin_child_frame",
                    "returnType": 2
                },
                {
                    "id": "94a11f80-b07d-402b-bb8f-cfa595a6a735",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "EndChildFrame",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_end_child_frame",
                    "returnType": 2
                },
                {
                    "id": "aaebb08b-c3eb-43c2-8a0f-5212961a5be1",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "ColorConvertU32ToFloat4",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_color_convert_u32_to_float4",
                    "returnType": 2
                },
                {
                    "id": "b92658fc-08cf-4dc3-adaf-456f71d731d2",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "ColorConvertFloat4ToU32",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_color_convert_float4_to_u32",
                    "returnType": 2
                },
                {
                    "id": "c0373649-2fcd-44ee-bab0-e1d0f213d170",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "ColorConvertRGBtoHSV",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_color_convert_rgb_to_hsv",
                    "returnType": 2
                },
                {
                    "id": "6490446d-f4af-4bc8-ad24-b23357e8a532",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "ColorConvertHSVtoRGB",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_color_convert_hsv_to_rgb",
                    "returnType": 2
                },
                {
                    "id": "35c40684-58a7-4b94-8671-c9c0bb7682b0",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "ImText",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_text",
                    "returnType": 2
                },
                {
                    "id": "1f570970-2281-4a9f-8799-176e545e6323",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "ImTextColored",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_text_colored",
                    "returnType": 2
                },
                {
                    "id": "63edcf1f-9654-4920-aa3a-49d346d1dadd",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "ImTextDisabled",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_text_disabled",
                    "returnType": 2
                },
                {
                    "id": "457a5d3c-02c1-4028-a9c3-7bfa3d3e0ceb",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "ImTextWrapped",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_text_wrapped",
                    "returnType": 2
                },
                {
                    "id": "ac953b3e-ccfe-4b57-84cb-803f8225e302",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "ImBulletText",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_bullet_text",
                    "returnType": 2
                },
                {
                    "id": "605c0cde-b052-4766-952a-32d4f50e2734",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "ImBullet",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_bullet",
                    "returnType": 2
                },
                {
                    "id": "52049c8e-b8ed-4b32-aec2-b8b6678f4b44",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "ImLabelText",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_label_text",
                    "returnType": 2
                },
                {
                    "id": "18d54bab-a040-4028-8ec7-f41f9f22a3e3",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "TreeNode",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_tree_node",
                    "returnType": 2
                },
                {
                    "id": "6c835b9d-da2d-45cd-8d71-b7ae56d99d49",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "TreeNodeEx",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_tree_node_ex",
                    "returnType": 2
                },
                {
                    "id": "c4cab4c4-2bf5-41a9-8596-7d26d9194450",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "TreePush",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_tree_push",
                    "returnType": 2
                },
                {
                    "id": "d884ca88-d283-46da-ab3a-65ae53ef4698",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "TreePop",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_tree_pop",
                    "returnType": 2
                },
                {
                    "id": "992d86eb-4bef-4bd0-94a5-0d8d351f388e",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "TreeAdvanceToLabelPos",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_tree_advance_to_label_pos",
                    "returnType": 2
                },
                {
                    "id": "bd0cf4d9-a084-4ce0-a750-1fdae7d3d8a3",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "GetTreeNodeToLabelSpacing",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_get_tree_node_to_label_spacing",
                    "returnType": 2
                },
                {
                    "id": "e8025d70-5467-4826-adf2-d0d43668588f",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "SetNextTreeNodeOpen",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_set_next_tree_node_open",
                    "returnType": 2
                },
                {
                    "id": "d18a11ef-8bf6-419d-8596-01bd7c95c625",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "CollapsingHeader",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_collapsing_header",
                    "returnType": 2
                },
                {
                    "id": "8fe446e0-ab54-4f0c-9123-5ad2720f0020",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "BeginTooltip",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_begin_tooltip",
                    "returnType": 2
                },
                {
                    "id": "7777656b-34da-4742-b1b5-afbe430574c8",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "SetTooltip",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_set_tooltip",
                    "returnType": 2
                },
                {
                    "id": "0d37a10a-7615-4ffc-ae8f-5cbab53c44ed",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "EndTooltip",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_end_tooltip",
                    "returnType": 2
                },
                {
                    "id": "c24a2109-dc33-4ac9-adba-3453ed583e4e",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "SliderFloat",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_slider_float",
                    "returnType": 2
                },
                {
                    "id": "e3dc859e-c24e-4912-8eca-a1e9965d1ffa",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "VSliderInt",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_vslider_int",
                    "returnType": 2
                },
                {
                    "id": "69bf00ad-864f-4597-8b2e-54a32e944702",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "SliderFloat2",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_slider_float2",
                    "returnType": 2
                },
                {
                    "id": "a8e92448-079b-4b1f-9aa8-5d29df81890a",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "SliderFloat3",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_slider_float3",
                    "returnType": 2
                },
                {
                    "id": "62b56659-d239-44bb-8605-e7c01dd82f7b",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "SliderFloat4",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_slider_float4",
                    "returnType": 2
                },
                {
                    "id": "94ab5b09-3520-4390-bec4-b48d7c689fa3",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "SliderInt",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_slider_int",
                    "returnType": 2
                },
                {
                    "id": "47dc9b89-91b8-4f35-b616-86f5e78951c3",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "SliderInt2",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_slider_int2",
                    "returnType": 2
                },
                {
                    "id": "a85c51ab-afbd-4b70-aed8-fbb3b4b7374b",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "SliderInt3",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_slider_int3",
                    "returnType": 2
                },
                {
                    "id": "a0e2d568-f8fa-4fbb-acc3-73f2ee5fa8d9",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "SliderInt4",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_slider_int4",
                    "returnType": 2
                },
                {
                    "id": "c78eaeab-ef96-40cc-b218-7ed4157656f5",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "VSliderFloat",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_vslider_float",
                    "returnType": 2
                },
                {
                    "id": "594bc001-4bdd-4851-9caa-a9bbee3fd6de",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "ListBoxFooter",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_list_box_footer",
                    "returnType": 2
                },
                {
                    "id": "d5663428-35b7-41a2-a0c5-cf8610472d11",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "ListBoxHeader",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_list_box_header",
                    "returnType": 2
                },
                {
                    "id": "8fb0e76b-9cbe-4086-95db-371f87a607c1",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "ListBox",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_list_box",
                    "returnType": 2
                },
                {
                    "id": "14c05815-ae3a-4547-b823-e242237de204",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "ImSelectable",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_selectable",
                    "returnType": 2
                },
                {
                    "id": "fd557405-df43-4775-9f0c-216da4d4ddb4",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "PushID",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_push_id",
                    "returnType": 2
                },
                {
                    "id": "ad5137a5-0aee-4818-9f33-7da7da8ffec7",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "PopID",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_pop_id",
                    "returnType": 2
                },
                {
                    "id": "a8224db7-697e-46e6-8245-98bf5a83d153",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "GetID",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_get_id",
                    "returnType": 2
                },
                {
                    "id": "d1acd087-7f63-4c9b-924e-380374cf51ac",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "ImGetVersion",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_get_version",
                    "returnType": 2
                },
                {
                    "id": "911a0da6-bb9d-41f6-9c2c-43cc135fdd34",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "ImCreateContext",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_create_context",
                    "returnType": 2
                },
                {
                    "id": "a7c84543-4bcf-49d3-a300-f1af3b6720c8",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "ImDestroyContext",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_destroy_context",
                    "returnType": 2
                },
                {
                    "id": "c4681cd8-f479-45db-a7c2-23de996c3aa7",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "ImGetCurrentContext",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_get_current_context",
                    "returnType": 2
                },
                {
                    "id": "f1374cfd-24a4-48ed-ba1e-3d4d910ac824",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "ImSetCcurrentContext",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_set_current_context",
                    "returnType": 2
                },
                {
                    "id": "0f125eb5-52e1-4577-8b29-ff6f1e212250",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "ImGetClipboardText",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_get_clipboard_text",
                    "returnType": 2
                },
                {
                    "id": "1540686d-3e87-45f1-af37-1e321dfb3b2d",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "SetClipboardText",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_set_clipboard_text",
                    "returnType": 2
                },
                {
                    "id": "d4edfcaf-9fd5-4e8a-9251-b2956cc35656",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "ImGetKeyIndex",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_get_key_index",
                    "returnType": 2
                },
                {
                    "id": "8a45d6a6-c317-4d3d-907d-89ed5351f7a4",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "ImIsKeyDown",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_is_key_down",
                    "returnType": 2
                },
                {
                    "id": "74f582b1-520e-4329-85ec-8c0b31d2ef89",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "ImIsKeyPressed",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_is_key_pressed",
                    "returnType": 2
                },
                {
                    "id": "95c8c14d-4c61-4026-9dec-f28f8916aa04",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "ImIsKeyReleased",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_is_key_released",
                    "returnType": 2
                },
                {
                    "id": "c4f692fc-18d0-479c-863b-fcda75fd9c5f",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "ImGetKeyPressedAmount",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_get_key_pressed_amount",
                    "returnType": 2
                },
                {
                    "id": "d6161e74-bc35-4c6c-8ea2-b4d43b231bbd",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "ImIsMouseDown",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_is_mouse_down",
                    "returnType": 2
                },
                {
                    "id": "03657c9e-b5f2-406f-9e18-f3e925923358",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "ImIsMouseClicked",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_is_mouse_clicked",
                    "returnType": 2
                },
                {
                    "id": "07c23c95-142a-482c-a4bc-a1554f4f2b8d",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "ImIsMouseDoubleClicked",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_is_mouse_double_clicked",
                    "returnType": 2
                },
                {
                    "id": "284dc6f4-0a8a-462a-bccf-33a4a1844bb1",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "ImIsMouseReleased",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_is_mouse_released",
                    "returnType": 2
                },
                {
                    "id": "7a490e17-9fa4-4143-98c4-2733bf9ebd04",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "ImIsMouseDragging",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_is_mouse_dragging",
                    "returnType": 2
                },
                {
                    "id": "3a2e82b1-62a3-40dc-99f9-ef9dcc7b6715",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "ImIsMouseHoveringRect",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_is_mouse_hovering_rect",
                    "returnType": 2
                },
                {
                    "id": "1ecbbc65-bf03-4b42-aff0-8c67f412ed6e",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "ImIsMousePosValid",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_is_mouse_pos_valid",
                    "returnType": 2
                },
                {
                    "id": "51c7c545-d2b8-4c93-9098-8ea7d28915e5",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "ImGetMousePos",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_get_mouse_pos",
                    "returnType": 2
                },
                {
                    "id": "82f9a6c9-216c-4d1f-90f6-fe60215c38bc",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "ImGetMousePosOnOpeningCurrentPopup",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_get_mouse_pos_on_opening_current_popup",
                    "returnType": 2
                },
                {
                    "id": "b934a800-3672-4185-84cf-76318ae0c8ea",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "ImGetMouseDragDelta",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_get_mouse_drag_delta",
                    "returnType": 2
                },
                {
                    "id": "fe3ad773-60aa-488e-b619-190bbd9b459c",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "ImResetMouseDragDelta",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_reset_mouse_drag_delta",
                    "returnType": 2
                },
                {
                    "id": "5ccd3e05-5eb5-48a9-b281-ea04f2f97576",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "ImGetMouseCursor",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_get_mouse_cursor",
                    "returnType": 2
                },
                {
                    "id": "2883febb-5ee3-4cd3-839e-e7028accec80",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "ImSetMouseCursor",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_set_mouse_cursor",
                    "returnType": 1
                },
                {
                    "id": "4124f75a-73ba-4e6f-818e-6241f39bef2d",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "ImCaptureKeyboardFromApp",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_capture_keyboard_from_app",
                    "returnType": 2
                },
                {
                    "id": "ff2cd14a-786b-4d65-9af7-447fdbde4807",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "ImCaptureMouseFromApp",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_capture_mouse_from_app",
                    "returnType": 2
                },
                {
                    "id": "0949dde5-c62e-4d06-a946-bb454b8c7fa7",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "PushFont",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_push_font",
                    "returnType": 2
                },
                {
                    "id": "1479959a-f0e9-41c9-b1aa-302c35371e63",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "PopFont",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_pop_font",
                    "returnType": 2
                },
                {
                    "id": "71a2023d-b5ce-437a-a0ea-04a8a08254f7",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "PushStyleColor",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_push_style_color",
                    "returnType": 2
                },
                {
                    "id": "eb243915-a5ac-4742-9681-ea6066869b80",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "PopStyleColor",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_pop_style_color",
                    "returnType": 2
                },
                {
                    "id": "a0ce0e43-cb1f-4b23-952f-299dccefc1fa",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "PushStyleVar",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_push_style_var",
                    "returnType": 2
                },
                {
                    "id": "7d929fc2-556d-40bd-8c84-ec6a6bd352f2",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "PopStyleVar",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_pop_style_var",
                    "returnType": 2
                },
                {
                    "id": "779ca38a-1681-4ff7-8a38-29fc1bdd97cf",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "GetStyleColorVec4",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_get_style_color_vec4",
                    "returnType": 2
                },
                {
                    "id": "5e28be7c-e00d-4aa1-94a6-5cac01e74935",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "GetFont",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_get_font",
                    "returnType": 2
                },
                {
                    "id": "9a728fc7-0b1e-4224-82b9-84157823d7fa",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "GetFontSize",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_get_font_size",
                    "returnType": 2
                },
                {
                    "id": "f6b71107-d0cf-4fe8-8a61-ea58def141b5",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "GetFontTexUvWhitePixel",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_get_font_tex_uv_white_pixel",
                    "returnType": 2
                },
                {
                    "id": "51461021-6e04-4d03-9c84-ace83b5c9687",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "GetColorU32",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_get_color_u32",
                    "returnType": 2
                },
                {
                    "id": "28510958-e37c-43a0-88cc-cce19adc72bf",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "PushItemWidth",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_push_item_width",
                    "returnType": 2
                },
                {
                    "id": "341e3521-0580-4726-83c1-1cb1a813f2d9",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "PopItemWidth",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_pop_item_width",
                    "returnType": 2
                },
                {
                    "id": "742f494d-9393-4d98-9928-1320f675a3cc",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "CalcItemWidth",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_calc_item_width",
                    "returnType": 2
                },
                {
                    "id": "3600d7aa-b77a-4de4-b203-5e6b6e59258e",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "PushTextWrapPos",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_push_text_wrap_pos",
                    "returnType": 2
                },
                {
                    "id": "ff3dc9f5-ab19-4f43-bba6-f3ccfaaa5d49",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "PopTextWrapPos",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_pop_text_wrap_pos",
                    "returnType": 2
                },
                {
                    "id": "199976c0-c3e6-4a16-a4b6-870205d0ff6d",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "PushAllowKeyboardFocus",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_push_allow_keyboard_focus",
                    "returnType": 2
                },
                {
                    "id": "fa524c61-c550-4acd-b0d7-8e25a9771f8a",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "PopAllowKeyboardFocus",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_pop_allow_keyboard_focus",
                    "returnType": 2
                },
                {
                    "id": "d8fff2f8-5392-4b9c-b62e-2765a6b5bce3",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "PushButtonRepeat",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_push_button_repeat",
                    "returnType": 2
                },
                {
                    "id": "2ba0142f-5a43-4a61-a36b-16275af88031",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "PopButtonRepeat",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_pop_button_repeat",
                    "returnType": 2
                },
                {
                    "id": "dd0e9dca-c8d2-4c9b-bdd8-3f91e4ce2d15",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "BeginMainMenuBar",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_begin_main_menu_bar",
                    "returnType": 2
                },
                {
                    "id": "3e9802f2-b6b6-426d-8373-1944b17433d7",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "EndMainMenuBar",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_end_main_menu_bar",
                    "returnType": 2
                },
                {
                    "id": "41fc7797-83f5-4a37-8fb4-127be8346b7c",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "BeginMenuBar",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_begin_menu_bar",
                    "returnType": 2
                },
                {
                    "id": "1f57ae22-f19a-46b7-a64c-fe70d4d88908",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "EndMenuBar",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_end_menu_bar",
                    "returnType": 2
                },
                {
                    "id": "ab39d329-92ae-40dc-9fda-4fdca70a0077",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "ImBeginMenu",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_begin_menu",
                    "returnType": 2
                },
                {
                    "id": "353b51dd-e6c4-4fc1-bffc-b32479646121",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "ImEndMenu",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_end_menu",
                    "returnType": 2
                },
                {
                    "id": "e9b99841-904f-4955-b78b-2bcefb010895",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "MenuItem",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_menu_item",
                    "returnType": 2
                },
                {
                    "id": "4c52de26-a89d-4a4d-9187-6f01939130fe",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "OpenPopup",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_open_popup",
                    "returnType": 2
                },
                {
                    "id": "99f0ecc3-06ae-4fa6-8ca6-9c7dadda8894",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "OpenPopupOnItemClick",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_open_popup_on_item_click",
                    "returnType": 2
                },
                {
                    "id": "c18d3a95-0333-4a08-be9e-44e6c2ec943c",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "BeginPopup",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_begin_popup",
                    "returnType": 2
                },
                {
                    "id": "f579e496-04be-4165-ae9a-7d68fa7949ae",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "BeginPopupModal",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_begin_popup_modal",
                    "returnType": 2
                },
                {
                    "id": "d728a513-80af-41f3-9f91-e162c7b7ec1e",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "BeginPopupContextItem",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_begin_popup_context_item",
                    "returnType": 2
                },
                {
                    "id": "59c9317f-820b-48e9-a421-4bf840ce72cb",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "BeginPopupContextWindow",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_begin_popup_context_window",
                    "returnType": 2
                },
                {
                    "id": "8cf2fc1c-bbd0-44cc-bf9b-a1a1fee32b1c",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "BeginPopupContextVoid",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_begin_popup_context_void",
                    "returnType": 2
                },
                {
                    "id": "82fd73a9-940a-4183-8a46-7d03891273a8",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "EndPopup",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_end_popup",
                    "returnType": 2
                },
                {
                    "id": "15bea453-7e72-4db6-bf93-a605c3c044bc",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "IsPopupOpen",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_is_popup_open",
                    "returnType": 2
                },
                {
                    "id": "be178972-3ffa-45c4-8b43-c716d18fbf47",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "CloseCurrentPopup",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_close_current_popup",
                    "returnType": 2
                },
                {
                    "id": "922fff29-4e73-483e-8de4-c03ba95507fa",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "Separator",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_separator",
                    "returnType": 2
                },
                {
                    "id": "a9cb798b-430a-4124-9966-7da406384616",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "SameLine",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_same_line",
                    "returnType": 2
                },
                {
                    "id": "a2faee8a-498c-4324-92f6-9a1084bbb19b",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "NewLine",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_new_line",
                    "returnType": 2
                },
                {
                    "id": "287ea61f-7fd4-4fb0-9891-8d803cd3f2c8",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "Spacing",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_spacing",
                    "returnType": 2
                },
                {
                    "id": "21a5b6ce-5872-407a-87ab-8e52140c483c",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "Dummy",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_dummy",
                    "returnType": 2
                },
                {
                    "id": "f7cfdde5-3609-4bbd-b169-9b7518c98a08",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "Indent",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_indent",
                    "returnType": 2
                },
                {
                    "id": "866bc4d9-177a-4085-9eba-09a54bfc086a",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "Unindent",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_unindent",
                    "returnType": 2
                },
                {
                    "id": "1e2b4ff9-fbde-44fe-9394-e870f56fc1db",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "BeginGroup",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_begin_group",
                    "returnType": 2
                },
                {
                    "id": "8d2da125-e693-4fbf-ab4c-3eff4618b02a",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "EndGroup",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_end_group",
                    "returnType": 2
                },
                {
                    "id": "a821f4f2-c46d-41af-b08f-2096da6cd7f0",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "ImGetCursorPos",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_get_cursor_pos",
                    "returnType": 2
                },
                {
                    "id": "06c351e2-3b4d-437e-8dad-5cb7be82b7d7",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "GetCursorPosX",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_get_cursor_pos_x",
                    "returnType": 2
                },
                {
                    "id": "c51502ca-964d-44ac-94c8-70bb3285ae7c",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "GetCursorPosY",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_get_cursor_pos_y",
                    "returnType": 2
                },
                {
                    "id": "48b04c46-1d65-41d3-8888-4a255f93346a",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "ImSetCursorPos",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_set_cursor_pos",
                    "returnType": 2
                },
                {
                    "id": "7f99d793-6045-4ab3-825b-e0de97f01a30",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "SetCursorPosX",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_set_cursor_pos_x",
                    "returnType": 2
                },
                {
                    "id": "2368d3ef-298b-4a11-8686-b8fa5c3c3758",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "SetCursorPosY",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_set_cursor_pos_y",
                    "returnType": 2
                },
                {
                    "id": "b7b79ae3-fe76-4718-8c6a-d4b06a30756d",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "GetCursorStartPos",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_get_cursor_start_pos",
                    "returnType": 2
                },
                {
                    "id": "c4ae7c2f-faee-45fe-807c-0cc450a98b8d",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "GetCursorScreenPos",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_get_cursor_screen_pos",
                    "returnType": 2
                },
                {
                    "id": "16f16b36-c2b2-470a-982c-fcc1a929bed4",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "SetCursorScreenPos",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_set_cursor_screen_pos",
                    "returnType": 2
                },
                {
                    "id": "dc8f9f60-bb63-4785-9e62-0b59bc58b02e",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "AlignTextToFramePadding",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_align_text_to_frame_padding",
                    "returnType": 2
                },
                {
                    "id": "fe06b014-adf7-44a3-9cd3-981e61c8d5ed",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "GetTextLineHeight",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_get_text_line_height",
                    "returnType": 2
                },
                {
                    "id": "20b269e1-de83-47b8-936c-cb982f3fc334",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "GetTextLineHeightWithSpacing",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_get_text_line_height_with_spacing",
                    "returnType": 2
                },
                {
                    "id": "1eef356b-a49e-4c1d-a4a7-4e49eb37dc13",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "GetItemsLineHeightWithSpacing",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_get_items_line_height_with_spacing",
                    "returnType": 2
                },
                {
                    "id": "4828557f-61e1-415a-bebe-ebc349b6f95e",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "Columns",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_columns",
                    "returnType": 2
                },
                {
                    "id": "c9f7aa0d-6e4c-4f1e-8abe-e842e28f86c5",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "NextColumn",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_next_column",
                    "returnType": 2
                },
                {
                    "id": "99ba4ab2-2d63-49df-aacb-26847f6f85f2",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "GetColumnIndex",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_get_column_index",
                    "returnType": 2
                },
                {
                    "id": "8870c26b-811c-4a45-acb0-996e4b91e30b",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "GetColumnWidth",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_get_column_width",
                    "returnType": 2
                },
                {
                    "id": "948c6e17-e23b-446d-9b9d-4c3221999ee1",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "SetColumnWidth",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_set_column_width",
                    "returnType": 2
                },
                {
                    "id": "aee09090-b0b4-4b35-994a-274ee4a8187a",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "GetColumnOffset",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_get_column_offset",
                    "returnType": 2
                },
                {
                    "id": "6480a464-4618-4938-8ede-9948b0a70eb5",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "SetColumnOffset",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_set_column_offset",
                    "returnType": 2
                },
                {
                    "id": "6d0f0891-c76c-486e-a9cd-a72f62c16544",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "GetColumnsCount",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_get_columns_count",
                    "returnType": 2
                },
                {
                    "id": "8c381b69-a2aa-4312-9cc7-0760ec8235c0",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "LogToTTY",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_log_to_tty",
                    "returnType": 2
                },
                {
                    "id": "8914ccd9-ab0f-4830-ac86-30a225d8ae48",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "LogToFile",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_log_to_file",
                    "returnType": 2
                },
                {
                    "id": "01c78836-61b8-4ee7-95b0-f8570caed544",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "LogToClipboard",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_log_to_clipboard",
                    "returnType": 2
                },
                {
                    "id": "ca93b3d8-71ee-4ad1-a67c-649547f5a11b",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "LogFinish",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_log_finish",
                    "returnType": 2
                },
                {
                    "id": "da454b94-2108-4c95-b948-437b81fbb7c7",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "LogButtons",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_log_buttons",
                    "returnType": 2
                },
                {
                    "id": "e1943ff9-cf8e-44e4-b25e-39d79b320f83",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "LogText",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_log_text",
                    "returnType": 2
                },
                {
                    "id": "3d548a6f-524e-49b0-b91b-d67e15a4cbcd",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "IsItemHovered",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_is_item_hovered",
                    "returnType": 2
                },
                {
                    "id": "f76f56b6-57d2-4850-98e4-94e0eac08176",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "IsItemActive",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_is_item_active",
                    "returnType": 2
                },
                {
                    "id": "11fc7af9-432d-479f-95a6-fd0357b54fc7",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "IsItemClicked",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_is_item_clicked",
                    "returnType": 2
                },
                {
                    "id": "a4a89c0b-9ff4-45ac-b3c2-d27ff9636134",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "IsItemVisible",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_is_item_visible",
                    "returnType": 2
                },
                {
                    "id": "679615ba-e3de-47cd-8a79-182c62c29bbb",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "IsAnyItemHovered",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_is_any_item_hovered",
                    "returnType": 2
                },
                {
                    "id": "e78b28f9-9226-4de7-afa8-66fb3ecdd17a",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "GetItemRectMin",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_get_item_rect_min",
                    "returnType": 2
                },
                {
                    "id": "5b3c3051-33b7-457c-8367-d1f04ae5fc17",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "GetItemRectMax",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_get_item_rect_max",
                    "returnType": 2
                },
                {
                    "id": "8a5c3271-bba9-4d9e-9c0d-e13e344535a8",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "GetItemRectSize",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_get_item_rect_size",
                    "returnType": 2
                },
                {
                    "id": "2cdd630e-7a15-4e2b-b6d1-e514d3ba9273",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "SetItemAllowOverlap",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_set_item_allow_overlap",
                    "returnType": 2
                },
                {
                    "id": "db700c73-d315-430d-860f-2f4127126444",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "IsWindowFocused",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_is_window_focused",
                    "returnType": 2
                },
                {
                    "id": "a2a4f010-6971-417d-b36b-346b30722b78",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "IsWindowHovered",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_is_window_hovered",
                    "returnType": 2
                },
                {
                    "id": "5fcdbf71-a663-4fb6-b109-aeee0a738052",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "IsRootWindowFocused",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_is_root_window_focused",
                    "returnType": 2
                },
                {
                    "id": "82e50bf7-865c-4e94-8799-fb665b4fb40f",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "IsRootWindowOrAnyChildFocused",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_is_root_window_or_any_child_focused",
                    "returnType": 2
                },
                {
                    "id": "efe97c9f-6d61-4653-bb50-6ed4a2d7604f",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "IsAnyWindowHovered",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_is_any_window_hovered",
                    "returnType": 2
                },
                {
                    "id": "5086b920-4f26-452b-b94f-3845212dcf2f",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "IsRectVisible",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_is_rect_visible",
                    "returnType": 2
                },
                {
                    "id": "5ca3ad28-13da-410b-a5db-bd1b07702b0f",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "GetTime",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_get_time",
                    "returnType": 2
                },
                {
                    "id": "ec635168-6564-495f-b870-e8e4c5165c0e",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "GetFrameCount",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_get_frame_count",
                    "returnType": 2
                },
                {
                    "id": "b78e778d-a946-412a-a4f6-a5cceb701cd7",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "GetStyleColorName",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_get_style_color_name",
                    "returnType": 2
                },
                {
                    "id": "fddda520-4e48-4630-b991-35a1c3181f0c",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "CalcItemRectClosestPoint",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_calc_item_rect_closest_point",
                    "returnType": 2
                },
                {
                    "id": "3e395a37-de06-4b03-92f1-c78788362a46",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "CalcTextSize",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_calc_text_size",
                    "returnType": 2
                },
                {
                    "id": "85c06bdf-2b36-4635-a0c4-1ce1c2617d54",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "CalcListClipping",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_calc_list_clipping",
                    "returnType": 2
                },
                {
                    "id": "67f48022-656f-4c75-9aaf-101acd8c27ec",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "PushClipRect",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_push_clip_rect",
                    "returnType": 2
                },
                {
                    "id": "9381841a-36be-406d-a5b6-863ae64cda6b",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "PopClipRect",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_pop_clip_rect",
                    "returnType": 2
                },
                {
                    "id": "639dd921-b6bc-4937-a932-be9de60ce88a",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "IsAnyItemActive",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_is_any_item_active",
                    "returnType": 2
                },
                {
                    "id": "b2537fd5-24f2-4626-8406-5da099baa85f",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "ShowStyleEditor",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_show_style_editor",
                    "returnType": 2
                },
                {
                    "id": "51e8ce47-dcfe-4dfa-88f4-c9211688089d",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "StyleColorsClassic",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_style_colors_classic",
                    "returnType": 2
                },
                {
                    "id": "1b805a21-875a-4a44-92c7-abcb09b7d993",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "StyleColorsDark",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_style_colors_dark",
                    "returnType": 2
                },
                {
                    "id": "7f08ec0c-f9d2-49e3-a4ca-589a5b992d76",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "SliderAngle",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_slider_angle",
                    "returnType": 2
                },
                {
                    "id": "d2282a34-c624-4626-afa4-2716cc195869",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "ColorEdit3",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_color_edit3",
                    "returnType": 2
                },
                {
                    "id": "5197d060-a0d5-40bc-9901-d06c751a8533",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "ColorEdit4",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_color_edit4",
                    "returnType": 2
                },
                {
                    "id": "3c216eab-b20f-48a6-afb3-a180c5880661",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "ColorPicker3",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_color_picker3",
                    "returnType": 2
                },
                {
                    "id": "194a5936-e29d-4ea8-a997-4f9ba7863de6",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "ColorPicker4",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_color_picker4",
                    "returnType": 2
                },
                {
                    "id": "11a6a994-d947-4a2c-972c-ab5212cf41e3",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "ColorButton",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_color_button",
                    "returnType": 2
                },
                {
                    "id": "a5054133-bc80-4c15-a9e5-7445c3b4b783",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "SetColorEditOptions",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_set_color_edit_options",
                    "returnType": 2
                },
                {
                    "id": "85477b42-6cf6-4a8d-9695-88d349d51f36",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "DragFloat",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_drag_float",
                    "returnType": 2
                },
                {
                    "id": "ac6dea49-b178-41c3-a3d9-2a1e0422bab3",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "DragFloat2",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_drag_float2",
                    "returnType": 2
                },
                {
                    "id": "8bbcf3e2-666a-4ef4-8fed-7334c95ee418",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "DragFloat3",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_drag_float3",
                    "returnType": 2
                },
                {
                    "id": "9c987346-fc93-43bc-b039-f3c27e83de27",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "DragFloat4",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_drag_float4",
                    "returnType": 2
                },
                {
                    "id": "5e89c04e-1b76-47ab-be26-dc8f809c553f",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "DragFloatRange2",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_drag_float_range2",
                    "returnType": 2
                },
                {
                    "id": "41ec27a4-5baf-450f-8184-b02b34d6a144",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "DragInt",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_drag_int",
                    "returnType": 2
                },
                {
                    "id": "b2c04102-9812-4478-9ba0-4640ecf2aa15",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "DragInt2",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_drag_int2",
                    "returnType": 2
                },
                {
                    "id": "5fcb3c19-862f-4ed9-b744-d8082591fb93",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "DragInt3",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_drag_int3",
                    "returnType": 2
                },
                {
                    "id": "7c99a815-55e7-4cca-8375-bb160e8211b0",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "DragInt4",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_drag_int4",
                    "returnType": 2
                },
                {
                    "id": "629824e5-3045-401f-9ab7-573e3da6594c",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "DragIntRange2",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_drag_int_range2",
                    "returnType": 2
                },
                {
                    "id": "27bb6d00-1bcf-4362-8406-495425ffb997",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "InputText",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_input_text",
                    "returnType": 2
                },
                {
                    "id": "a8468a5e-441f-45da-bfb7-595e06e1a31b",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "InputTextMultiline",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_input_text_multiline",
                    "returnType": 2
                },
                {
                    "id": "e274387d-a794-4404-95e0-6eec16a56bcf",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "InputFloat",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_input_float",
                    "returnType": 2
                },
                {
                    "id": "e5e1ab04-7827-470c-bffb-5a8b58f5b166",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "InputFloat2",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_input_float2",
                    "returnType": 2
                },
                {
                    "id": "2d61b403-7d3c-40cb-a12c-867bc00f9ce8",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "InputFloat3",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_input_float3",
                    "returnType": 2
                },
                {
                    "id": "c3b60a76-0394-46bf-9977-eb9a05ec27a9",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "InputFloat4",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_input_float4",
                    "returnType": 2
                },
                {
                    "id": "1b27b3df-6927-4f89-9f62-14e5fcb943ec",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "InputInt",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_input_int",
                    "returnType": 2
                },
                {
                    "id": "44bcd4fb-3a78-4b29-96ef-ba373d6c8c67",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "InputInt2",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_input_int2",
                    "returnType": 2
                },
                {
                    "id": "1d522c7c-8a15-4a94-825b-3e484f4550a7",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "InputInt3",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_input_int3",
                    "returnType": 2
                },
                {
                    "id": "92e55309-185c-4df4-ace7-3f870e6b4270",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "InputInt4",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_input_int4",
                    "returnType": 2
                }
            ],
            "init": "",
            "kind": 1,
            "order": [
                "f1e7180d-9ad4-4df0-a977-9e6b168eb693",
                "503ddcce-1b60-4ed9-b965-cc17c236cc8e",
                "a5f87da5-63cf-4597-848b-4cebf77f3f1b",
                "4b157507-376f-4011-9ade-77396a510fe7",
                "90eb82d9-1e00-4bdf-b7f3-f9998dc32e33",
                "48035199-16c7-49d6-814d-66e46cb564f1",
                "4637674c-bd6d-4fee-be1a-b727139ddd51",
                "181ac5f1-1462-4b4e-a3d3-f2c7627ed0e6",
                "01795a0e-924f-44e1-8388-87fa5c313d05",
                "856b3e7b-abc7-40a6-9199-703030492772",
                "6d9bdf06-ca3d-4283-b546-95576222db5a",
                "7beb6b3f-44b5-43af-a43d-3b432d7accf8",
                "4463d887-8f6f-4125-83b5-fe4ee4c0601c",
                "30255a72-f7c9-453f-a7cd-6998498c1082",
                "2a665a4d-08c8-478a-85b4-73a073f290f2",
                "84f9df6d-ad55-448d-ba04-22ed906d61b8",
                "8405dca5-8817-432c-af10-c6a2a9aaa166",
                "f7f0cd67-f8a4-4f8d-9aa3-bca25a2273e3",
                "c2348eea-dcc3-450a-b2ad-92d8e923ebb8",
                "4f8e8b42-8c7a-4d8d-a733-6f6fe328fe92",
                "d738832a-a8ae-44a8-bf0e-80d82ed0007b",
                "94213695-6e65-425c-8900-8d594df0de3a",
                "04bd5ba4-f5be-4af4-9c91-fc0796d764ee",
                "6a257779-4fb3-41f9-b241-48b15e8717c1",
                "47cccd33-e68e-49a8-882c-b57e4921e710",
                "4b291416-e194-4d2c-b58a-9a1f04bc6b01",
                "1a6ddf8a-0d96-4cbf-9cd4-c9f5c2979e86",
                "2f021fcd-bbbe-4ef9-b03b-bb5158faaae8",
                "30e417e7-7986-46a4-92ea-46668f7f7aba",
                "85486f19-c5f6-4b18-b255-deb5c2c7d91d",
                "9c240008-d053-42b3-9782-825966d96ea5",
                "8ae05abe-b68a-4bb6-b830-ea8db831be64",
                "103b9a16-b1bd-4a4b-9cf1-0d0fb9b8d76c",
                "97d9e43b-605f-4350-ac22-7820884917f3",
                "3432aae9-76be-48b3-a705-3a60c928ebde",
                "73fed998-e2f4-4dac-8a3c-d1ab232f9f73",
                "c6e27bfb-beb5-413f-9709-fae29b553833",
                "78b51cf2-d62d-4b80-817e-4ac9849b34f5",
                "7040d4d3-08a5-4eda-859a-58e67ad33d1c",
                "d5a0534b-f076-4ec2-93d5-960e1ee7895b",
                "c225d5d2-6dcb-4cc9-98f2-5fe525942cdb",
                "37077e37-26e1-40c9-be85-4a7f7e743016",
                "133cc5f3-e8d6-45ec-ae47-c6c24ba9222b",
                "c6495484-0b5a-4567-bbe3-e1d5c35e1847",
                "66c7cead-b94e-481d-a155-f3738ed18164",
                "d6892057-2cae-4766-9c8a-e6731feea8f6",
                "637fdfc3-3ce9-49c4-9db1-bb5ef8da6cc8",
                "5f6c0611-c2e7-4fd0-80e2-182d0562e9ec",
                "a454413a-9339-473b-83d6-be21695414d5",
                "efb51fb6-2f8f-4778-9c69-72858b9b8fd6",
                "f28da0e9-9549-4201-ab1d-d9913dbc535f",
                "f90e2c18-caf9-48f3-a6e1-4311832d947c",
                "bcb288ec-2e92-4350-ae10-bfbeb98b74f6",
                "1ba66d79-c2af-4cfe-998f-8f44777d7799",
                "90613df2-7acd-4985-b591-2b1b93180ac9",
                "e89f4af8-61ab-448a-94ae-9e1a9e885c7a",
                "36363f5b-b1fc-4768-830e-3dccc6a42c29",
                "fbb8dc88-70df-4b63-99f1-598e72103986",
                "34c637e8-a187-4a33-8289-e3612c192af0",
                "02ccb8a1-6311-4a64-806b-88a0a1dec9e3",
                "c7c08178-eb0a-40cc-b45d-0b033a64b0a5",
                "d4ca090f-97f6-4681-a735-56dd460ecd3f",
                "9308330d-da41-42ea-afb5-947a339a504a",
                "65503f6a-7d10-4025-9058-204083a9b013",
                "f6066083-3aab-440e-8ab5-38c33bd80cb5",
                "94a11f80-b07d-402b-bb8f-cfa595a6a735",
                "aaebb08b-c3eb-43c2-8a0f-5212961a5be1",
                "b92658fc-08cf-4dc3-adaf-456f71d731d2",
                "c0373649-2fcd-44ee-bab0-e1d0f213d170",
                "6490446d-f4af-4bc8-ad24-b23357e8a532",
                "35c40684-58a7-4b94-8671-c9c0bb7682b0",
                "1f570970-2281-4a9f-8799-176e545e6323",
                "63edcf1f-9654-4920-aa3a-49d346d1dadd",
                "457a5d3c-02c1-4028-a9c3-7bfa3d3e0ceb",
                "52049c8e-b8ed-4b32-aec2-b8b6678f4b44",
                "ac953b3e-ccfe-4b57-84cb-803f8225e302",
                "605c0cde-b052-4766-952a-32d4f50e2734",
                "18d54bab-a040-4028-8ec7-f41f9f22a3e3",
                "6c835b9d-da2d-45cd-8d71-b7ae56d99d49",
                "c4cab4c4-2bf5-41a9-8596-7d26d9194450",
                "d884ca88-d283-46da-ab3a-65ae53ef4698",
                "992d86eb-4bef-4bd0-94a5-0d8d351f388e",
                "bd0cf4d9-a084-4ce0-a750-1fdae7d3d8a3",
                "e8025d70-5467-4826-adf2-d0d43668588f",
                "d18a11ef-8bf6-419d-8596-01bd7c95c625",
                "7777656b-34da-4742-b1b5-afbe430574c8",
                "8fe446e0-ab54-4f0c-9123-5ad2720f0020",
                "0d37a10a-7615-4ffc-ae8f-5cbab53c44ed",
                "c24a2109-dc33-4ac9-adba-3453ed583e4e",
                "69bf00ad-864f-4597-8b2e-54a32e944702",
                "a8e92448-079b-4b1f-9aa8-5d29df81890a",
                "62b56659-d239-44bb-8605-e7c01dd82f7b",
                "7f08ec0c-f9d2-49e3-a4ca-589a5b992d76",
                "94ab5b09-3520-4390-bec4-b48d7c689fa3",
                "47dc9b89-91b8-4f35-b616-86f5e78951c3",
                "a85c51ab-afbd-4b70-aed8-fbb3b4b7374b",
                "a0e2d568-f8fa-4fbb-acc3-73f2ee5fa8d9",
                "c78eaeab-ef96-40cc-b218-7ed4157656f5",
                "e3dc859e-c24e-4912-8eca-a1e9965d1ffa",
                "14c05815-ae3a-4547-b823-e242237de204",
                "8fb0e76b-9cbe-4086-95db-371f87a607c1",
                "d5663428-35b7-41a2-a0c5-cf8610472d11",
                "594bc001-4bdd-4851-9caa-a9bbee3fd6de",
                "fd557405-df43-4775-9f0c-216da4d4ddb4",
                "ad5137a5-0aee-4818-9f33-7da7da8ffec7",
                "a8224db7-697e-46e6-8245-98bf5a83d153",
                "d1acd087-7f63-4c9b-924e-380374cf51ac",
                "911a0da6-bb9d-41f6-9c2c-43cc135fdd34",
                "a7c84543-4bcf-49d3-a300-f1af3b6720c8",
                "c4681cd8-f479-45db-a7c2-23de996c3aa7",
                "f1374cfd-24a4-48ed-ba1e-3d4d910ac824",
                "0f125eb5-52e1-4577-8b29-ff6f1e212250",
                "1540686d-3e87-45f1-af37-1e321dfb3b2d",
                "d4edfcaf-9fd5-4e8a-9251-b2956cc35656",
                "8a45d6a6-c317-4d3d-907d-89ed5351f7a4",
                "74f582b1-520e-4329-85ec-8c0b31d2ef89",
                "95c8c14d-4c61-4026-9dec-f28f8916aa04",
                "c4f692fc-18d0-479c-863b-fcda75fd9c5f",
                "d6161e74-bc35-4c6c-8ea2-b4d43b231bbd",
                "03657c9e-b5f2-406f-9e18-f3e925923358",
                "07c23c95-142a-482c-a4bc-a1554f4f2b8d",
                "284dc6f4-0a8a-462a-bccf-33a4a1844bb1",
                "7a490e17-9fa4-4143-98c4-2733bf9ebd04",
                "3a2e82b1-62a3-40dc-99f9-ef9dcc7b6715",
                "1ecbbc65-bf03-4b42-aff0-8c67f412ed6e",
                "51c7c545-d2b8-4c93-9098-8ea7d28915e5",
                "82f9a6c9-216c-4d1f-90f6-fe60215c38bc",
                "b934a800-3672-4185-84cf-76318ae0c8ea",
                "fe3ad773-60aa-488e-b619-190bbd9b459c",
                "5ccd3e05-5eb5-48a9-b281-ea04f2f97576",
                "2883febb-5ee3-4cd3-839e-e7028accec80",
                "4124f75a-73ba-4e6f-818e-6241f39bef2d",
                "ff2cd14a-786b-4d65-9af7-447fdbde4807",
                "0949dde5-c62e-4d06-a946-bb454b8c7fa7",
                "1479959a-f0e9-41c9-b1aa-302c35371e63",
                "71a2023d-b5ce-437a-a0ea-04a8a08254f7",
                "eb243915-a5ac-4742-9681-ea6066869b80",
                "a0ce0e43-cb1f-4b23-952f-299dccefc1fa",
                "7d929fc2-556d-40bd-8c84-ec6a6bd352f2",
                "779ca38a-1681-4ff7-8a38-29fc1bdd97cf",
                "5e28be7c-e00d-4aa1-94a6-5cac01e74935",
                "9a728fc7-0b1e-4224-82b9-84157823d7fa",
                "f6b71107-d0cf-4fe8-8a61-ea58def141b5",
                "51461021-6e04-4d03-9c84-ace83b5c9687",
                "28510958-e37c-43a0-88cc-cce19adc72bf",
                "341e3521-0580-4726-83c1-1cb1a813f2d9",
                "742f494d-9393-4d98-9928-1320f675a3cc",
                "3600d7aa-b77a-4de4-b203-5e6b6e59258e",
                "ff3dc9f5-ab19-4f43-bba6-f3ccfaaa5d49",
                "199976c0-c3e6-4a16-a4b6-870205d0ff6d",
                "fa524c61-c550-4acd-b0d7-8e25a9771f8a",
                "d8fff2f8-5392-4b9c-b62e-2765a6b5bce3",
                "2ba0142f-5a43-4a61-a36b-16275af88031",
                "dd0e9dca-c8d2-4c9b-bdd8-3f91e4ce2d15",
                "3e9802f2-b6b6-426d-8373-1944b17433d7",
                "41fc7797-83f5-4a37-8fb4-127be8346b7c",
                "1f57ae22-f19a-46b7-a64c-fe70d4d88908",
                "ab39d329-92ae-40dc-9fda-4fdca70a0077",
                "353b51dd-e6c4-4fc1-bffc-b32479646121",
                "e9b99841-904f-4955-b78b-2bcefb010895",
                "4c52de26-a89d-4a4d-9187-6f01939130fe",
                "99f0ecc3-06ae-4fa6-8ca6-9c7dadda8894",
                "c18d3a95-0333-4a08-be9e-44e6c2ec943c",
                "f579e496-04be-4165-ae9a-7d68fa7949ae",
                "d728a513-80af-41f3-9f91-e162c7b7ec1e",
                "59c9317f-820b-48e9-a421-4bf840ce72cb",
                "8cf2fc1c-bbd0-44cc-bf9b-a1a1fee32b1c",
                "82fd73a9-940a-4183-8a46-7d03891273a8",
                "15bea453-7e72-4db6-bf93-a605c3c044bc",
                "be178972-3ffa-45c4-8b43-c716d18fbf47",
                "922fff29-4e73-483e-8de4-c03ba95507fa",
                "a9cb798b-430a-4124-9966-7da406384616",
                "a2faee8a-498c-4324-92f6-9a1084bbb19b",
                "287ea61f-7fd4-4fb0-9891-8d803cd3f2c8",
                "21a5b6ce-5872-407a-87ab-8e52140c483c",
                "f7cfdde5-3609-4bbd-b169-9b7518c98a08",
                "866bc4d9-177a-4085-9eba-09a54bfc086a",
                "1e2b4ff9-fbde-44fe-9394-e870f56fc1db",
                "8d2da125-e693-4fbf-ab4c-3eff4618b02a",
                "a821f4f2-c46d-41af-b08f-2096da6cd7f0",
                "06c351e2-3b4d-437e-8dad-5cb7be82b7d7",
                "c51502ca-964d-44ac-94c8-70bb3285ae7c",
                "48b04c46-1d65-41d3-8888-4a255f93346a",
                "7f99d793-6045-4ab3-825b-e0de97f01a30",
                "2368d3ef-298b-4a11-8686-b8fa5c3c3758",
                "b7b79ae3-fe76-4718-8c6a-d4b06a30756d",
                "c4ae7c2f-faee-45fe-807c-0cc450a98b8d",
                "16f16b36-c2b2-470a-982c-fcc1a929bed4",
                "dc8f9f60-bb63-4785-9e62-0b59bc58b02e",
                "fe06b014-adf7-44a3-9cd3-981e61c8d5ed",
                "20b269e1-de83-47b8-936c-cb982f3fc334",
                "1eef356b-a49e-4c1d-a4a7-4e49eb37dc13",
                "4828557f-61e1-415a-bebe-ebc349b6f95e",
                "c9f7aa0d-6e4c-4f1e-8abe-e842e28f86c5",
                "99ba4ab2-2d63-49df-aacb-26847f6f85f2",
                "8870c26b-811c-4a45-acb0-996e4b91e30b",
                "948c6e17-e23b-446d-9b9d-4c3221999ee1",
                "aee09090-b0b4-4b35-994a-274ee4a8187a",
                "6480a464-4618-4938-8ede-9948b0a70eb5",
                "6d0f0891-c76c-486e-a9cd-a72f62c16544",
                "8c381b69-a2aa-4312-9cc7-0760ec8235c0",
                "8914ccd9-ab0f-4830-ac86-30a225d8ae48",
                "01c78836-61b8-4ee7-95b0-f8570caed544",
                "ca93b3d8-71ee-4ad1-a67c-649547f5a11b",
                "da454b94-2108-4c95-b948-437b81fbb7c7",
                "e1943ff9-cf8e-44e4-b25e-39d79b320f83",
                "3d548a6f-524e-49b0-b91b-d67e15a4cbcd",
                "f76f56b6-57d2-4850-98e4-94e0eac08176",
                "11fc7af9-432d-479f-95a6-fd0357b54fc7",
                "a4a89c0b-9ff4-45ac-b3c2-d27ff9636134",
                "679615ba-e3de-47cd-8a79-182c62c29bbb",
                "639dd921-b6bc-4937-a932-be9de60ce88a",
                "e78b28f9-9226-4de7-afa8-66fb3ecdd17a",
                "5b3c3051-33b7-457c-8367-d1f04ae5fc17",
                "8a5c3271-bba9-4d9e-9c0d-e13e344535a8",
                "2cdd630e-7a15-4e2b-b6d1-e514d3ba9273",
                "db700c73-d315-430d-860f-2f4127126444",
                "a2a4f010-6971-417d-b36b-346b30722b78",
                "5fcdbf71-a663-4fb6-b109-aeee0a738052",
                "82e50bf7-865c-4e94-8799-fb665b4fb40f",
                "efe97c9f-6d61-4653-bb50-6ed4a2d7604f",
                "5086b920-4f26-452b-b94f-3845212dcf2f",
                "5ca3ad28-13da-410b-a5db-bd1b07702b0f",
                "ec635168-6564-495f-b870-e8e4c5165c0e",
                "b78e778d-a946-412a-a4f6-a5cceb701cd7",
                "fddda520-4e48-4630-b991-35a1c3181f0c",
                "3e395a37-de06-4b03-92f1-c78788362a46",
                "85c06bdf-2b36-4635-a0c4-1ce1c2617d54",
                "67f48022-656f-4c75-9aaf-101acd8c27ec",
                "9381841a-36be-406d-a5b6-863ae64cda6b",
                "b2537fd5-24f2-4626-8406-5da099baa85f",
                "51e8ce47-dcfe-4dfa-88f4-c9211688089d",
                "1b805a21-875a-4a44-92c7-abcb09b7d993",
                "d2282a34-c624-4626-afa4-2716cc195869",
                "5197d060-a0d5-40bc-9901-d06c751a8533",
                "3c216eab-b20f-48a6-afb3-a180c5880661",
                "194a5936-e29d-4ea8-a997-4f9ba7863de6",
                "11a6a994-d947-4a2c-972c-ab5212cf41e3",
                "a5054133-bc80-4c15-a9e5-7445c3b4b783",
                "85477b42-6cf6-4a8d-9695-88d349d51f36",
                "ac6dea49-b178-41c3-a3d9-2a1e0422bab3",
                "8bbcf3e2-666a-4ef4-8fed-7334c95ee418",
                "9c987346-fc93-43bc-b039-f3c27e83de27",
                "5e89c04e-1b76-47ab-be26-dc8f809c553f",
                "41ec27a4-5baf-450f-8184-b02b34d6a144",
                "b2c04102-9812-4478-9ba0-4640ecf2aa15",
                "5fcb3c19-862f-4ed9-b744-d8082591fb93",
                "7c99a815-55e7-4cca-8375-bb160e8211b0",
                "629824e5-3045-401f-9ab7-573e3da6594c",
                "27bb6d00-1bcf-4362-8406-495425ffb997",
                "a8468a5e-441f-45da-bfb7-595e06e1a31b",
                "e274387d-a794-4404-95e0-6eec16a56bcf",
                "e5e1ab04-7827-470c-bffb-5a8b58f5b166",
                "2d61b403-7d3c-40cb-a12c-867bc00f9ce8",
                "c3b60a76-0394-46bf-9977-eb9a05ec27a9",
                "1b27b3df-6927-4f89-9f62-14e5fcb943ec",
                "44bcd4fb-3a78-4b29-96ef-ba373d6c8c67",
                "1d522c7c-8a15-4a94-825b-3e484f4550a7",
                "92e55309-185c-4df4-ace7-3f870e6b4270"
            ],
            "origname": "",
            "uncompress": false
        },
        {
            "id": "be385c94-a4be-47e0-a581-5b00a6123e5f",
            "modelName": "GMExtensionFile",
            "mvc": "1.0",
            "ProxyFiles": [
                
            ],
            "constants": [
                
            ],
            "copyToTargets": -1,
            "filename": "extImguiGML.gml",
            "final": "",
            "functions": [
                {
                    "id": "ad7c4725-b494-4391-b28b-31f7ec0a8b93",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_separator",
                    "help": " separator, generally horizontal. inside a menu bar or in horizontal layout mode, this becomes a vertical separator. ( )",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_separator",
                    "returnType": 2
                },
                {
                    "id": "8a14a2c7-4dd5-4c91-9785-b31acc5e9d6d",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_same_line",
                    "help": " call between widgets or groups to layout them horizontally ( [_pos_x=0.0], [_spacing_w=-1.0])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_same_line",
                    "returnType": 2
                },
                {
                    "id": "f7effa36-9e0c-4d95-bcfa-89917c313398",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_new_line",
                    "help": " undo a SameLine[] ( )",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_new_line",
                    "returnType": 2
                },
                {
                    "id": "df338459-4eae-46ec-a81e-7cbce6793a01",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_spacing",
                    "help": " add vertical spacing ( )",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_spacing",
                    "returnType": 2
                },
                {
                    "id": "c62ede95-0652-4fea-9614-084b0d0847c7",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_dummy",
                    "help": " add a dummy item of given size ( _size_x, _size_y)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_dummy",
                    "returnType": 2
                },
                {
                    "id": "b69d992c-7314-4ec1-8482-218d08e31d5f",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_indent",
                    "help": " move content position toward the right, by style.IndentSpacing or indent_w if >0 ( [_index_w=0.0f])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_indent",
                    "returnType": 2
                },
                {
                    "id": "51a11211-ffc3-4843-b506-efad261ac1a3",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_unindent",
                    "help": " move content position back to the left, by style.IndentSpacing or indent_w if >0 ( [_index_w=0.0f])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_unindent",
                    "returnType": 2
                },
                {
                    "id": "42fb2dfc-f4a0-414c-b144-fc23a2378bbd",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_begin_group",
                    "help": " lock horizontal starting position + capture group bounding box into one \"item\" [so you can use IsItemHovered[] or layout primitives such as SameLine[] on whole group, etc.] ( )",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_begin_group",
                    "returnType": 2
                },
                {
                    "id": "1758b7a2-38da-465e-b5ab-ce45881a4833",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_end_group",
                    "help": " end horizontal capture group ( )",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_end_group",
                    "returnType": 2
                },
                {
                    "id": "915e5de9-f587-4dae-992c-bff8e3e698e7",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_get_cursor_pos",
                    "help": " cursor position is relative to window position ( )",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_get_cursor_pos",
                    "returnType": 2
                },
                {
                    "id": "28ef2875-5985-4fe0-a6d3-4540001e5f38",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_get_cursor_pos_x",
                    "help": " cursor position is relative to window position ( )",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_get_cursor_pos_x",
                    "returnType": 2
                },
                {
                    "id": "f7766e51-c52a-4f78-b411-dc95b950d44f",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_get_cursor_pos_y",
                    "help": " cursor position is relative to window position ( )",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_get_cursor_pos_y",
                    "returnType": 2
                },
                {
                    "id": "6d0c60b8-0610-4a24-abbd-c7517ec12e0a",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_set_cursor_pos",
                    "help": " set the imgui cursor position ( _x, _y)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_set_cursor_pos",
                    "returnType": 2
                },
                {
                    "id": "f4d9d925-c540-425a-8a49-af47b44b3568",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_set_cursor_pos_x",
                    "help": " set the imgui cursor position x ( _x)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_set_cursor_pos_x",
                    "returnType": 2
                },
                {
                    "id": "aeb4f427-535e-4c3b-ad09-ec9d71695f25",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_set_cursor_pos_y",
                    "help": " set the imgui cursor position y ( _y)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_set_cursor_pos_y",
                    "returnType": 2
                },
                {
                    "id": "1fe1e912-75a8-4837-b3bb-4361ea4e46d5",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_get_cursor_start_pos",
                    "help": " initial cursor position ( )",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_get_cursor_start_pos",
                    "returnType": 2
                },
                {
                    "id": "297c2d69-0b2c-4903-a0d6-7d9b02e17b1e",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_get_cursor_screen_pos",
                    "help": " cursor position in absolute screen coordinates [0..io.DisplaySize] [useful to work with ImDrawList API] ( )",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_get_cursor_screen_pos",
                    "returnType": 2
                },
                {
                    "id": "bc3a5d13-217f-4629-961a-4f5dd290adf5",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_set_cursor_screen_pos",
                    "help": " cursor position in absolute screen coordinates [0..io.DisplaySize] ( _x, _y)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_set_cursor_screen_pos",
                    "returnType": 2
                },
                {
                    "id": "8db72fd1-7697-48c8-a53a-fe4a1ee328e0",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_align_text_to_frame_padding",
                    "help": " vertically align\/lower upcoming text to FramePadding.y so that it will aligns to upcoming widgets [call if you have text on a line before regular widgets] ( )",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_align_text_to_frame_padding",
                    "returnType": 2
                },
                {
                    "id": "9ebce278-f423-479b-894f-fef25e150b61",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_get_text_line_height",
                    "help": " height of font == GetWindowFontSize[] ( )",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_get_text_line_height",
                    "returnType": 2
                },
                {
                    "id": "b7f0ed05-6db4-41da-a18f-533c781fbbcf",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_get_text_line_height_with_spacing",
                    "help": " distance [in pixels] between 2 consecutive lines of text == GetWindowFontSize[] + GetStyle[].ItemSpacing.y ( )",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_get_text_line_height_with_spacing",
                    "returnType": 2
                },
                {
                    "id": "7858deb6-d667-4f8d-8568-90a86371b917",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_get_items_line_height_with_spacing",
                    "help": " distance [in pixels] between 2 consecutive lines of standard height widgets == GetWindowFontSize[] + GetStyle[].FramePadding.y*2 + GetStyle[].ItemSpacing.y ( )",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_get_items_line_height_with_spacing",
                    "returnType": 2
                },
                {
                    "id": "e9ede1e6-0fad-4975-bb15-f80285abd4cb",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_columns",
                    "help": " You can also use SameLine[pos_x] for simplified columns. ( [_count=1], [_id=undefined], [_border=true])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_columns",
                    "returnType": 2
                },
                {
                    "id": "04855de5-7c64-4686-85e2-ed115a811275",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_next_column",
                    "help": " next column, defaults to current row or next row if the current row is finished ( )",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_next_column",
                    "returnType": 2
                },
                {
                    "id": "02389678-1028-4bb7-ad51-9a8e1d384ad8",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_get_column_index",
                    "help": " get current column index ( )",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_get_column_index",
                    "returnType": 2
                },
                {
                    "id": "82988d58-ccb2-4c38-87c1-f92d17aa4264",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_get_column_width",
                    "help": " get column width [in pixels]. pass -1 to use current column ( [_column_index=-1])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_get_column_width",
                    "returnType": 2
                },
                {
                    "id": "fbfd4717-8003-493a-9107-b6977e7f859d",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_set_column_width",
                    "help": " set column width [in pixels]. pass -1 to use current column ( _column_index, _width)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_set_column_width",
                    "returnType": 2
                },
                {
                    "id": "5afbb325-5166-4aa2-abc7-b887e91eb93f",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_get_column_offset",
                    "help": " get position of column line [in pixels, from the left side of the contents region]. ( [_column_index=-1])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_get_column_offset",
                    "returnType": 2
                },
                {
                    "id": "45775045-6190-4520-a761-eaa694ada4be",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_set_column_offset",
                    "help": " set position of column line [in pixels, from the left side of the contents region]. ( _column_index, _offset_x)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_set_column_offset",
                    "returnType": 2
                },
                {
                    "id": "7b1f3288-4aee-426c-8979-73857bd507b9",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_get_columns_count",
                    "help": " get amount of columns ( )",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_get_columns_count",
                    "returnType": 2
                },
                {
                    "id": "3db21ade-e717-4eee-bdee-ad4fc15958d4",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_push_id",
                    "help": " push identifier into the ID stack. IDs are hash of the entire stack! ( _id, [_end_id])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_push_id",
                    "returnType": 2
                },
                {
                    "id": "d634569e-4a6c-44b8-a613-cbce3c62c7b9",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_pop_id",
                    "help": " pop identifier from ID stack ( )",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_pop_id",
                    "returnType": 2
                },
                {
                    "id": "1b030767-ecd6-4ad2-8d3f-2fc9f6a5f8f8",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_get_id",
                    "help": " push identifier into the ID stack. IDs are hash of the entire stack! ( _id, [_end_id])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_get_id",
                    "returnType": 2
                },
                {
                    "id": "4d40bd72-1715-4139-a08a-53e3a744d01a",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_get_version",
                    "help": " ( )",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_get_version",
                    "returnType": 2
                },
                {
                    "id": "0540db0e-c450-4ec2-9770-c3957106ce5f",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_get_clipboard_text",
                    "help": " get the clipboard text ( )",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_get_clipboard_text",
                    "returnType": 2
                },
                {
                    "id": "a9e3b81d-89ca-4a38-8b13-0b9b88d73731",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_set_clipboard_text",
                    "help": " set the clipboard text ( _text)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_set_clipboard_text",
                    "returnType": 2
                },
                {
                    "id": "30c62556-f3ca-4ae3-8c70-34069fefc1dd",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_get_key_index",
                    "help": " get mapped index for imgui_key index, you really don't need this ( _key_index)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_get_key_index",
                    "returnType": 2
                },
                {
                    "id": "4be7c79e-b4e5-449d-b403-b47da53393eb",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_is_key_down",
                    "help": " is key being held. == io.KeysDown[user_key_index]. note that imgui doesn't know the semantic of each entry of io.KeyDown[]. Use your own indices\/enums according to how your backend\/engine stored them into KeyDown[]! ( _key_index)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_is_key_down",
                    "returnType": 2
                },
                {
                    "id": "761abb95-31f3-43f2-891e-b8a8b2ed64c5",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_is_key_pressed",
                    "help": " was key pressed [went from !Down to Down] ( _key_index, [_repeat=true])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_is_key_pressed",
                    "returnType": 2
                },
                {
                    "id": "21f3ca8d-d9d7-4bff-95af-c9a21f5f64f9",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_is_key_released",
                    "help": " is key released ( _key_index)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_is_key_released",
                    "returnType": 2
                },
                {
                    "id": "a04a8657-0b00-4b5a-a02c-af1bfd7b5a46",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_get_key_pressed_amount",
                    "help": " uses provided repeat rate\/delay. ( _key_index, _repeat_delay, _rate;)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_get_key_pressed_amount",
                    "returnType": 2
                },
                {
                    "id": "d87cfb6b-594d-48ed-90ef-e64e9e9eb534",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_is_mouse_down",
                    "help": " is mouse button held ( _button)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_is_mouse_down",
                    "returnType": 2
                },
                {
                    "id": "a929158f-1243-4bbf-ae42-58e1872203d4",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_is_mouse_clicked",
                    "help": " did mouse button clicked [went from !Down to Down] ( _button, [_repeat=false])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_is_mouse_clicked",
                    "returnType": 2
                },
                {
                    "id": "e39d6c43-8eca-42cd-87c5-9ba1b4b0b5af",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_is_mouse_double_clicked",
                    "help": " did mouse button double-clicked. a double-click returns false in IsMouseClicked[]. uses io.MouseDoubleClickTime. ( _button)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_is_mouse_double_clicked",
                    "returnType": 2
                },
                {
                    "id": "3745227a-6c59-4a5d-b3e5-87975c985281",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_is_mouse_released",
                    "help": " did mouse button released [went from Down to !Down] ( _button)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_is_mouse_released",
                    "returnType": 2
                },
                {
                    "id": "82e3e3c4-a8e4-4221-9f5f-d1717fb60d8e",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_is_mouse_dragging",
                    "help": " is mouse dragging. ( [_button=0], [_lock_threadhold=-1.0])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_is_mouse_dragging",
                    "returnType": 2
                },
                {
                    "id": "77ae1d77-ca70-43a1-870c-d491bed33676",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_is_mouse_hovering_rect",
                    "help": " is mouse hovering given bounding rect [in screen space]. ( _min_x, _min_y, _max_x, _max_y, [_clip=true])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_is_mouse_hovering_rect",
                    "returnType": 2
                },
                {
                    "id": "36537c5a-c9b6-4150-b17f-7d8c55ac1183",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_is_mouse_pos_valid",
                    "help": " is the mouse position valid ( )",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_is_mouse_pos_valid",
                    "returnType": 2
                },
                {
                    "id": "984fd0ca-1b35-4429-9ed7-95bf9a71ff2e",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_get_mouse_pos",
                    "help": " shortcut to ImGui::GetIO[].MousePos provided by user, to be consistent with other calls ( )",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_get_mouse_pos",
                    "returnType": 2
                },
                {
                    "id": "af083bf3-dde9-4de1-bc27-4ed11085102c",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_get_mouse_pos_on_opening_current_popup",
                    "help": " retrieve backup of mouse positioning at the time of opening popup we have BeginPopup[] into ( )",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_get_mouse_pos_on_opening_current_popup",
                    "returnType": 2
                },
                {
                    "id": "992213e9-b803-47a5-bbaa-c763aeafd793",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_get_mouse_drag_delta",
                    "help": " retrieve backup of mouse positioning at the time of opening popup we have BeginPopup[] into ( )",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_get_mouse_drag_delta",
                    "returnType": 2
                },
                {
                    "id": "429e8128-fb59-4c2f-b6af-c4747995cb76",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_reset_mouse_drag_delta",
                    "help": " reset the drag delta ( [_button=0])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_reset_mouse_drag_delta",
                    "returnType": 2
                },
                {
                    "id": "6b56fc55-f3c9-4e79-b630-58e75c8dfb53",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_get_mouse_cursor",
                    "help": " get desired cursor type, reset in ImGui::NewFrame[], this is updated during the frame. valid before Render[]. If you use software rendering by setting io.MouseDrawCursor ImGui will render those for you ( )",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_get_mouse_cursor",
                    "returnType": 2
                },
                {
                    "id": "95f6c851-c2f1-4be0-8d5d-29f5419a338f",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_set_mouse_cursor",
                    "help": " set desired cursor type ( _type)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_set_mouse_cursor",
                    "returnType": 2
                },
                {
                    "id": "aca1a485-865c-473a-bfd0-fd814d3537e6",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_capture_keyboard_from_app",
                    "help": " manually override io.WantCaptureKeyboard flag next frame [said flag is entirely left for your application handle]. e.g. force capture keyboard when your widget is being hovered. ( [_capture=true])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_capture_keyboard_from_app",
                    "returnType": 2
                },
                {
                    "id": "b316a21b-550e-4cd3-a06f-98cd95df90d3",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_capture_mouse_from_app",
                    "help": " manually override io.WantCaptureMouse flag next frame [said flag is entirely left for your application handle]. ( [_capture=true])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_capture_mouse_from_app",
                    "returnType": 2
                },
                {
                    "id": "49c7a205-6f46-4b63-8d8a-b5c14d1a7d6d",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_log_to_tty",
                    "help": " start logging to tty ( [_max_depth=-1])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_log_to_tty",
                    "returnType": 2
                },
                {
                    "id": "85a91146-bb2c-452c-8ca5-0680e401d396",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_log_to_file",
                    "help": " start logging to file ( [_max_depth=-1], [_file_name=undefined])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_log_to_file",
                    "returnType": 2
                },
                {
                    "id": "c4b6d7ab-0e01-459f-a49f-48b75848d521",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_log_to_clipboard",
                    "help": " start logging to OS clipboard ( [_max_depth=-1])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_log_to_clipboard",
                    "returnType": 2
                },
                {
                    "id": "61fdd479-68ba-4ec4-be1a-730ec46bf2bf",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_log_finish",
                    "help": " stop logging [close file, etc.] ( @func imguigml_log_finish)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_log_finish",
                    "returnType": 2
                },
                {
                    "id": "37a445ec-0c11-4b9d-b044-dad0d6e04159",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_log_buttons",
                    "help": " helper to display buttons for logging to tty\/file\/clipboard ( )",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_log_buttons",
                    "returnType": 2
                },
                {
                    "id": "231e3754-b767-4802-9727-658b699f434a",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_log_text",
                    "help": " pass text data straight to log [without being displayed] ( _text)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_log_text",
                    "returnType": 2
                },
                {
                    "id": "939572bb-3549-4ae0-a7e0-b303cca421bd",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_begin_main_menu_bar",
                    "help": " create and append to a full screen menu-bar. only call EndMainMenuBar[] if this returns true! ( )",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_begin_main_menu_bar",
                    "returnType": 2
                },
                {
                    "id": "65bbfd50-8433-4c80-b527-0009223514c7",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_end_main_menu_bar",
                    "help": " end main menu bar ( )",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_end_main_menu_bar",
                    "returnType": 2
                },
                {
                    "id": "f345f224-2fbe-4a28-afdc-7a8ca3ab049d",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_begin_menu_bar",
                    "help": " append to menu-bar of current window [requires ImGuiWindowFlags_MenuBar flag set on parent window]. only call EndMenuBar[] if this returns true! ( )",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_begin_menu_bar",
                    "returnType": 2
                },
                {
                    "id": "1d0f3a21-84d3-4409-aebe-7c07b39117f0",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_end_menu_bar",
                    "help": " end menu bar ( )",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_end_menu_bar",
                    "returnType": 2
                },
                {
                    "id": "3cafccf2-3128-48ac-b66a-5b0b24839103",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_begin_menu",
                    "help": " create a sub-menu entry. only call EndMenu[] if this returns true! ( _label, [_enabled=true];)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_begin_menu",
                    "returnType": 2
                },
                {
                    "id": "bc00a688-a4ca-43c3-8a67-6baf2965e9f3",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_end_menu",
                    "help": " end sub-menu entry ( )",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_end_menu",
                    "returnType": 2
                },
                {
                    "id": "ba03fbe9-b2c1-42d2-bfe0-06f213f4145e",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_menu_item",
                    "help": " show a sub-menu item ( _label, [_shortcut=\"\"], [_selected=false], [_enabled=true];)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_menu_item",
                    "returnType": 2
                },
                {
                    "id": "ea3f2053-d674-482a-9ffc-a54b5f6484f4",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_open_popup",
                    "help": " current ID-stack [so OpenPopup and BeginPopup needs to be at the same level]. ( _str_id)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_open_popup",
                    "returnType": 2
                },
                {
                    "id": "c3d22d0a-3ff4-4009-9e55-03d81f77bade",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_open_popup_on_item_click",
                    "help": " helper to open popup when clicked on last item. ( [_str_id=undefined], [_mouse_button=1])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_open_popup_on_item_click",
                    "returnType": 2
                },
                {
                    "id": "cfe7489a-80f6-4398-9072-f6f3f0f483c3",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_begin_popup",
                    "help": " begin a pop up - only call EndPopup[] if BeginPopup[] returned true! ( _str_id)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_begin_popup",
                    "returnType": 2
                },
                {
                    "id": "c83bbe35-924e-4c93-ac3b-935eea8ad4ce",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_begin_popup_modal",
                    "help": " modal dialog [block interactions behind the modal window, can't close the modal window by clicking outside] ( _name, [_open=undefined], [_extra_flags=0])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_begin_popup_modal",
                    "returnType": 2
                },
                {
                    "id": "b3ac3955-b221-4ab2-8e6d-ab1d7dd59a71",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_begin_popup_context_item",
                    "help": " helper to open and begin popup when clicked on last item. if you can pass a NULL str_id only if the previous item had an id. If you want to use that on a non-interactive item such as Text[] you need to pass in an explicit ID here. read comments in .cpp! ( [_str_id=undefined], [_mouse_button=1])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_begin_popup_context_item",
                    "returnType": 2
                },
                {
                    "id": "8c0f23e2-7597-4111-a8ce-4e303f97c5c2",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_begin_popup_context_window",
                    "help": " helper to open and begin popup when clicked on current window. ( [_str_id=undefined], [_mouse_button=1], [_also_over_items=true])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_begin_popup_context_window",
                    "returnType": 2
                },
                {
                    "id": "b056af51-97c2-4029-8157-e6cf8e47910c",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_begin_popup_context_void",
                    "help": " helper to open and begin popup when clicked in void [where there are no imgui windows]. ( [_str_id=undefined], [_mouse_button=1])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_begin_popup_context_void",
                    "returnType": 2
                },
                {
                    "id": "f5fbdc6e-3631-488e-a5d7-45ea4e0b62a0",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_end_popup",
                    "help": " end the current pop up ( )",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_end_popup",
                    "returnType": 2
                },
                {
                    "id": "2622108f-bdb5-4fd6-9ed6-a88b038bf1f4",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_is_popup_open",
                    "help": " return true if the popup is open ( _str_id)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_is_popup_open",
                    "returnType": 2
                },
                {
                    "id": "bd669425-e122-41c2-ad54-96ae139bf4a6",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_close_current_popup",
                    "help": " close the popup we have begin-ed into. clicking on a MenuItem or Selectable automatically close the current popup. ( )",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_close_current_popup",
                    "returnType": 2
                },
                {
                    "id": "bbbb3e0d-b5a2-479a-9af5-f37b346a949d",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_push_font",
                    "help": " use undefined as a shortcut to push default font ( _font_index)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_push_font",
                    "returnType": 2
                },
                {
                    "id": "fd68217e-4325-497e-9238-6cd33955eebd",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_pop_font",
                    "help": " pop the font ( )",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_pop_font",
                    "returnType": 2
                },
                {
                    "id": "5c739a95-467f-4370-920e-b20494a84e45",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_push_style_color",
                    "help": " ( _idx, _colOrR, [_g], [_b], [_a])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_push_style_color",
                    "returnType": 2
                },
                {
                    "id": "72dd4d85-83c2-4e3e-bc1b-4430e8b107e0",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_pop_style_color",
                    "help": " pop style colors ( [_count=1])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_pop_style_color",
                    "returnType": 2
                },
                {
                    "id": "0c8fb882-f7ef-4350-a486-3faac6b52361",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_push_style_var",
                    "help": " push a style var on the param stack ( @func imguigml_push_style_var)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_push_style_var",
                    "returnType": 2
                },
                {
                    "id": "ae7115e5-edad-45c8-9b3d-00b297ed195d",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_pop_style_var",
                    "help": " pop style colors ( [_count=1])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_pop_style_var",
                    "returnType": 2
                },
                {
                    "id": "e7683a93-c1a5-456a-8df2-2f9c106bb6ac",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_get_style_color_vec4",
                    "help": " retrieve style color as stored in ImGuiStyle structure. use to feed back into PushStyleColor[], otherwhise use GetColorU32[] to get style color + style alpha. ( _idx)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_get_style_color_vec4",
                    "returnType": 2
                },
                {
                    "id": "07c01eb3-083f-4400-bf2d-5892cb0fa172",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_get_font",
                    "help": " get current font ( )",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_get_font",
                    "returnType": 2
                },
                {
                    "id": "0eb7ebea-f561-4203-a6ee-e85bb01c3a2d",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_get_font_size",
                    "help": " get current font size [= height in pixels] of current font with current scale applied ( )",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_get_font_size",
                    "returnType": 2
                },
                {
                    "id": "05068dce-63b4-4596-8031-d3de430904f3",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_get_font_tex_uv_white_pixel",
                    "help": " get UV coordinate for a while pixel, useful to draw custom shapes via the ImDrawList API ( )",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_get_font_tex_uv_white_pixel",
                    "returnType": 2
                },
                {
                    "id": "26110cfa-9f0c-4dde-a07a-3da4d9b42641",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_get_color_u32",
                    "help": " retrieve given style color with style alpha applied and optional extra alpha multiplier ( _colOrR, [_g], [_b], [_a])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_get_color_u32",
                    "returnType": 2
                },
                {
                    "id": "83ffbb90-3807-44ef-9d15-3027ce4aa3ab",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_get_color_u32_from_idx",
                    "help": " retrieve given style color with style alpha applied and optional extra alpha multiplier ( _idx, [_alpha_mul=1.0])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_get_color_u32_from_idx",
                    "returnType": 2
                },
                {
                    "id": "73cf05db-bea2-4120-af0b-5b0772da6cfd",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_push_item_width",
                    "help": " width of items for the common item+label case, pixels. ( _item_width)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_push_item_width",
                    "returnType": 2
                },
                {
                    "id": "c4ef6dfe-d582-4ed5-a2fd-28bf4b87e85e",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_pop_item_width",
                    "help": " pop item width ( )",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_pop_item_width",
                    "returnType": 2
                },
                {
                    "id": "1987efd9-320e-47e4-9403-48229dc7ea74",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_calc_item_width",
                    "help": " width of item given pushed settings and current cursor position ( )",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_calc_item_width",
                    "returnType": 2
                },
                {
                    "id": "3b854e5c-795a-49cb-9eff-9a372eb94f22",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_push_text_wrap_pos",
                    "help": " word-wrapping for Text*[] commands. ( [_wrap_pos_x=0.0])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_push_text_wrap_pos",
                    "returnType": 2
                },
                {
                    "id": "10470cea-a941-4e8a-9616-8dfa8296427e",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_pop_text_wrap_pos",
                    "help": " pop text wrap pos ( )",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_pop_text_wrap_pos",
                    "returnType": 2
                },
                {
                    "id": "cbd0e546-915f-4b80-8244-4acf905a68fd",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_push_allow_keyboard_focus",
                    "help": " allow focusing using TAB\/Shift-TAB, enabled by default but you can disable it for certain widgets ( _allow_keyboard_focus)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_push_allow_keyboard_focus",
                    "returnType": 2
                },
                {
                    "id": "00f83f95-bbb4-412e-8f6c-c19866ec7cf1",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_pop_allow_keyboard_focus",
                    "help": " pop allow keyboard focus ( )",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_pop_allow_keyboard_focus",
                    "returnType": 2
                },
                {
                    "id": "8b9b6e5b-bc02-4d80-925a-684f214926d6",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_push_button_repeat",
                    "help": " in 'repeat' mode, Button*[] functions return repeated true in a typematic manner [using io.KeyRepeatDelay\/io.KeyRepeatRate setting]. Note that you can call IsItemActive[] after any Button[] to tell if the button is held in the current frame. ( _repeat)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_push_button_repeat",
                    "returnType": 2
                },
                {
                    "id": "42e0ca51-c36b-472b-b8da-881de2bd0516",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_pop_button_repeat",
                    "help": " pop repeat mode ( )",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_pop_button_repeat",
                    "returnType": 2
                },
                {
                    "id": "a77edf0f-c005-4772-9965-7e2477c2d1fb",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_selectable",
                    "help": " selectable element ( _label, [_selected=false], [_selectable_flags=0], [_size_x=0], [_size_y=0])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_selectable",
                    "returnType": 2
                },
                {
                    "id": "b48d38d8-dcd6-4ade-a8dd-20c187a60098",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_list_box",
                    "help": " create a list box ( _label, _current_item, _item_array, [_height_in_items=-1])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_list_box",
                    "returnType": 2
                },
                {
                    "id": "0da9740d-1c37-4e26-ac7e-18d261c4c704",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_list_box_header",
                    "help": " use if you want to reimplement ListBox[] will custom data or interactions. make sure to call ListBoxFooter[] afterwards. ( _label, _size_x, _size_y)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_list_box_header",
                    "returnType": 2
                },
                {
                    "id": "60202ec7-c84e-458c-a22f-07783ac558aa",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_list_box_header_items",
                    "help": " use if you want to reimplement ListBox[] will custom data or interactions. make sure to call ListBoxFooter[] afterwards. ( _label, _items_count, [_height_in_items=-1];)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_list_box_header_items",
                    "returnType": 2
                },
                {
                    "id": "4b1e88e8-dbf9-4b93-9c57-6ed60666a9c3",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_list_box_footer",
                    "help": " terminate the scrolling region ( )",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_list_box_footer",
                    "returnType": 2
                },
                {
                    "id": "daa15279-6a17-4b0a-a434-aea433fc8a8a",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_show_style_editor",
                    "help": " add style editor block [not a window]. you can pass in a reference ImGuiStyle structure to compare to, revert to and save to [else it uses the default style] ( )",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_show_style_editor",
                    "returnType": 2
                },
                {
                    "id": "45262705-d6f2-4709-8b30-e31ebb7bb9f8",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_style_colors_classic",
                    "help": " use classic colors ( )",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_style_colors_classic",
                    "returnType": 2
                },
                {
                    "id": "3ac8f52d-58a5-4cbf-84ce-cd2bb2f0bf7d",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_style_colors_dark",
                    "help": " use dark colors ( )",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_style_colors_dark",
                    "returnType": 2
                },
                {
                    "id": "7b4f668b-70a4-49b8-ae16-d19c41485251",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_set_tooltip",
                    "help": " set text tooltip under mouse-cursor, typically use with ImGui::IsItemHovered[]. overidde any previous call to SetTooltip[]. ( _tooltip_text)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_set_tooltip",
                    "returnType": 2
                },
                {
                    "id": "2356fac4-fb20-4d74-887f-8ed24fb9afaf",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_begin_tooltip",
                    "help": " begin\/append a tooltip window. to create full-featured tooltip [with any kind of contents]. ( )",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_begin_tooltip",
                    "returnType": 2
                },
                {
                    "id": "ed7d3e94-fb75-416d-bd44-9543cec9726b",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_end_tooltip",
                    "help": " end a tooltip window ( )",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_end_tooltip",
                    "returnType": 2
                },
                {
                    "id": "9c182ef3-46ac-4720-883e-40596d97fb4e",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_value",
                    "help": " Output single value in \"name: value\" format [tip: freely declare more in your code to handle your types. you can add functions to the ImGui namespace] ( _label, _val_type, _val, [_float_format])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_value",
                    "returnType": 2
                },
                {
                    "id": "e6945a6d-3b2c-40e7-980c-1fb3f8b1d2bf",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_color_convert_u32_to_float4",
                    "help": " convert a u32 color to a float 4 ( _color)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_color_convert_u32_to_float4",
                    "returnType": 2
                },
                {
                    "id": "6671a1da-d11c-43a5-b740-1590cefb38b7",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_color_convert_float4_to_u32",
                    "help": " convert a float4 color to a u32 ( _r, _g, _b, _a)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_color_convert_float4_to_u32",
                    "returnType": 2
                },
                {
                    "id": "269c1a48-eeb8-4f6c-a016-02d221eed876",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_color_convert_rgb_to_hsv",
                    "help": " convert rgb to hsv ( _r, _g, _b)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_color_convert_rgb_to_hsv",
                    "returnType": 2
                },
                {
                    "id": "20267992-6407-42a5-a4ad-760646fe6fc7",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_color_convert_hsv_to_rgb",
                    "help": " convert rgb to hsv ( _h, _s, _v)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_color_convert_hsv_to_rgb",
                    "returnType": 2
                },
                {
                    "id": "580e5c2c-564b-40bb-a101-7734ea77a8e6",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_is_item_hovered",
                    "help": " is the last item hovered by mouse [and usable]? ( [_flags=0])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_is_item_hovered",
                    "returnType": 2
                },
                {
                    "id": "43053365-331e-4d67-bad5-4335348719c5",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_is_item_active",
                    "help": " is the last item active? [e.g. button being held, text field being edited- items that don't interact will always return false] ( )",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_is_item_active",
                    "returnType": 2
                },
                {
                    "id": "191fa4dc-eaf8-48ed-926a-87950bb47fef",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_is_item_clicked",
                    "help": " is the last item clicked? [e.g. button\/node just clicked on] ( [_button=0])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_is_item_clicked",
                    "returnType": 2
                },
                {
                    "id": "59d5f768-c642-46a5-ad36-ee067d6f402b",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_is_item_visible",
                    "help": " is the last item visible? [aka not out of sight due to clipping\/scrolling.] ( )",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_is_item_visible",
                    "returnType": 2
                },
                {
                    "id": "b15b807f-2a2a-4cf3-ad9a-9e72e5820d79",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_is_any_item_hovered",
                    "help": " are any items hovered ( )",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_is_any_item_hovered",
                    "returnType": 2
                },
                {
                    "id": "382ee3ee-a8f1-4b81-9c34-f69e65887576",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_is_any_item_active",
                    "help": " are any items active ( )",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_is_any_item_active",
                    "returnType": 2
                },
                {
                    "id": "5e86837a-1e84-482b-9f7a-b8b70268180f",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_get_item_rect_min",
                    "help": " get bounding rect of last item in screen space ( )",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_get_item_rect_min",
                    "returnType": 2
                },
                {
                    "id": "ecf08578-55ea-4725-9801-5d600d45d217",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_get_item_rect_max",
                    "help": " get bounding rect of last item in screen space ( )",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_get_item_rect_max",
                    "returnType": 2
                },
                {
                    "id": "f897614b-856d-4cf7-8529-dbdc3c89a081",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_get_item_rect_size",
                    "help": " get bounding rect of last item in screen space ( )",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_get_item_rect_size",
                    "returnType": 2
                },
                {
                    "id": "8819f16c-539d-4882-a85d-773864cf5d2a",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_set_item_allow_overlap",
                    "help": " allow last item to be overlapped by a subsequent item. sometimes useful with invisible buttons, selectables, etc. to catch unused area. ( @func imguigml_set_item_allow_overlap)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_set_item_allow_overlap",
                    "returnType": 2
                },
                {
                    "id": "e7af340d-3c04-45d0-bd38-06972ce9ff6d",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_is_window_focused",
                    "help": " is current Begin[]-ed window focused? ( )",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_is_window_focused",
                    "returnType": 2
                },
                {
                    "id": "8db505e6-bbb4-401a-80bb-fcbe38823b54",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_is_window_hovered",
                    "help": " is current Begin[]-ed window hovered [and typically: not blocked by a popup\/modal]? ( [_flags=0])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_is_window_hovered",
                    "returnType": 2
                },
                {
                    "id": "92f5317c-126a-42c9-b248-ec264f7ceb63",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_is_root_window_focused",
                    "help": " is current Begin[]-ed root window focused [root = top-most parent of a child, otherwise self]? ( )",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_is_root_window_focused",
                    "returnType": 2
                },
                {
                    "id": "6fed2124-e36b-45f7-bd64-5432aa86499c",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_is_root_window_or_any_child_focused",
                    "help": " is current Begin[]-ed root window or any of its child [including current window] focused? ( )",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_is_root_window_or_any_child_focused",
                    "returnType": 2
                },
                {
                    "id": "606ead62-3300-4119-acf3-20e363ea9a9f",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_is_any_window_hovered",
                    "help": " is mouse hovering any visible window ( )",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_is_any_window_hovered",
                    "returnType": 2
                },
                {
                    "id": "465674c8-d020-4131-a1bb-7db2ebd6c6a5",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_is_rect_visible",
                    "help": " test if a rectangle is visible \/ not clipped ( _sizeOrMin, [_max])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_is_rect_visible",
                    "returnType": 2
                },
                {
                    "id": "ca9d1ddf-fccb-418b-885d-67ee69d55a43",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_get_time",
                    "help": " get the time ( )",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_get_time",
                    "returnType": 2
                },
                {
                    "id": "4ce3c772-022a-44ed-8318-272106e27591",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_get_frame_count",
                    "help": " get the time ( )",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_get_frame_count",
                    "returnType": 2
                },
                {
                    "id": "0470dd56-c401-47b1-8da7-26424b183284",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_get_style_color_name",
                    "help": " get the style color's name ( _idx)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_get_style_color_name",
                    "returnType": 2
                },
                {
                    "id": "a936e28f-b8eb-4ad1-9bb6-74c774b6d8e4",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_calc_item_rect_closest_point",
                    "help": " utility to find the closest point the last item bounding rectangle edge. useful to visually link items ( _pos_x, _pos_y, [_on_edge=false], [_outward=+0.0])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_calc_item_rect_closest_point",
                    "returnType": 2
                },
                {
                    "id": "8d4ad677-353c-439d-a80b-241f67f74f1f",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_calc_text_size",
                    "help": " Calculate text size. Text can be multi-line. Optionally ignore text after a ## marker. ( _text, [_text_end=undefined], [_hide_text_after_double_hash=false], [_wrap_width=-1.0f];)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_calc_text_size",
                    "returnType": 2
                },
                {
                    "id": "26316c21-2841-43d3-b4f5-096ae32fa798",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_calc_list_clipping",
                    "help": " calculate coarse clipping for large list of evenly sized items. Prefer using the ImGuiListClipper higher-level helper if you can. ( _items_count, _items_height)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_calc_list_clipping",
                    "returnType": 2
                },
                {
                    "id": "171b03e3-1bce-443b-8c3d-1a7b818881db",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_push_clip_rect",
                    "help": " ( _min_x, _min_y, _max_x, _max_y, _intersect_with_current_clip_rect)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_push_clip_rect",
                    "returnType": 2
                },
                {
                    "id": "93b0fec4-dd36-4f88-a8db-cc21e9d7a8f2",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_pop_clip_rect",
                    "help": " pop the clip rect ( @func imguigml_pop_clip_rect)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_pop_clip_rect",
                    "returnType": 2
                },
                {
                    "id": "65fdedaf-9e38-4254-b9bf-519fcc06c60a",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_slider_float",
                    "help": " adjust display_format to decorate the value with a prefix or a suffix for in-slider labels or unit display. Use power!=1.0 for logarithmic sliders ( _label, _val, _min, _max, [_display_fmt=\"%.3f\"], [_power=1.0])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_slider_float",
                    "returnType": 2
                },
                {
                    "id": "1196aeac-7555-4170-8f67-c926463ec319",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_slider_float2",
                    "help": " adjust display_format to decorate the value with a prefix or a suffix for in-slider labels or unit display. Use power!=1.0 for logarithmic sliders ( _label, _val, _val2, _min, _max, [_display_fmt=\"%.3f\"], [_power=1.0])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_slider_float2",
                    "returnType": 2
                },
                {
                    "id": "3069accf-4954-4394-b19b-e66e9b846831",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_slider_float3",
                    "help": " adjust display_format to decorate the value with a prefix or a suffix for in-slider labels or unit display. Use power!=1.0 for logarithmic sliders ( _label, _val, _val2, _val3, _min, _max, [_display_fmt=\"%.3f\"], [_power=1.0])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_slider_float3",
                    "returnType": 2
                },
                {
                    "id": "51274298-295b-4545-a66c-a373df16bd50",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_slider_float4",
                    "help": " adjust display_format to decorate the value with a prefix or a suffix for in-slider labels or unit display. Use power!=1.0 for logarithmic sliders ( _label, _val, _val2, _val3, _val4, _min, _max, [_display_fmt=\"%.3f\"], [_power=1.0])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_slider_float4",
                    "returnType": 2
                },
                {
                    "id": "9996fb40-fb0f-46c9-ab11-ae7839a6fdf7",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_slider_angle",
                    "help": " angle slider ( _label, _rad, [_degree_min=-360.0], [_degree_max=360.0])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_slider_angle",
                    "returnType": 2
                },
                {
                    "id": "b7399bb7-1411-487e-ab30-9060816383fa",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_slider_int",
                    "help": " add an integer slider ( _label, _v, _v_min, _v_max, [_display_fmt=\"%.0f\"])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_slider_int",
                    "returnType": 2
                },
                {
                    "id": "8bcf111b-57c2-4f49-b686-bc66d3c8a834",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_slider_int2",
                    "help": " add an integer slider ( _label, _v, _v2, _v_min, _v_max, [_display_fmt=\"%.0f\"])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_slider_int2",
                    "returnType": 2
                },
                {
                    "id": "e4bb8aed-919b-454a-9d7e-41eae9da09cd",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_slider_int3",
                    "help": " add an integer slider ( _label, _v, _v2, _v3, _v_min, _v_max, [_display_fmt=\"%.0f\"])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_slider_int3",
                    "returnType": 2
                },
                {
                    "id": "0608ebf7-2180-4735-a309-fbdf819d6f08",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_slider_int4",
                    "help": " add an integer slider ( _label, _v, _v2, _v3, _v4, _v_min, _v_max, [_display_fmt=\"%.0f\"])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_slider_int4",
                    "returnType": 2
                },
                {
                    "id": "f123eec0-15dd-4ff7-ae65-31b031b009c6",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_vslider_float",
                    "help": " a vslider float? ( _label, _size_x, _size_y, _v, _v_min, _v_max, [_display_fmt=\"%.0f\"])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_vslider_float",
                    "returnType": 2
                },
                {
                    "id": "e6aaf974-95f0-47ba-9bc1-d8a0541534f0",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_vslider_int",
                    "help": " a vslider int? ( _label, _size_x, _size_y, _v, _v_min, _v_max, [_display_fmt=\"%.0f\"])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_vslider_int",
                    "returnType": 2
                },
                {
                    "id": "0eeaeb85-4adf-45b0-b4d4-8d5aa2856528",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_color_edit3",
                    "help": " show a color edit field ( _label, _r, _g, _b, [_flags=0])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_color_edit3",
                    "returnType": 2
                },
                {
                    "id": "da35edc1-496f-43dc-9ec8-401ba948795a",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_color_edit4",
                    "help": " show a color edit field ( _label, _r, _g, _b, _a, [_flags=0])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_color_edit4",
                    "returnType": 2
                },
                {
                    "id": "68ec004d-b4eb-4a63-b539-73ade374369b",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_color_picker3",
                    "help": " show a color edit field ( _label, _r, _g, _b, [_flags=0])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_color_picker3",
                    "returnType": 2
                },
                {
                    "id": "71b1d9e3-bc17-4dde-b57d-c78603985260",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_color_picker4",
                    "help": " show a color edit field ( _label, _r, _g, _b, [_flags=0])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_color_picker4",
                    "returnType": 2
                },
                {
                    "id": "4d1d6858-a96a-42d5-a627-b22f03f98161",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_color_button",
                    "help": " display a colored square\/button, hover for details, return true when pressed. ( _desc_id, _r, _g, _b, _a, [_flags=0], [_size_x=0], [_size_y=0])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_color_button",
                    "returnType": 2
                },
                {
                    "id": "685e724a-53ef-4d02-b16d-e2f9c6160bc1",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_set_color_edit_options",
                    "help": " initialize current options [generally on application startup] if you want to select a default format, picker type, etc. User will be able to change many settings, unless you pass the _NoOptions flag to your calls. ( @func imguigml_set_color_edit_options)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_set_color_edit_options",
                    "returnType": 2
                },
                {
                    "id": "11ee3bfa-818e-4039-ba43-9ab0596e66a3",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_drag_float",
                    "help": " If v_min >= v_max we have no bound ( _label, _v, [_v_speed=1.0], [_v_min=0.0], [_v_max=0.0], [_display_format=\"%.3f\"], [_power=1.0]; )",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_drag_float",
                    "returnType": 2
                },
                {
                    "id": "9b500d52-e30d-4bfe-ac09-f46ea552d0e2",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_drag_float2",
                    "help": " If v_min >= v_max we have no bound ( _label, _v, _v2, [_v_speed=1.0], [_v_min=0.0], [_v_max=0.0], [_display_format=\"%.3f\"], [_power=1.0]; )",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_drag_float2",
                    "returnType": 2
                },
                {
                    "id": "ce947a7a-b5de-48c0-8698-3ae077b68307",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_drag_float3",
                    "help": " If v_min >= v_max we have no bound ( _label, _v, _v2, _v3, [_v_speed=1.0], [_v_min=0.0], [_v_max=0.0], [_display_format=\"%.3f\"], [_power=1.0]; )",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_drag_float3",
                    "returnType": 2
                },
                {
                    "id": "a3f76f8e-2090-43ac-860f-1b53c15a1839",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_drag_float4",
                    "help": " If v_min >= v_max we have no bound ( _label, _v, _v2, _v3, _v4, [_v_speed=1.0], [_v_min=0.0], [_v_max=0.0], [_display_format=\"%.3f\"], [_power=1.0]; )",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_drag_float4",
                    "returnType": 2
                },
                {
                    "id": "af583522-078c-4714-9acc-22a18b6da9ca",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_drag_float_range2",
                    "help": " drag an integer range 2? ( _label, _v_current_min, _v_current_max, [_v_speed=1.0], [_v_min=0], [_v_max=0], [_display_fmt=\"%.0f\"], [_display_fmt_max=undefined])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_drag_float_range2",
                    "returnType": 2
                },
                {
                    "id": "e78664d9-bcbb-4dd4-ae77-95a449e266a6",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_drag_int",
                    "help": " If v_min >= v_max we have no bound ( _label, _v, [_v_speed=1.0], [_v_min=0.0], [_v_max=0.0], [_display_format=\"%.3f\"], [_power=1.0]; )",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_drag_int",
                    "returnType": 2
                },
                {
                    "id": "74efa2f0-1d96-46e8-a2e0-23aa1a22c060",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_drag_int2",
                    "help": " If v_min >= v_max we have no bound ( _label, _v, _v2, [_v_speed=1.0], [_v_min=0.0], [_v_max=0.0], [_display_format=\"%.3f\"], [_power=1.0]; )",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_drag_int2",
                    "returnType": 2
                },
                {
                    "id": "923cf033-eb78-4e63-a434-ce6d6e81d584",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_drag_int3",
                    "help": " If v_min >= v_max we have no bound ( _label, _v, _v2, _v3, [_v_speed=1.0], [_v_min=0.0], [_v_max=0.0], [_display_format=\"%.3f\"], [_power=1.0]; )",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_drag_int3",
                    "returnType": 2
                },
                {
                    "id": "78c14041-6c3d-408a-9f8b-f7c12f3aaf2a",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_drag_int4",
                    "help": " If v_min >= v_max we have no bound ( _label, _v, _v2, _v3, _v4, [_v_speed=1.0], [_v_min=0.0], [_v_max=0.0], [_display_format=\"%.3f\"], [_power=1.0]; )",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_drag_int4",
                    "returnType": 2
                },
                {
                    "id": "016e6bf9-b819-44db-a2d2-2e7b277929dc",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_drag_int_range2",
                    "help": " drag an integer range 2? ( _label, _v_current_min, _v_current_max, [_v_speed=1.0], [_v_min=0], [_v_max=0], [_display_fmt=\"%.0f\"], [_display_fmt_max=undefined])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_drag_int_range2",
                    "returnType": 2
                },
                {
                    "id": "aecfac98-3cdb-4dc6-b5ae-afb3f214da76",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_input_text",
                    "help": " add an input text field ( _label, _text, _max_length, [_flags=0], [_callback=undefined], [_user_data=undefined])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_input_text",
                    "returnType": 2
                },
                {
                    "id": "eb709d01-37b9-48f7-a647-4a211ba8af7c",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_input_text_multiline",
                    "help": " add an input text field ( _label, _text, _max_len, _size_x, _size_y, [_flags=0], [_callback=undefined], [_user_data=undefined])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_input_text_multiline",
                    "returnType": 2
                },
                {
                    "id": "28df4267-00bc-49ff-b042-b358a41566b9",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_input_float",
                    "help": " keyboard input field float ( _label, _val, [_step=0.0f], [_step_fast=0.0f], [_decimal_precision=-1], [_extra_flags=0])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_input_float",
                    "returnType": 2
                },
                {
                    "id": "a037f9bf-5dc1-4e0f-873e-d6fbe5b7b864",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_input_float2",
                    "help": " keyboard input field float ( _label, _val, _val2, [_decimal_precision=-1], [_extra_flags=0])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_input_float2",
                    "returnType": 2
                },
                {
                    "id": "5e64ba25-f84a-45b5-b0b5-448902e9eeb9",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_input_float3",
                    "help": " keyboard input field float ( _label, _val, _val2, _val3, [_decimal_precision=-1], [_extra_flags=0])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_input_float3",
                    "returnType": 2
                },
                {
                    "id": "7f56c7fc-a825-4621-9362-5f9bac0b17ce",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_input_float4",
                    "help": " keyboard input field float ( _label, _val, _val2, _val3, _val4, [_decimal_precision=-1], [_extra_flags=0])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_input_float4",
                    "returnType": 2
                },
                {
                    "id": "95915327-b1be-4135-857c-c4e631b30717",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_input_int",
                    "help": " keyboard input field float ( _label, _val, [_step=1], [_step_fast=100], [_extra_flags=0])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_input_int",
                    "returnType": 2
                },
                {
                    "id": "ae72f2ef-2400-4eab-8ea3-a06936f8660b",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_input_int2",
                    "help": " keyboard input field float ( _label, _val, _val2, [_extra_flags=0])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_input_int2",
                    "returnType": 2
                },
                {
                    "id": "c85b8a41-88ce-4ee3-909c-d8119c02d7c1",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_input_int3",
                    "help": " keyboard input field float ( _label, _val, _val2, _val3, [_extra_flags=0])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_input_int3",
                    "returnType": 2
                },
                {
                    "id": "798b9534-2854-46d0-a840-11b6c498405d",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_input_int4",
                    "help": " keyboard input field float ( _label, _val, _val2, _val3, _val4, [_extra_flags=0])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_input_int4",
                    "returnType": 2
                },
                {
                    "id": "aea3591a-41f7-4ab8-a99c-f535bfe69bff",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_button",
                    "help": " ImGui::Button[] ( _label, [_size_x=0], [_size_y=0])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_button",
                    "returnType": 2
                },
                {
                    "id": "600575fa-ba1d-47f8-b702-23b96dc1b534",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_small_button",
                    "help": " button with FramePadding=[0,0] to easily embed within text ( _label)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_small_button",
                    "returnType": 2
                },
                {
                    "id": "0307cf09-f9e0-42bb-a045-d04a27f04313",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_invisible_button",
                    "help": " ImGui::InvisibleButton[] ( _str_id, [_size_x=0], [_size_y=0])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_invisible_button",
                    "returnType": 2
                },
                {
                    "id": "cbf89a94-f2ef-42d4-acdf-9911c60c61da",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_image",
                    "help": " ImGui::Image[] ( _texture_id, _size_x, _size_y, [_u0=0.0], [_v0=0.0], [_u1=1.0], [_v1=1.0], [_tint_r=1.0], [_tint_g=1.0], [_tint_b=1.0], [_tint_a=1.0], [_border_r=0.0], [_border_g=0.0], [_border_b=0.0], [_border_a=0.0])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_image",
                    "returnType": 2
                },
                {
                    "id": "84a8ba3b-4441-4588-af70-7f0c8a24b69f",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_image_button",
                    "help": " ImGui::ImageButton[] ( _texture_id, _size_x, _size_y, [_u0=0.0], [_v0=0.0], [_u1=1.0], [_v1=1.0], [_tint_r=1.0], [_tint_g=1.0], [_tint_b=1.0], [_tint_a=1.0], [_border_r=0.0], [_border_g=0.0], [_border_b=0.0], [_border_a=0.0])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_image_button",
                    "returnType": 2
                },
                {
                    "id": "98e3bfed-0867-4acf-90d3-b764f32993f4",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_checkbox",
                    "help": " ImGui::Checkbox[] ( _label, _val)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_checkbox",
                    "returnType": 2
                },
                {
                    "id": "3e133aa5-caa5-42ff-81fb-7b727aa0b776",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_checkbox_flags",
                    "help": " ImGui::CheckboxFlags[] ( _label, _flags, _flag_val)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_checkbox_flags",
                    "returnType": 2
                },
                {
                    "id": "d9bb38c7-ab4b-47d1-9168-5bf3d111cbf6",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_radio_button",
                    "help": " ImGui::RadioButton[] ( _label, [_activeOrVal], [_current_val])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_radio_button",
                    "returnType": 2
                },
                {
                    "id": "80d48f35-b48d-4c14-87c1-01f1d6f252b0",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_combo",
                    "help": " ( _label, _current_item, _items, [_height_in_items = -1];)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_combo",
                    "returnType": 2
                },
                {
                    "id": "117f740f-f629-4bba-b029-7ae1ddb30ae4",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_plot_lines",
                    "help": " plot a line graph i guess ( float])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_plot_lines",
                    "returnType": 2
                },
                {
                    "id": "b4aa16e9-3f98-432b-824d-15efa84fa936",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_plot_histogram",
                    "help": " plot a histogram graph i guess ( float])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_plot_histogram",
                    "returnType": 2
                },
                {
                    "id": "eb5ce560-62f0-4677-b804-58526a5b06e6",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_progress_bar",
                    "help": " ( _fraction, [_size_x=-1.0], [_size_y=0.0], [_overlay])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_progress_bar",
                    "returnType": 2
                },
                {
                    "id": "20a00e62-5acd-468a-8365-f6d5db54d0d6",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_text",
                    "help": " simple formatted text ( _text)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_text",
                    "returnType": 2
                },
                {
                    "id": "f12a89b2-3d24-417f-adf2-39b22d25a353",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_text_colored",
                    "help": " shortcut for PushStyleColor[ImGuiCol_Text, style.Colors[ImGuiCol_TextDisabled]]; Text[fmt, ...]; PopStyleColor[]; ( _r, _g, _b, _a, _text)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_text_colored",
                    "returnType": 2
                },
                {
                    "id": "a049a84a-0313-4371-9fd6-0cfafd42bafd",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_text_disabled",
                    "help": " shortcut for PushStyleColor[ImGuiCol_Text, style.Colors[ImGuiCol_TextDisabled]]; Text[fmt, ...]; PopStyleColor[]; ( _text)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_text_disabled",
                    "returnType": 2
                },
                {
                    "id": "94921c4b-9563-4ef0-94b7-00845177fcbb",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_text_wrapped",
                    "help": " shortcut for `imguigml_push_text_wrap_pos[0.0f]; imguigml_text[_text]; imguigml_pop_text_wrap_pos[];`. ( _text)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_text_wrapped",
                    "returnType": 2
                },
                {
                    "id": "bccf1959-4c8b-458e-8a59-c428a9952c0a",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_label_text",
                    "help": " display text+label aligned the same way as value+label widgets ( _label, _text)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_label_text",
                    "returnType": 2
                },
                {
                    "id": "d05624b0-8bb2-40c5-a983-ac1d806bd8bd",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_bullet_text",
                    "help": " shortcut for Bullet[]+Text[] ( _text)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_bullet_text",
                    "returnType": 2
                },
                {
                    "id": "26e64b85-36ce-41af-833c-c8bc9165f476",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_bullet",
                    "help": " advance cursor x position by GetTreeNodeToLabelSpacing[], same distance that TreeNode[] uses ( )",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_bullet",
                    "returnType": 2
                },
                {
                    "id": "eef712fe-5a0d-498f-9cdc-02b476299dde",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_tree_node",
                    "help": " ( )",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_tree_node",
                    "returnType": 2
                },
                {
                    "id": "e4a64785-91c8-43fe-b14d-4e8e2cebf03b",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_tree_node_ex",
                    "help": " ( )",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_tree_node_ex",
                    "returnType": 2
                },
                {
                    "id": "6aaf8fd6-346c-4bdb-9dc4-9159ca1fd2bc",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_tree_push",
                    "help": " ( )",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_tree_push",
                    "returnType": 2
                },
                {
                    "id": "9dcc1477-f8c0-47a4-bab4-ac39a3e4124c",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_tree_pop",
                    "help": " ~ Unindent[]+PopId[] ( )",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_tree_pop",
                    "returnType": 2
                },
                {
                    "id": "95e4f654-7391-4eee-a8df-d127036d5fb3",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_tree_advance_to_label_pos",
                    "help": " advance cursor x position by GetTreeNodeToLabelSpacing[] ( @func imguigml_tree_advance_to_label_pos)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_tree_advance_to_label_pos",
                    "returnType": 2
                },
                {
                    "id": "a00ed321-7944-4a0d-8459-038e2e40f057",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_get_tree_node_to_label_spacing",
                    "help": " ( )",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_get_tree_node_to_label_spacing",
                    "returnType": 2
                },
                {
                    "id": "5b99e2ee-98ed-45c4-8410-092f60331c26",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_set_next_tree_node_open",
                    "help": " set next TreeNode\/CollapsingHeader open state. ( _is_open, [_cond=0])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_set_next_tree_node_open",
                    "returnType": 2
                },
                {
                    "id": "f4d47d0d-238c-4bd0-ae2c-4ccba42abc21",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_collapsing_header",
                    "help": " add a collapsing header ( _label, [_p_open=undefined], [_flags=0])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_collapsing_header",
                    "returnType": 2
                },
                {
                    "id": "2fbe53e9-dd4e-4ec0-b5b7-e64ac4135b03",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_begin",
                    "help": " Push a new ImGui window to add widgets to. ( _name, [_open=undefined], [_flags=0])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_begin",
                    "returnType": 2
                },
                {
                    "id": "157fcf0c-57e7-498a-9d45-12c56cd9b846",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_end",
                    "help": " ImGui::End[] ( )",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_end",
                    "returnType": 2
                },
                {
                    "id": "6b110433-aa5c-4f3f-9a31-262721b0f611",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_begin_child",
                    "help": " begin a scrolling region. each axis can use a different mode, e.g. ImVec2[0,400]. ( _id, [_size_x=0], [_size_y=0], [_border=false], [_extra_flags=0])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_begin_child",
                    "returnType": 2
                },
                {
                    "id": "bd5edf6a-7d69-4430-9b38-49f784047b66",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_end_child",
                    "help": " end a scrolling region ( )",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_end_child",
                    "returnType": 2
                },
                {
                    "id": "1c05c48e-3b5b-407c-be3e-1978afa566fe",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_get_content_region_max",
                    "help": " current content boundaries [typically window boundaries including scrolling, or current column boundaries], in windows coordinates ( )",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_get_content_region_max",
                    "returnType": 2
                },
                {
                    "id": "748434be-4044-4de5-a0b0-7c50e6f38f90",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_get_content_region_avail",
                    "help": " == GetContentRegionMax[] - GetCursorPos[] ( @func imguigml_get_content_region_avail)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_get_content_region_avail",
                    "returnType": 2
                },
                {
                    "id": "a92b947d-5002-477c-91a5-3c559f796247",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_get_content_region_avail_width",
                    "help": " get available width ( @func imguigml_get_content_region_avail_width)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_get_content_region_avail_width",
                    "returnType": 2
                },
                {
                    "id": "977e8efb-74f6-4633-abec-0036c7eab05c",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_get_window_content_region_min",
                    "help": " content boundaries min [roughly [0,0]-Scroll], in window coordinates ( @func imguigml_get_window_content_region_min)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_get_window_content_region_min",
                    "returnType": 2
                },
                {
                    "id": "c98824e4-8db9-4149-b3ba-d7ef58428b14",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_get_window_content_region_max",
                    "help": " content boundaries max [roughly [0,0]+Size-Scroll] where Size can be override with SetNextWindowContentSize[], in window coordinates ( @func imguigml_get_window_content_region_max)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_get_window_content_region_max",
                    "returnType": 2
                },
                {
                    "id": "fc6ded8d-df9a-46bd-ab22-702cc1f945a8",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_get_window_content_region_width",
                    "help": " content width in windows coordinates ( @func imguigml_get_window_content_region_width)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_get_window_content_region_width",
                    "returnType": 2
                },
                {
                    "id": "c08bfe24-0082-492b-8c0c-ae0100a5d3bd",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_get_window_pos",
                    "help": " get current window position in screen space [useful if you want to do your own drawing via the DrawList api] ( @func imguigml_get_window_pos)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_get_window_pos",
                    "returnType": 2
                },
                {
                    "id": "b80c512d-7440-4ac2-b366-0a08dfc104ab",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_get_window_size",
                    "help": " get current window size ( @func imguigml_get_window_size)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_get_window_size",
                    "returnType": 2
                },
                {
                    "id": "f7fb1af8-32b3-419f-a2df-5e62f80cf953",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_get_window_width",
                    "help": " get current window width ( @func imguigml_get_window_width)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_get_window_width",
                    "returnType": 2
                },
                {
                    "id": "07cffb62-a4cb-4856-947b-63f07830b925",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_get_window_height",
                    "help": " get current window height ( @func imguigml_get_window_height)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_get_window_height",
                    "returnType": 2
                },
                {
                    "id": "0d25bc2d-0d13-4284-8450-279ad762df1c",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_is_window_collapsed",
                    "help": " is current window collapsed ( )",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_is_window_collapsed",
                    "returnType": 2
                },
                {
                    "id": "08930b8d-29d9-4760-8d47-b05cd016b1da",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_is_window_appearing",
                    "help": " is current window appearing ( )",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_is_window_appearing",
                    "returnType": 2
                },
                {
                    "id": "db08bf19-bd17-406d-a629-bacc6ddb3556",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_set_window_font_scale",
                    "help": " per-window font scale. Adjust IO.FontGlobalScale if you want to scale all windows ( _scale)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_set_window_font_scale",
                    "returnType": 2
                },
                {
                    "id": "6b8ac1a3-10ef-43bc-b36c-a1091e42cef9",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_set_next_window_pos",
                    "help": " set next window position. call before Begin[]. use pivot=[0.5f,0.5f] to center on given point, etc. ( _pos_x, _pos_y, [_cond=0], [_pivot_x=0], [_pivot_y=0])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_set_next_window_pos",
                    "returnType": 2
                },
                {
                    "id": "ec50d09b-a21f-48bd-ab11-07c0b83ab4ab",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_set_next_window_size",
                    "help": " set next window size. set axis to 0.0f to force an auto-fit on this axis. call before Begin[] ( _size_x, _size_y, [_cond=0])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_set_next_window_size",
                    "returnType": 2
                },
                {
                    "id": "9bd6a60e-38ff-417a-9bca-23d0a5914282",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_set_next_window_size_constraints",
                    "help": " set next window size limits. use -1,-1 on either X\/Y axis to preserve the current size. ( _min_size_x, _min_size_y, _max_size_x, _max_size_y)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_set_next_window_size_constraints",
                    "returnType": 2
                },
                {
                    "id": "1f8c8a64-b0bd-4e2c-99d8-961bba1faff8",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_set_next_window_content_size",
                    "help": " set next window content size [enforce the range of scrollbars]. set axis to 0.0f to leave it automatic. call before Begin[] ( _size_x, _size_y)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_set_next_window_content_size",
                    "returnType": 2
                },
                {
                    "id": "d36cdab9-8ced-4a45-a92e-ebee8af678ca",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_set_next_window_content_width",
                    "help": " set next window content width [enforce the range of horizontal scrollbar]. call before Begin[] ( _width)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_set_next_window_content_width",
                    "returnType": 2
                },
                {
                    "id": "7bd30de7-7871-41ad-b820-802c13e55a6b",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_set_next_window_collapsed",
                    "help": " set next window collapsed state. call before Begin[] ( _collapsed, [_cond=0])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_set_next_window_collapsed",
                    "returnType": 2
                },
                {
                    "id": "69ff2655-7822-4362-8d67-d92c7000a471",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_set_next_window_focus",
                    "help": " set next window to be focused \/ front-most. call before Begin[] ( )",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_set_next_window_focus",
                    "returnType": 2
                },
                {
                    "id": "ed3fe857-f473-46cd-abbd-35884fd0b924",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_set_window_pos",
                    "help": " set named window position. ( _name, _pos_x, _pos_y, [_cond=0])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_set_window_pos",
                    "returnType": 2
                },
                {
                    "id": "9985f218-8027-49f7-a818-cd11a25f81dd",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_set_window_size",
                    "help": " ( )",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_set_window_size",
                    "returnType": 2
                },
                {
                    "id": "3dd4e917-d1a1-4e1f-bc60-0bcec4d1d01f",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_set_window_collapsed",
                    "help": " set named window collapsed state ( _name, _collapsed, [_cond=0])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_set_window_collapsed",
                    "returnType": 2
                },
                {
                    "id": "a7ee6966-6255-417e-9c8a-9f3f0cd6ec73",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_set_window_focus",
                    "help": " set named window to be focused \/ front-most. use NULL to remove focus. ( _name)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_set_window_focus",
                    "returnType": 2
                },
                {
                    "id": "8127d04a-b7a5-4830-ba57-88d67d5cacd8",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_get_scroll_x",
                    "help": " get scrolling amount [0..GetScrollMaxX[]] ( )",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_get_scroll_x",
                    "returnType": 2
                },
                {
                    "id": "3206241a-4804-4dbf-853c-0a12ffa76cb3",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_get_scroll_y",
                    "help": " get scrolling amount [0..GetScrollMaxY[]] ( )",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_get_scroll_y",
                    "returnType": 2
                },
                {
                    "id": "5bffefc1-69de-43d2-a5fa-f23641cf1804",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_get_scroll_max_x",
                    "help": " get maximum scrolling amount ~~ ContentSize.X - WindowSize.X ( )",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_get_scroll_max_x",
                    "returnType": 2
                },
                {
                    "id": "2defa5a5-04cf-495d-804e-e221e0c91090",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_get_scroll_max_y",
                    "help": " get maximum scrolling amount ~~ ContentSize.Y - WindowSize.Y ( )",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_get_scroll_max_y",
                    "returnType": 2
                },
                {
                    "id": "945953e8-0fbc-43e0-aadd-0a3b151f9891",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_set_scroll_x",
                    "help": " set scrolling amount [0..GetScrollMaxX[]] ( _scroll_x)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_set_scroll_x",
                    "returnType": 2
                },
                {
                    "id": "a44c0d93-f6bb-4304-8f6a-ac4aa665871e",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_set_scroll_y",
                    "help": " set scrolling amount [0..GetScrollMaxY[]] ( _scroll_y)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_set_scroll_y",
                    "returnType": 2
                },
                {
                    "id": "cdad897e-2daa-42cd-b529-31d797df238c",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_set_scroll_here",
                    "help": " adjust scrolling amount to make current cursor position visible. ( [_center_y_ratio=0.0])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_set_scroll_here",
                    "returnType": 2
                },
                {
                    "id": "aea388c5-b875-4497-9780-fa7853e3bf3f",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_set_scroll_from_pos_y",
                    "help": " adjust scrolling amount to make given position valid. use GetCursorPos[] or GetCursorStartPos[]+offset to get valid positions. ( _pos_y, [_center_y_ratio=0.5])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_set_scroll_from_pos_y",
                    "returnType": 2
                },
                {
                    "id": "4e5d99de-28ea-4f0a-918a-4524b026203c",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_set_keyboard_focus_here",
                    "help": " focus keyboard on the next widget. ( [_offset=0])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_set_keyboard_focus_here",
                    "returnType": 2
                },
                {
                    "id": "e489b081-cd15-43a9-b20c-fedaf6ad4285",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_set_state_storage",
                    "help": " replace tree state storage with our own [if you want to manipulate it yourself, typically clear subsection of it] ( _tree)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_set_state_storage",
                    "returnType": 2
                },
                {
                    "id": "2997d9f4-3e8c-436c-8f4c-90749210f231",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_get_state_storage",
                    "help": " replace tree state storage with our own [if you want to manipulate it yourself, typically clear subsection of it] ( _tree)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_get_state_storage",
                    "returnType": 2
                },
                {
                    "id": "241b2d15-a1d1-4ceb-b9e0-a47df1fe1cdc",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_begin_child_frame",
                    "help": " helper to create a child window \/ scrolling region that looks like a normal widget frame ( _guiID, [_size_x], [_size_y], [_extra_flags=0])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_begin_child_frame",
                    "returnType": 2
                },
                {
                    "id": "db75fb80-c4f4-4aa6-add5-2490640be4a3",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_end_child_frame",
                    "help": " helper to create a child window \/ scrolling region that looks like a normal widget frame ( )",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_end_child_frame",
                    "returnType": 2
                },
                {
                    "id": "14c21db3-ca37-4f68-b0f1-8972ad8c7e4c",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_draw_list",
                    "help": " ( )",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_draw_list",
                    "returnType": 2
                },
                {
                    "id": "fc271af5-42d6-4e5b-80ba-2ec2a2e4d7be",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "__imguigml_draw",
                    "help": " draw the imgui ( )",
                    "hidden": false,
                    "kind": 1,
                    "name": "__imguigml_draw",
                    "returnType": 2
                },
                {
                    "id": "ba63b6a0-c369-49f6-8899-d475b64d3f6d",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "__imguigml_wrapper_buffer",
                    "help": " prepare the function buffer for next use ( )",
                    "hidden": false,
                    "kind": 1,
                    "name": "__imguigml_wrapper_buffer",
                    "returnType": 2
                },
                {
                    "id": "662ce62f-fabc-47ef-b9b2-861eb1d0a7e3",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "rousr_buffer_definitions",
                    "help": " enums \/ macros for rousr buffer functions [no need to call] ( )",
                    "hidden": false,
                    "kind": 1,
                    "name": "rousr_buffer_definitions",
                    "returnType": 2
                },
                {
                    "id": "556bbbfe-6806-48ea-a9bb-1cff531acbb8",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "rousr_buffer_rousr_type_to_buffer_type",
                    "help": " return a buffer type from a luarousr data type ( _type)",
                    "hidden": false,
                    "kind": 1,
                    "name": "rousr_buffer_rousr_type_to_buffer_type",
                    "returnType": 2
                },
                {
                    "id": "8777e215-9d33-4100-8f26-2c332ca72893",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "rousr_buffer_read_val",
                    "help": " Reads a value from a packed buffer, first reading data type to expect. ( _buffer)",
                    "hidden": false,
                    "kind": 1,
                    "name": "rousr_buffer_read_val",
                    "returnType": 2
                },
                {
                    "id": "7acdfc0d-df4a-4d6c-9c94-4ffa1673cce2",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "rousr_buffer_write_val",
                    "help": " writes a value to the buffer, but first writes the type ( _buffer, _val, [_type=ERousrData.Invald])",
                    "hidden": false,
                    "kind": 1,
                    "name": "rousr_buffer_write_val",
                    "returnType": 2
                },
                {
                    "id": "6d0200b7-ae2d-45f2-a0a7-a0ee90f20349",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "__imguigml_event_create",
                    "help": " imguigml create event ( )",
                    "hidden": false,
                    "kind": 1,
                    "name": "__imguigml_event_create",
                    "returnType": 2
                },
                {
                    "id": "decb9428-c168-4a87-9a47-d9255f0083b2",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "__imguigml_event_begin_step",
                    "help": " imguigml begin step event ( @func __imguigml_event_begin_step)",
                    "hidden": false,
                    "kind": 1,
                    "name": "__imguigml_event_begin_step",
                    "returnType": 2
                },
                {
                    "id": "301f0700-86ce-4b59-9cd8-cb261f59455c",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "__imguigml_event_end_step",
                    "help": " imguigml end step event ( @func __imguigml_end_step)",
                    "hidden": false,
                    "kind": 1,
                    "name": "__imguigml_event_end_step",
                    "returnType": 2
                },
                {
                    "id": "5e08675b-0d94-4cc6-8d4e-abf2f1b03390",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "__imguigml_event_clean_up",
                    "help": " imguigml clean up event ( )",
                    "hidden": false,
                    "kind": 1,
                    "name": "__imguigml_event_clean_up",
                    "returnType": 2
                },
                {
                    "id": "289c7ee4-2a3f-4c4a-8ebc-ec4cea058481",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "__imguigml_event_draw",
                    "help": " imguigml draw event ( )",
                    "hidden": false,
                    "kind": 1,
                    "name": "__imguigml_event_draw",
                    "returnType": 2
                },
                {
                    "id": "5347824c-f9ab-4e54-bcf2-50698a10120e",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "__imguigml_event_draw_gui",
                    "help": " imguigml draw gui event ( )",
                    "hidden": false,
                    "kind": 1,
                    "name": "__imguigml_event_draw_gui",
                    "returnType": 2
                },
                {
                    "id": "ac08fd00-1ed3-4647-9963-66ad4ec92193",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "__imguigml_init_rendering",
                    "help": " called `with` imguigml - initialize the rendering ( )",
                    "hidden": false,
                    "kind": 1,
                    "name": "__imguigml_init_rendering",
                    "returnType": 2
                },
                {
                    "id": "3a7a68df-baa3-4db7-ae93-e11636213608",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "__imguigml_init_font",
                    "help": " called `with` imguigml - load the font texture ( )",
                    "hidden": false,
                    "kind": 1,
                    "name": "__imguigml_init_font",
                    "returnType": 2
                },
                {
                    "id": "2584de2a-35b9-4094-b436-8304461139ae",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "__imguigml_init_input",
                    "help": " called `with` imguigml - initilaize the input stuff ( )",
                    "hidden": false,
                    "kind": 1,
                    "name": "__imguigml_init_input",
                    "returnType": 2
                },
                {
                    "id": "cde97b76-1b29-4f5d-a5b3-861f3d766b9e",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "__imguigml_init_wrapper",
                    "help": " called `with` imguigml - initialize wrapper buffer ( )",
                    "hidden": false,
                    "kind": 1,
                    "name": "__imguigml_init_wrapper",
                    "returnType": 2
                }
            ],
            "init": "",
            "kind": 2,
            "order": [
                "ad7c4725-b494-4391-b28b-31f7ec0a8b93",
                "8a14a2c7-4dd5-4c91-9785-b31acc5e9d6d",
                "f7effa36-9e0c-4d95-bcfa-89917c313398",
                "df338459-4eae-46ec-a81e-7cbce6793a01",
                "c62ede95-0652-4fea-9614-084b0d0847c7",
                "b69d992c-7314-4ec1-8482-218d08e31d5f",
                "51a11211-ffc3-4843-b506-efad261ac1a3",
                "42fb2dfc-f4a0-414c-b144-fc23a2378bbd",
                "1758b7a2-38da-465e-b5ab-ce45881a4833",
                "915e5de9-f587-4dae-992c-bff8e3e698e7",
                "28ef2875-5985-4fe0-a6d3-4540001e5f38",
                "f7766e51-c52a-4f78-b411-dc95b950d44f",
                "6d0c60b8-0610-4a24-abbd-c7517ec12e0a",
                "f4d9d925-c540-425a-8a49-af47b44b3568",
                "aeb4f427-535e-4c3b-ad09-ec9d71695f25",
                "1fe1e912-75a8-4837-b3bb-4361ea4e46d5",
                "297c2d69-0b2c-4903-a0d6-7d9b02e17b1e",
                "bc3a5d13-217f-4629-961a-4f5dd290adf5",
                "8db72fd1-7697-48c8-a53a-fe4a1ee328e0",
                "9ebce278-f423-479b-894f-fef25e150b61",
                "b7f0ed05-6db4-41da-a18f-533c781fbbcf",
                "7858deb6-d667-4f8d-8568-90a86371b917",
                "e9ede1e6-0fad-4975-bb15-f80285abd4cb",
                "04855de5-7c64-4686-85e2-ed115a811275",
                "02389678-1028-4bb7-ad51-9a8e1d384ad8",
                "82988d58-ccb2-4c38-87c1-f92d17aa4264",
                "fbfd4717-8003-493a-9107-b6977e7f859d",
                "5afbb325-5166-4aa2-abc7-b887e91eb93f",
                "45775045-6190-4520-a761-eaa694ada4be",
                "7b1f3288-4aee-426c-8979-73857bd507b9",
                "3db21ade-e717-4eee-bdee-ad4fc15958d4",
                "d634569e-4a6c-44b8-a613-cbce3c62c7b9",
                "1b030767-ecd6-4ad2-8d3f-2fc9f6a5f8f8",
                "4d40bd72-1715-4139-a08a-53e3a744d01a",
                "0540db0e-c450-4ec2-9770-c3957106ce5f",
                "a9e3b81d-89ca-4a38-8b13-0b9b88d73731",
                "30c62556-f3ca-4ae3-8c70-34069fefc1dd",
                "4be7c79e-b4e5-449d-b403-b47da53393eb",
                "761abb95-31f3-43f2-891e-b8a8b2ed64c5",
                "21f3ca8d-d9d7-4bff-95af-c9a21f5f64f9",
                "a04a8657-0b00-4b5a-a02c-af1bfd7b5a46",
                "d87cfb6b-594d-48ed-90ef-e64e9e9eb534",
                "a929158f-1243-4bbf-ae42-58e1872203d4",
                "e39d6c43-8eca-42cd-87c5-9ba1b4b0b5af",
                "3745227a-6c59-4a5d-b3e5-87975c985281",
                "82e3e3c4-a8e4-4221-9f5f-d1717fb60d8e",
                "77ae1d77-ca70-43a1-870c-d491bed33676",
                "36537c5a-c9b6-4150-b17f-7d8c55ac1183",
                "984fd0ca-1b35-4429-9ed7-95bf9a71ff2e",
                "af083bf3-dde9-4de1-bc27-4ed11085102c",
                "992213e9-b803-47a5-bbaa-c763aeafd793",
                "429e8128-fb59-4c2f-b6af-c4747995cb76",
                "6b56fc55-f3c9-4e79-b630-58e75c8dfb53",
                "95f6c851-c2f1-4be0-8d5d-29f5419a338f",
                "aca1a485-865c-473a-bfd0-fd814d3537e6",
                "b316a21b-550e-4cd3-a06f-98cd95df90d3",
                "49c7a205-6f46-4b63-8d8a-b5c14d1a7d6d",
                "85a91146-bb2c-452c-8ca5-0680e401d396",
                "c4b6d7ab-0e01-459f-a49f-48b75848d521",
                "61fdd479-68ba-4ec4-be1a-730ec46bf2bf",
                "37a445ec-0c11-4b9d-b044-dad0d6e04159",
                "231e3754-b767-4802-9727-658b699f434a",
                "939572bb-3549-4ae0-a7e0-b303cca421bd",
                "65bbfd50-8433-4c80-b527-0009223514c7",
                "f345f224-2fbe-4a28-afdc-7a8ca3ab049d",
                "1d0f3a21-84d3-4409-aebe-7c07b39117f0",
                "3cafccf2-3128-48ac-b66a-5b0b24839103",
                "bc00a688-a4ca-43c3-8a67-6baf2965e9f3",
                "ba03fbe9-b2c1-42d2-bfe0-06f213f4145e",
                "ea3f2053-d674-482a-9ffc-a54b5f6484f4",
                "c3d22d0a-3ff4-4009-9e55-03d81f77bade",
                "cfe7489a-80f6-4398-9072-f6f3f0f483c3",
                "c83bbe35-924e-4c93-ac3b-935eea8ad4ce",
                "b3ac3955-b221-4ab2-8e6d-ab1d7dd59a71",
                "8c0f23e2-7597-4111-a8ce-4e303f97c5c2",
                "b056af51-97c2-4029-8157-e6cf8e47910c",
                "f5fbdc6e-3631-488e-a5d7-45ea4e0b62a0",
                "2622108f-bdb5-4fd6-9ed6-a88b038bf1f4",
                "bd669425-e122-41c2-ad54-96ae139bf4a6",
                "bbbb3e0d-b5a2-479a-9af5-f37b346a949d",
                "fd68217e-4325-497e-9238-6cd33955eebd",
                "5c739a95-467f-4370-920e-b20494a84e45",
                "72dd4d85-83c2-4e3e-bc1b-4430e8b107e0",
                "0c8fb882-f7ef-4350-a486-3faac6b52361",
                "ae7115e5-edad-45c8-9b3d-00b297ed195d",
                "e7683a93-c1a5-456a-8df2-2f9c106bb6ac",
                "07c01eb3-083f-4400-bf2d-5892cb0fa172",
                "0eb7ebea-f561-4203-a6ee-e85bb01c3a2d",
                "05068dce-63b4-4596-8031-d3de430904f3",
                "26110cfa-9f0c-4dde-a07a-3da4d9b42641",
                "83ffbb90-3807-44ef-9d15-3027ce4aa3ab",
                "73cf05db-bea2-4120-af0b-5b0772da6cfd",
                "c4ef6dfe-d582-4ed5-a2fd-28bf4b87e85e",
                "1987efd9-320e-47e4-9403-48229dc7ea74",
                "3b854e5c-795a-49cb-9eff-9a372eb94f22",
                "10470cea-a941-4e8a-9616-8dfa8296427e",
                "cbd0e546-915f-4b80-8244-4acf905a68fd",
                "00f83f95-bbb4-412e-8f6c-c19866ec7cf1",
                "8b9b6e5b-bc02-4d80-925a-684f214926d6",
                "42e0ca51-c36b-472b-b8da-881de2bd0516",
                "a77edf0f-c005-4772-9965-7e2477c2d1fb",
                "b48d38d8-dcd6-4ade-a8dd-20c187a60098",
                "0da9740d-1c37-4e26-ac7e-18d261c4c704",
                "60202ec7-c84e-458c-a22f-07783ac558aa",
                "4b1e88e8-dbf9-4b93-9c57-6ed60666a9c3",
                "daa15279-6a17-4b0a-a434-aea433fc8a8a",
                "45262705-d6f2-4709-8b30-e31ebb7bb9f8",
                "3ac8f52d-58a5-4cbf-84ce-cd2bb2f0bf7d",
                "7b4f668b-70a4-49b8-ae16-d19c41485251",
                "2356fac4-fb20-4d74-887f-8ed24fb9afaf",
                "ed7d3e94-fb75-416d-bd44-9543cec9726b",
                "9c182ef3-46ac-4720-883e-40596d97fb4e",
                "e6945a6d-3b2c-40e7-980c-1fb3f8b1d2bf",
                "6671a1da-d11c-43a5-b740-1590cefb38b7",
                "269c1a48-eeb8-4f6c-a016-02d221eed876",
                "20267992-6407-42a5-a4ad-760646fe6fc7",
                "580e5c2c-564b-40bb-a101-7734ea77a8e6",
                "43053365-331e-4d67-bad5-4335348719c5",
                "191fa4dc-eaf8-48ed-926a-87950bb47fef",
                "59d5f768-c642-46a5-ad36-ee067d6f402b",
                "b15b807f-2a2a-4cf3-ad9a-9e72e5820d79",
                "382ee3ee-a8f1-4b81-9c34-f69e65887576",
                "5e86837a-1e84-482b-9f7a-b8b70268180f",
                "ecf08578-55ea-4725-9801-5d600d45d217",
                "f897614b-856d-4cf7-8529-dbdc3c89a081",
                "8819f16c-539d-4882-a85d-773864cf5d2a",
                "e7af340d-3c04-45d0-bd38-06972ce9ff6d",
                "8db505e6-bbb4-401a-80bb-fcbe38823b54",
                "92f5317c-126a-42c9-b248-ec264f7ceb63",
                "6fed2124-e36b-45f7-bd64-5432aa86499c",
                "606ead62-3300-4119-acf3-20e363ea9a9f",
                "465674c8-d020-4131-a1bb-7db2ebd6c6a5",
                "ca9d1ddf-fccb-418b-885d-67ee69d55a43",
                "4ce3c772-022a-44ed-8318-272106e27591",
                "0470dd56-c401-47b1-8da7-26424b183284",
                "a936e28f-b8eb-4ad1-9bb6-74c774b6d8e4",
                "8d4ad677-353c-439d-a80b-241f67f74f1f",
                "26316c21-2841-43d3-b4f5-096ae32fa798",
                "171b03e3-1bce-443b-8c3d-1a7b818881db",
                "93b0fec4-dd36-4f88-a8db-cc21e9d7a8f2",
                "65fdedaf-9e38-4254-b9bf-519fcc06c60a",
                "1196aeac-7555-4170-8f67-c926463ec319",
                "3069accf-4954-4394-b19b-e66e9b846831",
                "51274298-295b-4545-a66c-a373df16bd50",
                "9996fb40-fb0f-46c9-ab11-ae7839a6fdf7",
                "b7399bb7-1411-487e-ab30-9060816383fa",
                "8bcf111b-57c2-4f49-b686-bc66d3c8a834",
                "e4bb8aed-919b-454a-9d7e-41eae9da09cd",
                "0608ebf7-2180-4735-a309-fbdf819d6f08",
                "f123eec0-15dd-4ff7-ae65-31b031b009c6",
                "e6aaf974-95f0-47ba-9bc1-d8a0541534f0",
                "0eeaeb85-4adf-45b0-b4d4-8d5aa2856528",
                "da35edc1-496f-43dc-9ec8-401ba948795a",
                "68ec004d-b4eb-4a63-b539-73ade374369b",
                "71b1d9e3-bc17-4dde-b57d-c78603985260",
                "4d1d6858-a96a-42d5-a627-b22f03f98161",
                "685e724a-53ef-4d02-b16d-e2f9c6160bc1",
                "11ee3bfa-818e-4039-ba43-9ab0596e66a3",
                "9b500d52-e30d-4bfe-ac09-f46ea552d0e2",
                "ce947a7a-b5de-48c0-8698-3ae077b68307",
                "a3f76f8e-2090-43ac-860f-1b53c15a1839",
                "af583522-078c-4714-9acc-22a18b6da9ca",
                "e78664d9-bcbb-4dd4-ae77-95a449e266a6",
                "74efa2f0-1d96-46e8-a2e0-23aa1a22c060",
                "923cf033-eb78-4e63-a434-ce6d6e81d584",
                "78c14041-6c3d-408a-9f8b-f7c12f3aaf2a",
                "016e6bf9-b819-44db-a2d2-2e7b277929dc",
                "aecfac98-3cdb-4dc6-b5ae-afb3f214da76",
                "eb709d01-37b9-48f7-a647-4a211ba8af7c",
                "28df4267-00bc-49ff-b042-b358a41566b9",
                "a037f9bf-5dc1-4e0f-873e-d6fbe5b7b864",
                "5e64ba25-f84a-45b5-b0b5-448902e9eeb9",
                "7f56c7fc-a825-4621-9362-5f9bac0b17ce",
                "95915327-b1be-4135-857c-c4e631b30717",
                "ae72f2ef-2400-4eab-8ea3-a06936f8660b",
                "c85b8a41-88ce-4ee3-909c-d8119c02d7c1",
                "798b9534-2854-46d0-a840-11b6c498405d",
                "aea3591a-41f7-4ab8-a99c-f535bfe69bff",
                "600575fa-ba1d-47f8-b702-23b96dc1b534",
                "0307cf09-f9e0-42bb-a045-d04a27f04313",
                "cbf89a94-f2ef-42d4-acdf-9911c60c61da",
                "84a8ba3b-4441-4588-af70-7f0c8a24b69f",
                "98e3bfed-0867-4acf-90d3-b764f32993f4",
                "3e133aa5-caa5-42ff-81fb-7b727aa0b776",
                "d9bb38c7-ab4b-47d1-9168-5bf3d111cbf6",
                "80d48f35-b48d-4c14-87c1-01f1d6f252b0",
                "117f740f-f629-4bba-b029-7ae1ddb30ae4",
                "b4aa16e9-3f98-432b-824d-15efa84fa936",
                "eb5ce560-62f0-4677-b804-58526a5b06e6",
                "20a00e62-5acd-468a-8365-f6d5db54d0d6",
                "f12a89b2-3d24-417f-adf2-39b22d25a353",
                "a049a84a-0313-4371-9fd6-0cfafd42bafd",
                "94921c4b-9563-4ef0-94b7-00845177fcbb",
                "bccf1959-4c8b-458e-8a59-c428a9952c0a",
                "d05624b0-8bb2-40c5-a983-ac1d806bd8bd",
                "26e64b85-36ce-41af-833c-c8bc9165f476",
                "eef712fe-5a0d-498f-9cdc-02b476299dde",
                "e4a64785-91c8-43fe-b14d-4e8e2cebf03b",
                "6aaf8fd6-346c-4bdb-9dc4-9159ca1fd2bc",
                "9dcc1477-f8c0-47a4-bab4-ac39a3e4124c",
                "95e4f654-7391-4eee-a8df-d127036d5fb3",
                "a00ed321-7944-4a0d-8459-038e2e40f057",
                "5b99e2ee-98ed-45c4-8410-092f60331c26",
                "f4d47d0d-238c-4bd0-ae2c-4ccba42abc21",
                "2fbe53e9-dd4e-4ec0-b5b7-e64ac4135b03",
                "157fcf0c-57e7-498a-9d45-12c56cd9b846",
                "6b110433-aa5c-4f3f-9a31-262721b0f611",
                "bd5edf6a-7d69-4430-9b38-49f784047b66",
                "1c05c48e-3b5b-407c-be3e-1978afa566fe",
                "748434be-4044-4de5-a0b0-7c50e6f38f90",
                "a92b947d-5002-477c-91a5-3c559f796247",
                "977e8efb-74f6-4633-abec-0036c7eab05c",
                "c98824e4-8db9-4149-b3ba-d7ef58428b14",
                "fc6ded8d-df9a-46bd-ab22-702cc1f945a8",
                "c08bfe24-0082-492b-8c0c-ae0100a5d3bd",
                "b80c512d-7440-4ac2-b366-0a08dfc104ab",
                "f7fb1af8-32b3-419f-a2df-5e62f80cf953",
                "07cffb62-a4cb-4856-947b-63f07830b925",
                "0d25bc2d-0d13-4284-8450-279ad762df1c",
                "08930b8d-29d9-4760-8d47-b05cd016b1da",
                "db08bf19-bd17-406d-a629-bacc6ddb3556",
                "6b8ac1a3-10ef-43bc-b36c-a1091e42cef9",
                "ec50d09b-a21f-48bd-ab11-07c0b83ab4ab",
                "9bd6a60e-38ff-417a-9bca-23d0a5914282",
                "1f8c8a64-b0bd-4e2c-99d8-961bba1faff8",
                "d36cdab9-8ced-4a45-a92e-ebee8af678ca",
                "7bd30de7-7871-41ad-b820-802c13e55a6b",
                "69ff2655-7822-4362-8d67-d92c7000a471",
                "ed3fe857-f473-46cd-abbd-35884fd0b924",
                "9985f218-8027-49f7-a818-cd11a25f81dd",
                "3dd4e917-d1a1-4e1f-bc60-0bcec4d1d01f",
                "a7ee6966-6255-417e-9c8a-9f3f0cd6ec73",
                "8127d04a-b7a5-4830-ba57-88d67d5cacd8",
                "3206241a-4804-4dbf-853c-0a12ffa76cb3",
                "5bffefc1-69de-43d2-a5fa-f23641cf1804",
                "2defa5a5-04cf-495d-804e-e221e0c91090",
                "945953e8-0fbc-43e0-aadd-0a3b151f9891",
                "a44c0d93-f6bb-4304-8f6a-ac4aa665871e",
                "cdad897e-2daa-42cd-b529-31d797df238c",
                "aea388c5-b875-4497-9780-fa7853e3bf3f",
                "4e5d99de-28ea-4f0a-918a-4524b026203c",
                "e489b081-cd15-43a9-b20c-fedaf6ad4285",
                "2997d9f4-3e8c-436c-8f4c-90749210f231",
                "241b2d15-a1d1-4ceb-b9e0-a47df1fe1cdc",
                "db75fb80-c4f4-4aa6-add5-2490640be4a3",
                "14c21db3-ca37-4f68-b0f1-8972ad8c7e4c",
                "fc271af5-42d6-4e5b-80ba-2ec2a2e4d7be",
                "ba63b6a0-c369-49f6-8899-d475b64d3f6d",
                "662ce62f-fabc-47ef-b9b2-861eb1d0a7e3",
                "556bbbfe-6806-48ea-a9bb-1cff531acbb8",
                "8777e215-9d33-4100-8f26-2c332ca72893",
                "7acdfc0d-df4a-4d6c-9c94-4ffa1673cce2",
                "6d0200b7-ae2d-45f2-a0a7-a0ee90f20349",
                "decb9428-c168-4a87-9a47-d9255f0083b2",
                "301f0700-86ce-4b59-9cd8-cb261f59455c",
                "5e08675b-0d94-4cc6-8d4e-abf2f1b03390",
                "289c7ee4-2a3f-4c4a-8ebc-ec4cea058481",
                "5347824c-f9ab-4e54-bcf2-50698a10120e",
                "ac08fd00-1ed3-4647-9963-66ad4ec92193",
                "3a7a68df-baa3-4db7-ae93-e11636213608",
                "2584de2a-35b9-4094-b436-8304461139ae",
                "cde97b76-1b29-4f5d-a5b3-861f3d766b9e"
            ],
            "origname": "",
            "uncompress": false
        }
    ],
    "gradleinject": "",
    "helpfile": "",
    "installdir": "",
    "iosProps": false,
    "iosSystemFrameworkEntries": [
        
    ],
    "iosThirdPartyFrameworkEntries": [
        
    ],
    "iosplistinject": "",
    "license": "",
    "maccompilerflags": "",
    "maclinkerflags": "",
    "macsourcedir": "",
    "packageID": "",
    "productID": "",
    "sourcedir": "",
    "version": "0.2.3"
}
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
            "copyToTargets": 35184372089058,
            "filename": "Imguigml.dll",
            "final": "",
            "functions": [
                {
                    "id": "503ddcce-1b60-4ed9-b965-cc17c236cc8e",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
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
                        2,
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
                    "externalName": "GetFrameHeightWithSpacing",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_get_frame_height_with_spacing",
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
                },
                {
                    "id": "358b2137-b0d0-46a8-8824-b1a9d688581f",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "GetIOOut",
                    "help": "Return the output structure (used by imguigml object)",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_get_io_outputs",
                    "returnType": 2
                },
                {
                    "id": "d8ba8b25-99e9-4d5d-ab65-12e737fbd965",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "UpdateCharacterInput",
                    "help": "Add new characters into InputCharacters[] from an UTF-8 string",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_update_character_input",
                    "returnType": 2
                },
                {
                    "id": "d5d0a6f1-2fca-4c5c-b53a-aa479075bd5f",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "ClearCharacterInput",
                    "help": "Clear the text input buffer manually",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_clear_character_input",
                    "returnType": 2
                },
                {
                    "id": "de8daf26-105c-42cc-b408-0d117a6f88a5",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "IOSetIniSavingRate",
                    "help": "= 5.0f               \/\/ Maximum time between saving positions\/sizes to .ini file, in seconds. ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_set_ini_saving_rate",
                    "returnType": 2
                },
                {
                    "id": "efeebc8d-a43e-4bf5-ae0e-e70a33070503",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "IOGetIniSavingRate",
                    "help": "= 5.0f               \/\/ Maximum time between saving positions\/sizes to .ini file, in seconds. ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_get_ini_saving_rate",
                    "returnType": 2
                },
                {
                    "id": "046b7734-66ef-4963-9962-bef3d45563f6",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "IOSetMouseDoubleClickTime",
                    "help": "Time for a double-click, in seconds.",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_set_mouse_double_click_time",
                    "returnType": 2
                },
                {
                    "id": "0f0d84c5-139a-4279-a9a6-f0d48e4872cb",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "IOGetMouseDoubleClickTime",
                    "help": "Time for a double-click, in seconds.",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_get_mouse_double_click_time",
                    "returnType": 2
                },
                {
                    "id": "0c4826cc-3003-4a32-9d7d-d62a9c2e6025",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "IOSetMouseDoubleClickMaxDist",
                    "help": "Distance threshold to stay in to validate a double-click, in pixels.",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_set_mouse_double_click_max_dist",
                    "returnType": 2
                },
                {
                    "id": "aa1375e4-0cbf-4138-815d-1cffd5b6eca4",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "IOGetMouseDoubleClickMaxDist",
                    "help": "Distance threshold to stay in to validate a double-click, in pixels.",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_get_mouse_double_click_max_dist",
                    "returnType": 2
                },
                {
                    "id": "f17139d0-d1f9-43fb-af53-ae2dd3d8f489",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "IOSetMouseDragThreshold",
                    "help": "Distance threshold before considering we are dragging",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_set_mouse_drag_threshold",
                    "returnType": 2
                },
                {
                    "id": "a3163654-2e70-4bca-9c33-fddfaa2ace4e",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "IOGetMouseDragThreshold",
                    "help": "Distance threshold before considering we are dragging",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_get_mouse_drag_threshold",
                    "returnType": 2
                },
                {
                    "id": "27ae76f8-e131-49e7-9cd3-76056eb18861",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "IOSetKeyRepeatDelay",
                    "help": "When holding a key\/button, time before it starts repeating, in seconds (for buttons in Repeat mode, etc.).",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_set_key_repeat_delay",
                    "returnType": 2
                },
                {
                    "id": "49062be2-655b-46da-81e7-ca0e7f85e705",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "IOGetKeyRepeatDelay",
                    "help": "When holding a key\/button, time before it starts repeating, in seconds (for buttons in Repeat mode, etc.).",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_get_key_repeat_delay",
                    "returnType": 2
                },
                {
                    "id": "838bfbd7-83d6-49e7-9b16-bde357174462",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "IOSetKeyRepeatRate",
                    "help": "When holding a key\/button, rate at which it repeats, in seconds.",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_set_key_repeat_rate",
                    "returnType": 2
                },
                {
                    "id": "d578c44c-734d-4a1e-b8e5-16b42fc742c5",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "IOGetKeyRepeatRate",
                    "help": "When holding a key\/button, rate at which it repeats, in seconds.",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_get_key_repeat_rate",
                    "returnType": 2
                },
                {
                    "id": "8e2c2a97-f452-4e48-8cfd-682188d9b6e5",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "IOSetFontGlobalScale",
                    "help": "Global scale all fonts",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_set_font_global_scale",
                    "returnType": 2
                },
                {
                    "id": "dda1f737-1c09-48b9-b788-e46a54a8016b",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "IOGetFontGlobalScale",
                    "help": "Global scale all fonts",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_get_font_global_scale",
                    "returnType": 2
                },
                {
                    "id": "6364e777-0113-41e8-92ec-94bbe56dedd2",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "IOSetFontAllowUserScaling",
                    "help": "Allow user scaling text of individual window with CTRL+Wheel.",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_set_font_allow_user_scaling",
                    "returnType": 2
                },
                {
                    "id": "addbdf9e-dbf2-445e-888c-396993102737",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "IOGetFontAllowUserScaling",
                    "help": "Allow user scaling text of individual window with CTRL+Wheel.",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_get_font_allow_user_scaling",
                    "returnType": 2
                },
                {
                    "id": "dcbe5aa0-aea0-4327-b496-98541dc8135c",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "IOSetDisplayFramebufferScaling",
                    "help": "For retina display or other situations where window coordinates are different from framebuffer coordinates. User storage only, presently not used by ImGui.",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_set_display_framebuffer_scaling",
                    "returnType": 2
                },
                {
                    "id": "9810102e-43b5-4385-b0e6-50b93ba7f698",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "IOGetDisplayFramebufferScaling",
                    "help": "For retina display or other situations where window coordinates are different from framebuffer coordinates. User storage only, presently not used by ImGui.",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_get_display_framebuffer_scaling",
                    "returnType": 2
                },
                {
                    "id": "b411a072-5498-4708-a6ad-0b6e5b0c4e9a",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "IOSetDisplayVisibleMin",
                    "help": "If you use DisplaySize as a virtual space larger than your screen, set DisplayVisibleMin\/Max to the visible area.",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_set_display_visible_min",
                    "returnType": 2
                },
                {
                    "id": "3dfd5bab-11c6-4f9c-8df4-f213388a6414",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "IOSGetDisplayVisibleMin",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_get_display_visible_min",
                    "returnType": 2
                },
                {
                    "id": "f2e27184-e995-45ed-893d-799cb02fcba0",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "IOSetDisplayVisibleMax",
                    "help": "If the values are the same, we defaults to Min=(0.0f) and Max=DisplaySize",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_set_display_visible_max",
                    "returnType": 2
                },
                {
                    "id": "c4a03d57-bcfa-445a-bc69-b1c04878a138",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "IOGetDisplayVisibleMax",
                    "help": "If the values are the same, we defaults to Min=(0.0f) and Max=DisplaySize",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_get_display_visible_max",
                    "returnType": 2
                },
                {
                    "id": "15c11d08-ade9-4345-b692-2b399046e319",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "IOSetOptMacOSXBehaviors",
                    "help": "OS X style: Text editing cursor movement using Alt instead of Ctrl, Shortcuts using Cmd\/Super instead of Ctrl, Line\/Text Start and End using Cmd+Arrows instead of Home\/End, Double click selects by word instead of selecting whole text, Multi-selection in lists uses Cmd\/Super instead of Ctrl",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_set_osx_behaviors",
                    "returnType": 2
                },
                {
                    "id": "140f6bc3-ddae-43ca-95ce-092c81ef6dd1",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "IOGetOptMacOSXBehaviors",
                    "help": "OS X style: Text editing cursor movement using Alt instead of Ctrl, Shortcuts using Cmd\/Super instead of Ctrl, Line\/Text Start and End using Cmd+Arrows instead of Home\/End, Double click selects by word instead of selecting whole text, Multi-selection in lists uses Cmd\/Super instead of Ctrl",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_get_osx_behaviors",
                    "returnType": 2
                },
                {
                    "id": "04cc5063-c377-4b9f-87e4-27e14d4fa1dd",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "IOSetINIFilename",
                    "help": "Path to .ini file. NULL to disable .ini saving.",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_set_ini_filename",
                    "returnType": 2
                },
                {
                    "id": "5583d4a1-b7f8-4627-99c3-4dc12d3a46c9",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "IOGetINIFilename",
                    "help": "Path to .ini file. NULL to disable .ini saving.",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_get_ini_filename",
                    "returnType": 2
                },
                {
                    "id": "4e3dc4c1-1ced-4a68-9f08-2905f03ff2eb",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "IOGetLogFilename",
                    "help": "Path to .log file (default parameter to ImGui::LogToFile when no file is specified).",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_set_log_filename",
                    "returnType": 2
                },
                {
                    "id": "4b93b2a7-6f82-48a6-b3c6-d4f44618e122",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "IOGetLogFilename",
                    "help": "Path to .log file (default parameter to ImGui::LogToFile when no file is specified).",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_get_log_filename",
                    "returnType": 2
                },
                {
                    "id": "15576a15-8586-492d-a33b-7ac99f2e4d65",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        2,
                        1,
                        2
                    ],
                    "externalName": "WaitForDLL",
                    "help": "returns ERousrCallStatus (_call_id, _buffer, _buffer_size)",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extRousrDLL_callstack_process",
                    "returnType": 2
                },
                {
                    "id": "cfc8382b-0566-4a47-9a2a-c88b0624659f",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "InitSharedCallstack",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extRousrDLL_callstack_init",
                    "returnType": 2
                },
                {
                    "id": "5cb20f41-6c68-47a9-8da7-926dae1e3f4d",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "ShutdownSharedCallstack",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extRousrDLL_callstack_shutdown",
                    "returnType": 2
                },
                {
                    "id": "b14133f5-d9b5-42c8-bf25-274eeb5dae59",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "BeginTabBar",
                    "help": "Begin a new tab bar (_str_id, [_flags=0])",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_extra_begin_tab_bar",
                    "returnType": 2
                },
                {
                    "id": "50f820b4-c561-4fbd-921c-415e318f50cb",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "EndTabBar",
                    "help": "End tab bar",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_extra_end_tab_bar",
                    "returnType": 2
                },
                {
                    "id": "94d26af4-9322-4310-bc8b-decda4b68f7e",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "TabItem",
                    "help": "create a tab item (_label, [_open=undefined], [_flags=0])",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_extra_tab_item",
                    "returnType": 2
                },
                {
                    "id": "164caab9-ac13-43c7-a7ff-8d4b9b82fe11",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "SetTabItemClosed",
                    "help": "set an item closed (_label)",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_extra_set_tab_item_closed",
                    "returnType": 2
                },
                {
                    "id": "ba65aa5b-d14e-49e1-89c8-9773a9eb99ca",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "SetTabItemSelected",
                    "help": "set a tab item selected (_label)",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_extra_set_tab_item_selected",
                    "returnType": 2
                },
                {
                    "id": "6bb1c245-ca54-49ce-86db-8e09df0dc59a",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "ShowTabsDemo",
                    "help": "show the tabs demo (_title, [_open=undefined])",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_extra_show_tabs_demo",
                    "returnType": 2
                },
                {
                    "id": "35849655-e73c-47e4-9156-46e429e46649",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "ShowsTabsDebug",
                    "help": "show tabs debug info ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_extra_show_tabs_debug",
                    "returnType": 2
                },
                {
                    "id": "d5a02e34-5ec5-4760-8c72-ccd1f8def957",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "AddLine",
                    "help": "Adds a line to the draw list (_x1, _y1, _x2, _y1, _col, [_line_thickness=1.0f])",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_drawlist_add_line",
                    "returnType": 2
                },
                {
                    "id": "2e66c56f-0079-4a39-ba94-f6820420410c",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "AddRect",
                    "help": "Adds a rectangle to the drawlist (_x1, _y1, _x2, _y2, _col, [_roundine = 0.0], [_rounding_corner_flags = ~0], [_thickness = 0.0])",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_drawlist_add_rect",
                    "returnType": 2
                },
                {
                    "id": "d6991798-3a2a-4b4d-94c2-3ae5eeed8d17",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "AddRectFilled",
                    "help": "Adds a filled rectangle to the drawlist ( _x1, _y1, _x2, _y2, _col, [_rounding = 0.0], [_rounding_corners_flags = ~0] )",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_drawlist_add_rect_filled",
                    "returnType": 2
                },
                {
                    "id": "0f17f55c-e04f-4431-aa06-9c8d29bfb059",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "AddRectFilledMultiColor",
                    "help": "Adds a filled rectangle to the draw list ( _x1, _y2, _x2, _y2, _col_upr_left, _col_upr_right, _col_bot_left, _col_bot_right )",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_drawlist_add_rect_filled_multicolor",
                    "returnType": 2
                },
                {
                    "id": "8c758fad-fab2-4521-8b31-a830befe784c",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "AddQuad",
                    "help": "Adds a quad to the drawlist ( _x1, _y1, _x2, _y2, _x3, _y3, _x4, _y4, _col, [_thickness = 0.0] )",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_drawlist_add_quad",
                    "returnType": 2
                },
                {
                    "id": "20632a00-128d-4b5a-b472-cfe123421229",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "AddQuadFilled",
                    "help": "Adds a filled quad to the draw list ( _x1, _y1, _x2, _y2, _x3, _y3, _x4, _y4, _col )",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_drawlist_add_quad_filled",
                    "returnType": 2
                },
                {
                    "id": "c297bf95-d530-4374-b2d3-31a4ac3b0822",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "AddTriangle",
                    "help": "Adds a triangle to the drawlist ( _x1, _y1, _x2, _y2, _x3, _y3, [thickness = 0.0] )",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_drawlist_add_triangle",
                    "returnType": 2
                },
                {
                    "id": "93614a06-0095-4864-9c8c-f8787eba2ba7",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "AddTriangleFilled",
                    "help": "Adds a filled triangle to the drawlist ( _x1, _y2, _x2, _y2, _x3, _y3, _col )",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_drawlist_add_triangle_filled",
                    "returnType": 2
                },
                {
                    "id": "aad1a777-21be-4ed8-8c47-f6f94ebc740a",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "AddCircle",
                    "help": "Adds a circle to the drawlist ( _center_x, _center_y, _radius, _col, [ _num_segments = 12 ] )",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_drawlist_add_circle",
                    "returnType": 2
                },
                {
                    "id": "e6c2aa1a-5190-4d25-87a9-441e67efc204",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "AddCircleFilled",
                    "help": "Adds a filled circle to the drawlist ( _center_x, _center_y, _radius, _col, [ _num_segments = 12 ] )",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_drawlist_add_circle_filled",
                    "returnType": 2
                },
                {
                    "id": "05273652-25c3-43c8-99df-66a4621739ca",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "AddText",
                    "help": "Adds text to the drawlist ( _pos_x, _pos_y, _col, _text, _wrap_width ) ",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_drawlist_add_text",
                    "returnType": 2
                },
                {
                    "id": "eaf6eff7-e12d-4661-a102-bc7e84f1a1bf",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "AddImage",
                    "help": "Adds an image to the draw list ( texture_id, _x1, _y1, _x2, _y2, [ _u1 = 0 ], [ _v1 = 0 ], [ _u2 = 0], [ _v2 = 0 ], [_col = c_white] )",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_drawlist_add_image",
                    "returnType": 2
                },
                {
                    "id": "ef86db70-8169-4db4-ad38-87bab4b51666",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "AddImageQuad",
                    "help": "Adds an image quad to the draw list ( texture_id, _x1, _y1, _x2, _y2, _x3, _y3, _x4, _y4, [ _u1 = 0 ], [ _v1 = 0], [ _u2 = 0 ], [ _v2 = 0], [ _u3 = 0 ], [ _v3 = 0], [ _u4 = 0 ], [ _v4 = 0], [_col = c_white )  ",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_drawlist_add_image_quad",
                    "returnType": 2
                },
                {
                    "id": "3b2255b7-f213-405b-a629-0065d6c1edc4",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "AddPolyline",
                    "help": "Adds a polyline to the drawlist ( points_array, points_count, _col, _closed, _thickness, _use_aa )",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_drawlist_add_polyline",
                    "returnType": 2
                },
                {
                    "id": "0fc0082c-cd23-40c1-bc9f-63491401976f",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "AddConvexPolyFilled",
                    "help": "Adds filled convex poly to the drawlist ( points_array, points_count, _col, use_aa )",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_drawlist_add_convex_poly_filled",
                    "returnType": 2
                },
                {
                    "id": "56ad2af6-a10b-4739-89d5-690977a451e2",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "AddBezierCurve",
                    "help": "Adds a bezier curve to the drawlist ( _pos_x1, _pos_y1, curve_x1, _curve_y1, _curve_x2, _curve_y2, _pos_x2, _pos_y2 , _col, _thickness, [ _num_segments = 0 ] ) ",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_drawlist_add_bezier_curve",
                    "returnType": 2
                },
                {
                    "id": "2a49b1fa-e022-4c74-a79d-85de2ce3c47b",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "PathClear",
                    "help": "Clears the path ( )",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_drawlist_path_clear",
                    "returnType": 2
                },
                {
                    "id": "b7d8c20a-1310-401a-af49-c2efbdc86e39",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "PathLineTo",
                    "help": "Adds a point to a path? ( _pos_x, _pos_y ) ",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_drawlist_path_line_to",
                    "returnType": 2
                },
                {
                    "id": "b0bd31dd-faaa-464e-8386-dc60fada5389",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "PathLineToMergeDuplicate",
                    "help": "??? ( _pos_x, _pos_y ) ",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_drawlist_path_line_to_merge_duplicate",
                    "returnType": 2
                },
                {
                    "id": "0b971f57-a7ec-41f1-9c10-53c59fbdef26",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "PathFillConvex",
                    "help": "Fills a convex path ( _col ) ",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_drawlist_path_fill_convex",
                    "returnType": 2
                },
                {
                    "id": "25178463-f1a4-4ff3-80e6-b669f57e6ab8",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "PathStroke",
                    "help": "Adds stroke to a path ( _col, closed, [thickness = 0.0] )",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_drawlist_path_stroke",
                    "returnType": 2
                },
                {
                    "id": "a8427ea3-66d0-4f74-b6bb-e89f46c51e80",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "PathArcTo",
                    "help": "Adds an arc to a path ( _center_x, _center_y, _radius, _min, _max, [ _num_segments = 10 ] )",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_drawlist_path_arc_to",
                    "returnType": 2
                },
                {
                    "id": "fb697c3b-4dae-4b09-ab2c-60e0df1dbf06",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "PathArcToFast",
                    "help": "More performant path_arc ( _center_x, _center_y, _radius, _min, _max, [ _num_segments = 10] )",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_drawlist_path_arc_to_fast",
                    "returnType": 2
                },
                {
                    "id": "87ed4e14-eb27-48f9-9484-aad284750b39",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "PathBezierCurveTo",
                    "help": "Curve path to ( _x1, _y1, _x2, _y2, _x3, _y3, [ _num_segments = 0 ] )",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_drawlist_path_bezier_curve_to",
                    "returnType": 2
                },
                {
                    "id": "8a88bdbf-79bb-40f7-b8e4-b1c6b20c998e",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "PathRect",
                    "help": "draw a rect on the path ( _x1, _x2, _y1, _y2, [rounding = 0.0], [rounding_corner_flags = ~0 ] )",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_drawlist_path_rect",
                    "returnType": 2
                },
                {
                    "id": "30183d51-fd59-4226-bf50-36cb22891f3b",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "ChannelsSplit",
                    "help": "Split channels ( _channels_count ) ",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_drawlist_channels_split",
                    "returnType": 2
                },
                {
                    "id": "db0cb609-dfa3-46e6-b2a8-0efe08437aa0",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "ChannelsMerge",
                    "help": "Merge channels ( ) ",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_drawlist_channels_merge",
                    "returnType": 2
                },
                {
                    "id": "17458a40-61da-4087-b860-d902c68fb732",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "ChannelsSetCurrent",
                    "help": "Sets current chanel ( _channel_index ) ",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_drawlist_channels_set_current",
                    "returnType": 2
                },
                {
                    "id": "55b92250-7b95-46e6-8ed3-d85c539117b5",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "DrawPushClipRect",
                    "help": "Render-level scissoring ( _x1, _y1, _x2, _y2, [ _intersect_with_current_clip_rect = false ] )",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_drawlist_push_clip_rect",
                    "returnType": 2
                },
                {
                    "id": "9ad5761d-caa2-4c43-812f-9a1424235115",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "PushClipRectFullscreen",
                    "help": "Push the clip rect for the fullscreen  ( ) ",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_drawlist_push_clip_rect_fullscreen",
                    "returnType": 2
                },
                {
                    "id": "67aa95c7-f84d-429a-ba85-fa78bf57ef37",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "PushTextureID",
                    "help": "Pushes texture ID to drawlist ( _texture_id ) ",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_drawlist_push_texture_id",
                    "returnType": 2
                },
                {
                    "id": "d685ef1b-78f7-4500-8c0c-ff46d07b69e5",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "PopTextureID",
                    "help": "Pops texture from drawlist ( ) ",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_drawlist_pop_texture_id",
                    "returnType": 2
                },
                {
                    "id": "14f4c6d8-1c5d-439c-9887-ea858e4a6b18",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "GetClipRectMin",
                    "help": "Gets the min clipping rectangle ( )",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_drawlist_get_clip_rect_min",
                    "returnType": 2
                },
                {
                    "id": "4eff528c-ff3e-4c86-bbc2-20050f4081aa",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "GetClipRectMax",
                    "help": "Gets the max clipping rectangle ( ) ",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_drawlist_get_clip_rect_max",
                    "returnType": 2
                },
                {
                    "id": "15c158ff-f60d-418d-b7de-347d0176a1cb",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "DrawPopClipRect",
                    "help": "End Render-level scissoring ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_drawlist_pop_clip_rect",
                    "returnType": 2
                },
                {
                    "id": "833d34ec-8ace-46c0-9d96-6fbc85f69a67",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "TextEditorCreate",
                    "help": "create a new texteditor ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_texteditor_create",
                    "returnType": 2
                },
                {
                    "id": "7f9fa2d2-55ad-4fe7-aeac-152025e446f3",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "TextEditorsCleanup",
                    "help": "Cleans up after the text editor (  )",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_texteditors_cleanup",
                    "returnType": 2
                },
                {
                    "id": "cd8f7775-8427-434a-a758-38740e97bf01",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "TextEditorGetLanguageDefinition",
                    "help": "Gets the current text editor language definition ( _editor_index ) ",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_texteditor_get_language_definition",
                    "returnType": 2
                },
                {
                    "id": "ccec2822-e0af-4a58-b1f0-ee332ea5db8d",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "TextEditorSetLanguageDefinition",
                    "help": "Sets the current text editor language definition ( _editor_index, _language_definition ) ",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_texteditor_set_language_definition",
                    "returnType": 2
                },
                {
                    "id": "edd1852e-f589-4725-96cc-6922c24255bf",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "TextEditorGetPalette",
                    "help": "Gets the palette of the current text editor ( _editor_index ) ",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_texteditor_get_palette",
                    "returnType": 2
                },
                {
                    "id": "28e9d867-7016-4f1a-94af-0bb7d69b7ed5",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "TextEditorSetPalette",
                    "help": "Sets the palette for the current text editor ( _editor_index ) ",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_texteditor_set_palette",
                    "returnType": 2
                },
                {
                    "id": "2e89014b-5356-43bf-96a4-8a0913ca18a0",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "TextEditorRender",
                    "help": "Renders the text editor ( _editor_index, _title, size_x, _size_y, _borde )",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_texteditor_render",
                    "returnType": 2
                },
                {
                    "id": "6d0a38d3-e57c-4f6e-bf1f-0e2ff6489817",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        2,
                        1
                    ],
                    "externalName": "TextEditorSetText",
                    "help": "Sets the text of the current editor ( _editor_index, text ) ",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_texteditor_set_text",
                    "returnType": 2
                },
                {
                    "id": "493225ad-dad3-429c-9e95-3d75ab931b9e",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        2
                    ],
                    "externalName": "TextEditorGetText",
                    "help": "Gets the text from the current text editor ( _editor_index ) ",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_texteditor_get_text",
                    "returnType": 1
                },
                {
                    "id": "002bbb45-2695-4837-958d-eeb01e3f3e41",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "TextEditorGetSelectedText",
                    "help": "Gets the selected text from the current editor ( _editor_index ) ",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_texteditor_get_selected_text",
                    "returnType": 2
                },
                {
                    "id": "372d02af-64f0-4a0c-91c3-91769fc0b0c6",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "TextEditorGetTotalLines",
                    "help": "Gets the total lines from the current text editor ( _editor_index ) ",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_texteditor_get_total_lines",
                    "returnType": 2
                },
                {
                    "id": "71366ca9-9659-4ffc-9c0d-76538c548d58",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "TextEditorIsOverwrite",
                    "help": "Checks if current text editor is in overwrite mode ( _editor_index ) ",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_texteditor_is_overwrite",
                    "returnType": 2
                },
                {
                    "id": "d00334d9-d9a8-48b3-9f94-8a487bf06faa",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "TextEditorSetReadOnly",
                    "help": "Sets the text editor to read only ( _editor_index, _value ) ",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_texteditor_set_read_only",
                    "returnType": 2
                },
                {
                    "id": "659aa43a-9c50-4398-8264-b0b2bc1ee1a5",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "TextEditorIsReadOnly",
                    "help": "Checks if the current editor is read only ( _editor_index ) ",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_texteditor_is_read_only",
                    "returnType": 2
                },
                {
                    "id": "dfaf49b5-1a6c-47d4-b14f-2bcc1ac516e6",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "TextEditorGetCursorPosition",
                    "help": "Gets the line and column from the current text editor ( _editor_index ) ",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_texteditor_get_cursor_position",
                    "returnType": 2
                },
                {
                    "id": "e85acb2b-aa55-49db-9d15-d0fe98707b8e",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "TextEditorSetCursorPosition",
                    "help": "Sets the cursor position using line and column ( _editor_index, _line, _col )",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_texteditor_set_cursor_position",
                    "returnType": 2
                },
                {
                    "id": "0837f759-332e-41bc-9f24-3744e423c095",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "TextEditorInsertText",
                    "help": "Inserts text at current pos in _editor_index ( _editor_index, _text ) ",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_texteditor_insert_text",
                    "returnType": 2
                },
                {
                    "id": "bdbc55d9-2e12-448b-a949-1ee1f255009a",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "TextEditorMoveUp",
                    "help": "Moves up  lines in the text editor ( _editor_index, _amount, [select=false] )",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_texteditor_move_up",
                    "returnType": 2
                },
                {
                    "id": "c654392c-26ff-490f-af2b-904e898bdcb1",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "TextEditorMoveDown",
                    "help": "Moves down lines in the text editor ( _editor_index, _amount, [ _select = false ] ) ",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_texteditor_move_down",
                    "returnType": 2
                },
                {
                    "id": "bb90e03a-5fce-4f4c-bc55-b21ae81a09e1",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "TextEditorMoveLeft",
                    "help": "Moves columns in the current text editor ( _editor_index, _amount, [ _select = false ] , [ _word_mode = false ] ) ",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_texteditor_move_left",
                    "returnType": 2
                },
                {
                    "id": "02f58de7-2829-4150-a410-fb51afbdfdc0",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "TextEditorMoveRight",
                    "help": "Moves columns in the current text editor ( _editor_index, _amount, [ _select = false ] , [ _word_mode = false ] ) ",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_texteditor_move_right",
                    "returnType": 2
                },
                {
                    "id": "16869769-dca1-4e60-b35e-0dcfd16bd7da",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "TextEditorMoveTop",
                    "help": "Skips to top of current editor ( _editor_index, [ _select = false ] ) ",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_texteditor_move_top",
                    "returnType": 2
                },
                {
                    "id": "f75f797c-8ad0-4106-91e7-503f3868f521",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "TextEditorMoveBottom",
                    "help": "Moves to the bottom of the current editor ( _editor_index, [ _select = false ] ) ",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_texteditor_move_bottom",
                    "returnType": 2
                },
                {
                    "id": "1943fdfd-48c7-4494-b30e-bdecf925a443",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "TextEditorMoveHome",
                    "help": "Moves to the home position of the current editor ( _editor, [ _select = false ] ) ",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_texteditor_move_home",
                    "returnType": 2
                },
                {
                    "id": "0abd2e72-f771-4d11-bc50-ecc7f1828936",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "TextEditorMoveEnd",
                    "help": "Moves position to end of line in current editor ( _editor_index ) ",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_texteditor_move_end",
                    "returnType": 2
                },
                {
                    "id": "b92cf839-ff53-4f23-9d6f-e416351e9771",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "TextEditorSetSelectionStart",
                    "help": "Sets the start select position in the current editor ( _editor_index, _line, _col ) ",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_texteditor_set_selection_start",
                    "returnType": 2
                },
                {
                    "id": "a30e64ae-7ca4-4103-8a76-82e24630f0d1",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "TextEditorSetSelectionEnd",
                    "help": "Sets the end select position in the current editor ( _editor_index, _line, _col ) ",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_texteditor_set_selection_end",
                    "returnType": 2
                },
                {
                    "id": "5413fd41-1f5f-47f9-9205-c50c85148add",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "TextEditorSelectWordUnderCursor",
                    "help": "Selects the word under the mouse cursor in the current editor ( _editor_index ) ",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_texteditor_select_word_under_cursor",
                    "returnType": 2
                },
                {
                    "id": "00224191-c034-4adb-8e6c-5b95481a8354",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "TextEditorHasSelection",
                    "help": "Checks if current editor has selected text ( _editor_index ) ",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_texteditor_has_selection",
                    "returnType": 2
                },
                {
                    "id": "50ab039f-0f15-439c-8855-0346932ea625",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "TextEditorCopy",
                    "help": "Copies the selected text ( _editor_index ) ",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_texteditor_copy",
                    "returnType": 2
                },
                {
                    "id": "fd836342-bb71-48cc-8116-c5d4ec19eb64",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "TextEditorCut",
                    "help": "Cuts the selected text from the editor ( _editor_index ) ",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_texteditor_cut",
                    "returnType": 2
                },
                {
                    "id": "f6c661ea-60e8-4c02-a3eb-106f6d3bf221",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "TextEditorPaste",
                    "help": "Pastes text from the clipboard into the current position in the editor ( _editor_index ) ",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_texteditor_paste",
                    "returnType": 2
                },
                {
                    "id": "51c5b621-098c-491c-91c1-0984466cc98e",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "TextEditorDelete",
                    "help": "Deletes from the current editor ( _editor_index ) ",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_texteditor_delete",
                    "returnType": 2
                },
                {
                    "id": "2944d0ec-4d30-4300-ae16-6265463edd6f",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "TextEditorCanUndo",
                    "help": "Check if there is undo history ( _editor_index ) ",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_texteditor_can_undo",
                    "returnType": 2
                },
                {
                    "id": "18b3d6ac-b05f-4454-82f5-ebf9f3377930",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "TextEditorCanRedo",
                    "help": "Checks for redo history in the current editor ( _editor_index ) ",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_texteditor_can_redo",
                    "returnType": 2
                },
                {
                    "id": "7e8a98ce-f2b2-402d-94c2-dbdb8862aefc",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "TextEditorUndo",
                    "help": "Undo ( _editor_index, _steps ) ",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_texteditor_undo",
                    "returnType": 2
                },
                {
                    "id": "f036b056-e4a5-4b01-93e6-8a35d8a722b3",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "TextEditorRedo",
                    "help": "Redo ( _editor_index, _steps ) ",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_texteditor_redo",
                    "returnType": 2
                },
                {
                    "id": "4ffa0cca-bb9e-4c97-9f6e-201033f317c6",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "TextEditorGetLightPalette",
                    "help": "Gets the light palette that may be used with editor ( _editor_index ) ",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_texteditor_get_light_palette",
                    "returnType": 2
                },
                {
                    "id": "a97d639f-7957-4182-b10c-2be48256c044",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "TextEditorGetDarkPalette",
                    "help": "Gets the dark palette that may be used with editor ( _editor_index ) ",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_texteditor_get_dark_palette",
                    "returnType": 2
                },
                {
                    "id": "630858ba-2a50-47e3-9aee-0e8708093f69",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "TextEditorSetSelection",
                    "help": "Sets the editor selection ( _line1, _col1, _line2, _col2, [ word_mode = false ] )",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_texteditor_set_selection",
                    "returnType": 2
                },
                {
                    "id": "0583685a-5f8c-41d2-beef-8e35f040d5b5",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "TextEditorClose",
                    "help": "close  text editor, freeing its index (_editor_index)",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_texteditor_destroy",
                    "returnType": 2
                },
                {
                    "id": "22eab2e1-4179-4058-bcd3-505e5d75a8aa",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        2,
                        2
                    ],
                    "externalName": "SetDisplaySize",
                    "help": "set the display size for window clamping(_width, _height)",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_set_display_size",
                    "returnType": 2
                },
                {
                    "id": "6ad4ee6c-b243-4f7a-992e-43f442c3baa8",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "GetDisplaySize",
                    "help": "Get the display size ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_get_display_size",
                    "returnType": 2
                },
                {
                    "id": "4069423a-554d-4e09-b021-c8e44ee08ee6",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "SetDrawlistFlags",
                    "help": "Set anti-aliasing per primitive (_flags=0)",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_drawlist_set_flags",
                    "returnType": 2
                },
                {
                    "id": "6fcc207d-292a-4f25-bbae-78eb9efd1dda",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "GetDrawListFlags",
                    "help": "Get anti-aliasing (_flags=0)",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_drawlist_get_flags",
                    "returnType": 2
                },
                {
                    "id": "4a02685d-7521-4417-b704-be692f685b7b",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "UseOverlayDrawlist",
                    "help": "Use the overlay drawlist ontop of windows ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_drawlist_use_overlay",
                    "returnType": 2
                },
                {
                    "id": "e59e23ef-ced6-4742-918e-94577f722f29",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "UseWindowDrawList",
                    "help": "Use the drawlist for the current window ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_drawlist_use_window",
                    "returnType": 2
                },
                {
                    "id": "5659191e-bd1e-4f06-adbc-92332fa87349",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "IOGetOptCursorBlink",
                    "help": "Get whether or not the cursor should blink ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_get_cursor_blink",
                    "returnType": 2
                },
                {
                    "id": "cf90c80f-8c6c-470d-a866-a1f7d9de8acb",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "IOGetOptCursorBlink",
                    "help": "Set whether or not the cursor should blink (_enabled)",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_set_cursor_blink",
                    "returnType": 2
                },
                {
                    "id": "d93d4bb9-a26c-4bc0-baa4-fdd217e84ff9",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "StyleColorsLight",
                    "help": "Use light colors ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_style_colors_light",
                    "returnType": 2
                },
                {
                    "id": "83b8d868-6c14-4756-b182-a9eefe0d83a5",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "GetFrameHeight",
                    "help": "~ FontSize + style.FramePadding.y * 2",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_get_frame_height",
                    "returnType": 2
                },
                {
                    "id": "78892183-a712-470e-8218-5a27caf8fe23",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "BeginCombo",
                    "help": "begin a combo widget (_label, _preview_value, [_flags=0])",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_begin_combo",
                    "returnType": 2
                },
                {
                    "id": "ed1da062-27d9-447e-897a-807584f53049",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "EndCombo",
                    "help": "End a combo widghet ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_end_combo",
                    "returnType": 2
                },
                {
                    "id": "06bf0549-6cf7-4acf-a2ea-03351ccf474f",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "ShowStyleSelector",
                    "help": "Show the new style selector (_label)",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_show_style_selector",
                    "returnType": 2
                },
                {
                    "id": "e5dc4a87-36c9-456f-a643-e094328df235",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "ShowMetricsWindow",
                    "help": "show a metrics window ([_open=undefined])",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_show_metrics_window",
                    "returnType": 2
                },
                {
                    "id": "28c50629-e044-4425-bcb4-9368533b6592",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "ShowUserGuide",
                    "help": "add basic help\/info block [not a window]: how to manipulate ImGui as a end-user [mouse\/keyboard controls] ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_show_user_guide",
                    "returnType": 2
                },
                {
                    "id": "015dfc99-af09-4cbd-9d3e-2f999a249436",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "ShowDemoWindow",
                    "help": "create demo\/test window. demonstrate most ImGui features. call this to learn about the library! try to make it always available in your application!",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_show_demo_window",
                    "returnType": 2
                },
                {
                    "id": "918c2077-b396-46cb-ae68-e08147b8cbad",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "ShowFontSelector",
                    "help": "shows a font selector (_label)",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_show_font_selector",
                    "returnType": 2
                },
                {
                    "id": "1f0bac73-1d6a-493b-9a95-b13d1d1dd53e",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "BeginDragDropSource",
                    "help": "call when the current item is active. If this return true, you can call SetDragDropPayload + EndDragDropSource ([_flags=0], [_mouse_button=0])",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_begin_drag_drop_source",
                    "returnType": 2
                },
                {
                    "id": "43dd37e8-269c-4fc4-8fb4-997b57cba333",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "SetDragDropPayload",
                    "help": "type is a user defined string of maximum 8 characters. Strings starting with '_' are reserved for dear imgui internal types. Data is copied and held by imgui. (_type, _payload_id, [_cond=0])",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_set_drag_drop_payload",
                    "returnType": 2
                },
                {
                    "id": "566553eb-c26b-46af-af9b-454d37b990c1",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "EndDragDropSource",
                    "help": "end the drag drop source ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_end_drag_drop_source",
                    "returnType": 2
                },
                {
                    "id": "3b865286-c11c-4130-9595-7d7a8d527f56",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "BeginDragDropTarget",
                    "help": "call after submitting an item that may receive an item. If this returns true, you can call AcceptDragDropPayload + EndDragDropTarget ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_begin_drop_target",
                    "returnType": 2
                },
                {
                    "id": "b61061a7-d30a-4275-b0ba-a52f5e0ebd60",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "AcceptDragDropPayload",
                    "help": "accept contents of a given type. If ImGuiDragDropFlags_AcceptBeforeDelivery is set you can peek into the payload before the mouse button is released. (_type, [_flags=0])",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_accept_drag_drop_payload",
                    "returnType": 2
                },
                {
                    "id": "e634556b-67d8-43dd-8fc7-5b037c7fa8e0",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "EndDragDropTarget",
                    "help": "end drag drop target ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImguiGML_end_drag_drop_target",
                    "returnType": 2
                },
                {
                    "id": "917a2d10-cdc6-4f0b-a5d0-33d3f68fbaaa",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "SetDebugBuffer",
                    "help": "sets the buffer used for debug messages, first u32 is the amount of messages since last flush, followed by that many strings (_buffer_address, _buffer_size)",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImGuiGML_set_debug_buffer",
                    "returnType": 2
                },
                {
                    "id": "5e855ad2-2136-46aa-89a3-0e282ff3cffc",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "FlushDebugBuffer",
                    "help": "flushes the debug message counter to 0 ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "_extImGuiGML_flush_debug_buffer",
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
                "22eab2e1-4179-4058-bcd3-505e5d75a8aa",
                "48035199-16c7-49d6-814d-66e46cb564f1",
                "4637674c-bd6d-4fee-be1a-b727139ddd51",
                "181ac5f1-1462-4b4e-a3d3-f2c7627ed0e6",
                "01795a0e-924f-44e1-8388-87fa5c313d05",
                "856b3e7b-abc7-40a6-9199-703030492772",
                "6d9bdf06-ca3d-4283-b546-95576222db5a",
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
                "92e55309-185c-4df4-ace7-3f870e6b4270",
                "358b2137-b0d0-46a8-8824-b1a9d688581f",
                "d8ba8b25-99e9-4d5d-ab65-12e737fbd965",
                "d5d0a6f1-2fca-4c5c-b53a-aa479075bd5f",
                "de8daf26-105c-42cc-b408-0d117a6f88a5",
                "efeebc8d-a43e-4bf5-ae0e-e70a33070503",
                "046b7734-66ef-4963-9962-bef3d45563f6",
                "0f0d84c5-139a-4279-a9a6-f0d48e4872cb",
                "0c4826cc-3003-4a32-9d7d-d62a9c2e6025",
                "aa1375e4-0cbf-4138-815d-1cffd5b6eca4",
                "f17139d0-d1f9-43fb-af53-ae2dd3d8f489",
                "a3163654-2e70-4bca-9c33-fddfaa2ace4e",
                "27ae76f8-e131-49e7-9cd3-76056eb18861",
                "49062be2-655b-46da-81e7-ca0e7f85e705",
                "838bfbd7-83d6-49e7-9b16-bde357174462",
                "d578c44c-734d-4a1e-b8e5-16b42fc742c5",
                "8e2c2a97-f452-4e48-8cfd-682188d9b6e5",
                "dda1f737-1c09-48b9-b788-e46a54a8016b",
                "6364e777-0113-41e8-92ec-94bbe56dedd2",
                "addbdf9e-dbf2-445e-888c-396993102737",
                "dcbe5aa0-aea0-4327-b496-98541dc8135c",
                "9810102e-43b5-4385-b0e6-50b93ba7f698",
                "b411a072-5498-4708-a6ad-0b6e5b0c4e9a",
                "3dfd5bab-11c6-4f9c-8df4-f213388a6414",
                "f2e27184-e995-45ed-893d-799cb02fcba0",
                "c4a03d57-bcfa-445a-bc69-b1c04878a138",
                "15c11d08-ade9-4345-b692-2b399046e319",
                "140f6bc3-ddae-43ca-95ce-092c81ef6dd1",
                "04cc5063-c377-4b9f-87e4-27e14d4fa1dd",
                "5583d4a1-b7f8-4627-99c3-4dc12d3a46c9",
                "4e3dc4c1-1ced-4a68-9f08-2905f03ff2eb",
                "4b93b2a7-6f82-48a6-b3c6-d4f44618e122",
                "15576a15-8586-492d-a33b-7ac99f2e4d65",
                "cfc8382b-0566-4a47-9a2a-c88b0624659f",
                "5cb20f41-6c68-47a9-8da7-926dae1e3f4d",
                "b14133f5-d9b5-42c8-bf25-274eeb5dae59",
                "50f820b4-c561-4fbd-921c-415e318f50cb",
                "94d26af4-9322-4310-bc8b-decda4b68f7e",
                "164caab9-ac13-43c7-a7ff-8d4b9b82fe11",
                "ba65aa5b-d14e-49e1-89c8-9773a9eb99ca",
                "6bb1c245-ca54-49ce-86db-8e09df0dc59a",
                "35849655-e73c-47e4-9156-46e429e46649",
                "d5a02e34-5ec5-4760-8c72-ccd1f8def957",
                "2e66c56f-0079-4a39-ba94-f6820420410c",
                "d6991798-3a2a-4b4d-94c2-3ae5eeed8d17",
                "0f17f55c-e04f-4431-aa06-9c8d29bfb059",
                "8c758fad-fab2-4521-8b31-a830befe784c",
                "20632a00-128d-4b5a-b472-cfe123421229",
                "c297bf95-d530-4374-b2d3-31a4ac3b0822",
                "93614a06-0095-4864-9c8c-f8787eba2ba7",
                "aad1a777-21be-4ed8-8c47-f6f94ebc740a",
                "e6c2aa1a-5190-4d25-87a9-441e67efc204",
                "05273652-25c3-43c8-99df-66a4621739ca",
                "eaf6eff7-e12d-4661-a102-bc7e84f1a1bf",
                "ef86db70-8169-4db4-ad38-87bab4b51666",
                "3b2255b7-f213-405b-a629-0065d6c1edc4",
                "0fc0082c-cd23-40c1-bc9f-63491401976f",
                "56ad2af6-a10b-4739-89d5-690977a451e2",
                "2a49b1fa-e022-4c74-a79d-85de2ce3c47b",
                "b7d8c20a-1310-401a-af49-c2efbdc86e39",
                "b0bd31dd-faaa-464e-8386-dc60fada5389",
                "0b971f57-a7ec-41f1-9c10-53c59fbdef26",
                "25178463-f1a4-4ff3-80e6-b669f57e6ab8",
                "a8427ea3-66d0-4f74-b6bb-e89f46c51e80",
                "fb697c3b-4dae-4b09-ab2c-60e0df1dbf06",
                "87ed4e14-eb27-48f9-9484-aad284750b39",
                "8a88bdbf-79bb-40f7-b8e4-b1c6b20c998e",
                "30183d51-fd59-4226-bf50-36cb22891f3b",
                "db0cb609-dfa3-46e6-b2a8-0efe08437aa0",
                "17458a40-61da-4087-b860-d902c68fb732",
                "55b92250-7b95-46e6-8ed3-d85c539117b5",
                "15c158ff-f60d-418d-b7de-347d0176a1cb",
                "9ad5761d-caa2-4c43-812f-9a1424235115",
                "67aa95c7-f84d-429a-ba85-fa78bf57ef37",
                "d685ef1b-78f7-4500-8c0c-ff46d07b69e5",
                "14f4c6d8-1c5d-439c-9887-ea858e4a6b18",
                "4eff528c-ff3e-4c86-bbc2-20050f4081aa",
                "833d34ec-8ace-46c0-9d96-6fbc85f69a67",
                "0583685a-5f8c-41d2-beef-8e35f040d5b5",
                "7f9fa2d2-55ad-4fe7-aeac-152025e446f3",
                "cd8f7775-8427-434a-a758-38740e97bf01",
                "ccec2822-e0af-4a58-b1f0-ee332ea5db8d",
                "edd1852e-f589-4725-96cc-6922c24255bf",
                "28e9d867-7016-4f1a-94af-0bb7d69b7ed5",
                "2e89014b-5356-43bf-96a4-8a0913ca18a0",
                "6d0a38d3-e57c-4f6e-bf1f-0e2ff6489817",
                "493225ad-dad3-429c-9e95-3d75ab931b9e",
                "002bbb45-2695-4837-958d-eeb01e3f3e41",
                "372d02af-64f0-4a0c-91c3-91769fc0b0c6",
                "71366ca9-9659-4ffc-9c0d-76538c548d58",
                "d00334d9-d9a8-48b3-9f94-8a487bf06faa",
                "659aa43a-9c50-4398-8264-b0b2bc1ee1a5",
                "dfaf49b5-1a6c-47d4-b14f-2bcc1ac516e6",
                "e85acb2b-aa55-49db-9d15-d0fe98707b8e",
                "0837f759-332e-41bc-9f24-3744e423c095",
                "bdbc55d9-2e12-448b-a949-1ee1f255009a",
                "c654392c-26ff-490f-af2b-904e898bdcb1",
                "bb90e03a-5fce-4f4c-bc55-b21ae81a09e1",
                "02f58de7-2829-4150-a410-fb51afbdfdc0",
                "16869769-dca1-4e60-b35e-0dcfd16bd7da",
                "f75f797c-8ad0-4106-91e7-503f3868f521",
                "1943fdfd-48c7-4494-b30e-bdecf925a443",
                "0abd2e72-f771-4d11-bc50-ecc7f1828936",
                "b92cf839-ff53-4f23-9d6f-e416351e9771",
                "a30e64ae-7ca4-4103-8a76-82e24630f0d1",
                "5413fd41-1f5f-47f9-9205-c50c85148add",
                "00224191-c034-4adb-8e6c-5b95481a8354",
                "50ab039f-0f15-439c-8855-0346932ea625",
                "fd836342-bb71-48cc-8116-c5d4ec19eb64",
                "f6c661ea-60e8-4c02-a3eb-106f6d3bf221",
                "51c5b621-098c-491c-91c1-0984466cc98e",
                "2944d0ec-4d30-4300-ae16-6265463edd6f",
                "18b3d6ac-b05f-4454-82f5-ebf9f3377930",
                "7e8a98ce-f2b2-402d-94c2-dbdb8862aefc",
                "f036b056-e4a5-4b01-93e6-8a35d8a722b3",
                "4ffa0cca-bb9e-4c97-9f6e-201033f317c6",
                "a97d639f-7957-4182-b10c-2be48256c044",
                "630858ba-2a50-47e3-9aee-0e8708093f69",
                "6ad4ee6c-b243-4f7a-992e-43f442c3baa8",
                "4069423a-554d-4e09-b021-c8e44ee08ee6",
                "6fcc207d-292a-4f25-bbae-78eb9efd1dda",
                "4a02685d-7521-4417-b704-be692f685b7b",
                "e59e23ef-ced6-4742-918e-94577f722f29",
                "5659191e-bd1e-4f06-adbc-92332fa87349",
                "cf90c80f-8c6c-470d-a866-a1f7d9de8acb",
                "d93d4bb9-a26c-4bc0-baa4-fdd217e84ff9",
                "83b8d868-6c14-4756-b182-a9eefe0d83a5",
                "78892183-a712-470e-8218-5a27caf8fe23",
                "ed1da062-27d9-447e-897a-807584f53049",
                "06bf0549-6cf7-4acf-a2ea-03351ccf474f",
                "e5dc4a87-36c9-456f-a643-e094328df235",
                "28c50629-e044-4425-bcb4-9368533b6592",
                "015dfc99-af09-4cbd-9d3e-2f999a249436",
                "918c2077-b396-46cb-ae68-e08147b8cbad",
                "1f0bac73-1d6a-493b-9a95-b13d1d1dd53e",
                "43dd37e8-269c-4fc4-8fb4-997b57cba333",
                "566553eb-c26b-46af-af9b-454d37b990c1",
                "3b865286-c11c-4130-9595-7d7a8d527f56",
                "b61061a7-d30a-4275-b0ba-a52f5e0ebd60",
                "e634556b-67d8-43dd-8fc7-5b037c7fa8e0",
                "917a2d10-cdc6-4f0b-a5d0-33d3f68fbaaa",
                "5e855ad2-2136-46aa-89a3-0e282ff3cffc"
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
            "copyToTargets": 35184372089026,
            "filename": "extImguiGML.gml",
            "final": "",
            "functions": [
                {
                    "id": "91a538b8-ccae-48c9-bda2-c799b65f36f9",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_activate",
                    "help": "helper function to simply activate imguigml again ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_activate",
                    "returnType": 2
                },
                {
                    "id": "af3f923a-077d-4f08-9930-a833bd659673",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_deactivate",
                    "help": "helper function to simply deactivate imguigml again ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_deactivate",
                    "returnType": 2
                },
                {
                    "id": "9b002747-5398-4ac2-ab7a-9edfb02056fd",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_ready",
                    "help": "returns true if imguigml is ready for commands to be called ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_ready",
                    "returnType": 2
                },
                {
                    "id": "4aa5fbad-60b2-4b61-914b-70332559cf64",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_color_convert_gml_to_u32",
                    "help": "get an ImGui color from a gml color (_color, [_alpha=1.0])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_color_convert_gml_to_u32",
                    "returnType": 2
                },
                {
                    "id": "039b4ae4-988c-4595-ad1c-60d0e18c8a49",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_color_convert_gml_to_float4",
                    "help": "get an ImGui color4 from a gml color (_color, [_alpha=1.0])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_color_convert_gml_to_float4",
                    "returnType": 2
                },
                {
                    "id": "19a599fa-bc91-41fb-b6f5-f180d1c1e1c7",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_color_convert_float4_to_gml",
                    "help": "get an gml color from a ImGui color4 (_r_or_array4, [_g=undefined], [_b=undefined], [_a=undefined])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_color_convert_float4_to_gml",
                    "returnType": 2
                },
                {
                    "id": "6eb9a427-d8a2-4f53-8686-21211219287b",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_color_convert_u32_to_gml",
                    "help": "get an ImGui color from a gml color (_color)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_color_convert_u32_to_gml",
                    "returnType": 2
                },
                {
                    "id": "17d7807e-f2b5-4ab6-a232-c5a33c8c7578",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_toggle_cursor",
                    "help": "Toggle whether or not ImGui will touch the cursor or not ([_force])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_toggle_cursor",
                    "returnType": 2
                },
                {
                    "id": "b5f61e6b-704c-474a-a795-bd30d4538391",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_enable_depth",
                    "help": "if enabled, setting the `depth` of the `imgui` instance will change the `z-value` imgui renders, otherwise it's at z=1.0 ([_enabled])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_enable_depth",
                    "returnType": 2
                },
                {
                    "id": "9f1cfe9c-ffe7-426f-ac65-b4a3d6a4e9b7",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_set_display_mode",
                    "help": "set the imguigml display mode - this affects how the window is resized \/ handled.      currently there's the 3 display modes:      *  GUIAspect     - ImGuiGML Draws on the GUI layer, but corrects for aspect ratio according to the viewport of view passed. **DEFAULT**      *  View          - ImGuiGML will Draw in a normal Draw call **NOT** Draw GUI, the mouse will scale to the view given. **Use if you want to Draw ImGuiGML during the Draw event [application surface].**      **NOTE: This should be set before or after `Begin Step` and `Draw` of the `imgui` object,      it affects both mouse [Begin Step] and rendering [Draw]**      _If you're using `EImGui_DisplayMode.View` you may want to experiment with [imguigml_set_display_scale][#imguigml_set_display_scale]_ (_display_mode, [_display_view=0])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_set_display_mode",
                    "returnType": 2
                },
                {
                    "id": "a5d9321e-e499-4c03-9101-e82ff4d9e68a",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_get_display_mode",
                    "help": "returns the current set display mode ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_get_display_mode",
                    "returnType": 2
                },
                {
                    "id": "6d22ce0c-842c-40d4-b3dc-df2639ed8f6a",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_get_display_view",
                    "help": "returns the current set display view - the view who's viewport we respect the aspect ratio of with using `EImGui_DisplayMode.GUIWindowSize` or `EImGui_DisplayMode.GUIAspect` ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_get_display_view",
                    "returnType": 2
                },
                {
                    "id": "299ef1ea-1409-47df-986f-1e01d26a9846",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_set_display_scale",
                    "help": "set the imguigml display scaling - it will scale the mouse and the vertex buffer ImGui passes ImGuiGML by this much.      if you pass no arguments, Scale will no longer be overriden (_x, _y)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_set_display_scale",
                    "returnType": 2
                },
                {
                    "id": "d9cfaced-7f5c-401d-98ac-ccbaa299df96",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_get_display_scale_width",
                    "help": "get the scale % we scale the width of ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_get_display_scale_width",
                    "returnType": 2
                },
                {
                    "id": "819a4de7-132c-4c57-8ebc-549b7d8d8d58",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_get_display_scale_height",
                    "help": "get the scale % we scale the height of ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_get_display_scale_height",
                    "returnType": 2
                },
                {
                    "id": "5e16d758-b3c9-4c77-a8c4-488b0be409dc",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_set_display_size",
                    "help": "set the display size [how imgui will clamp windows].      by default, ImGuiGML automatically sets the display size to the window size each step. using this function disables that behavior.      calling this fucntion with **NO** params, re-enables that functionality. ([_width], [_height])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_set_display_size",
                    "returnType": 2
                },
                {
                    "id": "281da188-f37b-448d-854d-8bdb9ec444de",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_get_display_size",
                    "help": "get the display size [how imgui will clamp windows] ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_get_display_size",
                    "returnType": 2
                },
                {
                    "id": "d589bf2f-32f5-49f4-ac69-30eefb1c3ce2",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_separator",
                    "help": "separator, generally horizontal. inside a menu bar or in horizontal layout mode, this becomes a vertical separator. ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_separator",
                    "returnType": 2
                },
                {
                    "id": "5e9422c9-2490-4133-b4f6-a6f41f25b4dd",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_same_line",
                    "help": "call between widgets or groups to layout them horizontally ([_pos_x=0.0], [_spacing_w=-1.0])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_same_line",
                    "returnType": 2
                },
                {
                    "id": "8adf803d-c406-467b-a4d6-767cf3cb74ac",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_new_line",
                    "help": "undo a SameLine[] ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_new_line",
                    "returnType": 2
                },
                {
                    "id": "8bf39e1c-2d11-42c2-8c24-9e2b7a14833b",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_spacing",
                    "help": "add vertical spacing ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_spacing",
                    "returnType": 2
                },
                {
                    "id": "87c68a15-0d8e-4a78-97c0-22ce0dee8e3d",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_dummy",
                    "help": "add a dummy item of given size ([_pos_x=0.0], [_spacing_w=-1.0])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_dummy",
                    "returnType": 2
                },
                {
                    "id": "22947598-8b5d-4123-85b4-f73ed64999b7",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_indent",
                    "help": "move content position toward the right, by style.IndentSpacing or indent_w if >0 ([_index_w=0.0f])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_indent",
                    "returnType": 2
                },
                {
                    "id": "8107c6a2-6f3a-45c9-8e9f-d252b844db5c",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_unindent",
                    "help": "move content position back to the left, by style.IndentSpacing or indent_w if >0 ([_index_w=0.0f])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_unindent",
                    "returnType": 2
                },
                {
                    "id": "c8586178-c0d7-4097-846f-e53f3ad3406c",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_begin_group",
                    "help": "lock horizontal starting position + capture group bounding box into one \"item\" [so you can use IsItemHovered[] or layout primitives such as SameLine[] on whole group, etc.] ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_begin_group",
                    "returnType": 2
                },
                {
                    "id": "aa41a6af-a9af-4040-8a8b-d3fe36d3f01f",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_end_group",
                    "help": "end horizontal capture group ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_end_group",
                    "returnType": 2
                },
                {
                    "id": "05a036fc-0325-4e23-8cb9-acc8354908de",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_get_cursor_pos",
                    "help": "cursor position is relative to window position ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_get_cursor_pos",
                    "returnType": 2
                },
                {
                    "id": "221280b6-6e41-473e-9cb0-cf877308f003",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_get_cursor_pos_x",
                    "help": "cursor position is relative to window position ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_get_cursor_pos_x",
                    "returnType": 2
                },
                {
                    "id": "9a2b55be-2cf0-4f67-973a-ef8d4b844fd8",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_get_cursor_pos_y",
                    "help": "cursor position is relative to window position ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_get_cursor_pos_y",
                    "returnType": 2
                },
                {
                    "id": "19d0df58-c5e7-4b16-ae8c-5787321322d4",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_set_cursor_pos",
                    "help": "set the imgui cursor position (_x, _y)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_set_cursor_pos",
                    "returnType": 2
                },
                {
                    "id": "d64933fc-43f5-4767-b937-9ac7eb3b08aa",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_set_cursor_pos_x",
                    "help": "set the imgui cursor position x (_x)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_set_cursor_pos_x",
                    "returnType": 2
                },
                {
                    "id": "2e172bd6-2345-4e79-a2d3-afa31d4d8bd4",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_set_cursor_pos_y",
                    "help": "set the imgui cursor position y (_y)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_set_cursor_pos_y",
                    "returnType": 2
                },
                {
                    "id": "80470eee-fb58-46f3-973d-8c3643427676",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_get_cursor_start_pos",
                    "help": "initial cursor position ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_get_cursor_start_pos",
                    "returnType": 2
                },
                {
                    "id": "df61fdd1-4d22-4c67-84f1-f71a5af7feda",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_get_cursor_screen_pos",
                    "help": "cursor position in absolute screen coordinates [0..io.DisplaySize] [useful to work with ImDrawList API] ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_get_cursor_screen_pos",
                    "returnType": 2
                },
                {
                    "id": "61555036-f93d-4048-bccc-22c12812fd42",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_set_cursor_screen_pos",
                    "help": "cursor position in absolute screen coordinates [0..io.DisplaySize] (_x, _y)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_set_cursor_screen_pos",
                    "returnType": 2
                },
                {
                    "id": "6c539b2e-0eb4-49eb-9656-380ea5e89270",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_align_text_to_frame_padding",
                    "help": "vertically align\/lower upcoming text to FramePadding.y so that it will aligns to upcoming widgets [call if you have text on a line before regular widgets] ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_align_text_to_frame_padding",
                    "returnType": 2
                },
                {
                    "id": "d6807a9b-064c-4b1f-afda-dab3e604d4d6",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_get_text_line_height",
                    "help": "height of font == GetWindowFontSize[] ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_get_text_line_height",
                    "returnType": 2
                },
                {
                    "id": "0fb7d6ba-aec1-40d3-8753-42cc91b2edab",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_get_text_line_height_with_spacing",
                    "help": "distance [in pixels] between 2 consecutive lines of text == GetWindowFontSize[] + GetStyle[].ItemSpacing.y ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_get_text_line_height_with_spacing",
                    "returnType": 2
                },
                {
                    "id": "93547e70-f897-40fe-99c6-7b04f79aafc7",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_get_frame_height",
                    "help": "gets the height of the active frame [~ FontSize + style.FramePadding.y * 2] ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_get_frame_height",
                    "returnType": 2
                },
                {
                    "id": "94747012-4856-4672-b103-badf5ab7e5bb",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_get_frame_height_with_spacing",
                    "help": "distance [in pixels] between 2 consecutive lines of standard height widgets == GetWindowFontSize[] + GetStyle[].FramePadding.y*2 + GetStyle[].ItemSpacing.y ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_get_frame_height_with_spacing",
                    "returnType": 2
                },
                {
                    "id": "e13441e1-82be-44d5-8b83-21d7a2459df7",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_columns",
                    "help": "You can also use SameLine[pos_x] for simplified columns. ([_count=1], [_id=undefined], [_border=true])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_columns",
                    "returnType": 2
                },
                {
                    "id": "17563d3b-3eb1-45bd-8855-45c355ca4399",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_next_column",
                    "help": "next column, defaults to current row or next row if the current row is finished ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_next_column",
                    "returnType": 2
                },
                {
                    "id": "011432ca-0247-4fac-816d-17d0f00fb4a8",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_get_column_index",
                    "help": "get current column index ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_get_column_index",
                    "returnType": 2
                },
                {
                    "id": "7a549327-6de4-43a5-bce4-e1816f9237a9",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_get_column_width",
                    "help": "get column width [in pixels]. pass -1 to use current column ([_column_index=-1])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_get_column_width",
                    "returnType": 2
                },
                {
                    "id": "a165407a-2de8-4131-a1ad-8da578de98fb",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_set_column_width",
                    "help": "set column width [in pixels]. pass -1 to use current column (_column_index, _width)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_set_column_width",
                    "returnType": 2
                },
                {
                    "id": "a172b4a7-7157-4bb6-ad82-0a80c6c32254",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_get_column_offset",
                    "help": "get position of column line [in pixels, from the left side of the contents region]. ([_column_index=-1])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_get_column_offset",
                    "returnType": 2
                },
                {
                    "id": "a87c14e7-c7dc-482f-817a-5b5e79ef4ab9",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_set_column_offset",
                    "help": "set position of column line [in pixels, from the left side of the contents region]. (_column_index, _offset_x)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_set_column_offset",
                    "returnType": 2
                },
                {
                    "id": "358d5345-2083-42ba-bc04-b92c4a79a9ff",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_get_columns_count",
                    "help": "get amount of columns ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_get_columns_count",
                    "returnType": 2
                },
                {
                    "id": "5f605163-1920-4abf-8a4f-2b5e70ac08f2",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_push_id",
                    "help": "push identifier into the ID stack. IDs are hash of the entire stack! (_id, [_end_id])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_push_id",
                    "returnType": 2
                },
                {
                    "id": "e55dfc9e-6201-4ab3-b1da-7c2c5ed4e8a9",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_pop_id",
                    "help": "pop identifier from ID stack ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_pop_id",
                    "returnType": 2
                },
                {
                    "id": "092fd123-ff19-4089-84de-e70a8ddc6aa9",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_get_id",
                    "help": "push identifier into the ID stack. IDs are hash of the entire stack! (_id, [_end_id])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_get_id",
                    "returnType": 2
                },
                {
                    "id": "3d25be9a-0eb9-467e-b673-37a6c2823002",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_get_clipboard_text",
                    "help": "get the clipboard text ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_get_clipboard_text",
                    "returnType": 2
                },
                {
                    "id": "2ce232e6-a3e2-4d03-9490-9c8c0a8d5856",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_set_clipboard_text",
                    "help": "set the clipboard text ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_set_clipboard_text",
                    "returnType": 2
                },
                {
                    "id": "3dc540c6-c35c-46aa-8e0b-a4c22c0e2fff",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_get_key_index",
                    "help": "get mapped index for imgui_key index, you really don't need this (_key_index)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_get_key_index",
                    "returnType": 2
                },
                {
                    "id": "e7909ac4-24a8-471a-aaf5-492c0e86b247",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_is_key_down",
                    "help": "is key being held. == io.KeysDown[user_key_index]. note that imgui doesn't know the semantic of each entry of io.KeyDown[]. Use your own indices\/enums according to how your backend\/engine stored them into KeyDown[]! (_key_index)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_is_key_down",
                    "returnType": 2
                },
                {
                    "id": "ff2b1181-64ce-42ff-aaaf-91db655063b4",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_is_key_pressed",
                    "help": "was key pressed [went from !Down to Down] (_key_index, [_repeat=true])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_is_key_pressed",
                    "returnType": 2
                },
                {
                    "id": "49015f41-0c02-4918-bcd6-d024cfb68794",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_is_key_released",
                    "help": "is key released (_key_index)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_is_key_released",
                    "returnType": 2
                },
                {
                    "id": "5e5e6695-6195-4432-96e6-65007d009213",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_get_key_pressed_amount",
                    "help": "uses provided repeat rate\/delay. (_key_index, _repeat_delay, _rate)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_get_key_pressed_amount",
                    "returnType": 2
                },
                {
                    "id": "07d37f2e-7f71-4135-a2b3-cd4f56846e91",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_is_mouse_down",
                    "help": "is mouse button held (_button)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_is_mouse_down",
                    "returnType": 2
                },
                {
                    "id": "5adad332-1566-493d-a69e-3e750a959d7a",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_is_mouse_clicked",
                    "help": "did mouse button clicked [went from !Down to Down] (_button, [_repeat=false])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_is_mouse_clicked",
                    "returnType": 2
                },
                {
                    "id": "af21ba3d-ec7b-4420-9f32-6933016e710e",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_is_mouse_double_clicked",
                    "help": "did mouse button double-clicked. a double-click returns false in IsMouseClicked[]. uses io.MouseDoubleClickTime. (_button)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_is_mouse_double_clicked",
                    "returnType": 2
                },
                {
                    "id": "6743e7aa-b75d-4e2e-b53c-87940fbaaa96",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_is_mouse_released",
                    "help": "did mouse button released [went from Down to !Down] (_button)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_is_mouse_released",
                    "returnType": 2
                },
                {
                    "id": "d85e900a-2d7f-4bc4-a155-d07980eaf49c",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_is_mouse_dragging",
                    "help": "is mouse dragging. ([_button=0], [_lock_threshold=-1.0])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_is_mouse_dragging",
                    "returnType": 2
                },
                {
                    "id": "4155e992-40b7-4a14-b82a-54a29752ebad",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_is_mouse_hovering_rect",
                    "help": "is mouse hovering given bounding rect [in screen space]. (_min_x, _min_y, _max_x, _max_y, [_clip=true])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_is_mouse_hovering_rect",
                    "returnType": 2
                },
                {
                    "id": "931d6b40-6b32-4e51-903c-4000fd38e3a1",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_is_mouse_pos_valid",
                    "help": "is the mouse position valid ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_is_mouse_pos_valid",
                    "returnType": 2
                },
                {
                    "id": "a4ef50e8-11b0-48b2-8962-f40eb9ffe101",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_get_mouse_pos",
                    "help": "shortcut to ImGui::GetIO[].MousePos provided by user, to be consistent with other calls ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_get_mouse_pos",
                    "returnType": 2
                },
                {
                    "id": "88fddfe1-fcb6-4f6f-a1e1-848b0ed0de13",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_get_mouse_pos_on_opening_current_popup",
                    "help": "retrieve backup of mouse positioning at the time of opening popup we have BeginPopup[] into ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_get_mouse_pos_on_opening_current_popup",
                    "returnType": 2
                },
                {
                    "id": "1b8e30d6-e685-4789-8ba9-9d72c14c35ad",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_get_mouse_drag_delta",
                    "help": "retrieve backup of mouse positioning at the time of opening popup we have BeginPopup[] into ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_get_mouse_drag_delta",
                    "returnType": 2
                },
                {
                    "id": "cb48f8f6-640a-4ce3-8ddb-fafbfe7ce4e1",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_reset_mouse_drag_delta",
                    "help": "reset the drag delta ([_button=0])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_reset_mouse_drag_delta",
                    "returnType": 2
                },
                {
                    "id": "73df820d-fb31-4a36-b470-7b83203fa69e",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_get_mouse_cursor",
                    "help": "get desired cursor type, reset in ImGui::NewFrame[], this is updated during the frame. valid before Render[]. If you use software rendering by setting io.MouseDrawCursor ImGui will render those for you ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_get_mouse_cursor",
                    "returnType": 2
                },
                {
                    "id": "3c442b56-d578-4ee5-a8ef-aabd1609db1a",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_set_mouse_cursor",
                    "help": "set desired cursor type (_type)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_set_mouse_cursor",
                    "returnType": 2
                },
                {
                    "id": "b6a7f40d-bbef-4b32-bc63-dcab73a69d87",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_capture_keyboard_from_app",
                    "help": "manually override io.WantCaptureKeyboard flag next frame [said flag is entirely left for your application handle]. e.g. force capture keyboard when your widget is being hovered. ([_capture=true])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_capture_keyboard_from_app",
                    "returnType": 2
                },
                {
                    "id": "ef70245c-6297-46e2-91b5-dae647b815b9",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_capture_mouse_from_app",
                    "help": "manually override io.WantCaptureMouse flag next frame [said flag is entirely left for your application handle]. ([_capture=true])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_capture_mouse_from_app",
                    "returnType": 2
                },
                {
                    "id": "ba302a46-df5c-4f3e-a9f2-ea8f3b0e7dfb",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_log_to_tty",
                    "help": "start logging to tty ([_max_depth=-1])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_log_to_tty",
                    "returnType": 2
                },
                {
                    "id": "8070aac7-3b56-4ded-99b3-1b89bf7e23b6",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_log_to_file",
                    "help": "start logging to file ([_max_depth=-1], [_file_name=undefined])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_log_to_file",
                    "returnType": 2
                },
                {
                    "id": "b1ff5b3d-ead8-44ad-af76-68cbfe534013",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_log_to_clipboard",
                    "help": "start logging to OS clipboard ([_max_depth=-1])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_log_to_clipboard",
                    "returnType": 2
                },
                {
                    "id": "3659a319-951d-407d-8aea-114514dd7810",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_log_finish",
                    "help": "stop logging [close file, etc.] ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_log_finish",
                    "returnType": 2
                },
                {
                    "id": "8622d176-d870-4589-abc8-b92279af937a",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_log_buttons",
                    "help": "helper to display buttons for logging to tty\/file\/clipboard ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_log_buttons",
                    "returnType": 2
                },
                {
                    "id": "f58b4b4f-f064-40eb-8e54-d929f95afdc5",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_log_text",
                    "help": "pass text data straight to log [without being displayed] (_text)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_log_text",
                    "returnType": 2
                },
                {
                    "id": "4c934998-d4e7-4677-9b79-25a9cab83101",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_begin_main_menu_bar",
                    "help": "create and append to a full screen menu-bar. only call EndMainMenuBar[] if this returns true! ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_begin_main_menu_bar",
                    "returnType": 2
                },
                {
                    "id": "48dcb5a3-52d4-4a21-be20-1962cff6e93c",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_end_main_menu_bar",
                    "help": "end main menu bar ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_end_main_menu_bar",
                    "returnType": 2
                },
                {
                    "id": "01feb5c0-0e37-4ec6-bc09-3acd9723ca3e",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_begin_menu_bar",
                    "help": "append to menu-bar of current window [requires ImGuiWindowFlags_MenuBar flag set on parent window]. only call EndMenuBar[] if this returns true! ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_begin_menu_bar",
                    "returnType": 2
                },
                {
                    "id": "5808707e-b62d-4e86-a149-2dbf2dd4ac07",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_end_menu_bar",
                    "help": "end menu bar ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_end_menu_bar",
                    "returnType": 2
                },
                {
                    "id": "67b63f90-c43a-4f1a-9ce1-6e6984e8b150",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_begin_menu",
                    "help": "create a sub-menu entry. only call EndMenu[] if this returns true! (_label, [_enabled=true])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_begin_menu",
                    "returnType": 2
                },
                {
                    "id": "7e2e1ecf-65cf-4828-aca3-f81cc3fb97d1",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_end_menu",
                    "help": "end sub-menu entry ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_end_menu",
                    "returnType": 2
                },
                {
                    "id": "e2b93280-ae4f-4cef-bab0-62e76ae30350",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_menu_item",
                    "help": "show a sub-menu item (_label, [_shortcut=\"\"], [_selected=false], [_enabled=true])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_menu_item",
                    "returnType": 2
                },
                {
                    "id": "663486c8-2ca0-451a-9833-b41e79e40af4",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_open_popup",
                    "help": "call to mark popup as open [don't call every frame!]. popups are closed when user click outside,      or if CloseCurrentPopup[] is called within a BeginPopup[]\/EndPopup[] block. By default,      Selectable[]\/MenuItem[] are calling CloseCurrentPopup[]. Popup identifiers are relative to the      current ID-stack [so OpenPopup and BeginPopup needs to be at the same level]. (_str_id)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_open_popup",
                    "returnType": 2
                },
                {
                    "id": "11e28105-7f9e-4c3e-bd9a-77661ea00184",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_open_popup_on_item_click",
                    "help": "helper to open popup when clicked on last item. ([_str_id=undefined], [_mouse_button=1])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_open_popup_on_item_click",
                    "returnType": 2
                },
                {
                    "id": "69724f22-028d-4adc-9ca7-66686609ff1e",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_begin_popup",
                    "help": "begin a pop up - only call EndPopup[] if BeginPopup[] returned true! (_str_id)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_begin_popup",
                    "returnType": 2
                },
                {
                    "id": "7b43cb4e-5fd5-4d86-9203-872789459e7d",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_begin_popup_modal",
                    "help": "modal dialog [block interactions behind the modal window, can't close the modal window by clicking outside] (_name, [_open=undefined], [_extra_flags=0])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_begin_popup_modal",
                    "returnType": 2
                },
                {
                    "id": "913e628c-501c-4852-9e4f-175c29f4413c",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_begin_popup_context_item",
                    "help": "helper to open and begin popup when clicked on last item. if you can pass a NULL str_id only if the previous item had an id. If you want to use that on a non-interactive item such as Text[] you need to pass in an explicit ID here. read comments in .cpp! ([_str_id=undefined], [_mouse_button=1])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_begin_popup_context_item",
                    "returnType": 2
                },
                {
                    "id": "9d8c6a09-77ba-45fc-9697-9c2e6176f3bc",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_begin_popup_context_window",
                    "help": "helper to open and begin popup when clicked on current window. ([_str_id=undefined], [_mouse_button=1], [_also_over_items=true])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_begin_popup_context_window",
                    "returnType": 2
                },
                {
                    "id": "6bf3d938-b3ac-49e6-8551-1fa9e88791d7",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_begin_popup_context_void",
                    "help": "helper to open and begin popup when clicked in void [where there are no imgui windows]. ([_str_id=undefined], [_mouse_button=1])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_begin_popup_context_void",
                    "returnType": 2
                },
                {
                    "id": "2b8c5378-d8fd-4f33-9dee-1237e694b88d",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_end_popup",
                    "help": "end the current pop up ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_end_popup",
                    "returnType": 2
                },
                {
                    "id": "3d6b1321-c876-45f2-b9eb-37d349533146",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_is_popup_open",
                    "help": "return true if the popup is open (_str_id)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_is_popup_open",
                    "returnType": 2
                },
                {
                    "id": "e845fb3a-fc4d-4080-8e47-30ed95cb8491",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_close_current_popup",
                    "help": "close the popup we have begin-ed into. clicking on a MenuItem or Selectable automatically close the current popup. ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_close_current_popup",
                    "returnType": 2
                },
                {
                    "id": "81122184-61cd-4f67-b916-e05791dbfea7",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_push_font",
                    "help": "use undefined as a shortcut to push default font ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_push_font",
                    "returnType": 2
                },
                {
                    "id": "93c772ed-5e3d-4360-a4af-9be6a6acd005",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_pop_font",
                    "help": "pop the font ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_pop_font",
                    "returnType": 2
                },
                {
                    "id": "7107c448-ef97-4e11-86cc-b5dd2f292629",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_push_style_color",
                    "help": "(_idx, _colOrR, [_g], [_b], [_a])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_push_style_color",
                    "returnType": 2
                },
                {
                    "id": "99b9aa00-5a6f-43a4-9df1-bc4b32928eec",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_pop_style_color",
                    "help": "pop style colors ([_count=1])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_pop_style_color",
                    "returnType": 2
                },
                {
                    "id": "c5241508-95ba-496b-9b3a-d73a7d9cd698",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_push_style_var",
                    "help": "push a style var on the param stack (_idx, _valOrX, [_y])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_push_style_var",
                    "returnType": 2
                },
                {
                    "id": "cd357cb9-d209-4107-a31d-9ce154a0aa3a",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_pop_style_var",
                    "help": "pop style colors ([_count=1])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_pop_style_var",
                    "returnType": 2
                },
                {
                    "id": "e55d1196-40a6-4fa2-8297-9cf010c13968",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_get_style_color_vec4",
                    "help": "retrieve style color as stored in ImGuiStyle structure. use to feed back into PushStyleColor[], otherwhise use GetColorU32[] to get style color + style alpha. (_idx)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_get_style_color_vec4",
                    "returnType": 2
                },
                {
                    "id": "4f0e8ba6-813e-4e9e-bc7d-1381fa07e18b",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_get_font",
                    "help": "get current font ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_get_font",
                    "returnType": 2
                },
                {
                    "id": "c4ba8f2e-5227-4006-aad3-03df413d5263",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_get_font_size",
                    "help": "get current font size [= height in pixels] of current font with current scale applied ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_get_font_size",
                    "returnType": 2
                },
                {
                    "id": "2c4839c3-813b-46bd-9d20-afaa7d5226d0",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_get_font_tex_uv_white_pixel",
                    "help": "get UV coordinate for a while pixel, useful to draw custom shapes via the ImDrawList API ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_get_font_tex_uv_white_pixel",
                    "returnType": 2
                },
                {
                    "id": "48eaef63-8d59-4b9b-8201-d0b8dc8affb5",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_get_color_u32",
                    "help": "retrieve given style color with style alpha applied and optional extra alpha multiplier (_colOrR, [_g], [_b], [_a])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_get_color_u32",
                    "returnType": 2
                },
                {
                    "id": "2c7f90ad-4965-40eb-ba31-7f5b86420974",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_get_color_u32_from_idx",
                    "help": "retrieve given style color with style alpha applied and optional extra alpha multiplier (_idx, [_alpha_mul=1.0])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_get_color_u32_from_idx",
                    "returnType": 2
                },
                {
                    "id": "8e0a5933-d37d-4ff5-8517-bbc91899c38d",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_push_item_width",
                    "help": "width of items for the common item+label case, pixels. (_item_width)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_push_item_width",
                    "returnType": 2
                },
                {
                    "id": "5f757b74-15bc-4fc3-a702-9ea442b2c46b",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_pop_item_width",
                    "help": "pop item width ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_pop_item_width",
                    "returnType": 2
                },
                {
                    "id": "aa52a7dc-29fa-4da9-b775-c045d7b5dc4c",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_calc_item_width",
                    "help": "width of item given pushed settings and current cursor position ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_calc_item_width",
                    "returnType": 2
                },
                {
                    "id": "7c8deb5e-46a7-42e4-9d63-1da049fa2e5a",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_push_text_wrap_pos",
                    "help": "word-wrapping for Text*[] commands. ([_wrap_pos_x=0.0])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_push_text_wrap_pos",
                    "returnType": 2
                },
                {
                    "id": "59a61687-83be-46d2-be9f-da8f7b2637b3",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_pop_text_wrap_pos",
                    "help": "pop text wrap pos ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_pop_text_wrap_pos",
                    "returnType": 2
                },
                {
                    "id": "84c0a70d-e75e-4efa-8f2a-690acd367a7f",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_push_allow_keyboard_focus",
                    "help": "allow focusing using TAB\/Shift-TAB, enabled by default but you can disable it for certain widgets (_allow_keyboard_focus)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_push_allow_keyboard_focus",
                    "returnType": 2
                },
                {
                    "id": "258c1ca0-a05a-45cb-bc61-1a92ac92cecd",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_pop_allow_keyboard_focus",
                    "help": "pop allow keyboard focus ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_pop_allow_keyboard_focus",
                    "returnType": 2
                },
                {
                    "id": "a640b5dc-da14-4dfb-a746-26f29c4aa9b3",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_push_button_repeat",
                    "help": "in 'repeat' mode, Button*[] functions return repeated true in a typematic manner [using io.KeyRepeatDelay\/io.KeyRepeatRate setting]. Note that you can call IsItemActive[] after any Button[] to tell if the button is held in the current frame. (_repeat)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_push_button_repeat",
                    "returnType": 2
                },
                {
                    "id": "e1dbe698-a1a6-493b-a47e-2e14485684f4",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_pop_button_repeat",
                    "help": "pop repeat mode ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_pop_button_repeat",
                    "returnType": 2
                },
                {
                    "id": "a1a98fc7-b245-4f5c-ad2f-bd567dc8390d",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_selectable",
                    "help": "selectable element (_label, [_selected=false], [_selectable_flags=0], [_size_x=0], [_size_y=0])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_selectable",
                    "returnType": 2
                },
                {
                    "id": "83559a29-35a6-4f46-8f50-a38cef706eba",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_list_box",
                    "help": "create a list box (_label, _current_item, _item_array, [_height_in_items=-1]))",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_list_box",
                    "returnType": 2
                },
                {
                    "id": "89444b67-9220-43bd-b839-fb4eee5dca78",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_list_box_header",
                    "help": "use if you want to reimplement ListBox[] will custom data or interactions. make sure to call ListBoxFooter[] afterwards. (_label, _size_x, _size_y)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_list_box_header",
                    "returnType": 2
                },
                {
                    "id": "7ed2608b-8b7f-4850-b4bf-a1991b7d802b",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_list_box_header_items",
                    "help": "use if you want to reimplement ListBox[] will custom data or interactions. make sure to call ListBoxFooter[] afterwards. (_label, _items_count, [_height_in_items=-1])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_list_box_header_items",
                    "returnType": 2
                },
                {
                    "id": "440d353f-e9d5-4dd5-b5a8-098bfbfa80b3",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_list_box_footer",
                    "help": "terminate the scrolling region ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_list_box_footer",
                    "returnType": 2
                },
                {
                    "id": "3d5e72fd-cdec-4914-91cc-65613c296128",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_show_style_editor",
                    "help": "add style editor block [not a window]. you can pass in a reference ImGuiStyle structure to compare to, revert to and save to [else it uses the default style] ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_show_style_editor",
                    "returnType": 2
                },
                {
                    "id": "e24f557d-4379-441a-a0a0-9464b616797d",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_style_colors_classic",
                    "help": "use classic colors ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_style_colors_classic",
                    "returnType": 2
                },
                {
                    "id": "2f189e67-90d1-4a0f-ac46-c8ce4b598c36",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_style_colors_dark",
                    "help": "use dark colors ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_style_colors_dark",
                    "returnType": 2
                },
                {
                    "id": "4a55df2c-befe-4c8a-a4b1-8d3cc18c0dff",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_style_colors_light",
                    "help": "use light colors ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_style_colors_light",
                    "returnType": 2
                },
                {
                    "id": "22464456-5eca-42f2-83bd-379e158ba0c4",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_show_style_selector",
                    "help": "show the style selector widget (_label)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_show_style_selector",
                    "returnType": 2
                },
                {
                    "id": "df7126a6-5212-4b21-bc39-9ec540c94e3a",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_set_tooltip",
                    "help": "set text tooltip under mouse-cursor, typically use with ImGui::IsItemHovered[]. overidde any previous call to SetTooltip[]. (_tooltip_text)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_set_tooltip",
                    "returnType": 2
                },
                {
                    "id": "516ef314-28d9-46f3-bd8c-499df7a6f4f2",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_begin_tooltip",
                    "help": "begin\/append a tooltip window. to create full-featured tooltip [with any kind of contents]. ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_begin_tooltip",
                    "returnType": 2
                },
                {
                    "id": "ea3d327b-608e-4c88-a6e7-786ecb029130",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_end_tooltip",
                    "help": "end a tooltip window ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_end_tooltip",
                    "returnType": 2
                },
                {
                    "id": "0f4daf64-db12-4519-a30e-5b93800b699b",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_value",
                    "help": "Output single value in \"name: value\" format [tip: freely declare more in your code to handle your types. you can add functions to the ImGui namespace] (_prefix, _val_type, _val, [_float_format])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_value",
                    "returnType": 2
                },
                {
                    "id": "921ebd65-0844-43d5-9dcb-364c5024492d",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_color_convert_u32_to_float4",
                    "help": "convert a u32 color to a float 4 (_color)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_color_convert_u32_to_float4",
                    "returnType": 2
                },
                {
                    "id": "6f12e8e1-b920-4749-8070-c32d6080fab9",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_color_convert_float4_to_u32",
                    "help": "convert a float4 color to a u32 (_r_or_array4, [_g=undefined], [_b=undefined], [_a=undefined])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_color_convert_float4_to_u32",
                    "returnType": 2
                },
                {
                    "id": "7dde260b-d894-4cbf-a87c-100e7bd75110",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_color_convert_rgb_to_hsv",
                    "help": "convert rgb to hsv (_r, _g, _b)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_color_convert_rgb_to_hsv",
                    "returnType": 2
                },
                {
                    "id": "a56b75d2-dca3-4391-9acd-1b8ad59f0be0",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_color_convert_hsv_to_rgb",
                    "help": "convert rgb to hsv (_h, _s, _b)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_color_convert_hsv_to_rgb",
                    "returnType": 2
                },
                {
                    "id": "61a581c2-e399-4bf4-914f-25963a086b32",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_is_item_hovered",
                    "help": "is the last item hovered by mouse [and usable]? ([_flags=0])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_is_item_hovered",
                    "returnType": 2
                },
                {
                    "id": "6a841353-8251-4554-b52c-80529d60de22",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_is_item_active",
                    "help": "is the last item active? [e.g. button being held, text field being edited- items that don't interact will always return false] ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_is_item_active",
                    "returnType": 2
                },
                {
                    "id": "ef6a9bf9-264a-4f6d-b21d-3305054dff74",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_is_item_clicked",
                    "help": "is the last item clicked? [e.g. button\/node just clicked on] ([_button=0])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_is_item_clicked",
                    "returnType": 2
                },
                {
                    "id": "b579ab69-5899-42e9-ba0d-8d893c8e0d28",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_is_item_visible",
                    "help": "is the last item visible? [aka not out of sight due to clipping\/scrolling.] ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_is_item_visible",
                    "returnType": 2
                },
                {
                    "id": "9a04a917-f956-46c3-853b-0834a8f560da",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_is_any_item_hovered",
                    "help": "are any items hovered ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_is_any_item_hovered",
                    "returnType": 2
                },
                {
                    "id": "7f7931e9-8ce0-45b3-b19a-e7831f629e65",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_is_any_item_active",
                    "help": "are any items active ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_is_any_item_active",
                    "returnType": 2
                },
                {
                    "id": "67786837-3aaa-4b95-ba34-278e6d98d34d",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_get_item_rect_min",
                    "help": "get bounding rect of last item in screen space ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_get_item_rect_min",
                    "returnType": 2
                },
                {
                    "id": "43c0ec18-5cf7-4bc4-8e4c-41ec29b02ea6",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_get_item_rect_max",
                    "help": "get bounding rect of last item in screen space ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_get_item_rect_max",
                    "returnType": 2
                },
                {
                    "id": "86b53359-9a76-46dd-88c6-ffc14e17fbc5",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_get_item_rect_size",
                    "help": "get bounding rect of last item in screen space ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_get_item_rect_size",
                    "returnType": 2
                },
                {
                    "id": "bc1f3655-64f0-48fd-855a-48bb6dc4a998",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_set_item_allow_overlap",
                    "help": "allow last item to be overlapped by a subsequent item. sometimes useful with invisible buttons, selectables, etc. to catch unused area. ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_set_item_allow_overlap",
                    "returnType": 2
                },
                {
                    "id": "dd77f1f4-2949-4e86-8b29-d8829a91ae2d",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_is_window_focused",
                    "help": "is current Begin[]-ed window focused? ([_flags=0])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_is_window_focused",
                    "returnType": 2
                },
                {
                    "id": "648335c1-eeda-4919-962d-9b1f3a8dff79",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_is_window_hovered",
                    "help": "is current Begin[]-ed window hovered [and typically: not blocked by a popup\/modal]? ([_flags=0])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_is_window_hovered",
                    "returnType": 2
                },
                {
                    "id": "71fa0652-4594-49a2-b972-da75db06ae76",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_is_any_window_hovered",
                    "help": "is mouse hovering any visible window ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_is_any_window_hovered",
                    "returnType": 2
                },
                {
                    "id": "9c8e81f8-9fdf-4aa2-8a64-69f67e2057f8",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_is_rect_visible",
                    "help": "test if a rectangle is visible \/ not clipped (_size_or_min_x, _size_or_min_y, [_max_x], [_max_y])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_is_rect_visible",
                    "returnType": 2
                },
                {
                    "id": "15a06d34-dbd9-4a6f-b60b-b0d84cbf32af",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_get_time",
                    "help": "get the time ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_get_time",
                    "returnType": 2
                },
                {
                    "id": "b90cd2c8-f20c-4989-9dc9-d3b6b6347cc4",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_get_frame_count",
                    "help": "get the time ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_get_frame_count",
                    "returnType": 2
                },
                {
                    "id": "ed388619-e038-4db9-8bc4-c896ae9c8053",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_get_style_color_name",
                    "help": "get the style color's name (_idx)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_get_style_color_name",
                    "returnType": 2
                },
                {
                    "id": "97136529-5882-4516-b6af-103111961aae",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_calc_item_rect_closest_point",
                    "help": "utility to find the closest point the last item bounding rectangle edge. useful to visually link items (_pos_x, _pos_y, [_on_edge=false], [_outward=+0.0]))",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_calc_item_rect_closest_point",
                    "returnType": 2
                },
                {
                    "id": "4f5e20d2-997e-4264-bbb5-89c13121b28b",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_calc_text_size",
                    "help": "Calculate text size. Text can be multi-line. Optionally ignore text after a ## marker. (_text, [_text_end=undefined], [_hide_text_after_double_hash=false], [_wrap_width=-1.0f]);)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_calc_text_size",
                    "returnType": 2
                },
                {
                    "id": "150ab8f7-2d36-49c3-a58b-54c622c4d044",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_calc_list_clipping",
                    "help": "calculate coarse clipping for large list of evenly sized items. Prefer using the ImGuiListClipper higher-level helper if you can. (_items_count, _items_height)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_calc_list_clipping",
                    "returnType": 2
                },
                {
                    "id": "a8ef5b0a-47a6-46bf-a376-431d43279208",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_push_clip_rect",
                    "help": "(_min_x, _min_y, _max_x, _max_y, _intersect_with_current_clip_rect)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_push_clip_rect",
                    "returnType": 2
                },
                {
                    "id": "98594839-4595-4257-834c-f10b20688cb1",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_pop_clip_rect",
                    "help": "pop the clip rect ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_pop_clip_rect",
                    "returnType": 2
                },
                {
                    "id": "6b618dba-0a33-4d65-8835-19eef31d1ead",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_slider_float",
                    "help": "adjust display_format to decorate the value with a prefix or a suffix for in-slider labels or unit display. Use power!=1.0 for logarithmic sliders (_label, _val, _min, _max, [_display_fmt=\"%.3f\"], [_power=1.0]))",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_slider_float",
                    "returnType": 2
                },
                {
                    "id": "c6eba779-91ee-4ece-99ec-cfa5aadb9853",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_slider_float2",
                    "help": "adjust display_format to decorate the value with a prefix or a suffix for in-slider labels or unit display. Use power!=1.0 for logarithmic sliders (_label, _val, _val2, _min, _max, [_display_fmt=\"%.3f\"], [_power=1.0]))",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_slider_float2",
                    "returnType": 2
                },
                {
                    "id": "a424a191-83f4-42c0-9eeb-5da00491249a",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_slider_float3",
                    "help": "adjust display_format to decorate the value with a prefix or a suffix for in-slider labels or unit display. Use power!=1.0 for logarithmic sliders (_label, _val, _val2, _val3, _min, _max, [_display_fmt=\"%.3f\"], [_power=1.0]))",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_slider_float3",
                    "returnType": 2
                },
                {
                    "id": "aa10ec33-f58d-4d35-b173-60a0b8b9adb8",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_slider_float4",
                    "help": "adjust display_format to decorate the value with a prefix or a suffix for in-slider labels or unit display. Use power!=1.0 for logarithmic sliders (_label, _val, _val2, _val3, _val4, _min, _max, [_display_fmt=\"%.3f\"], [_power=1.0]))",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_slider_float4",
                    "returnType": 2
                },
                {
                    "id": "a418d7f2-4b39-45a8-a2c4-1c2c4ceba39f",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_slider_angle",
                    "help": "angle slider (_label, _rad, [_degree_min=-360.0], [_degree_max=360.0])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_slider_angle",
                    "returnType": 2
                },
                {
                    "id": "d9ea0a56-fde3-4d7e-a136-d300730fd2de",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_slider_int",
                    "help": "add an integer slider (_label, _v, _v_min, _v_max, [_display_fmt=\"%.0f\"])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_slider_int",
                    "returnType": 2
                },
                {
                    "id": "1e640bf0-b350-4005-9ee3-92b876755e59",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_slider_int2",
                    "help": "add an integer slider (_label, _v, _v2, _v_min, _v_max, [_display_fmt=\"%.0f\"])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_slider_int2",
                    "returnType": 2
                },
                {
                    "id": "ae4dd40e-5734-4787-af56-5ef4e7fd0894",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_slider_int3",
                    "help": "add an integer slider (_label, _v, _v2, _v3, _v_min, _v_max, [_display_fmt=\"%.0f\"])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_slider_int3",
                    "returnType": 2
                },
                {
                    "id": "1ec46102-b671-4286-a451-d355d4977991",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_slider_int4",
                    "help": "add an integer slider (_label, _v, _v2, _v3, _v4, _v_min, _v_max, [_display_fmt=\"%.0f\"])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_slider_int4",
                    "returnType": 2
                },
                {
                    "id": "d1b0741c-cd3b-410e-a636-b0604e387664",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_vslider_float",
                    "help": "a vslider float? (_label, _size_x, _size_y, _v, _v_min, _v_max, [_display_fmt=\"%.0f\"])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_vslider_float",
                    "returnType": 2
                },
                {
                    "id": "2727c892-0386-4584-a9ca-865e80afccb3",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_vslider_int",
                    "help": "a vslider int? (_label, _size_x, _size_y, _v, _v_min, _v_max, [_display_fmt=\"%.0f\"])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_vslider_int",
                    "returnType": 2
                },
                {
                    "id": "b917d413-f513-4c6e-bdea-198d1b493d32",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_color_edit3",
                    "help": "show a color edit field (_label, _r_or_array3, [_g=undefined], [_b=undefined], [_flags=0])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_color_edit3",
                    "returnType": 2
                },
                {
                    "id": "1133f1c9-8a9e-4a8a-8b33-8e5d8013b070",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_color_edit4",
                    "help": "show a color edit field (_label, _r_or_array4, [_g=undefined], [_b=undefined], [_a=undefined], [_flags=0])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_color_edit4",
                    "returnType": 2
                },
                {
                    "id": "a127ce49-5ab5-4e42-8157-b54882061aad",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_color_picker3",
                    "help": "show a color edit field (_label, _r_or_array4, [_g=undefined], [_b=undefined], [_flags=0])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_color_picker3",
                    "returnType": 2
                },
                {
                    "id": "ab7dc480-a144-4f3d-b0d5-0a7015e5da81",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_color_picker4",
                    "help": "show a color edit field (_label, _r_or_array4, [_g=undefined], [_b=undefined], [_a=undefined], [_flags=0])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_color_picker4",
                    "returnType": 2
                },
                {
                    "id": "a7c59808-211d-47ae-95ef-9906b2fb3e14",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_color_button",
                    "help": "display a colored square\/button, hover for details, return true when pressed. (_desc_id, _r, _g, _b, _a, [_flags=0], [_size_x=0], [_size_y=0]))",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_color_button",
                    "returnType": 2
                },
                {
                    "id": "ed01a2a5-66d0-4748-839d-064ea4c17f60",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_set_color_edit_options",
                    "help": "initialize current options [generally on application startup] if you want to select a default format, picker type, etc. User will be able to change many settings, unless you pass the _NoOptions flag to your calls. ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_set_color_edit_options",
                    "returnType": 2
                },
                {
                    "id": "daa476c9-934c-46dc-b7b9-abf35020ba8b",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_drag_float",
                    "help": "If v_min >= v_max we have no bound (_label, _v, [_v_speed=1.0], [_v_min=0.0], [_v_max=0.0], [_displayFmt=\"%.3f\"], [_power=1.0])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_drag_float",
                    "returnType": 2
                },
                {
                    "id": "993722f7-faaa-4d2b-9890-8feff9c184dc",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_drag_float2",
                    "help": "If v_min >= v_max we have no bound (_label, _v, _v2, [_v_speed=1.0], [_v_min=0.0], [_v_max=0.0], [_displayFmt=\"%.3f\"], [_power=1.0])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_drag_float2",
                    "returnType": 2
                },
                {
                    "id": "00412557-7fcc-413e-8f6e-e79e897a9cf8",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_drag_float3",
                    "help": "If v_min >= v_max we have no bound (_label, _v, _v2, _v3, [_v_speed=1.0], [_v_min=0.0], [_v_max=0.0], [_displayFmt=\"%.3f\"], [_power=1.0])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_drag_float3",
                    "returnType": 2
                },
                {
                    "id": "63dfd11b-b06d-4692-b47d-5cd3e8a4b410",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_drag_float4",
                    "help": "If v_min >= v_max we have no bound (_label, _v, _v2, _v3, _v4, [_v_speed=1.0], [_v_min=0.0], [_v_max=0.0], [_displayFmt=\"%.3f\"], [_power=1.0])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_drag_float4",
                    "returnType": 2
                },
                {
                    "id": "68ed2245-7c8b-4c5e-b262-127d1fdbbf31",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_drag_float_range2",
                    "help": "drag an integer range 2? (_label, _v_current_min, _v_current_max, [_v_speed=1.0], [_v_min=0.0], [_v_max=0.0], [_displayFmt=\"%.0f\"], [_displayFmtMax=undefined], [_power=1.0])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_drag_float_range2",
                    "returnType": 2
                },
                {
                    "id": "c8ca6e83-574d-4f1f-af6f-17dad424b1ae",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_drag_int",
                    "help": "If v_min >= v_max we have no bound (_label, _v, [_v_speed=1.0], [_v_min=0.0], [_v_max=0.0], [_displayFmt=\"%.0f\"])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_drag_int",
                    "returnType": 2
                },
                {
                    "id": "74c606d2-9b31-4b22-a57e-9ba75af24e94",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_drag_int2",
                    "help": "If v_min >= v_max we have no bound (_label, _v, _v2, [_v_speed=1.0], [_v_min=0.0], [_v_max=0.0], [_displayFmt=\"%.0f\"])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_drag_int2",
                    "returnType": 2
                },
                {
                    "id": "d2572fd5-ac7c-4a39-afad-ad07c77401ef",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_drag_int3",
                    "help": "If v_min >= v_max we have no bound (_label, _v, _v2, _v3, [_v_speed=1.0], [_v_min=0.0], [_v_max=0.0], [_displayFmt=\"%.0f\"])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_drag_int3",
                    "returnType": 2
                },
                {
                    "id": "e4530442-59fd-4985-a60a-8c52626bc8a6",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_drag_int4",
                    "help": "If v_min >= v_max we have no bound (_label, _v, _v2, _v3, _v4, [_v_speed=1.0], [_v_min=0.0], [_v_max=0.0], [_displayFmt=\"%.0f\"])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_drag_int4",
                    "returnType": 2
                },
                {
                    "id": "db4dce48-ee16-4616-bb7e-bdbaa4961ec1",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_drag_int_range2",
                    "help": "drag an integer range 2? (_label, _v_current_min, _v_current_max, [_v_speed=1.0], [_v_min=0], [_v_max=0], [_displayFmt=\"%.0f\"], [_displayFmtMax=undefined])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_drag_int_range2",
                    "returnType": 2
                },
                {
                    "id": "f0c14ba4-e1c8-43b4-a8a3-4bd6dd5747ad",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_input_text",
                    "help": "add an input text field (_label, _text, _max_length, [_flags=0], [_callback=noone], [_userdata=undefined])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_input_text",
                    "returnType": 2
                },
                {
                    "id": "0fccfe79-5cf3-4e9f-9805-15326eb4d850",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_input_text_multiline",
                    "help": "add an input text field (_label, _text, _max_len, _size_x, _size_y, [_flags=0], [_callback=noone], [_userdata=undefined])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_input_text_multiline",
                    "returnType": 2
                },
                {
                    "id": "b2fa0320-3bf3-41cf-8ea9-782a3a41ccd6",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_input_float",
                    "help": "keyboard input field float (_label, _val, [_step=0.0f], [_step_fast=0.0f], [_decimal_precision=-1], [_extra_flags=0]))",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_input_float",
                    "returnType": 2
                },
                {
                    "id": "8fd573d4-f829-44c5-a129-0e9ab0d00ac1",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_input_float2",
                    "help": "keyboard input field float (_label, _val, _val2, [_decimal_precision=-1], [_extra_flags=0]))",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_input_float2",
                    "returnType": 2
                },
                {
                    "id": "39e95110-dcc6-4af1-b93a-e789ecd42189",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_input_float3",
                    "help": "keyboard input field float (_label, _val, _val2, _val3, [_decimal_precision=-1], [_extra_flags=0]))",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_input_float3",
                    "returnType": 2
                },
                {
                    "id": "e44c1c59-d6ae-4291-9ac6-f6ed9ff40ee1",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_input_float4",
                    "help": "keyboard input field float (_label, _val, _val2, _val3, _val4, [_decimal_precision=-1], [_extra_flags=0]))",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_input_float4",
                    "returnType": 2
                },
                {
                    "id": "5f00c51d-ec12-43ac-bfa6-21d888a53b69",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_input_int",
                    "help": "keyboard input field float (_label, _val, [_step=1], [_step_fast=100], [_extra_flags=0]))",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_input_int",
                    "returnType": 2
                },
                {
                    "id": "959b65a0-b5f6-44d5-b1b2-4952fdcd0b57",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_input_int2",
                    "help": "keyboard input field float (_label, _val, _val2, [_extra_flags=0]))",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_input_int2",
                    "returnType": 2
                },
                {
                    "id": "56875575-559d-47a1-bcf4-9ff806932521",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_input_int3",
                    "help": "keyboard input field float (_label, _val, _val2, _val3, [_extra_flags=0]))",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_input_int3",
                    "returnType": 2
                },
                {
                    "id": "0beb23ac-a909-4070-a3bd-4483a3a0cb81",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_input_int4",
                    "help": "keyboard input field float (_label, _val, _val2, _val3, _val4, [_extra_flags=0]))",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_input_int4",
                    "returnType": 2
                },
                {
                    "id": "02da9173-b762-4084-a579-690db516633f",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_button",
                    "help": "ImGui::Button[] (_label, [_size_x=0.0], [_size_y=0.0])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_button",
                    "returnType": 2
                },
                {
                    "id": "15bff1fa-ecad-4161-a2d9-0d743df9c649",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_small_button",
                    "help": "button with FramePadding=[0,0] to easily embed within text (_label)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_small_button",
                    "returnType": 2
                },
                {
                    "id": "b7d00dfb-853d-46b7-bd25-7d8adeb1c927",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_invisible_button",
                    "help": "ImGui::InvisibleButton[] (_str_id, [_size_x=0.0], [_size_y=0.0])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_invisible_button",
                    "returnType": 2
                },
                {
                    "id": "d286220b-4927-420a-88da-97c25138692b",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_image",
                    "help": "ImGui::Image[] (_texture_id, _size_x, _size_y, [_u0=0.0], [_v0=0.0], [_u1=1.0], [_v1=1.0], [_tint_r=1.0], [_tint_g=1.0], [_tint_b=1.0], [_tint_a=1.0], [_border_r=0.0], [_border_g=0.0], [_border_b=0.0], [_border_a=0.0])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_image",
                    "returnType": 2
                },
                {
                    "id": "c8666ea0-9586-4117-8547-81a674d2ba37",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_surface",
                    "help": "ImGui::Image[] (_surface, [width=undefined], [height=undefined], [_u0=0.0], [_v0=0.0], [_u1=1.0], [_v1=1.0], [_tint_r=1.0], [_tint_g=1.0], [_tint_b=1.0], [_tint_a=1.0], [_border_r=0.0], [_border_g=0.0], [_border_b=0.0], [_border_a=0.0])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_surface",
                    "returnType": 2
                },
                {
                    "id": "74155a71-a20a-4959-825f-36e7c7e769ed",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_sprite",
                    "help": "ImGui::Image[] (_sprite_index, _sub_img, [_width=undefined], [_height=undefined], [_tint_r=1.0], [_tint_g=1.0], [_tint_b=1.0], [_tint_a=1.0], [_border_r=0.0], [_border_g=0.0], [_border_b=0.0], [_border_a=0.0])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_sprite",
                    "returnType": 2
                },
                {
                    "id": "aa4bacdd-ad1e-415c-bb1a-1f0057f7b3e6",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_image_button",
                    "help": "ImGui::ImageButton[] (_texture_id, _size_x, _size_y, [_u0=0.0], [_v0=0.0], [_u1=1.0], [_v1=1.0], [_frame_padding=-1], [_bg_r=0.0], [_bg_g=0.0], [_bg_b=0.0], [_bg_a=0.0], [_tint_r=1.0], [_tint_g=1.0], [_tint_b=1.0], [_tint_a=1.0])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_image_button",
                    "returnType": 2
                },
                {
                    "id": "92f8e77c-6aff-4102-a9f6-2d2f0a4f89d6",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_surface_button",
                    "help": "Add an ImGui button that uses a surface for its appearance (_surface, [width=undefined], [height=undefined], [_u0=0.0], [_v0=0.0], [_u1=1.0], [_v1=1.0], [_frame_padding=-1], [_bg_r=0.0], [_bg_g=0.0], [_bg_b=0.0], [_bg_a=0.0], [_tint_r=1.0], [_tint_g=1.0], [_tint_b=1.0], [_tint_a=1.0])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_surface_button",
                    "returnType": 2
                },
                {
                    "id": "8ad06841-c3c2-4220-8e7b-8cc438154711",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_sprite_button",
                    "help": "ImGui::ImageButton[] (_sprite_index, _sub_img, [_width=undefined], [_height=undefined], [_frame_padding=-1], [_bg_r=0.0], [_bg_g=0.0], [_bg_b=0.0], [_bg_a=0.0], [_tint_r=1.0], [_tint_g=1.0], [_tint_b=1.0], [_tint_a=1.0])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_sprite_button",
                    "returnType": 2
                },
                {
                    "id": "bfed4e94-8d16-4d3e-a90c-0b069ba5300a",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_checkbox",
                    "help": "ImGui::Checkbox[] (_label, _val)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_checkbox",
                    "returnType": 2
                },
                {
                    "id": "8f0738db-364c-4ed9-aab8-a7679f7847fa",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_checkbox_flags",
                    "help": "Show a checkbox with multiple flags (_label, _flags, _flag_val)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_checkbox_flags",
                    "returnType": 2
                },
                {
                    "id": "b0c63e4e-ecc2-4914-b6c1-e7ef96511417",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_radio_button",
                    "help": "Show a radio button [multiple choice, single answer] (_label, _activeOrVal, _current_val)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_radio_button",
                    "returnType": 2
                },
                {
                    "id": "26f72f2e-7775-4e78-b67c-6372c65c70b8",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_plot_lines",
                    "help": "Plots a line graph, index as x axis values for y (_label, _values, [_values_offset=0], [_overlay=undefined], [_scale_min=undefined], [_scale_max=undefined], [_graph_size_x=0], [_graph_size_y=0], [_stride=sizeof(float)])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_plot_lines",
                    "returnType": 2
                },
                {
                    "id": "b84fb213-662d-4465-b29a-9ccc6b44abab",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_plot_histogram",
                    "help": "Plots a histogram. (_label, _values, [_values_offset=0], [_overlay=undefined], [_scale_min=undefined], [_scale_max=undefined], [_graph_size_x=0], [_graph_size_y=0], [_stride=sizeof(float)])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_plot_histogram",
                    "returnType": 2
                },
                {
                    "id": "b893c9a9-ccc3-4aed-8469-aabafe7c6bf0",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_progress_bar",
                    "help": "(_fraction, [_size_x=-1.0], [_size_y=0.0], [_overlay=undefined])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_progress_bar",
                    "returnType": 2
                },
                {
                    "id": "8966b07a-0c69-40fe-8ebc-ed98993f14e2",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "__imguigml_image",
                    "help": "internal imguigml  call to draw an image using the `_texture_id` texture (_texture_id, _size_x, _size_y, [_u0=0.0], [_v0=0.0], [_u1=1.0], [_v1=1.0], [_tint_r=1.0], [_tint_g=1.0], [_tint_b=1.0], [_tint_a=1.0], [_border_r=0.0], [_border_g=0.0], [_border_b=0.0], [_border_a=0.0])",
                    "hidden": false,
                    "kind": 1,
                    "name": "__imguigml_image",
                    "returnType": 2
                },
                {
                    "id": "42f2d623-54a5-4323-b1a3-a9082a4e84d0",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "__imguigml_image_button",
                    "help": "Add a button using the texture stored at `_texture_id` for the appearance (_texture_id, _size_x, _size_y, [_u0=0.0], [_v0=0.0], [_u1=1.0], [_v1=1.0], [_frame_padding=-1], [_bg_r=0.0], [_bg_g=0.0], [_bg_b=0.0], [_bg_a=0.0], [_tint_r=1.0], [_tint_g=1.0], [_tint_b=1.0], [_tint_a=1.0])",
                    "hidden": false,
                    "kind": 1,
                    "name": "__imguigml_image_button",
                    "returnType": 2
                },
                {
                    "id": "b7fac35b-cecf-45e6-adef-63fd04166558",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_text",
                    "help": "simple formatted text (_text)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_text",
                    "returnType": 2
                },
                {
                    "id": "3b68551b-b1a6-49f2-99e9-4477b0843f7d",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_text_colored",
                    "help": "shortcut for PushStyleColor[ImGuiCol_Text, style.Colors[ImGuiCol_TextDisabled]]; Text[fmt, ...]; PopStyleColor[]; (_r, _g, _b, _a, _text)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_text_colored",
                    "returnType": 2
                },
                {
                    "id": "9e82a9ee-7e22-4953-8d8b-70808c33f23a",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_text_disabled",
                    "help": "shortcut for PushStyleColor[ImGuiCol_Text, style.Colors[ImGuiCol_TextDisabled]]; Text[fmt, ...]; PopStyleColor[]; (_text)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_text_disabled",
                    "returnType": 2
                },
                {
                    "id": "04b19481-fdd1-4e5b-8d29-810e73e96d08",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_text_wrapped",
                    "help": "shortcut for `imguigml_push_text_wrap_pos[0.0f]; imguigml_text[_text]; imguigml_pop_text_wrap_pos[];`. (_text)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_text_wrapped",
                    "returnType": 2
                },
                {
                    "id": "33182452-674f-4fd6-b0d2-d74ed8704726",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_label_text",
                    "help": "display text+label aligned the same way as value+label widgets (_label, _text)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_label_text",
                    "returnType": 2
                },
                {
                    "id": "6874c129-e363-4a98-b0e7-e37fd3d1dd73",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_bullet_text",
                    "help": "shortcut for Bullet[]+Text[] (_text)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_bullet_text",
                    "returnType": 2
                },
                {
                    "id": "90451654-6452-442a-84f3-a9ba937e78ee",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_bullet",
                    "help": "draw a small circle and keep the cursor on the same line.       advance cursor x position by GetTreeNodeToLabelSpacing[], same distance that TreeNode[] uses ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_bullet",
                    "returnType": 2
                },
                {
                    "id": "7f26032e-34ec-4c44-a49a-ef2a4f6b41db",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_tree_node",
                    "help": "begin a tree node (_labelOrId)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_tree_node",
                    "returnType": 2
                },
                {
                    "id": "d3d503e1-2b37-4b5a-a28b-7e25a3c32be2",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_tree_node_ex",
                    "help": "begin a tree node (_labelOrId, [_flags=0])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_tree_node_ex",
                    "returnType": 2
                },
                {
                    "id": "3e238a78-33d0-4ddf-b31a-d8c56104133a",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_tree_push",
                    "help": "Indent[]+PushId[]. Already called by TreeNode[] when returning true, but you can call Push\/Pop yourself for layout purpose (_labelOrId)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_tree_push",
                    "returnType": 2
                },
                {
                    "id": "5b780f43-936e-404a-8f88-3eaf1fd9739c",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_tree_pop",
                    "help": "~ Unindent[]+PopId[] ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_tree_pop",
                    "returnType": 2
                },
                {
                    "id": "d48a14da-52c3-4ebc-8ad2-ba50889f44e0",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_tree_advance_to_label_pos",
                    "help": "advance cursor x position by GetTreeNodeToLabelSpacing[] ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_tree_advance_to_label_pos",
                    "returnType": 2
                },
                {
                    "id": "b65f82fc-7bd4-4b39-8b3b-637d44cd2daf",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_get_tree_node_to_label_spacing",
                    "help": "()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_get_tree_node_to_label_spacing",
                    "returnType": 2
                },
                {
                    "id": "2db7c31b-31d9-41f8-a156-1985b2e32b39",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_set_next_tree_node_open",
                    "help": "set next TreeNode\/CollapsingHeader open state. (_is_open, [_cond=0])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_set_next_tree_node_open",
                    "returnType": 2
                },
                {
                    "id": "2dd71b2a-1fdb-4cd0-b54d-995dff242615",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_collapsing_header",
                    "help": "add a collapsing header (_label, [_open=undefined], [_flags=0])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_collapsing_header",
                    "returnType": 2
                },
                {
                    "id": "94294169-b63b-4700-b93f-81b6c50dd15b",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_begin",
                    "help": "Push a new ImGui window to add widgets to. (_name, [_open=undefined], [_flags=0])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_begin",
                    "returnType": 2
                },
                {
                    "id": "ee79bcf6-ab9b-4778-bd09-83d03f6d8f82",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_end",
                    "help": "ImGui::End[] ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_end",
                    "returnType": 2
                },
                {
                    "id": "7b3f85da-bd37-4c6b-ae7f-b8372d4dc230",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_begin_child",
                    "help": "begin a scrolling region. each axis can use a different mode, e.g. ImVec2[0,400]. (_id, [_size_x=0], [_size_y=0], [_border=false], [_extra_flags=0])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_begin_child",
                    "returnType": 2
                },
                {
                    "id": "027cf3b4-9531-42fc-bd3d-0c6b50fd1b5e",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_end_child",
                    "help": "end a scrolling region ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_end_child",
                    "returnType": 2
                },
                {
                    "id": "47e06de4-a72d-4b3d-8790-ffee39bda66d",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_get_content_region_max",
                    "help": "current content boundaries [typically window boundaries including scrolling, or current column boundaries], in windows coordinates ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_get_content_region_max",
                    "returnType": 2
                },
                {
                    "id": "1630d447-2c99-4671-9907-ae3bf0c33a66",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_get_content_region_avail",
                    "help": "== GetContentRegionMax[] - GetCursorPos[] ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_get_content_region_avail",
                    "returnType": 2
                },
                {
                    "id": "9de738c3-b5b7-40db-a64b-0c27371fdc24",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_get_content_region_avail_width",
                    "help": "get available width ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_get_content_region_avail_width",
                    "returnType": 2
                },
                {
                    "id": "0038f768-a78b-48a6-b147-f841d2189ed0",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_get_window_content_region_min",
                    "help": "content boundaries min [roughly [0,0]-Scroll], in window coordinates ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_get_window_content_region_min",
                    "returnType": 2
                },
                {
                    "id": "413c684f-8975-4754-baea-8f0547dfa9e9",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_get_window_content_region_max",
                    "help": "content boundaries max [roughly [0,0]+Size-Scroll] where Size can be override with SetNextWindowContentSize[], in window coordinates ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_get_window_content_region_max",
                    "returnType": 2
                },
                {
                    "id": "44c1fc9b-fe9b-4aa4-8cf2-71a98cc848d0",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_get_window_content_region_width",
                    "help": "content width in windows coordinates ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_get_window_content_region_width",
                    "returnType": 2
                },
                {
                    "id": "06e96e9e-0893-405d-83da-01e11ced10ca",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_get_window_pos",
                    "help": "get current window position in screen space [useful if you want to do your own drawing via the DrawList api] ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_get_window_pos",
                    "returnType": 2
                },
                {
                    "id": "8727c5ee-fff5-4f66-bc2d-2f74136dbc6b",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_get_window_size",
                    "help": "get current window size ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_get_window_size",
                    "returnType": 2
                },
                {
                    "id": "a229ad75-eccb-4168-95d5-38b6a3bd21e1",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_get_window_width",
                    "help": "get current window width ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_get_window_width",
                    "returnType": 2
                },
                {
                    "id": "aad2f2ca-a298-42a6-a9e4-822c909d0883",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_get_window_height",
                    "help": "get current window height ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_get_window_height",
                    "returnType": 2
                },
                {
                    "id": "8360786c-6cff-4af9-9baa-7b5e53056e33",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_is_window_collapsed",
                    "help": "is current window collapsed ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_is_window_collapsed",
                    "returnType": 2
                },
                {
                    "id": "30cf8239-0fa3-4848-8a2a-b106c44dacbd",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_is_window_appearing",
                    "help": "is current window appearing ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_is_window_appearing",
                    "returnType": 2
                },
                {
                    "id": "fd881dfb-ddba-4758-8c33-75f28e4c54d7",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_set_window_font_scale",
                    "help": "per-window font scale. Adjust IO.FontGlobalScale if you want to scale all windows (_scale)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_set_window_font_scale",
                    "returnType": 2
                },
                {
                    "id": "51839523-6ce0-4f34-9137-c95e4dc286a5",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_set_next_window_pos",
                    "help": "set next window position. call before Begin[]. use pivot=[0.5f,0.5f] to center on given point, etc. (_x, _y, [_cond=0], [_pivot_x, [_pivot_y)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_set_next_window_pos",
                    "returnType": 2
                },
                {
                    "id": "e272d65a-cd35-462d-8ae3-690153dd3608",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_set_next_window_size",
                    "help": "set next window size. set axis to 0.0f to force an auto-fit on this axis. call before Begin[] (_x, _y, [_cond=0])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_set_next_window_size",
                    "returnType": 2
                },
                {
                    "id": "f349b209-3192-46de-8f73-95cda819e95a",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_set_next_window_size_constraints",
                    "help": "set next window size limits. use -1,-1 on either X\/Y axis to preserve the current size. (_min_x, _min_y, _max_x, _max_y, [_cond=0])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_set_next_window_size_constraints",
                    "returnType": 2
                },
                {
                    "id": "a007b9eb-44ed-4a79-bfdd-526201b25ee6",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_set_next_window_content_size",
                    "help": "set next window content size [enforce the range of scrollbars]. set axis to 0.0f to leave it automatic. call before Begin[] (_size_x, _size_y)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_set_next_window_content_size",
                    "returnType": 2
                },
                {
                    "id": "25715a72-e4d6-4af1-b24b-4e52bd548188",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_set_next_window_collapsed",
                    "help": "set next window collapsed state. call before Begin[] (_collapsed, [_cond=0])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_set_next_window_collapsed",
                    "returnType": 2
                },
                {
                    "id": "a5be10e2-a684-420b-b1fb-1835e435a64d",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_set_next_window_focus",
                    "help": "set next window to be focused \/ front-most. call before Begin[] ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_set_next_window_focus",
                    "returnType": 2
                },
                {
                    "id": "57595e23-d92a-4c0b-9883-0ad1525e1feb",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_set_window_pos",
                    "help": "set named window position. (_name, _pos_x, _pos_y, [_cond=0])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_set_window_pos",
                    "returnType": 2
                },
                {
                    "id": "b04a066f-7686-47ba-a031-4ae2ecc4c372",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_set_window_size",
                    "help": "set named window size. set axis to 0.0f to force an auto-fit on this axis. (_name, _size_x, _size_y, [_cond=0])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_set_window_size",
                    "returnType": 2
                },
                {
                    "id": "db43e4b7-77a8-437f-9db7-516fe0290305",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_set_window_collapsed",
                    "help": "set named window collapsed state (_name, _collapsed, [_cond=0])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_set_window_collapsed",
                    "returnType": 2
                },
                {
                    "id": "9e746116-6539-4540-92d6-1cbfe4036cf6",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_set_window_focus",
                    "help": "set named window to be focused \/ front-most. use NULL to remove focus. (_name)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_set_window_focus",
                    "returnType": 2
                },
                {
                    "id": "f3abc0e2-bf1c-48ea-b5f8-11dda82e6e67",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_get_scroll_x",
                    "help": "get scrolling amount [0..GetScrollMaxX[]] ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_get_scroll_x",
                    "returnType": 2
                },
                {
                    "id": "064ea937-42a9-4976-a78d-2582863d494f",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_get_scroll_y",
                    "help": "get scrolling amount [0..GetScrollMaxY[]] ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_get_scroll_y",
                    "returnType": 2
                },
                {
                    "id": "6ff59d54-4bde-4aa8-8755-35275cb19151",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_get_scroll_max_x",
                    "help": "get maximum scrolling amount ~~ ContentSize.X - WindowSize.X ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_get_scroll_max_x",
                    "returnType": 2
                },
                {
                    "id": "087f768a-90fd-4b1f-a84e-3ac633f37690",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_get_scroll_max_y",
                    "help": "get maximum scrolling amount ~~ ContentSize.Y - WindowSize.Y ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_get_scroll_max_y",
                    "returnType": 2
                },
                {
                    "id": "7379f113-5cd3-46d6-a64a-66f872c356c2",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_set_scroll_x",
                    "help": "set scrolling amount [0..GetScrollMaxX[]] (_scroll_x)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_set_scroll_x",
                    "returnType": 2
                },
                {
                    "id": "96150668-2c12-440f-99cc-62d0778eabc3",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_set_scroll_y",
                    "help": "set scrolling amount [0..GetScrollMaxY[]] (_scroll_y)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_set_scroll_y",
                    "returnType": 2
                },
                {
                    "id": "86be2a87-2fac-49e7-b044-bf602e85de4e",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_set_scroll_here",
                    "help": "adjust scrolling amount to make current cursor position visible. ([_center_y_ratio=0.0])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_set_scroll_here",
                    "returnType": 2
                },
                {
                    "id": "ea407964-4e2d-4d80-a35b-bc36f57fb687",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_set_scroll_from_pos_y",
                    "help": "adjust scrolling amount to make given position valid. use GetCursorPos[] or GetCursorStartPos[]+offset to get valid positions. ([_center_y_ratio=0.0])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_set_scroll_from_pos_y",
                    "returnType": 2
                },
                {
                    "id": "929d8a39-6a24-406d-a02c-1057278c94ed",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_set_keyboard_focus_here",
                    "help": "focus keyboard on the next widget. ([_offset])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_set_keyboard_focus_here",
                    "returnType": 2
                },
                {
                    "id": "430101aa-c943-4c27-9f28-ff2e815cf70d",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_set_state_storage",
                    "help": "replace tree state storage with our own [if you want to manipulate it yourself, typically clear subsection of it] (_tree)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_set_state_storage",
                    "returnType": 2
                },
                {
                    "id": "ecf64d9d-15f9-407d-bdfc-0511d0aacaa0",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_get_state_storage",
                    "help": "replace tree state storage with our own [if you want to manipulate it yourself, typically clear subsection of it] (_tree)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_get_state_storage",
                    "returnType": 2
                },
                {
                    "id": "ff60d347-22e1-405d-a9c6-03123380f46c",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_begin_child_frame",
                    "help": "helper to create a child window \/ scrolling region that looks like a normal widget frame (_guiID, _size_x, _size_y, [_extra_flags=0])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_begin_child_frame",
                    "returnType": 2
                },
                {
                    "id": "c2dab1ee-f90e-4216-b05d-64f94ec7071d",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_end_child_frame",
                    "help": "helper to create a child window \/ scrolling region that looks like a normal widget frame ([_offset])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_end_child_frame",
                    "returnType": 2
                },
                {
                    "id": "c8c40b77-1234-454e-9558-740f0550927c",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_show_metrics_window",
                    "help": "create metrics window. display ImGui internals: draw commands [with individual draw calls and vertices], window list, basic internal state, etc. ([_open=undefined])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_show_metrics_window",
                    "returnType": 2
                },
                {
                    "id": "88a2cee8-ddd3-4e1e-9ade-9544733be551",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_show_user_guide",
                    "help": "add basic help\/info block [not a window]: how to manipulate ImGui as a end-user [mouse\/keyboard controls]. ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_show_user_guide",
                    "returnType": 2
                },
                {
                    "id": "2458f828-818b-4bcd-a987-ac81e200cb60",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_show_demo_window",
                    "help": "create demo\/test window [previously called ShowTestWindow]. demonstrate most ImGui features. call this to learn about the library! try to make it always available in your application! ([_open=undefined])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_show_demo_window",
                    "returnType": 2
                },
                {
                    "id": "31af9605-1c33-48cf-b197-efeae74f77c1",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_show_font_selector",
                    "help": "show a font selector **NOTE:** Functionality is limited at this time until `ImGuiGML` has better font support (_label)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_show_font_selector",
                    "returnType": 2
                },
                {
                    "id": "5918ae33-0f4d-47aa-8fb1-cb3e5c57ea9c",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_begin_drag_drop_source",
                    "help": "call when the current item is active. If this return true, you can call imguigml_set_drag_drop_payload[] + imguigml_end_drag_drop_target[] ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_begin_drag_drop_source",
                    "returnType": 2
                },
                {
                    "id": "6b9d3ff6-17ee-404b-9c08-097b711198d9",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_set_drag_drop_payload",
                    "help": "pass an id to use to identify your payload data, or use the imgiugml_generate_payload \/ imguigml_set_payload_data \/ imguigml_release_payload_data helper functions (_type, _payload_id, [_flags=0])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_set_drag_drop_payload",
                    "returnType": 2
                },
                {
                    "id": "00c3d73e-2883-4464-8f0c-891294184802",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_end_drag_drop_source",
                    "help": "end the drag drop source ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_end_drag_drop_source",
                    "returnType": 2
                },
                {
                    "id": "7734a7f5-6942-48d5-91ba-6c8914433f7b",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_begin_drop_target",
                    "help": "call after submitting an item that may receive an item. If this returns true, you can call AcceptDragDropPayload[] + EndDragDropTarget[] ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_begin_drop_target",
                    "returnType": 2
                },
                {
                    "id": "d72125e1-604b-4d7e-943c-d747416e122c",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_accept_drag_drop_payload",
                    "help": "accept contents of a given type. If ImGuiDragDropFlags_AcceptBeforeDelivery is set you can peek into the payload before the mouse button is released. (_type, [_flags=0])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_accept_drag_drop_payload",
                    "returnType": 2
                },
                {
                    "id": "5b6b3582-c4c2-4636-a04f-c0930cf175fe",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_end_drag_drop_target",
                    "help": "end drag drop target ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_end_drag_drop_target",
                    "returnType": 2
                },
                {
                    "id": "f3a7afee-4fb4-45ba-8dc5-4a98f0be1c78",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_payload",
                    "help": "if an id is passed, use this id when looking up the payload, otherwise, return a generated id.      these ids work by clearing each ImGui `NewFrame` and starting over again. generally, this should function fine, however, if you're having id misses in dragndrop,      try just using your own unique id. ([_id], _payload_data)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_payload",
                    "returnType": 2
                },
                {
                    "id": "75f1b5d9-2427-4ea9-a925-15ff856eb1d3",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_payload_get",
                    "help": "return a payload given a passed _id. (_id)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_payload_get",
                    "returnType": 2
                },
                {
                    "id": "fbe3bb23-a1e6-44e1-bf57-aa91dbc9cfaa",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_combo",
                    "help": "(_label, _current_item, _items)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_combo",
                    "returnType": 2
                },
                {
                    "id": "674bc966-53c8-46d9-b3a8-9b5cb2ffc778",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_begin_combo",
                    "help": "begin a combo widget (_label, _preview_val, [_flags=0])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_begin_combo",
                    "returnType": 2
                },
                {
                    "id": "0dec7211-46a0-4929-b44f-b29b31cdc3ec",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_end_combo",
                    "help": "end a combo widget ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_end_combo",
                    "returnType": 2
                },
                {
                    "id": "eb110e66-1919-4566-a2d3-04bd998bd76e",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_io_ini_saving_rate",
                    "help": "Maximum time between saving positions\/sizes to .ini file, in seconds. ([_time], {)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_io_ini_saving_rate",
                    "returnType": 2
                },
                {
                    "id": "af06ef12-b677-42e4-b01b-6e7743a10c7d",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_io_mouse_double_click_time",
                    "help": "Time for a double-click, in seconds. ([_time], {)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_io_mouse_double_click_time",
                    "returnType": 2
                },
                {
                    "id": "9dd608be-490c-4e16-81e4-54ac11cd19a0",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_io_mouse_double_click_max_dist",
                    "help": "Distance threshold to stay in to validate a double-click, in pixels. ([_distance], {)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_io_mouse_double_click_max_dist",
                    "returnType": 2
                },
                {
                    "id": "637f0f77-2362-45a4-9733-394ea3c53a52",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_io_mouse_drag_threshold",
                    "help": "Distance threshold before considering we are dragging ([_distance], {)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_io_mouse_drag_threshold",
                    "returnType": 2
                },
                {
                    "id": "0bde44de-3ed5-4117-a32a-998772c86f54",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_io_key_repeat_delay",
                    "help": "When holding a key\/button, time before it starts repeating, in seconds [for buttons in Repeat mode, etc.]. ([_time], {)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_io_key_repeat_delay",
                    "returnType": 2
                },
                {
                    "id": "356a0ff2-afae-439d-88d1-9a0e176fb967",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_io_key_repeat_rate",
                    "help": "When holding a key\/button, rate at which it repeats, in seconds. ([_time], {)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_io_key_repeat_rate",
                    "returnType": 2
                },
                {
                    "id": "1f6b4fce-9b40-4255-913e-75e17c9a5592",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_io_font_global_scale",
                    "help": "Global scale all fonts ([_scale], {)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_io_font_global_scale",
                    "returnType": 2
                },
                {
                    "id": "16013f3c-4759-4b81-84e3-8fd748b9ef03",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_io_font_allow_user_scaling",
                    "help": "Allow user scaling text of individual window with CTRL+Wheel. ([_boolean], {)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_io_font_allow_user_scaling",
                    "returnType": 2
                },
                {
                    "id": "e899aada-728a-4f4d-911a-1217db3ed461",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_io_display_framebuffer_scaling",
                    "help": "**NOTE: DOES NOTHING FOR NOW** For retina display or other situations where window coordinates are different from framebuffer coordinates. User storage only, presently not used by ImGui. ([_x=1.0], [_y=1.0], {)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_io_display_framebuffer_scaling",
                    "returnType": 2
                },
                {
                    "id": "5fd8ca92-8932-4d4d-b3fb-858974ef208a",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_io_display_visible_min",
                    "help": "If you use DisplaySize as a virtual space larger than your screen, set DisplayVisibleMin\/Max to the visible area. ([_x], [_y], {)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_io_display_visible_min",
                    "returnType": 2
                },
                {
                    "id": "e55171c4-e413-4665-83e1-d1743cfde028",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_io_display_visible_max",
                    "help": "If the values are the same, we defaults to Min=[0.0f] and Max=DisplaySize ([_x], [_y], {)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_io_display_visible_max",
                    "returnType": 2
                },
                {
                    "id": "3cabfb71-e10e-4b16-ab25-eba688507d48",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_io_osx_behaviors",
                    "help": "OS X style: Text editing cursor movement using Alt instead of Ctrl, Shortcuts using Cmd\/Super instead of Ctrl, Line\/Text Start and End using Cmd+Arrows instead of Home\/End, ouble click selects by word instead of selecting whole text, Multi-selection in lists uses Cmd\/Super instead of Ctrl ([_boolean], {)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_io_osx_behaviors",
                    "returnType": 2
                },
                {
                    "id": "e4e70da4-2904-4521-8623-2a770ffcc09c",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_io_ini_filename",
                    "help": "Path to .ini file. NULL to disable .ini saving. ([_filename])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_io_ini_filename",
                    "returnType": 2
                },
                {
                    "id": "51dae7e7-3c5a-4180-854a-06e9382419cc",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_io_log_filename",
                    "help": "Path to .log file - default parameter to ImGui::LogToFile when no file is specified. defaults to \"imgui_log.txt ([_path])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_io_log_filename",
                    "returnType": 2
                },
                {
                    "id": "516c384c-d4c0-4527-9c6c-cffb955b5451",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_io_cursor_blink",
                    "help": "allow input currsors to blink ([_enabled])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_io_cursor_blink",
                    "returnType": 2
                },
                {
                    "id": "5e3fe331-3571-4a62-8c09-49be58ba9aff",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_drawlist_add_line",
                    "help": "()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_drawlist_add_line",
                    "returnType": 2
                },
                {
                    "id": "b04dfbbf-c80d-46c4-9a79-271639c33659",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_drawlist_add_rect",
                    "help": "Adds a rectangle to the drawlist (_x1, _y1, _x2, _y2, _col, [_rounding=0.0], [_rounding_corner_flags=-1], [_thickness=1.0])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_drawlist_add_rect",
                    "returnType": 2
                },
                {
                    "id": "f86b2509-ce9f-4447-86cf-cbf1c4ad40b6",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_drawlist_add_rect_filled",
                    "help": "Adds a filled rectangle to the drawlist (_x1, _y1, _x2, _y2, _col, [_rounding=0.0], [_rounding_corner_flags=-1])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_drawlist_add_rect_filled",
                    "returnType": 2
                },
                {
                    "id": "19016142-e5a4-46c4-a471-a056ad1edab2",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_drawlist_add_rect_filled_multicolor",
                    "help": "Adds a multicolored filled rectangle to the drawlist (_x1, _y1, _x2, _y2, _colUL, _colUR, _colBR, _colBL)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_drawlist_add_rect_filled_multicolor",
                    "returnType": 2
                },
                {
                    "id": "6399e41d-51af-448b-a0e1-c7d2b564fc45",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_drawlist_add_quad",
                    "help": "Adds a quad to the drawlist (_x1, _y1, _x2, _y2, _x3, _y3, _x4, _y5, _col, [_thickness=1.0])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_drawlist_add_quad",
                    "returnType": 2
                },
                {
                    "id": "2f4ffd10-5e87-4060-ac50-c3315af45d84",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_drawlist_add_quad_filled",
                    "help": "Adds a filled quad to the draw list (_x1, _y1, _x2, _y2, _x3, _y3, _x4, _y5, _col, [_thickness=1.0])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_drawlist_add_quad_filled",
                    "returnType": 2
                },
                {
                    "id": "d7a23d01-48c7-46d5-8423-6194cae702fd",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_drawlist_add_triangle",
                    "help": "Adds a triangle to the draw list (_x1, _y1, _x2, _y2, _x3, _y3, _col, [_thickness=1.0])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_drawlist_add_triangle",
                    "returnType": 2
                },
                {
                    "id": "9dc9bce8-36bc-48b6-a23f-1d219947b656",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_drawlist_add_triangle_filled",
                    "help": "Adds a filled triangle to the draw list (_x1, _y1, _x2, _y2, _x3, _y3, _col)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_drawlist_add_triangle_filled",
                    "returnType": 2
                },
                {
                    "id": "659d82bb-9e1f-47af-9259-222fb3bcbfc9",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_drawlist_add_circle",
                    "help": "Adds a circle to the drawlist (_center_x, _center_y, _radius, _col, [_num_segments=12], [_thickness)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_drawlist_add_circle",
                    "returnType": 2
                },
                {
                    "id": "52312a0d-0bdd-4349-89df-6c4a7c06feb5",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_drawlist_add_circle_filled",
                    "help": "Adds a circle to the drawlist (_center_x, _center_y, _radius, _col, [_num_segments=12])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_drawlist_add_circle_filled",
                    "returnType": 2
                },
                {
                    "id": "009f13cb-1ef1-4529-b226-2be171e1bee5",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_drawlist_add_text",
                    "help": "Adds text to the drawlist (_pos_x, _pos_y, _col, _text, _wrap_width)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_drawlist_add_text",
                    "returnType": 2
                },
                {
                    "id": "e8c8461c-02e2-4bcf-a233-7eebd299deb4",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_drawlist_add_surface",
                    "help": "(_surface, _x, _y, [_width=undefined], [_height=undefined], [_u0=0.0], [_v0=0.0], [_u1=1.0], [_v1=1.0], [_col=c_white])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_drawlist_add_surface",
                    "returnType": 2
                },
                {
                    "id": "872795af-ac94-4512-a781-b14a84bea7fd",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_drawlist_add_surface_quad",
                    "help": "Adds an image quad to the draw list (_surface, _x1, _y1, _x2, _y2, _x3, _y3, _x4, _y4, [_col=c_white], [_u1=0], [_v1=0], [_u2=1], [_v2=0], [_u3=1], [_v3=1], [_u4=0], [_v4=1])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_drawlist_add_surface_quad",
                    "returnType": 2
                },
                {
                    "id": "c8ae8518-677a-4a5d-97ca-cafd8038ca15",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_drawlist_add_sprite",
                    "help": "Adds an image to the draw list (_sprite_index, _image_index, _x, _y, [_width=undefined], [_height=undefined], [_col=c_white])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_drawlist_add_sprite",
                    "returnType": 2
                },
                {
                    "id": "155e41ed-5d59-4d79-bc2e-2d0338a484e1",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_drawlist_add_polyline",
                    "help": "add a line in a polygonal shape to the draw list (_y]}, _col, [_closed=true], [_thickness=1.0])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_drawlist_add_polyline",
                    "returnType": 2
                },
                {
                    "id": "3f975667-3e35-49ac-89fd-f24d899448a6",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_drawlist_add_convex_poly_filled",
                    "help": "add filled convex polygonal shape to the draw list (_points, _col)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_drawlist_add_convex_poly_filled",
                    "returnType": 2
                },
                {
                    "id": "8f329de5-68d2-4e7b-ba16-fa3da1ebdad4",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_drawlist_add_bezier_curve",
                    "help": "Adds a bezier curve to the drawlist (_pos_x1, _pos_y1, _curve_x1, _curve_y1, _curve_x2, _curve_y2, _pos_x2, _pos_y2, _col, _thickness, [_num_segments=0]))",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_drawlist_add_bezier_curve",
                    "returnType": 2
                },
                {
                    "id": "4aacc53b-d18f-4acc-9218-45db666ce582",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_drawlist_path_clear",
                    "help": "Clears the current path ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_drawlist_path_clear",
                    "returnType": 2
                },
                {
                    "id": "40190333-aa58-4604-990d-1999e612a136",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_drawlist_path_line_to",
                    "help": "add a line to the current path (_x, _y)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_drawlist_path_line_to",
                    "returnType": 2
                },
                {
                    "id": "15340e4f-7315-4cba-bfbc-3f36d8b49683",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_drawlist_path_line_to_merge_duplicate",
                    "help": "add a line to the current path, merging any duplicate lines this creates (_x, _y)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_drawlist_path_line_to_merge_duplicate",
                    "returnType": 2
                },
                {
                    "id": "667ea849-f583-45c0-91cf-3f1be2c8778e",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_drawlist_path_fill_convex",
                    "help": "add fill the current convex shape created bhy the path (_col)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_drawlist_path_fill_convex",
                    "returnType": 2
                },
                {
                    "id": "1e456fb6-5d60-4b28-9e66-1cf5e52959ec",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_drawlist_path_stroke",
                    "help": "set the stroke settings for drawing paths (_col, _closed, [_thickness=1.0]))",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_drawlist_path_stroke",
                    "returnType": 2
                },
                {
                    "id": "bc5d3a2a-7995-401a-8606-6e9e03965644",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_drawlist_path_arc_to",
                    "help": "Adds an arc to a path (_center_x, _center_y, _radius, _min, _max, [_num_segments=10])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_drawlist_path_arc_to",
                    "returnType": 2
                },
                {
                    "id": "a41b74dd-a2ef-40b0-b3b7-63ae2cacd113",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_drawlist_path_arc_to_fast",
                    "help": "More performant path_arc (_center_x, _center_y, _radius, _min_of_12, _max_of_12)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_drawlist_path_arc_to_fast",
                    "returnType": 2
                },
                {
                    "id": "3e67df9e-954a-4988-8e34-a27dc2a79050",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_drawlist_path_bezier_curve_to",
                    "help": "Curve path to (_x1, _y1, _x2, _y2, _x3, _y3, [_num_segments=0])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_drawlist_path_bezier_curve_to",
                    "returnType": 2
                },
                {
                    "id": "52ff0ff8-daef-4b3b-9a79-d793d9149d35",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_drawlist_path_rect",
                    "help": "draw a rect on the path (_min_x, _min_y, _max_x, _max_y, [_rounding=0], [_round_corner_flags=-1)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_drawlist_path_rect",
                    "returnType": 2
                },
                {
                    "id": "9c24e3a6-7672-4d06-aecf-b7e57242ddab",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_drawlist_channels_split",
                    "help": "merge channels      Channels:      - Use to simulate layers. By switching channels to can render out-of-order [e.g. submit foreground primitives before background primitives]      - Use to minimize draw calls [e.g. if going back-and-forth between multiple non-overlapping clipping rectangles, prefer to append into separate channels then merge at the end] (_channels_count)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_drawlist_channels_split",
                    "returnType": 2
                },
                {
                    "id": "53f8aac7-48c0-42bd-b9fb-c2ab1d8bc065",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_drawlist_channels_merge",
                    "help": "merge channels      Channels:      - Use to simulate layers. By switching channels to can render out-of-order [e.g. submit foreground primitives before background primitives]      - Use to minimize draw calls [e.g. if going back-and-forth between multiple non-overlapping clipping rectangles, prefer to append into separate channels then merge at the end] ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_drawlist_channels_merge",
                    "returnType": 2
                },
                {
                    "id": "b70977e0-d4b7-4696-85dd-06f7c5d37fcf",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_drawlist_channels_set_current",
                    "help": "merge channels      Channels:      - Use to simulate layers. By switching channels to can render out-of-order [e.g. submit foreground primitives before background primitives]      - Use to minimize draw calls [e.g. if going back-and-forth between multiple non-overlapping clipping rectangles, prefer to append into separate channels then merge at the end] (_channel_index)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_drawlist_channels_set_current",
                    "returnType": 2
                },
                {
                    "id": "f3ef959c-cec4-4c1f-bb91-a90072f55d0c",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_drawlist_push_clip_rect",
                    "help": "Render-level scissoring (_min_x, _min_y, _max_x, _max_y, [_intersect_with_clip_plane=false])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_drawlist_push_clip_rect",
                    "returnType": 2
                },
                {
                    "id": "2900b58b-ef21-4bc9-9727-77913899a55b",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_drawlist_pop_clip_rect",
                    "help": "End Render-level scissoring ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_drawlist_pop_clip_rect",
                    "returnType": 2
                },
                {
                    "id": "f7664e19-6862-44c6-92b6-8df956fc7ce2",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_drawlist_push_clip_rect_fullscreen",
                    "help": "Push the clip rect for the fullscreen ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_drawlist_push_clip_rect_fullscreen",
                    "returnType": 2
                },
                {
                    "id": "46efb2b7-3405-4bbd-a298-1e01b7239524",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_drawlist_get_clip_rect_min",
                    "help": "Gets the max pos of clipping rectangle ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_drawlist_get_clip_rect_min",
                    "returnType": 2
                },
                {
                    "id": "48412f6e-f360-475e-b354-91791988f0bf",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_drawlist_get_clip_rect_max",
                    "help": "Gets the max pos of clipping rectangle ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_drawlist_get_clip_rect_max",
                    "returnType": 2
                },
                {
                    "id": "0a513e70-ea4c-4941-a672-ab93e6c63684",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_drawlist_push_texture_id",
                    "help": "Pushes a texture to the drawlist (_tex_id)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_drawlist_push_texture_id",
                    "returnType": 2
                },
                {
                    "id": "9d9d94ce-059a-4e32-86d3-32e539f8052d",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_drawlist_pop_texture_id",
                    "help": "Pops texture from drawlist ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_drawlist_pop_texture_id",
                    "returnType": 2
                },
                {
                    "id": "1d5a4b7c-3141-40c9-b982-08c3aeeb430d",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_drawlist_set_flags",
                    "help": "set the antialising flags [per primitive] (_flags)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_drawlist_set_flags",
                    "returnType": 2
                },
                {
                    "id": "1ed77caa-f520-46ac-be19-b8265cc56be4",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_drawlist_get_flags",
                    "help": "get the antialising flags [per primitive] ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_drawlist_get_flags",
                    "returnType": 2
                },
                {
                    "id": "5d7f004a-e397-425b-9b5d-343e32e9d302",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_drawlist_use_overlay",
                    "help": "use imgui's overlay drawlist ontop of the screen ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_drawlist_use_overlay",
                    "returnType": 2
                },
                {
                    "id": "18032890-1684-494d-8825-5159c8a2f58c",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_drawlist_use_window",
                    "help": "use imgui's active window drawlist with drawlist functions ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_drawlist_use_window",
                    "returnType": 2
                },
                {
                    "id": "0a68a55e-e35c-43a9-801c-e356ed889a0f",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "__imguigml_drawlist_add_image_quad",
                    "help": "Adds an image quad to the draw list (_texture_id, _x1, _y1, _x2, _y2, _x3, _y3, _x4, _y4, [_u1=0], [_v1=0], [_u2=1], [_v2=1], [_u3=1], [_v3=1], [_u4=0], [_v4=1], [_col=c_white])",
                    "hidden": false,
                    "kind": 1,
                    "name": "__imguigml_drawlist_add_image_quad",
                    "returnType": 2
                },
                {
                    "id": "61293778-1b69-488b-b7c8-977bd46c4a23",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "__imguigml_drawlist_add_image",
                    "help": "Adds an image to the draw list (_texture_id, _x1, _y1, _x2, _y2, [_u1=0], [_v1=0], [_u2=1], [_v2=1], [_col=c_white])",
                    "hidden": false,
                    "kind": 1,
                    "name": "__imguigml_drawlist_add_image",
                    "returnType": 2
                },
                {
                    "id": "c8a42949-35d8-42f1-b304-ad0a7e1dfae4",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "__imguigml_draw",
                    "help": "draw the imgui ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "__imguigml_draw",
                    "returnType": 2
                },
                {
                    "id": "ce20703b-14e5-4d00-99b3-49e02fa5db54",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "__imguigml_texture_id",
                    "help": "return an index for a texture id so we can render this properly (_id\\u0009\\u0009\\u0009\\u0009\\u0009\\u0009, _texture_type_or_sub_img, [_texture_type])",
                    "hidden": false,
                    "kind": 1,
                    "name": "__imguigml_texture_id",
                    "returnType": 2
                },
                {
                    "id": "e45c0daa-5df4-4f1d-9837-1bc24d9411ee",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "__imguigml_wrapper_buffer",
                    "help": "prepare the wrapper buffer for next use ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "__imguigml_wrapper_buffer",
                    "returnType": 2
                },
                {
                    "id": "3d17e105-892c-4601-95d7-0f9454d6efdb",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "__imguigml_handle_text_callback",
                    "help": "handle text input callback functions, the script it supports is:      `real _text_input_callback[{Array:EImguiGML_TextCallback}_data, [_user_data=_undefined]]` - on CallbackCharFilter return 1 to discard. ignored elsewise. (_call_id, _callback)",
                    "hidden": false,
                    "kind": 1,
                    "name": "__imguigml_handle_text_callback",
                    "returnType": 2
                },
                {
                    "id": "7df052be-f41e-49a7-97fe-10576a2ff844",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "__imguigml_ext_call",
                    "help": "wrap a _extImguiGML call in this, handle returns or checking immediately after a call ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "__imguigml_ext_call",
                    "returnType": 2
                },
                {
                    "id": "1e7b3ee8-9eab-477f-b9c4-e7e0d22689b1",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "__imguigml_event_create",
                    "help": "imguigml create event ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "__imguigml_event_create",
                    "returnType": 2
                },
                {
                    "id": "9192c7dd-b293-415e-9182-9a2907d477f5",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "__imguigml_event_begin_step",
                    "help": "imguigml begin step event ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "__imguigml_event_begin_step",
                    "returnType": 2
                },
                {
                    "id": "69f448cb-74dc-4d6c-9f28-1cacb939b558",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "__imguigml_event_end_step",
                    "help": "imguigml end step event ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "__imguigml_event_end_step",
                    "returnType": 2
                },
                {
                    "id": "45c86854-a410-432d-89ef-b1fab5f07b2c",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "__imguigml_event_clean_up",
                    "help": "imguigml clean up event ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "__imguigml_event_clean_up",
                    "returnType": 2
                },
                {
                    "id": "587fee6f-fcfa-4299-8164-9d10303f75fb",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "__imguigml_event_draw",
                    "help": "imguigml draw event ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "__imguigml_event_draw",
                    "returnType": 2
                },
                {
                    "id": "100e52e7-3b49-4cd8-b4f6-ab719975b935",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "__imguigml_event_draw_gui",
                    "help": "imguigml draw gui event ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "__imguigml_event_draw_gui",
                    "returnType": 2
                },
                {
                    "id": "b784fbf3-42e7-4e1c-b8f3-54d32707b492",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "__imguigml_init_rendering",
                    "help": "called `with` imguigml - initialize the rendering ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "__imguigml_init_rendering",
                    "returnType": 2
                },
                {
                    "id": "a69a6edd-5e92-443b-8505-772064d4a060",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "__imguigml_init_font",
                    "help": "called `with` imguigml - load the font texture ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "__imguigml_init_font",
                    "returnType": 2
                },
                {
                    "id": "2f7b5de8-04e6-403d-a31f-70a22978958a",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "__imguigml_init_input",
                    "help": "called `with` imguigml - initilaize the input stuff ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "__imguigml_init_input",
                    "returnType": 2
                },
                {
                    "id": "46a8805e-35df-4972-a24b-48e4179953bf",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "__imguigml_init_wrapper",
                    "help": "called `with` imguigml - initialize wrapper buffer ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "__imguigml_init_wrapper",
                    "returnType": 2
                },
                {
                    "id": "5386cd03-a59f-41f8-a55e-e96ec70acc5b",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "__imguigml_init_debug",
                    "help": "called `with` imguigml - initialize debug buffer ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "__imguigml_init_debug",
                    "returnType": 2
                },
                {
                    "id": "b044671d-11c2-4ab6-a5cd-6109cbe230f9",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_mem",
                    "help": "()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_mem",
                    "returnType": 2
                },
                {
                    "id": "aee09137-6909-4096-9337-6946ea133463",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_memset",
                    "help": "()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_memset",
                    "returnType": 2
                },
                {
                    "id": "b1d291c2-2382-42ff-8645-e3846a5093a1",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_secure_save_mem",
                    "help": "()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_secure_save_mem",
                    "returnType": 2
                },
                {
                    "id": "53978743-cecf-4bc9-a379-7c61c6c83379",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_secure_load_mem",
                    "help": "()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_secure_load_mem",
                    "returnType": 2
                },
                {
                    "id": "69c8e74a-967b-4c20-9922-2372b13a86a5",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_begin_tab_bar",
                    "help": "start a tab bar (_std_id, [_flags=0])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_begin_tab_bar",
                    "returnType": 2
                },
                {
                    "id": "54df1d57-df6c-4eae-8353-eb51ec859c08",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_end_tab_bar",
                    "help": "finish a tab bar ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_end_tab_bar",
                    "returnType": 2
                },
                {
                    "id": "83a225ca-22fc-42d3-b90a-9606b31e4a9f",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_tab_item",
                    "help": "create a tab item (_name, [_open=undefined], [_flags=0])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_tab_item",
                    "returnType": 2
                },
                {
                    "id": "4eaa86ac-59ea-4a97-932c-b6e7d4330647",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_set_tab_item_closed",
                    "help": "set a tab item as closed (_name)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_set_tab_item_closed",
                    "returnType": 2
                },
                {
                    "id": "27da3614-4382-4312-add7-0209710d1919",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_set_tab_item_selected",
                    "help": "set a tab item as selected (_name)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_set_tab_item_selected",
                    "returnType": 2
                },
                {
                    "id": "a72b4d90-4c40-497b-a1fd-e7916f78a327",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_show_tabs_demo",
                    "help": "show the tabs demo (_name, [_open=undefined])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_show_tabs_demo",
                    "returnType": 2
                },
                {
                    "id": "ca347b95-8f18-44a5-9336-826ea863fe46",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_show_tabs_debug",
                    "help": "show tabs debug pane ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_show_tabs_debug",
                    "returnType": 2
                },
                {
                    "id": "2b30ae1a-eed0-481c-bccc-58f4029d5ae9",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_texteditor_create",
                    "help": "create a new texteditor ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_texteditor_create",
                    "returnType": 2
                },
                {
                    "id": "91d8b54b-9a0f-4673-8089-d4aa352ea5d6",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_texteditor_destroy",
                    "help": "destroy a texteditor (_editor_index)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_texteditor_destroy",
                    "returnType": 2
                },
                {
                    "id": "bc7509d2-882f-4b76-b69f-ad9a55f5c042",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_texteditor_set_language_definition",
                    "help": "Sets the current text editor language definition (_editor_index, _lang)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_texteditor_set_language_definition",
                    "returnType": 2
                },
                {
                    "id": "e07ef4c8-d837-4762-9192-1db8672f9fc3",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_texteditor_get_language_definition",
                    "help": "Gets the current text editor language definition (_editor_index)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_texteditor_get_language_definition",
                    "returnType": 2
                },
                {
                    "id": "11f0938d-c88f-4fca-9a87-cea6b9bcc19a",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_texteditor_get_palette",
                    "help": "Gets the palette of the current text editor (_editor_index)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_texteditor_get_palette",
                    "returnType": 2
                },
                {
                    "id": "712526e2-9cd6-4c51-a98a-24f01236e58e",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_texteditor_set_palette",
                    "help": "Sets the palette of the current text editor (_editor_index, _palette)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_texteditor_set_palette",
                    "returnType": 2
                },
                {
                    "id": "ba069bf7-b61f-4a19-a489-e7feec137fe7",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_texteditor_render",
                    "help": "Renders the text editor (_editor_index, _label, [_size_x=0], [_size_y=0], [_border=false])",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_texteditor_render",
                    "returnType": 2
                },
                {
                    "id": "cbc4bf05-08d5-44e5-9f2d-ad17e6947bfe",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_texteditor_set_text",
                    "help": "Sets the text of the current editor (_editor_index, _text)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_texteditor_set_text",
                    "returnType": 2
                },
                {
                    "id": "993d46b0-8b70-4cb1-8b3f-49fb6a62d405",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_texteditor_get_text",
                    "help": "Gets the text from the current editor (_editor_index)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_texteditor_get_text",
                    "returnType": 2
                },
                {
                    "id": "968ae34f-4064-4690-9013-a287380ea86f",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_texteditor_get_selected_text",
                    "help": "Gets the selected text of the current editor (_editor_index)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_texteditor_get_selected_text",
                    "returnType": 2
                },
                {
                    "id": "fa3beff3-9355-416e-ab0d-9308f3eab188",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_texteditor_get_total_lines",
                    "help": "Gets the total lines from the current text editor (_editor_index)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_texteditor_get_total_lines",
                    "returnType": 2
                },
                {
                    "id": "96dff880-4280-4c6d-9776-0a7ffe19b9d7",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_texteditor_is_overwrite",
                    "help": "Checks if current text editor is in overwrite mode (_editor_index)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_texteditor_is_overwrite",
                    "returnType": 2
                },
                {
                    "id": "ad8dffae-50c0-4e84-932a-59a8326ca0e2",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_texteditor_set_readonly",
                    "help": "Sets the text editor to read only (_editor_index, _value)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_texteditor_set_readonly",
                    "returnType": 2
                },
                {
                    "id": "abbc1d5c-2cf9-4aee-821c-0fffc63fadf9",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_texteditor_is_readonly",
                    "help": "Checks if the current editor is read only (_editor_index)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_texteditor_is_readonly",
                    "returnType": 2
                },
                {
                    "id": "74260552-6e8a-4da8-a761-3ca36d97b833",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_texteditor_set_cursor_position",
                    "help": "Sets the cursor position using line and column (_editor_index, _line, _col)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_texteditor_set_cursor_position",
                    "returnType": 2
                },
                {
                    "id": "cd8179f8-d43d-4769-9de5-1ac7343e1f09",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_texteditor_get_cursor_position",
                    "help": "Gets the line and column from the current text editor (_editor_index)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_texteditor_get_cursor_position",
                    "returnType": 2
                },
                {
                    "id": "9f19207d-933f-4bb8-9812-c0136eff4676",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_texteditor_insert_text",
                    "help": "Inserts text at position in the current text editor (_editor_index, _text)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_texteditor_insert_text",
                    "returnType": 2
                },
                {
                    "id": "76889c41-5e17-41b4-9706-d94b662a20a3",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_texteditor_move_up",
                    "help": "Moves up  lines in the text editor (_editor_index, _amount, [_select)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_texteditor_move_up",
                    "returnType": 2
                },
                {
                    "id": "14e070ec-ae02-444d-8437-ac6e30e7ec82",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_texteditor_move_down",
                    "help": "Moves down  lines in the text editor (_editor_index, _amount, [_select)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_texteditor_move_down",
                    "returnType": 2
                },
                {
                    "id": "30dbca72-40d0-4066-86b1-090c615785c8",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_texteditor_move_left",
                    "help": "Moves left  lines in the text editor (_editor_index, _amount, [_select)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_texteditor_move_left",
                    "returnType": 2
                },
                {
                    "id": "097f3f5d-437d-4f0f-83ce-3536f25c0d06",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_texteditor_move_right",
                    "help": "Moves right  lines in the text editor (_editor_index, _amount, [_select)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_texteditor_move_right",
                    "returnType": 2
                },
                {
                    "id": "21f3bec0-8cea-4a02-afce-bb6fe229eca5",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_texteditor_move_top",
                    "help": "Skips to top of current editor (_editor_index, [_select)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_texteditor_move_top",
                    "returnType": 2
                },
                {
                    "id": "05a88e14-2575-4dbe-9046-708a12cdf8db",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_texteditor_move_bottom",
                    "help": "Skips to bottom of current editor (_editor_index, [_select)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_texteditor_move_bottom",
                    "returnType": 2
                },
                {
                    "id": "dab4fe40-e1fa-4267-b0f2-d96f9bffc18f",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_texteditor_move_home",
                    "help": "Moves to the home position of the current editor (_editor_index, [_select)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_texteditor_move_home",
                    "returnType": 2
                },
                {
                    "id": "910d1d0b-fbea-4ddc-baef-7a00a29a0660",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_texteditor_move_end",
                    "help": "Moves to the end position of the current editor (_editor_index, [_select)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_texteditor_move_end",
                    "returnType": 2
                },
                {
                    "id": "d9840eb4-a061-43d1-b47c-7c91fd3dbf90",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_texteditor_set_selection_start",
                    "help": "Sets the start select position in the current editor (_editor_index, _line, _col)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_texteditor_set_selection_start",
                    "returnType": 2
                },
                {
                    "id": "2739e6aa-d7c6-44f5-b1f2-976bfeddcbcb",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_texteditor_set_selection_end",
                    "help": "Sets the end select position in the current editor (_editor_index, _line, _col)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_texteditor_set_selection_end",
                    "returnType": 2
                },
                {
                    "id": "8f302b70-228a-4a1f-a6b6-83441d047ef5",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_texteditor_set_selection",
                    "help": "Sets selection value in current editor (_editor_index, _line1, _col1, _line2, _col2, [word_mode)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_texteditor_set_selection",
                    "returnType": 2
                },
                {
                    "id": "7d2f5516-ef06-4b65-8c3a-5e5984da281b",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_texteditor_select_word_under_cursor",
                    "help": "Selects the word under the mouse cursor in the current editor (_editor_index)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_texteditor_select_word_under_cursor",
                    "returnType": 2
                },
                {
                    "id": "96dfb29a-5f37-4909-93d4-f5d9c0d8956e",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_texteditor_has_selection",
                    "help": "Checks if current editor has selected text (_editor_index)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_texteditor_has_selection",
                    "returnType": 2
                },
                {
                    "id": "8822f230-f1d3-485b-8684-4b876a016175",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_texteditor_copy",
                    "help": "Copies the selected tex (_editor_index)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_texteditor_copy",
                    "returnType": 2
                },
                {
                    "id": "f69bcc01-b4ef-4890-9b44-ce63799458fc",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_texteditor_cut",
                    "help": "Cuts the selected text (_editor_index)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_texteditor_cut",
                    "returnType": 2
                },
                {
                    "id": "dda9d9f4-13fe-4db4-a21c-de0f72132e2a",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_texteditor_paste",
                    "help": "pastes the selected text (_editor_index)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_texteditor_paste",
                    "returnType": 2
                },
                {
                    "id": "62c67044-a3c8-46af-bb25-73995cbf5d89",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_texteditor_delete",
                    "help": "deletes the selected text (_editor_index)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_texteditor_delete",
                    "returnType": 2
                },
                {
                    "id": "412f8472-a489-4709-a954-2d350156d0a3",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_texteditor_can_undo",
                    "help": "Check if there is undo history (_editor_index)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_texteditor_can_undo",
                    "returnType": 2
                },
                {
                    "id": "27114143-5e5f-4c69-8096-28d6e2016704",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_texteditor_can_redo",
                    "help": "Check if there is redo history (_editor_index)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_texteditor_can_redo",
                    "returnType": 2
                },
                {
                    "id": "920eb0b6-638a-4e20-b78a-7e180f40749f",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_texteditor_get_dark_palette",
                    "help": "Gets the dark palette that may be used with editor (_editor_index)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_texteditor_get_dark_palette",
                    "returnType": 2
                },
                {
                    "id": "7d8eb0e5-8d6d-4fe3-be9c-44873cc41814",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "imguigml_texteditor_get_light_palette",
                    "help": "Gets the light palette that may be used with editor (_editor_index)",
                    "hidden": false,
                    "kind": 1,
                    "name": "imguigml_texteditor_get_light_palette",
                    "returnType": 2
                },
                {
                    "id": "84f61138-430d-4279-88b8-0c242a1f03d5",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "rousr_callstack_init",
                    "help": "Initial rousr_callstack data ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "rousr_callstack_init",
                    "returnType": 2
                },
                {
                    "id": "e4f7b18b-23c3-45a9-95c1-4939f8182a80",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "rousr_callstack_clean_up",
                    "help": "delete all the buffers in the rousr callstack system - call before you 'reset' anything using the callstacks ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "rousr_callstack_clean_up",
                    "returnType": 2
                },
                {
                    "id": "3cff8241-7d50-472f-bd49-4bb9f85f4076",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "rousr_callstack_process",
                    "help": "allow passing back and forth between DLL and GML (_call_id)",
                    "hidden": false,
                    "kind": 1,
                    "name": "rousr_callstack_process",
                    "returnType": 2
                },
                {
                    "id": "95d4bfd7-6d3b-4bef-ad2c-f76d10386f01",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "rousr_callstack_out",
                    "help": "read data OUT of the DLL - get the output buffer for the `_call_id` ([_call_id=last)",
                    "hidden": false,
                    "kind": 1,
                    "name": "rousr_callstack_out",
                    "returnType": 2
                },
                {
                    "id": "0eb8255d-7200-43f2-8acb-b343ff09291b",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "rousr_callstack_in",
                    "help": "write data IN to the DLL - get the input buffer for the `_call_id`      **NOTE:** Don't call this until after you're finished with `out` - they're the same buffer. ([_call_id=last, [_seek_start=true])",
                    "hidden": false,
                    "kind": 1,
                    "name": "rousr_callstack_in",
                    "returnType": 2
                },
                {
                    "id": "45bf994b-e0a0-46fd-8eed-dc8835502c3a",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "_rousr_callstack_call",
                    "help": "return a call struct for a call id, if the id doesn't currently exist, assign it a buffer and return (_call_id)",
                    "hidden": false,
                    "kind": 1,
                    "name": "_rousr_callstack_call",
                    "returnType": 2
                },
                {
                    "id": "12454880-75b4-4032-85ae-cd71225026a5",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sr_sprite_cache_create",
                    "help": "create a new sprite cache ([_width=2048], [_height=2048])",
                    "hidden": false,
                    "kind": 1,
                    "name": "sr_sprite_cache_create",
                    "returnType": 2
                },
                {
                    "id": "a03e6dcb-484b-4ef6-baab-9a7c1df05619",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sr_sprite_cache_destroy",
                    "help": "clean up a sprite cache (_cache)",
                    "hidden": false,
                    "kind": 1,
                    "name": "sr_sprite_cache_destroy",
                    "returnType": 2
                },
                {
                    "id": "c5edb38b-d2e8-41e2-9842-fac35f8b569c",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sr_sprite_cache_push_sprite",
                    "help": "push a sprite onto the sprite cache, returns an id for the packed sprite (_sprite_cache, _sprite, _image_index)",
                    "hidden": false,
                    "kind": 1,
                    "name": "sr_sprite_cache_push_sprite",
                    "returnType": 2
                },
                {
                    "id": "d674314a-cb2f-4151-978f-20c0ba946a4a",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sr_sprite_cache_flush",
                    "help": "flush the sprites to a texture (_bin)",
                    "hidden": false,
                    "kind": 1,
                    "name": "sr_sprite_cache_flush",
                    "returnType": 2
                },
                {
                    "id": "63761b7b-eee1-4c8e-af9f-02accc10b5ce",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sr_sprite_cache_get_uvs",
                    "help": "returns uvs [0-1] for each of the four corner ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "sr_sprite_cache_get_uvs",
                    "returnType": 2
                },
                {
                    "id": "bf5285fe-9001-4186-b06e-0c3607c0b339",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sr_sprite_cache_get_surface",
                    "help": "get the surface for the cached sprite (_cache, _cached_sprite)",
                    "hidden": false,
                    "kind": 1,
                    "name": "sr_sprite_cache_get_surface",
                    "returnType": 2
                },
                {
                    "id": "9aef6fde-8b45-4183-9dd2-057bca98b6e7",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sr_lazy_bin_create",
                    "help": "creaete a lazy bin packer bin (_width, _height)",
                    "hidden": false,
                    "kind": 1,
                    "name": "sr_lazy_bin_create",
                    "returnType": 2
                },
                {
                    "id": "88dfef11-ae43-4ffa-9587-f7e012d91667",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sr_lazy_bin_destroy",
                    "help": "clean up a lazy bin (_bin)",
                    "hidden": false,
                    "kind": 1,
                    "name": "sr_lazy_bin_destroy",
                    "returnType": 2
                },
                {
                    "id": "9dff66f0-bc95-485e-868e-b6236c676b8e",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sr_lazy_bin_pack",
                    "help": "just try to fit a rectangle next to this one, if it fits :confetti: (_bin, _width, _height)",
                    "hidden": false,
                    "kind": 1,
                    "name": "sr_lazy_bin_pack",
                    "returnType": 2
                },
                {
                    "id": "a2541599-c388-4585-b0c5-29ebcd796e51",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sr_lazy_bin_get",
                    "help": "return the rect at the id given (_bin, _packed_id)",
                    "hidden": false,
                    "kind": 1,
                    "name": "sr_lazy_bin_get",
                    "returnType": 2
                },
                {
                    "id": "9acdc7fa-b5ee-400d-8064-bb831e2a6a2e",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sr_lazy_bin_width",
                    "help": "return the rect at the id given (_bin)",
                    "hidden": false,
                    "kind": 1,
                    "name": "sr_lazy_bin_width",
                    "returnType": 2
                },
                {
                    "id": "2f5b7495-0034-42ce-9569-e808b2d113e8",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sr_lazy_bin_height",
                    "help": "return the rect at the id given (_bin)",
                    "hidden": false,
                    "kind": 1,
                    "name": "sr_lazy_bin_height",
                    "returnType": 2
                },
                {
                    "id": "15a22899-ed8e-4a57-a76e-63578bdefe4a",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sr_lazy_bin_clear",
                    "help": "clear a lazy bin packer (_bin_pack)",
                    "hidden": false,
                    "kind": 1,
                    "name": "sr_lazy_bin_clear",
                    "returnType": 2
                },
                {
                    "id": "5b6c0832-7c33-4e38-972d-fda2cf334317",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sr_sprite_atlas_create",
                    "help": "create a sprite atlas (_width, _height)",
                    "hidden": false,
                    "kind": 1,
                    "name": "sr_sprite_atlas_create",
                    "returnType": 2
                },
                {
                    "id": "437884c2-b52d-46b6-b698-83069abc5c10",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sr_sprite_atlas_destroy",
                    "help": "free resources used by `_sprite_atlas` ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "sr_sprite_atlas_destroy",
                    "returnType": 2
                },
                {
                    "id": "a4f1d4a2-1141-4a99-87dc-cd548943bbe2",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sr_sprite_atlas_pack",
                    "help": "pack a sprite - note that this just packs a sprite and returns an id, duplicates are allowed, etc. (_sprite_atlas, _sprite, [_image_num=0])",
                    "hidden": false,
                    "kind": 1,
                    "name": "sr_sprite_atlas_pack",
                    "returnType": 2
                },
                {
                    "id": "24e84b36-7764-49d9-83a0-48d3ab96ab81",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sr_sprite_atlas_get",
                    "help": "return an atlas sprite (_sprite_atlas, _atlas_index)",
                    "hidden": false,
                    "kind": 1,
                    "name": "sr_sprite_atlas_get",
                    "returnType": 2
                },
                {
                    "id": "e7cc1098-deaa-4bc0-9cab-7179002ee7cb",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sr_sprite_atlas_flush",
                    "help": "draw all the added sprites to the surface (_sprite_atlas)",
                    "hidden": false,
                    "kind": 1,
                    "name": "sr_sprite_atlas_flush",
                    "returnType": 2
                },
                {
                    "id": "b0d51047-f8c0-46cb-ba9d-f47caf57c864",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sr_sprite_atlas_clear",
                    "help": "clear all the sprites from an atlas (_sprite_atlas)",
                    "hidden": false,
                    "kind": 1,
                    "name": "sr_sprite_atlas_clear",
                    "returnType": 2
                },
                {
                    "id": "c760050a-213b-4de8-969a-6a807ab968bb",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "__extimguigml_script_index",
                    "help": "Returns the actual runtime script index because YYG doesn't know how to do that apparently (ext_script_index)",
                    "hidden": false,
                    "kind": 1,
                    "name": "__extimguigml_script_index",
                    "returnType": 2
                }
            ],
            "init": "",
            "kind": 2,
            "order": [
                "91a538b8-ccae-48c9-bda2-c799b65f36f9",
                "af3f923a-077d-4f08-9930-a833bd659673",
                "9b002747-5398-4ac2-ab7a-9edfb02056fd",
                "4aa5fbad-60b2-4b61-914b-70332559cf64",
                "039b4ae4-988c-4595-ad1c-60d0e18c8a49",
                "19a599fa-bc91-41fb-b6f5-f180d1c1e1c7",
                "6eb9a427-d8a2-4f53-8686-21211219287b",
                "17d7807e-f2b5-4ab6-a232-c5a33c8c7578",
                "b5f61e6b-704c-474a-a795-bd30d4538391",
                "9f1cfe9c-ffe7-426f-ac65-b4a3d6a4e9b7",
                "a5d9321e-e499-4c03-9101-e82ff4d9e68a",
                "6d22ce0c-842c-40d4-b3dc-df2639ed8f6a",
                "299ef1ea-1409-47df-986f-1e01d26a9846",
                "d9cfaced-7f5c-401d-98ac-ccbaa299df96",
                "819a4de7-132c-4c57-8ebc-549b7d8d8d58",
                "5e16d758-b3c9-4c77-a8c4-488b0be409dc",
                "281da188-f37b-448d-854d-8bdb9ec444de",
                "d589bf2f-32f5-49f4-ac69-30eefb1c3ce2",
                "5e9422c9-2490-4133-b4f6-a6f41f25b4dd",
                "8adf803d-c406-467b-a4d6-767cf3cb74ac",
                "8bf39e1c-2d11-42c2-8c24-9e2b7a14833b",
                "87c68a15-0d8e-4a78-97c0-22ce0dee8e3d",
                "22947598-8b5d-4123-85b4-f73ed64999b7",
                "8107c6a2-6f3a-45c9-8e9f-d252b844db5c",
                "c8586178-c0d7-4097-846f-e53f3ad3406c",
                "aa41a6af-a9af-4040-8a8b-d3fe36d3f01f",
                "05a036fc-0325-4e23-8cb9-acc8354908de",
                "221280b6-6e41-473e-9cb0-cf877308f003",
                "9a2b55be-2cf0-4f67-973a-ef8d4b844fd8",
                "19d0df58-c5e7-4b16-ae8c-5787321322d4",
                "d64933fc-43f5-4767-b937-9ac7eb3b08aa",
                "2e172bd6-2345-4e79-a2d3-afa31d4d8bd4",
                "80470eee-fb58-46f3-973d-8c3643427676",
                "df61fdd1-4d22-4c67-84f1-f71a5af7feda",
                "61555036-f93d-4048-bccc-22c12812fd42",
                "6c539b2e-0eb4-49eb-9656-380ea5e89270",
                "d6807a9b-064c-4b1f-afda-dab3e604d4d6",
                "0fb7d6ba-aec1-40d3-8753-42cc91b2edab",
                "93547e70-f897-40fe-99c6-7b04f79aafc7",
                "94747012-4856-4672-b103-badf5ab7e5bb",
                "e13441e1-82be-44d5-8b83-21d7a2459df7",
                "17563d3b-3eb1-45bd-8855-45c355ca4399",
                "011432ca-0247-4fac-816d-17d0f00fb4a8",
                "7a549327-6de4-43a5-bce4-e1816f9237a9",
                "a165407a-2de8-4131-a1ad-8da578de98fb",
                "a172b4a7-7157-4bb6-ad82-0a80c6c32254",
                "a87c14e7-c7dc-482f-817a-5b5e79ef4ab9",
                "358d5345-2083-42ba-bc04-b92c4a79a9ff",
                "5f605163-1920-4abf-8a4f-2b5e70ac08f2",
                "e55dfc9e-6201-4ab3-b1da-7c2c5ed4e8a9",
                "092fd123-ff19-4089-84de-e70a8ddc6aa9",
                "3d25be9a-0eb9-467e-b673-37a6c2823002",
                "2ce232e6-a3e2-4d03-9490-9c8c0a8d5856",
                "3dc540c6-c35c-46aa-8e0b-a4c22c0e2fff",
                "e7909ac4-24a8-471a-aaf5-492c0e86b247",
                "ff2b1181-64ce-42ff-aaaf-91db655063b4",
                "49015f41-0c02-4918-bcd6-d024cfb68794",
                "5e5e6695-6195-4432-96e6-65007d009213",
                "07d37f2e-7f71-4135-a2b3-cd4f56846e91",
                "5adad332-1566-493d-a69e-3e750a959d7a",
                "af21ba3d-ec7b-4420-9f32-6933016e710e",
                "6743e7aa-b75d-4e2e-b53c-87940fbaaa96",
                "d85e900a-2d7f-4bc4-a155-d07980eaf49c",
                "4155e992-40b7-4a14-b82a-54a29752ebad",
                "931d6b40-6b32-4e51-903c-4000fd38e3a1",
                "a4ef50e8-11b0-48b2-8962-f40eb9ffe101",
                "88fddfe1-fcb6-4f6f-a1e1-848b0ed0de13",
                "1b8e30d6-e685-4789-8ba9-9d72c14c35ad",
                "cb48f8f6-640a-4ce3-8ddb-fafbfe7ce4e1",
                "73df820d-fb31-4a36-b470-7b83203fa69e",
                "3c442b56-d578-4ee5-a8ef-aabd1609db1a",
                "b6a7f40d-bbef-4b32-bc63-dcab73a69d87",
                "ef70245c-6297-46e2-91b5-dae647b815b9",
                "ba302a46-df5c-4f3e-a9f2-ea8f3b0e7dfb",
                "8070aac7-3b56-4ded-99b3-1b89bf7e23b6",
                "b1ff5b3d-ead8-44ad-af76-68cbfe534013",
                "3659a319-951d-407d-8aea-114514dd7810",
                "8622d176-d870-4589-abc8-b92279af937a",
                "f58b4b4f-f064-40eb-8e54-d929f95afdc5",
                "4c934998-d4e7-4677-9b79-25a9cab83101",
                "48dcb5a3-52d4-4a21-be20-1962cff6e93c",
                "01feb5c0-0e37-4ec6-bc09-3acd9723ca3e",
                "5808707e-b62d-4e86-a149-2dbf2dd4ac07",
                "67b63f90-c43a-4f1a-9ce1-6e6984e8b150",
                "7e2e1ecf-65cf-4828-aca3-f81cc3fb97d1",
                "e2b93280-ae4f-4cef-bab0-62e76ae30350",
                "663486c8-2ca0-451a-9833-b41e79e40af4",
                "11e28105-7f9e-4c3e-bd9a-77661ea00184",
                "69724f22-028d-4adc-9ca7-66686609ff1e",
                "7b43cb4e-5fd5-4d86-9203-872789459e7d",
                "913e628c-501c-4852-9e4f-175c29f4413c",
                "9d8c6a09-77ba-45fc-9697-9c2e6176f3bc",
                "6bf3d938-b3ac-49e6-8551-1fa9e88791d7",
                "2b8c5378-d8fd-4f33-9dee-1237e694b88d",
                "3d6b1321-c876-45f2-b9eb-37d349533146",
                "e845fb3a-fc4d-4080-8e47-30ed95cb8491",
                "81122184-61cd-4f67-b916-e05791dbfea7",
                "93c772ed-5e3d-4360-a4af-9be6a6acd005",
                "7107c448-ef97-4e11-86cc-b5dd2f292629",
                "99b9aa00-5a6f-43a4-9df1-bc4b32928eec",
                "c5241508-95ba-496b-9b3a-d73a7d9cd698",
                "cd357cb9-d209-4107-a31d-9ce154a0aa3a",
                "e55d1196-40a6-4fa2-8297-9cf010c13968",
                "4f0e8ba6-813e-4e9e-bc7d-1381fa07e18b",
                "c4ba8f2e-5227-4006-aad3-03df413d5263",
                "2c4839c3-813b-46bd-9d20-afaa7d5226d0",
                "48eaef63-8d59-4b9b-8201-d0b8dc8affb5",
                "2c7f90ad-4965-40eb-ba31-7f5b86420974",
                "8e0a5933-d37d-4ff5-8517-bbc91899c38d",
                "5f757b74-15bc-4fc3-a702-9ea442b2c46b",
                "aa52a7dc-29fa-4da9-b775-c045d7b5dc4c",
                "7c8deb5e-46a7-42e4-9d63-1da049fa2e5a",
                "59a61687-83be-46d2-be9f-da8f7b2637b3",
                "84c0a70d-e75e-4efa-8f2a-690acd367a7f",
                "258c1ca0-a05a-45cb-bc61-1a92ac92cecd",
                "a640b5dc-da14-4dfb-a746-26f29c4aa9b3",
                "e1dbe698-a1a6-493b-a47e-2e14485684f4",
                "a1a98fc7-b245-4f5c-ad2f-bd567dc8390d",
                "83559a29-35a6-4f46-8f50-a38cef706eba",
                "89444b67-9220-43bd-b839-fb4eee5dca78",
                "7ed2608b-8b7f-4850-b4bf-a1991b7d802b",
                "440d353f-e9d5-4dd5-b5a8-098bfbfa80b3",
                "3d5e72fd-cdec-4914-91cc-65613c296128",
                "e24f557d-4379-441a-a0a0-9464b616797d",
                "2f189e67-90d1-4a0f-ac46-c8ce4b598c36",
                "4a55df2c-befe-4c8a-a4b1-8d3cc18c0dff",
                "22464456-5eca-42f2-83bd-379e158ba0c4",
                "df7126a6-5212-4b21-bc39-9ec540c94e3a",
                "516ef314-28d9-46f3-bd8c-499df7a6f4f2",
                "ea3d327b-608e-4c88-a6e7-786ecb029130",
                "0f4daf64-db12-4519-a30e-5b93800b699b",
                "921ebd65-0844-43d5-9dcb-364c5024492d",
                "6f12e8e1-b920-4749-8070-c32d6080fab9",
                "7dde260b-d894-4cbf-a87c-100e7bd75110",
                "a56b75d2-dca3-4391-9acd-1b8ad59f0be0",
                "61a581c2-e399-4bf4-914f-25963a086b32",
                "6a841353-8251-4554-b52c-80529d60de22",
                "ef6a9bf9-264a-4f6d-b21d-3305054dff74",
                "b579ab69-5899-42e9-ba0d-8d893c8e0d28",
                "9a04a917-f956-46c3-853b-0834a8f560da",
                "7f7931e9-8ce0-45b3-b19a-e7831f629e65",
                "67786837-3aaa-4b95-ba34-278e6d98d34d",
                "43c0ec18-5cf7-4bc4-8e4c-41ec29b02ea6",
                "86b53359-9a76-46dd-88c6-ffc14e17fbc5",
                "bc1f3655-64f0-48fd-855a-48bb6dc4a998",
                "dd77f1f4-2949-4e86-8b29-d8829a91ae2d",
                "648335c1-eeda-4919-962d-9b1f3a8dff79",
                "71fa0652-4594-49a2-b972-da75db06ae76",
                "9c8e81f8-9fdf-4aa2-8a64-69f67e2057f8",
                "15a06d34-dbd9-4a6f-b60b-b0d84cbf32af",
                "b90cd2c8-f20c-4989-9dc9-d3b6b6347cc4",
                "ed388619-e038-4db9-8bc4-c896ae9c8053",
                "97136529-5882-4516-b6af-103111961aae",
                "4f5e20d2-997e-4264-bbb5-89c13121b28b",
                "150ab8f7-2d36-49c3-a58b-54c622c4d044",
                "a8ef5b0a-47a6-46bf-a376-431d43279208",
                "98594839-4595-4257-834c-f10b20688cb1",
                "6b618dba-0a33-4d65-8835-19eef31d1ead",
                "c6eba779-91ee-4ece-99ec-cfa5aadb9853",
                "a424a191-83f4-42c0-9eeb-5da00491249a",
                "aa10ec33-f58d-4d35-b173-60a0b8b9adb8",
                "a418d7f2-4b39-45a8-a2c4-1c2c4ceba39f",
                "d9ea0a56-fde3-4d7e-a136-d300730fd2de",
                "1e640bf0-b350-4005-9ee3-92b876755e59",
                "ae4dd40e-5734-4787-af56-5ef4e7fd0894",
                "1ec46102-b671-4286-a451-d355d4977991",
                "d1b0741c-cd3b-410e-a636-b0604e387664",
                "2727c892-0386-4584-a9ca-865e80afccb3",
                "b917d413-f513-4c6e-bdea-198d1b493d32",
                "1133f1c9-8a9e-4a8a-8b33-8e5d8013b070",
                "a127ce49-5ab5-4e42-8157-b54882061aad",
                "ab7dc480-a144-4f3d-b0d5-0a7015e5da81",
                "a7c59808-211d-47ae-95ef-9906b2fb3e14",
                "ed01a2a5-66d0-4748-839d-064ea4c17f60",
                "daa476c9-934c-46dc-b7b9-abf35020ba8b",
                "993722f7-faaa-4d2b-9890-8feff9c184dc",
                "00412557-7fcc-413e-8f6e-e79e897a9cf8",
                "63dfd11b-b06d-4692-b47d-5cd3e8a4b410",
                "68ed2245-7c8b-4c5e-b262-127d1fdbbf31",
                "c8ca6e83-574d-4f1f-af6f-17dad424b1ae",
                "74c606d2-9b31-4b22-a57e-9ba75af24e94",
                "d2572fd5-ac7c-4a39-afad-ad07c77401ef",
                "e4530442-59fd-4985-a60a-8c52626bc8a6",
                "db4dce48-ee16-4616-bb7e-bdbaa4961ec1",
                "f0c14ba4-e1c8-43b4-a8a3-4bd6dd5747ad",
                "0fccfe79-5cf3-4e9f-9805-15326eb4d850",
                "b2fa0320-3bf3-41cf-8ea9-782a3a41ccd6",
                "8fd573d4-f829-44c5-a129-0e9ab0d00ac1",
                "39e95110-dcc6-4af1-b93a-e789ecd42189",
                "e44c1c59-d6ae-4291-9ac6-f6ed9ff40ee1",
                "5f00c51d-ec12-43ac-bfa6-21d888a53b69",
                "959b65a0-b5f6-44d5-b1b2-4952fdcd0b57",
                "56875575-559d-47a1-bcf4-9ff806932521",
                "0beb23ac-a909-4070-a3bd-4483a3a0cb81",
                "02da9173-b762-4084-a579-690db516633f",
                "15bff1fa-ecad-4161-a2d9-0d743df9c649",
                "b7d00dfb-853d-46b7-bd25-7d8adeb1c927",
                "d286220b-4927-420a-88da-97c25138692b",
                "c8666ea0-9586-4117-8547-81a674d2ba37",
                "74155a71-a20a-4959-825f-36e7c7e769ed",
                "aa4bacdd-ad1e-415c-bb1a-1f0057f7b3e6",
                "92f8e77c-6aff-4102-a9f6-2d2f0a4f89d6",
                "8ad06841-c3c2-4220-8e7b-8cc438154711",
                "bfed4e94-8d16-4d3e-a90c-0b069ba5300a",
                "8f0738db-364c-4ed9-aab8-a7679f7847fa",
                "b0c63e4e-ecc2-4914-b6c1-e7ef96511417",
                "26f72f2e-7775-4e78-b67c-6372c65c70b8",
                "b84fb213-662d-4465-b29a-9ccc6b44abab",
                "b893c9a9-ccc3-4aed-8469-aabafe7c6bf0",
                "8966b07a-0c69-40fe-8ebc-ed98993f14e2",
                "42f2d623-54a5-4323-b1a3-a9082a4e84d0",
                "b7fac35b-cecf-45e6-adef-63fd04166558",
                "3b68551b-b1a6-49f2-99e9-4477b0843f7d",
                "9e82a9ee-7e22-4953-8d8b-70808c33f23a",
                "04b19481-fdd1-4e5b-8d29-810e73e96d08",
                "33182452-674f-4fd6-b0d2-d74ed8704726",
                "6874c129-e363-4a98-b0e7-e37fd3d1dd73",
                "90451654-6452-442a-84f3-a9ba937e78ee",
                "7f26032e-34ec-4c44-a49a-ef2a4f6b41db",
                "d3d503e1-2b37-4b5a-a28b-7e25a3c32be2",
                "3e238a78-33d0-4ddf-b31a-d8c56104133a",
                "5b780f43-936e-404a-8f88-3eaf1fd9739c",
                "d48a14da-52c3-4ebc-8ad2-ba50889f44e0",
                "b65f82fc-7bd4-4b39-8b3b-637d44cd2daf",
                "2db7c31b-31d9-41f8-a156-1985b2e32b39",
                "2dd71b2a-1fdb-4cd0-b54d-995dff242615",
                "94294169-b63b-4700-b93f-81b6c50dd15b",
                "ee79bcf6-ab9b-4778-bd09-83d03f6d8f82",
                "7b3f85da-bd37-4c6b-ae7f-b8372d4dc230",
                "027cf3b4-9531-42fc-bd3d-0c6b50fd1b5e",
                "47e06de4-a72d-4b3d-8790-ffee39bda66d",
                "1630d447-2c99-4671-9907-ae3bf0c33a66",
                "9de738c3-b5b7-40db-a64b-0c27371fdc24",
                "0038f768-a78b-48a6-b147-f841d2189ed0",
                "413c684f-8975-4754-baea-8f0547dfa9e9",
                "44c1fc9b-fe9b-4aa4-8cf2-71a98cc848d0",
                "06e96e9e-0893-405d-83da-01e11ced10ca",
                "8727c5ee-fff5-4f66-bc2d-2f74136dbc6b",
                "a229ad75-eccb-4168-95d5-38b6a3bd21e1",
                "aad2f2ca-a298-42a6-a9e4-822c909d0883",
                "8360786c-6cff-4af9-9baa-7b5e53056e33",
                "30cf8239-0fa3-4848-8a2a-b106c44dacbd",
                "fd881dfb-ddba-4758-8c33-75f28e4c54d7",
                "51839523-6ce0-4f34-9137-c95e4dc286a5",
                "e272d65a-cd35-462d-8ae3-690153dd3608",
                "f349b209-3192-46de-8f73-95cda819e95a",
                "a007b9eb-44ed-4a79-bfdd-526201b25ee6",
                "25715a72-e4d6-4af1-b24b-4e52bd548188",
                "a5be10e2-a684-420b-b1fb-1835e435a64d",
                "57595e23-d92a-4c0b-9883-0ad1525e1feb",
                "b04a066f-7686-47ba-a031-4ae2ecc4c372",
                "db43e4b7-77a8-437f-9db7-516fe0290305",
                "9e746116-6539-4540-92d6-1cbfe4036cf6",
                "f3abc0e2-bf1c-48ea-b5f8-11dda82e6e67",
                "064ea937-42a9-4976-a78d-2582863d494f",
                "6ff59d54-4bde-4aa8-8755-35275cb19151",
                "087f768a-90fd-4b1f-a84e-3ac633f37690",
                "7379f113-5cd3-46d6-a64a-66f872c356c2",
                "96150668-2c12-440f-99cc-62d0778eabc3",
                "86be2a87-2fac-49e7-b044-bf602e85de4e",
                "ea407964-4e2d-4d80-a35b-bc36f57fb687",
                "929d8a39-6a24-406d-a02c-1057278c94ed",
                "430101aa-c943-4c27-9f28-ff2e815cf70d",
                "ecf64d9d-15f9-407d-bdfc-0511d0aacaa0",
                "ff60d347-22e1-405d-a9c6-03123380f46c",
                "c2dab1ee-f90e-4216-b05d-64f94ec7071d",
                "c8c40b77-1234-454e-9558-740f0550927c",
                "88a2cee8-ddd3-4e1e-9ade-9544733be551",
                "2458f828-818b-4bcd-a987-ac81e200cb60",
                "31af9605-1c33-48cf-b197-efeae74f77c1",
                "5918ae33-0f4d-47aa-8fb1-cb3e5c57ea9c",
                "6b9d3ff6-17ee-404b-9c08-097b711198d9",
                "00c3d73e-2883-4464-8f0c-891294184802",
                "7734a7f5-6942-48d5-91ba-6c8914433f7b",
                "d72125e1-604b-4d7e-943c-d747416e122c",
                "5b6b3582-c4c2-4636-a04f-c0930cf175fe",
                "f3a7afee-4fb4-45ba-8dc5-4a98f0be1c78",
                "75f1b5d9-2427-4ea9-a925-15ff856eb1d3",
                "fbe3bb23-a1e6-44e1-bf57-aa91dbc9cfaa",
                "674bc966-53c8-46d9-b3a8-9b5cb2ffc778",
                "0dec7211-46a0-4929-b44f-b29b31cdc3ec",
                "eb110e66-1919-4566-a2d3-04bd998bd76e",
                "af06ef12-b677-42e4-b01b-6e7743a10c7d",
                "9dd608be-490c-4e16-81e4-54ac11cd19a0",
                "637f0f77-2362-45a4-9733-394ea3c53a52",
                "0bde44de-3ed5-4117-a32a-998772c86f54",
                "356a0ff2-afae-439d-88d1-9a0e176fb967",
                "1f6b4fce-9b40-4255-913e-75e17c9a5592",
                "16013f3c-4759-4b81-84e3-8fd748b9ef03",
                "e899aada-728a-4f4d-911a-1217db3ed461",
                "5fd8ca92-8932-4d4d-b3fb-858974ef208a",
                "e55171c4-e413-4665-83e1-d1743cfde028",
                "3cabfb71-e10e-4b16-ab25-eba688507d48",
                "e4e70da4-2904-4521-8623-2a770ffcc09c",
                "51dae7e7-3c5a-4180-854a-06e9382419cc",
                "516c384c-d4c0-4527-9c6c-cffb955b5451",
                "5e3fe331-3571-4a62-8c09-49be58ba9aff",
                "b04dfbbf-c80d-46c4-9a79-271639c33659",
                "f86b2509-ce9f-4447-86cf-cbf1c4ad40b6",
                "19016142-e5a4-46c4-a471-a056ad1edab2",
                "6399e41d-51af-448b-a0e1-c7d2b564fc45",
                "2f4ffd10-5e87-4060-ac50-c3315af45d84",
                "d7a23d01-48c7-46d5-8423-6194cae702fd",
                "9dc9bce8-36bc-48b6-a23f-1d219947b656",
                "659d82bb-9e1f-47af-9259-222fb3bcbfc9",
                "52312a0d-0bdd-4349-89df-6c4a7c06feb5",
                "009f13cb-1ef1-4529-b226-2be171e1bee5",
                "e8c8461c-02e2-4bcf-a233-7eebd299deb4",
                "872795af-ac94-4512-a781-b14a84bea7fd",
                "c8ae8518-677a-4a5d-97ca-cafd8038ca15",
                "155e41ed-5d59-4d79-bc2e-2d0338a484e1",
                "3f975667-3e35-49ac-89fd-f24d899448a6",
                "8f329de5-68d2-4e7b-ba16-fa3da1ebdad4",
                "4aacc53b-d18f-4acc-9218-45db666ce582",
                "40190333-aa58-4604-990d-1999e612a136",
                "15340e4f-7315-4cba-bfbc-3f36d8b49683",
                "667ea849-f583-45c0-91cf-3f1be2c8778e",
                "1e456fb6-5d60-4b28-9e66-1cf5e52959ec",
                "bc5d3a2a-7995-401a-8606-6e9e03965644",
                "a41b74dd-a2ef-40b0-b3b7-63ae2cacd113",
                "3e67df9e-954a-4988-8e34-a27dc2a79050",
                "52ff0ff8-daef-4b3b-9a79-d793d9149d35",
                "9c24e3a6-7672-4d06-aecf-b7e57242ddab",
                "53f8aac7-48c0-42bd-b9fb-c2ab1d8bc065",
                "b70977e0-d4b7-4696-85dd-06f7c5d37fcf",
                "f3ef959c-cec4-4c1f-bb91-a90072f55d0c",
                "2900b58b-ef21-4bc9-9727-77913899a55b",
                "f7664e19-6862-44c6-92b6-8df956fc7ce2",
                "46efb2b7-3405-4bbd-a298-1e01b7239524",
                "48412f6e-f360-475e-b354-91791988f0bf",
                "0a513e70-ea4c-4941-a672-ab93e6c63684",
                "9d9d94ce-059a-4e32-86d3-32e539f8052d",
                "1d5a4b7c-3141-40c9-b982-08c3aeeb430d",
                "1ed77caa-f520-46ac-be19-b8265cc56be4",
                "5d7f004a-e397-425b-9b5d-343e32e9d302",
                "18032890-1684-494d-8825-5159c8a2f58c",
                "0a68a55e-e35c-43a9-801c-e356ed889a0f",
                "61293778-1b69-488b-b7c8-977bd46c4a23",
                "c8a42949-35d8-42f1-b304-ad0a7e1dfae4",
                "ce20703b-14e5-4d00-99b3-49e02fa5db54",
                "e45c0daa-5df4-4f1d-9837-1bc24d9411ee",
                "3d17e105-892c-4601-95d7-0f9454d6efdb",
                "7df052be-f41e-49a7-97fe-10576a2ff844",
                "1e7b3ee8-9eab-477f-b9c4-e7e0d22689b1",
                "9192c7dd-b293-415e-9182-9a2907d477f5",
                "69f448cb-74dc-4d6c-9f28-1cacb939b558",
                "45c86854-a410-432d-89ef-b1fab5f07b2c",
                "587fee6f-fcfa-4299-8164-9d10303f75fb",
                "100e52e7-3b49-4cd8-b4f6-ab719975b935",
                "b784fbf3-42e7-4e1c-b8f3-54d32707b492",
                "a69a6edd-5e92-443b-8505-772064d4a060",
                "2f7b5de8-04e6-403d-a31f-70a22978958a",
                "46a8805e-35df-4972-a24b-48e4179953bf",
                "5386cd03-a59f-41f8-a55e-e96ec70acc5b",
                "b044671d-11c2-4ab6-a5cd-6109cbe230f9",
                "aee09137-6909-4096-9337-6946ea133463",
                "b1d291c2-2382-42ff-8645-e3846a5093a1",
                "53978743-cecf-4bc9-a379-7c61c6c83379",
                "69c8e74a-967b-4c20-9922-2372b13a86a5",
                "54df1d57-df6c-4eae-8353-eb51ec859c08",
                "83a225ca-22fc-42d3-b90a-9606b31e4a9f",
                "4eaa86ac-59ea-4a97-932c-b6e7d4330647",
                "27da3614-4382-4312-add7-0209710d1919",
                "a72b4d90-4c40-497b-a1fd-e7916f78a327",
                "ca347b95-8f18-44a5-9336-826ea863fe46",
                "2b30ae1a-eed0-481c-bccc-58f4029d5ae9",
                "91d8b54b-9a0f-4673-8089-d4aa352ea5d6",
                "bc7509d2-882f-4b76-b69f-ad9a55f5c042",
                "e07ef4c8-d837-4762-9192-1db8672f9fc3",
                "11f0938d-c88f-4fca-9a87-cea6b9bcc19a",
                "712526e2-9cd6-4c51-a98a-24f01236e58e",
                "ba069bf7-b61f-4a19-a489-e7feec137fe7",
                "cbc4bf05-08d5-44e5-9f2d-ad17e6947bfe",
                "993d46b0-8b70-4cb1-8b3f-49fb6a62d405",
                "968ae34f-4064-4690-9013-a287380ea86f",
                "fa3beff3-9355-416e-ab0d-9308f3eab188",
                "96dff880-4280-4c6d-9776-0a7ffe19b9d7",
                "ad8dffae-50c0-4e84-932a-59a8326ca0e2",
                "abbc1d5c-2cf9-4aee-821c-0fffc63fadf9",
                "74260552-6e8a-4da8-a761-3ca36d97b833",
                "cd8179f8-d43d-4769-9de5-1ac7343e1f09",
                "9f19207d-933f-4bb8-9812-c0136eff4676",
                "76889c41-5e17-41b4-9706-d94b662a20a3",
                "14e070ec-ae02-444d-8437-ac6e30e7ec82",
                "30dbca72-40d0-4066-86b1-090c615785c8",
                "097f3f5d-437d-4f0f-83ce-3536f25c0d06",
                "21f3bec0-8cea-4a02-afce-bb6fe229eca5",
                "05a88e14-2575-4dbe-9046-708a12cdf8db",
                "dab4fe40-e1fa-4267-b0f2-d96f9bffc18f",
                "910d1d0b-fbea-4ddc-baef-7a00a29a0660",
                "d9840eb4-a061-43d1-b47c-7c91fd3dbf90",
                "2739e6aa-d7c6-44f5-b1f2-976bfeddcbcb",
                "8f302b70-228a-4a1f-a6b6-83441d047ef5",
                "7d2f5516-ef06-4b65-8c3a-5e5984da281b",
                "96dfb29a-5f37-4909-93d4-f5d9c0d8956e",
                "8822f230-f1d3-485b-8684-4b876a016175",
                "f69bcc01-b4ef-4890-9b44-ce63799458fc",
                "dda9d9f4-13fe-4db4-a21c-de0f72132e2a",
                "62c67044-a3c8-46af-bb25-73995cbf5d89",
                "412f8472-a489-4709-a954-2d350156d0a3",
                "27114143-5e5f-4c69-8096-28d6e2016704",
                "920eb0b6-638a-4e20-b78a-7e180f40749f",
                "7d8eb0e5-8d6d-4fe3-be9c-44873cc41814",
                "84f61138-430d-4279-88b8-0c242a1f03d5",
                "e4f7b18b-23c3-45a9-95c1-4939f8182a80",
                "3cff8241-7d50-472f-bd49-4bb9f85f4076",
                "95d4bfd7-6d3b-4bef-ad2c-f76d10386f01",
                "0eb8255d-7200-43f2-8acb-b343ff09291b",
                "45bf994b-e0a0-46fd-8eed-dc8835502c3a",
                "12454880-75b4-4032-85ae-cd71225026a5",
                "a03e6dcb-484b-4ef6-baab-9a7c1df05619",
                "c5edb38b-d2e8-41e2-9842-fac35f8b569c",
                "d674314a-cb2f-4151-978f-20c0ba946a4a",
                "63761b7b-eee1-4c8e-af9f-02accc10b5ce",
                "bf5285fe-9001-4186-b06e-0c3607c0b339",
                "9aef6fde-8b45-4183-9dd2-057bca98b6e7",
                "88dfef11-ae43-4ffa-9587-f7e012d91667",
                "9dff66f0-bc95-485e-868e-b6236c676b8e",
                "a2541599-c388-4585-b0c5-29ebcd796e51",
                "9acdc7fa-b5ee-400d-8064-bb831e2a6a2e",
                "2f5b7495-0034-42ce-9569-e808b2d113e8",
                "15a22899-ed8e-4a57-a76e-63578bdefe4a",
                "5b6c0832-7c33-4e38-972d-fda2cf334317",
                "437884c2-b52d-46b6-b698-83069abc5c10",
                "a4f1d4a2-1141-4a99-87dc-cd548943bbe2",
                "24e84b36-7764-49d9-83a0-48d3ab96ab81",
                "e7cc1098-deaa-4bc0-9cab-7179002ee7cb",
                "b0d51047-f8c0-46cb-ba9d-f47caf57c864",
                "c760050a-213b-4de8-969a-6a807ab968bb"
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
    "version": "1.80.2"
}
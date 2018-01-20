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
                    "id": "9d5b88a2-5a65-40c2-89b2-ba253f35c57e",
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
                    "id": "55eadc3f-d1a0-4014-bc69-bdd1208942b3",
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
                    "id": "19a5ee4b-0294-4501-86a9-8de14eab44de",
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
                    "id": "0f72244c-5fb5-4d42-8eb9-eb658d813b1e",
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
                    "id": "2d3e4277-5928-42e4-91e0-305352872602",
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
                    "id": "2b9ad70c-c420-4943-9877-48a86c8b4395",
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
                    "id": "5feba2fe-e1ad-4739-b728-9bb19bd9c846",
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
                    "id": "b5b12faa-9307-40f8-baeb-595e88139919",
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
                    "id": "05a0479f-6d17-4ad8-a079-dad645029d41",
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
                    "id": "414a44a3-334c-47a3-ba4f-8523cb7091ef",
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
                    "id": "1a8d61ac-24ea-43a1-b74c-574773bbe439",
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
                    "id": "09b07338-84ae-4149-b323-21ed97484552",
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
                    "id": "3dbb6b2b-3ea9-4bdc-813d-bd61f9504ed8",
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
                    "id": "16d84c7a-9c14-4144-85f6-b88af0a59ffd",
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
                    "id": "c1461511-d4de-402d-a2c7-f2328bd23b9b",
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
                    "id": "609f2fc9-6f1f-4587-88bc-e69d0cb6238f",
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
                    "id": "271df248-31bb-48a3-ab91-2d98c4878969",
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
                    "id": "ddef1f8c-c07f-44d3-93f9-5ea2146ce433",
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
                    "id": "79e2fabd-fef6-4c12-b882-cc63b5d287c7",
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
                    "id": "6196b5af-fc4f-4228-b0aa-4291b7220c4f",
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
                    "id": "cba7b4ad-2e88-4199-b962-9961857180bb",
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
                    "id": "e2c4f69f-54bd-452b-99e8-0bbe946ce28a",
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
                    "id": "ef84d791-0abe-4157-b675-036cc88c2752",
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
                    "id": "387e0d99-8432-4444-b5a9-4b491f6be11a",
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
                    "id": "b094accd-7c23-4162-b855-35ae8ba695a3",
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
                    "id": "c09d7f92-d825-4d67-8103-ca76a9deb31d",
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
                    "id": "ffe54bf6-6b5b-452c-9f4d-0bdf9d9cf6df",
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
                    "id": "169ce7cc-0ce8-41e6-abaa-a7b96c0cdc1a",
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
                    "id": "66fa6865-cb51-44e8-a04b-67e5ec203a6c",
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
                    "id": "2229ea7b-0fd1-4b84-9d1c-fb1889a1a55c",
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
                    "id": "bbd6117a-7ae5-45f4-be30-4a79d8517c18",
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
                    "id": "632d3067-e555-4894-a411-0afb8dabbd95",
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
                    "id": "d169a9f3-471e-4bc7-a421-31c898d94582",
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
                    "id": "2d0b4d09-73ec-4a44-b335-45db6c7685c7",
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
                    "id": "c155acc8-9ddf-427a-a2b4-9c8aa3da7c8a",
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
                    "id": "74c3bbbe-34b5-49f4-92e9-b3b4660b1cf9",
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
                    "id": "70998ce2-9713-4d33-916a-9bac805e29f6",
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
                    "id": "7c6359a1-dd82-4472-b79f-926a01fbf2a0",
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
                    "id": "1ae6889c-6283-45df-b631-5116ca04882c",
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
                    "id": "bf3aa9bb-1c4d-4f16-9c32-c1bb9cf892f9",
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
                    "id": "e2c52b57-6fb2-4ec4-8fe2-52bee8c656fd",
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
                    "id": "a97732e6-87df-4db4-80d0-094a9f555a0b",
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
                    "id": "9c6242db-8ca3-43d9-aaaa-21bb94bb0bb8",
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
                    "id": "7971731f-a191-4334-ad81-263983c32b06",
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
                    "id": "3ca04485-3ce4-4c05-8896-e608543ebb85",
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
                    "id": "673f6ea3-d7d5-4267-8174-ed6085ca9aa8",
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
                    "id": "758b880f-5fe7-4d0b-a41f-39db48c2f023",
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
                    "id": "c2f207ae-f5b3-48d3-8c69-509e81e45b74",
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
                    "id": "3605bfb0-5aa7-4f6f-b291-1699d57e47f1",
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
                    "id": "97bae617-2687-41c0-b801-903bfd64f2a6",
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
                    "id": "2a2c0777-2b7f-4bbd-a48f-8454247aa2cb",
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
                    "id": "cd7a87a7-6000-4665-96dc-671e01b52f1b",
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
                    "id": "d038e395-eb35-4267-b089-c793814385eb",
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
                    "id": "d6ac6c1c-00e1-491a-a89a-d2ce212594c6",
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
                    "id": "8405289c-5823-45cd-9fcd-b3fb8259b933",
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
                    "id": "8e24a162-a795-44d4-8b29-0dc2afec127a",
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
                    "id": "0add4b30-f2b7-4590-9a3c-3cef11c39f82",
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
                    "id": "25d26220-fd1c-46ca-8c53-116928bef49a",
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
                    "id": "f7dc5ea5-d8da-46c1-929c-f64cb820fe0f",
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
                    "id": "106e53f5-62bc-4906-ab3e-e3ad6cafdc7e",
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
                    "id": "fd2550ff-45ae-4397-b053-d9e768f193e4",
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
                    "id": "a8aa919f-49ac-4e2c-876c-685dfa24ace3",
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
                    "id": "e90b8b82-de97-4d11-b6ae-0f554cf56191",
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
                    "id": "eafbf70d-9ae1-4b41-be8e-4841bbce6a96",
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
                    "id": "ada4d6b3-1d84-4b76-a9a0-5f5fe552f7ab",
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
                    "id": "5c92b90b-a8de-4536-835d-d5faaf8ce637",
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
                    "id": "669206f8-2f1f-4f52-af9c-13d83f5bb378",
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
                    "id": "ab6bc317-4229-4106-acbf-fbec871ca7ff",
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
                    "id": "e56472ab-2f7b-4e5f-a8a8-1e371937e223",
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
                    "id": "91b604b3-538c-4636-8514-b034a18cd7fd",
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
                    "id": "731a748c-140d-4fda-9017-af91560432a5",
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
                    "id": "6146485f-7b40-4278-ba89-bca6c6578680",
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
                    "id": "a725cb0b-d1c8-4722-8a76-6f6bd2555949",
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
                    "id": "7a1897de-49b9-4561-9791-d8597b034fdf",
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
                    "id": "4c636de2-ac74-4bda-8775-1b35318c0736",
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
                    "id": "b05f33cf-d3a5-4dc1-b7d1-e5ba37b1dabb",
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
                    "id": "0ec22fd5-0fac-479b-8822-e47e035183a9",
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
                    "id": "2d557f36-97f9-4a82-9497-588aba4435fc",
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
                    "id": "d32c169a-e3d4-44b7-aae7-fbb7d986aee9",
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
                    "id": "a4db2aff-4a6d-46ea-bbef-2f580da5e463",
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
                    "id": "c0684d57-1bdd-4287-8960-46a1aa970a5a",
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
                    "id": "a75d3d48-34ff-4c8c-828e-676535524e69",
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
                    "id": "d0a84c88-ae30-47fc-a3a5-58eed94a996d",
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
                    "id": "aa69959f-c357-4a08-a113-29d66243d3d4",
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
                    "id": "1ff87dfc-f31d-4b64-bcbd-7ee8c40da0f4",
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
                    "id": "d394bdbf-eb92-4c4d-a26d-da2983fe23c1",
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
                    "id": "a4b513a8-32ed-461b-9bd9-3748311fe142",
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
                    "id": "ce34de40-3d93-4f45-b0f2-7a7950e9d09c",
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
                    "id": "a83aa74f-6c6e-4e40-9ff1-682a2fa6df75",
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
                    "id": "00e2b043-798c-4966-9936-b32da9e8f27c",
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
                    "id": "5ad57013-5041-45e7-8814-0ad9e42698ff",
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
                    "id": "3c07ba02-5ade-405b-832a-5220445c62ef",
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
                    "id": "038e27b4-3a6a-4e4f-926b-69f005f9b526",
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
                    "id": "abda1222-70d7-4247-bf38-0d8a525b283e",
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
                    "id": "5bd994c6-9f68-44f5-b779-d0794000b4a8",
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
                    "id": "b9157ae0-522a-4e87-9697-51c4d5bb036a",
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
                    "id": "c4df229f-cc11-4c17-9444-ea132fd0759c",
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
                    "id": "ef5343bc-ada4-4364-9c3d-b2c201e0ede5",
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
                    "id": "29fd7ef5-ceb1-4887-ac86-2ada24dc45c7",
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
                    "id": "0efba832-45e2-4c85-88ab-834d6c469e9a",
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
                    "id": "1fe1c719-240d-4569-ad40-0fa9682caa73",
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
                    "id": "c768bbb4-65c2-41db-be77-a7fb7a7d2d3a",
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
                    "id": "8459cbfa-64a8-44db-a36a-dd91afd96023",
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
                    "id": "f0fe539e-8752-40a6-a8b4-382470bd4deb",
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
                    "id": "3e451ed3-6611-480f-a30d-9e0412340227",
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
                    "id": "d35ebb5b-dba8-4aea-af51-abeda00e4098",
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
                    "id": "0d9881d8-f081-4e24-85e5-35b6cebe6241",
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
                    "id": "d9c40ae5-ae7e-45e7-b430-03b19187c5e8",
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
                    "id": "1138764e-4fda-49e9-9c95-7ea92e4e42ff",
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
                    "id": "b4833ffb-4887-4fbd-afe9-d216100b5c31",
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
                    "id": "2ccf801a-1198-4110-9a57-d9792a13f7d3",
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
                    "id": "41461511-c043-4550-9914-528f75967210",
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
                    "id": "eccac0a9-1d17-4a3d-8bbc-727b8fdacf94",
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
                    "id": "af6e6e6e-6815-4af5-85ab-e7801599cb4e",
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
                    "id": "c08761f1-20de-4944-8646-53d5f651efb9",
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
                    "id": "54b549f5-1f78-4c8a-8759-903b78dba7a1",
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
                    "id": "56ffa389-69c6-4e0b-bb87-b03e3dbea1d9",
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
                    "id": "3bdbf6bb-3c53-41ad-a3b3-533531a63c3e",
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
                    "id": "a8babd99-7524-41aa-abec-41850607a995",
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
                    "id": "1e4f2d9b-4db9-4aaf-8006-4b4cc15e3af5",
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
                    "id": "591f4a53-928c-4bff-a99c-d73674ba8bc7",
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
                    "id": "e27b2e82-0ff3-4212-9b11-e168894cf3ef",
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
                    "id": "d6ddaea7-80be-4c00-9163-c060eaa12996",
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
                    "id": "41d8f6f1-61da-427e-a948-47a49969a5ce",
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
                    "id": "8b096d1f-5b8e-4e5d-b225-fa44353ec1ae",
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
                    "id": "fbc4c0cd-b535-444d-8919-ef23a366c4a9",
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
                    "id": "0da60899-1c16-49db-a54f-383be942aafc",
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
                    "id": "cb2f7c0b-7ad7-4dec-8a8a-dd9aa01f3595",
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
                    "id": "1feab42d-4b3b-4a8f-80a2-efead67868e5",
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
                    "id": "bf9588eb-7acf-4711-9b0c-4fea5270409f",
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
                    "id": "605fef96-469c-449f-b2d1-c00c8cb76573",
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
                    "id": "a09aca4b-7868-4dff-88a4-8365245022bb",
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
                    "id": "37323c85-9b4e-49e5-a015-8411a5e87d03",
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
                    "id": "f50e766e-c454-46c8-af87-da64d55eb88c",
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
                    "id": "6be114fe-c972-4511-8562-3da52fb591bc",
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
                    "id": "f5a371a3-1d3b-467e-9e58-8be9bbd7fe93",
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
                    "id": "94b24c74-d22e-4cb4-b866-3f4de3528f1c",
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
                    "id": "fe4064e4-fee2-41a0-906f-9c42704d054b",
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
                    "id": "77d378c4-202c-4a25-a37c-e63025be6061",
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
                    "id": "55c22a9f-d7c2-4859-877c-4e5464b1603f",
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
                    "id": "89f6d313-6138-4a8c-a28a-6abbf6b729bc",
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
                    "id": "3d0bb09e-8219-4b43-b774-b792272f0e35",
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
                    "id": "02040d6c-cfc3-4df2-abdc-a19b35bf4891",
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
                    "id": "42f0810f-edc7-4a98-a1cf-0d3e3ed3f49b",
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
                    "id": "f20a9879-d158-410d-97dd-d1c8e196f3b7",
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
                    "id": "6419f1e7-8068-430d-95c8-8001f1e75fe3",
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
                    "id": "4e7e3251-3316-4dbf-9791-1204d1d93d07",
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
                    "id": "72c3bf6e-77b5-464c-9aeb-94618d94c4dc",
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
                    "id": "e487555a-ef39-41b8-b6ae-cbad86683bec",
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
                    "id": "80c50a01-ce00-47ee-81c9-da3f5fcf86b8",
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
                    "id": "c4d32d9f-015b-4120-b5ba-eb6a08dc96fa",
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
                    "id": "57cd054c-850e-442f-b69e-fb8aa9081f19",
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
                    "id": "89ff34be-443b-41c1-85b4-12912ec469e7",
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
                    "id": "42bac745-c050-49fd-b8a8-eac41e48f1c5",
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
                    "id": "792c95a8-57db-4c67-9942-378756fd0fdd",
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
                    "id": "519fc7fd-778f-4dd7-83e9-e15441c74381",
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
                    "id": "cc0208b3-530d-4653-b65b-f7e303959d11",
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
                    "id": "2abea250-a112-4369-b8c5-cc90736af8c1",
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
                    "id": "b3d3e402-74c0-42be-96b1-c6f4b7e46b2b",
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
                    "id": "13f6ad9b-0374-4e1c-a1b2-7a9994d49724",
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
                    "id": "565a761e-efba-4c04-95ef-723501d50307",
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
                    "id": "67b77298-e73b-49dd-b46e-cb1236c37940",
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
                    "id": "37c3d2a4-86ae-4175-bf5f-e5f702057983",
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
                    "id": "4777c203-b22b-48b5-8101-79cb550d7ff1",
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
                    "id": "9e78ff35-0a8b-4663-9ac7-3f17300f0147",
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
                    "id": "10526094-2100-410c-aac7-5ae1dbd53184",
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
                    "id": "0c153588-8f5b-47ac-bb94-9515fafd5f7c",
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
                    "id": "40378344-694a-4f68-ad51-4817e5445d60",
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
                    "id": "3bd46615-a8a5-47b9-9583-aeaa641d5356",
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
                    "id": "4c3dfd7a-e9c3-466b-9916-c5096ed38cbf",
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
                    "id": "2284b65e-7b60-4581-8597-4da1e7cc59a6",
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
                    "id": "54b9432d-6e90-461c-ab50-91c72cfebe36",
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
                    "id": "3983ce10-9f34-4ffa-b82a-104a1b8ec439",
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
                    "id": "81c60160-2ef1-4e9a-9689-1643c98fc94e",
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
                    "id": "f5852993-5a91-433b-a0d7-db3b244a8db1",
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
                    "id": "a368c9a7-72d8-465a-add4-63efc2c59d69",
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
                    "id": "61f48def-823c-4755-9c90-a22515ef510c",
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
                    "id": "cfe04e77-60b2-47e7-866b-5709b9d80e01",
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
                    "id": "55af3eff-16c1-4663-aa2c-0d4a3d36c20c",
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
                    "id": "b654b95d-867d-4b3e-b751-3216e7c6b8e8",
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
                    "id": "68b77543-de41-4efc-9969-1fb6b1fb1dd6",
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
                    "id": "b08db182-b7a8-4018-898f-5c08110232a3",
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
                    "id": "25800f07-e49a-4723-a241-978227bf2f9e",
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
                    "id": "87df0cad-c701-4dc2-b972-8e13f114e29c",
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
                    "id": "779ab2ca-5b45-4812-ba18-90de75eafbcc",
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
                    "id": "936dd994-11c4-411b-9ddc-4e44168d3c55",
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
                    "id": "fd06b5dd-f5f9-4e84-b84c-6bd4ef5b777d",
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
                    "id": "5db5ea04-5773-4718-b332-22cc4f7860d8",
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
                    "id": "dce4e787-eef4-4008-8e70-1f4e41eca1c3",
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
                    "id": "1b106a98-b41a-4d12-ae0c-f6b0fc5359b4",
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
                    "id": "7f960ec6-81a7-4975-b27f-3383d2c36e74",
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
                    "id": "a0607e84-2edb-4f44-979b-f9f2cf16976d",
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
                    "id": "9facfb48-dc5b-4dea-b344-843bb58893ef",
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
                    "id": "48317145-5805-4bdc-893f-8d7031d6d21d",
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
                    "id": "830e2310-0902-4485-bf47-a3bea1c51e46",
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
                    "id": "1474924c-4ca8-450b-9d03-2b48a5ac4493",
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
                    "id": "16cf74af-1731-4058-9e43-18291b07ddf5",
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
                    "id": "15c68458-870f-4421-b568-99decf6c5f20",
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
                    "id": "4fd8e240-2e74-4256-85ac-941fad02ffbf",
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
                    "id": "70109630-6b1e-472b-b4f0-85bd65476608",
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
                    "id": "9bbc5f44-9863-4fc8-82ad-7d88df554e3e",
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
                    "id": "79c29bac-8009-459a-a148-f0bac9befadb",
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
                    "id": "64c31761-9a22-412c-8fd0-37557dc15ec1",
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
                    "id": "ff5eea4c-5cf0-478d-8961-be01a3e64fb5",
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
                    "id": "5bde9863-d9c7-4e14-b407-7eebd2ab0011",
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
                    "id": "f14a5e43-032f-4255-a81a-01eee8046311",
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
                    "id": "0a55a068-c8f6-4e56-99f4-756f7d4baf9f",
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
                    "id": "f7cf60c3-ebb2-43cb-af4f-e704d9fbf127",
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
                    "id": "89cb1110-bd97-418d-9bf4-f943c2f8b74c",
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
                    "id": "df79bd98-be07-4dbd-966d-ece0ff3bcfd7",
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
                    "id": "f1a2b90b-fcc0-4e2d-8995-4c5e861bdcfd",
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
                    "id": "e5563a8d-ab80-4ad0-b849-6bbf2394468a",
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
                    "id": "028c3c95-f717-428e-8053-b3aeebde166d",
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
                    "id": "fc342bc7-2b36-4f81-a0bf-641119758cd6",
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
                    "id": "63a7ae37-ce08-4780-815d-cf81f13215db",
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
                    "id": "0036193a-4ada-41af-a97d-8475d8ef4058",
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
                    "id": "2e7bf97d-2ddb-4595-a4c4-abd899401191",
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
                    "id": "4ed6e677-f502-4120-8914-aa812b106d54",
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
                    "id": "492358b1-8748-4d68-8468-eb53f4f9e971",
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
                    "id": "c4dabc7d-b587-4368-89aa-35239e68ac97",
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
                    "id": "2634d5eb-a5cc-4342-bfc8-9e4a9f30cf5b",
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
                    "id": "5852213f-5a81-4d40-987a-0edcbe1648fd",
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
                    "id": "08b72540-0385-47e8-bd6e-df0cc0f85fd6",
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
                    "id": "de920adb-b47f-4c20-a010-1d80a66d22bb",
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
                    "id": "3d186bcc-0f50-4a01-a8f7-30b5c6f5bb38",
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
                    "id": "e6ac2b9e-b88c-402c-8e5b-20e108dca2cc",
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
                    "id": "b43161dc-b253-4def-829d-1a9697ff82c8",
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
                    "id": "980c3535-e736-425d-9f37-f9637cf18bf4",
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
                    "id": "9bb92cfa-a819-447e-9e7b-403eaec3bec5",
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
                    "id": "2f9973f6-8c03-41e0-b80e-3fd472523cd1",
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
                    "id": "31f4bc15-1e9d-4516-b068-ee951a18a2aa",
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
                    "id": "09d06503-21c5-422a-9a42-dd2e68ba7a99",
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
                    "id": "c5a693a4-72cf-459c-8029-660c25055c61",
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
                    "id": "9d69fb5c-be6e-4750-8c4a-3f2e627ef627",
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
                    "id": "5c093095-cb14-4a89-b7f8-957fcd82eba4",
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
                    "id": "7f084574-517d-4d40-948e-57ce96301c09",
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
                    "id": "6912db62-8e62-4edb-9c04-5da129d91f56",
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
                    "id": "e72efe80-d298-46bd-bcfe-801cfe5fe6fe",
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
                    "id": "195a314f-c631-460e-a4a9-22ffb1388f75",
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
                    "id": "b3ce0819-ecce-4222-b92e-00d0b039baf3",
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
                    "id": "6ef64e64-7fca-4d7a-a696-18647d378d70",
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
                    "id": "58a994b8-ceb8-48f8-a44e-f4cbed79e0aa",
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
                    "id": "5487f7fb-8606-4ffd-8a5b-811c61d8aef2",
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
                    "id": "12c49796-ec30-4d79-ab48-9a8a185ae9b9",
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
                    "id": "9f9d46f9-d4df-4586-98d3-9cdba9f9b762",
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
                    "id": "83f626a3-9863-4070-a7da-8a8132b4e247",
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
                    "id": "2bf2481c-5d3b-4b74-af8f-f94a90e54757",
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
                    "id": "f55c1e8c-da9a-4e68-a264-4115dfbe6723",
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
                    "id": "02fa5a16-9c4a-41cd-85bc-688198f77d75",
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
                    "id": "a38fed64-827b-468d-9c9e-d86dbaa69dee",
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
                    "id": "6ca57a4e-62d8-4e90-9922-0ce035ca3b51",
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
                    "id": "1a6e78cd-7422-4ae3-a50f-4a78e7259772",
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
                    "id": "ab1123d8-ee87-4a46-b959-82e56793c7c0",
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
                    "id": "f739c3b5-fbdb-4118-b831-b962f27699be",
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
                    "id": "cf68bfe5-4fcc-484e-a00b-064a62700b7a",
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
                    "id": "d9ff8fa4-ec7c-4372-8b68-176b24eed7b5",
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
                    "id": "e907a17a-fbf0-46b7-b1b7-3a7f4166a296",
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
                    "id": "c6a9d3f0-aabb-4a81-98cd-3b449b81dac0",
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
                    "id": "8e2807de-bff4-4f9a-8625-ff70968f215d",
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
                    "id": "4226b58f-7652-42d8-8827-bc32d58131f6",
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
                    "id": "91eb1dc3-86b1-422a-9c61-b12db57f8093",
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
                    "id": "e0d25505-5585-474e-8c8e-c3a3eadee5db",
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
                    "id": "4d70fc73-2999-4431-8705-f92e00ede4e7",
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
                    "id": "ecacf10c-9c45-4e96-94c5-d1b140548aab",
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
                    "id": "c18df92d-b64a-49fb-b2ee-38112e52df92",
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
                    "id": "f49abb77-1d7f-426d-869c-e3df48dbaadc",
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
                    "id": "0e0f9fd3-89d6-47f9-9b44-29cae49a4aaa",
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
                    "id": "a2f16b1f-c154-4d64-bfbe-cc62e0919ca7",
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
                    "id": "827ab042-1e07-4ae5-8f87-0cbd9f4b03a3",
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
                    "id": "0457c440-030d-4e26-b4ea-b481e6de047b",
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
                    "id": "bd1477e6-b164-4cf9-a236-37c64dad1255",
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
                    "id": "83d28cb0-b487-4e01-b11a-2f6b39520111",
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
                    "id": "2d279413-61f0-4c30-9f09-741fb248fcaa",
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
                    "id": "11004f3f-f6b5-4ded-aeac-59a284034e80",
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
                    "id": "fa21e6ec-e616-4ef5-8b37-1cf3bde3f5ed",
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
                    "id": "a3e25ec5-52bf-4cd4-b000-8a006a1a4f73",
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
                    "id": "5b8a94d0-3c0e-4a79-8a6f-03d1c42b0976",
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
                    "id": "87f900ae-8076-484c-b340-82bd31987175",
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
                    "id": "668090c5-1a7c-4992-bf8c-006fd62e26ca",
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
                    "id": "c20cc4fe-8cd7-4ef2-93e9-7bf1d916fbb1",
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
                    "id": "8f6dfdbb-8d35-41d2-9cd5-c9423fa43d1c",
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
                    "id": "2faafc23-5c65-4704-b1a5-e7fe40b2531d",
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
                    "id": "9bf83375-8e1c-42fa-a138-382631e40a1f",
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
                    "id": "ca470332-1eca-4044-b2a0-aa83f65a95d8",
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
                    "id": "7e0c32f4-575b-4868-851b-0db8fc4613aa",
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
                    "id": "27a70fe3-167f-44c3-a0f6-4465ef246dc8",
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
                    "id": "1b6f78ae-ba23-4933-b6ef-4a727c78130c",
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
                    "id": "50f222b0-8474-4ea7-85b2-05685f76eaf0",
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
                    "id": "28d0de14-7778-44d0-b886-feaba02cb086",
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
                    "id": "f74d47a0-e3b4-4c59-a1a7-6c9b78af49a2",
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
                    "id": "53d81703-43c7-4264-8546-75d37e740fa7",
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
                    "id": "fff5a1cb-6c3f-47af-b84b-64b687f432ba",
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
                    "id": "dc2599ed-5ece-483e-b655-f9f0d063754f",
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
                    "id": "13a3f484-348c-472a-b00e-1f5f6d1c30c2",
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
                    "id": "15616a78-bc16-45a8-9916-7ca4cc7a7353",
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
                    "id": "798f5788-87a7-4aac-86a1-e112c49023e9",
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
                    "id": "4b877046-d9e0-4a80-9f18-1a1afaa74976",
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
                    "id": "8d6defb0-3303-4a9e-8584-ee13a7747548",
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
                    "id": "0053cf94-4e6f-4c2d-8739-05b26d72886b",
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
                    "id": "608f350a-f948-4740-bf7c-2ee81cd4fcc6",
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
                    "id": "f4a2ad5f-dcbd-4a47-93a7-5740005b975a",
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
                    "id": "f03fc127-438a-4c42-9219-d434ef235ef5",
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
                    "id": "acbab564-35e1-4fe2-b4de-ba7c1a855da4",
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
                    "id": "d4a86b2e-f64b-4050-a4e7-4929eed133e8",
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
                    "id": "353b8a7e-0ac1-43b9-9bd2-edcc3af2d2bb",
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
                    "id": "58946bd0-da3b-459b-aec9-c44719cdd525",
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
                    "id": "c61f106c-9681-4f3f-b92c-76dc30bcaf78",
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
                    "id": "1ff1aadc-c6ad-4212-ae4e-a86926a087d9",
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
                    "id": "5592fba1-3d1a-472f-af9e-ad2d898fe53b",
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
                    "id": "a93bddd5-4eb1-4c10-baba-d91b38fe7824",
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
                    "id": "f241925d-cb0f-4b5e-869b-46b334c329a6",
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
                    "id": "3b740686-0c2f-440b-8a92-044d879fe54a",
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
                    "id": "433ced83-fa87-4187-ad05-eef4e598ba29",
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
                    "id": "392282e1-2b71-40c5-baf6-c4d17d36cd9d",
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
                    "id": "61693fb9-fb63-4822-bdd1-9d629a611b3b",
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
                    "id": "65db7b07-f2df-44d4-8b83-370447062825",
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
                    "id": "fd22de23-cc81-40cd-830a-b455799f4c9a",
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
                    "id": "285f8a5a-4eb6-45a7-88c6-aa43cd8a4a90",
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
                    "id": "9b34147c-0d94-4c40-a7b6-43f74ab6f6a1",
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
                    "id": "3afc8085-7682-4e44-bac7-e533329335b4",
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
                    "id": "2fbb590d-9eb5-45ec-8a73-a17001991406",
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
                    "id": "88c54cec-75ef-47f0-95eb-72418bf55e5d",
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
                    "id": "e500c259-5d57-49b9-be42-4b0bce54d090",
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
                    "id": "0be2105a-5fab-4f78-af9e-98c587db5297",
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
                    "id": "a80d9ab1-0cc2-4b6d-9973-2f71b4a908ff",
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
                    "id": "e4ace7c2-1d10-4641-9577-638488b48b78",
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
                    "id": "8c130ff1-5c18-4029-bf4c-17ea0a2a2066",
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
                    "id": "0d4b91ba-cefb-4a5a-b069-0b3655dbf9ca",
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
                    "id": "ba8e4ed2-657b-4370-b7c8-e13763efdbe8",
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
                    "id": "b38f3feb-f4de-4d46-bf13-8081c6d422c3",
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
                    "id": "34174a0a-06e7-4bec-8fd6-672de4a5989d",
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
                    "id": "c410ae18-239c-41c5-8a06-2e0f9e799ee5",
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
                    "id": "acfc722f-7fec-4a0d-b4d9-8877b42efc8e",
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
                    "id": "1f505cad-f864-46fa-9813-823e13f9e4c9",
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
                    "id": "dc34bca0-e916-45bc-890c-f467da93131c",
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
                    "id": "83170a4d-cb78-498c-9ca3-896056703005",
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
                    "id": "0294454f-104b-475f-8f34-a1b3b231cfd6",
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
                    "id": "2923417c-e1ac-4640-b4db-3c80212ad1b1",
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
                    "id": "225e7faf-7f84-4024-a628-b7d8111b19f8",
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
                    "id": "25d95e41-ef6b-48d9-8511-b3016b7ed09f",
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
                    "id": "4c6343e3-bef4-4dc9-bf0d-36cbba47a36d",
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
                    "id": "4a29be88-c84c-4060-9fe2-8b25b0ab351a",
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
                    "id": "3f5d43bc-50dd-40f0-bd0f-36c3fa8e82ae",
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
                    "id": "190bbab3-8928-4f0d-bef4-4bbc6b0b3a7c",
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
                    "id": "ccc9a39f-2630-4f17-8553-9488e332a2f8",
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
                    "id": "a10e2279-8cd3-4e5e-b96d-0d423299d23a",
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
                    "id": "91fda32d-a453-4547-b1f9-b3d73be79eb3",
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
                    "id": "3cb64ec2-ba67-43b4-8ef8-b957685b4ecd",
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
                    "id": "07e59808-5631-4106-a817-145c45f05c0e",
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
                    "id": "91b8632e-3196-4bc6-b56a-607784d331f9",
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
                    "id": "99511c59-26d1-4f70-8334-2d482a98ba50",
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
                    "id": "af69e0ca-54e1-4df9-9397-19faf0566b35",
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
                    "id": "df87eb87-b4f9-45f8-ac5b-bb6334b941bc",
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
                    "id": "b33dacaa-be64-48e1-88d1-e608821a68f7",
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
                    "id": "f17259c5-e9d9-4932-8a94-700858d5e70e",
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
                    "id": "0a0acfcf-4913-4cee-880f-78415afb678f",
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
                    "id": "9ba4342b-7fac-4fce-9196-d919ebf4cb48",
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
                    "id": "f9ab96b3-007b-4ae8-96c8-8ffea2395cd2",
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
                    "id": "01a87f51-c8bd-4a28-90ee-397cf36c8aca",
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
                    "id": "3b99dcb2-ed7d-4e12-b160-0680dc791fb3",
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
                    "id": "0fdefe7c-92cd-4bab-b317-cd5802a1d09a",
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
                    "id": "bb38256c-fd9d-4d9d-9622-0286a2bcf7d7",
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
                    "id": "95d75c17-f87e-4ea9-b790-4a5215211d99",
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
                    "id": "160d27b1-b41c-4e42-b20e-3fd7c939ab01",
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
                    "id": "bcb96027-5b81-40fb-a466-a377cdaa0a9d",
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
                    "id": "2476fb52-ef13-463f-8c94-a56675b3ad2a",
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
                    "id": "bada6416-b040-4fb5-a955-584a8ac573b8",
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
                    "id": "e8c58316-43d5-4afc-8bee-42f152314e2e",
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
                    "id": "c8ce2e30-b984-4e05-bb20-ab982daf5921",
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
                    "id": "c0193792-90e9-4818-b9f3-6a5c8f5cbd0d",
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
                    "id": "3bd57a20-ecad-462e-97d1-1b5cc1f7e86b",
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
                    "id": "88e5463a-92d3-400e-9c46-e212b93b6cd5",
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
                    "id": "e4d4c7a6-fc06-4eb0-9703-413ce4a79ca0",
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
                    "id": "7288fee2-44b2-422c-9184-2bff9cad9dcc",
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
                    "id": "5adaca03-a016-4248-b47c-d757e246e1f1",
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
                    "id": "e28b624f-f113-4cc0-9bf2-319ad9e7515b",
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
                    "id": "dfe357a7-5ae8-47ed-8ddb-c14d6812abe5",
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
                    "id": "48de530e-adb3-40cb-90b3-36029baf8615",
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
                    "id": "0253f3b3-b382-4c30-88e5-4c5bec309b39",
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
                    "id": "862a422b-1656-4a08-a379-2472607d0327",
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
                    "id": "4268619a-6e94-4159-810b-c0f1d4b9da03",
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
                    "id": "dbfe5154-449d-49cc-95f8-4662ee59c386",
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
                    "id": "d5a7e0fc-94ff-40ab-98b6-a2a061a209a8",
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
                    "id": "aef487df-ae10-4c91-8f5d-b247fc0b6205",
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
                    "id": "c8ee1048-35cf-4348-9541-b6cbdc2bbcc0",
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
                    "id": "5833e739-543a-4e21-bb3d-f6281d5018b4",
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
                    "id": "335f4ccd-fdd3-44dd-91d1-c3fb6bd1fbba",
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
                    "id": "8bdd4ad5-447b-44eb-86e5-e1a742efbf16",
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
                    "id": "f8612cfd-9fdc-41e6-aeb5-4f1c145fceee",
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
                    "id": "5dc9abf7-40d4-4476-8754-f88e41fff7bc",
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
                    "id": "5a81dc3a-12ee-46fb-ab1b-343074137ce3",
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
                    "id": "29345d1e-2576-4af1-8a68-0d24ddf024b9",
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
                    "id": "1785b9c4-2b0b-4fdf-9fef-0c10e2039803",
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
                    "id": "064fab1f-05e7-4226-86b2-3db5029d1710",
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
                    "id": "66f3dba0-f105-4867-b8d2-84298f17c196",
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
                    "id": "300c95e7-e5a9-43e8-b4ba-e1eee38280c2",
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
                    "id": "fb2d709f-8163-4907-bb50-ca9140e824e8",
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
                    "id": "985e8cca-884b-45a3-a61a-6a47575be5bf",
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
                    "id": "2b9a991f-ca41-49a9-98e6-ab01aa353702",
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
                    "id": "161a674a-1582-4627-8da4-871e1caaef9b",
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
                    "id": "91d61196-a18b-4a42-9178-d3a05bb6bd4f",
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
                    "id": "960a9295-11a9-46e7-919a-ff43126dbd2a",
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
                    "id": "a48889a6-fc57-416b-8af8-96989b118a39",
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
                    "id": "8810645c-8f90-419e-aab7-d851a111ae20",
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
                    "id": "68da92cc-5665-4332-a095-74de205d6fdb",
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
                    "id": "f7dc2666-6701-4237-adbb-ab3cdfe8ff9c",
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
                    "id": "8a527d2d-1ed5-465a-a93c-2a424b52e8ec",
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
                    "id": "8bc4bb99-5cfb-4a7d-8fb4-e2ad54cc5ca2",
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
                    "id": "f4bb7d4d-1bec-4600-8100-e85bd3c0caee",
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
                    "id": "10b05c19-f3a8-4906-8a61-5248f207215f",
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
                    "id": "72872b81-0c6a-4169-9977-a71da4d3666b",
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
                    "id": "667ccf31-bde8-47a9-b108-65d10091557d",
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
                    "id": "5b7cbf17-ae92-4ebd-82f5-b21ed8783f22",
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
                    "id": "d60c10ad-ce7b-4a95-9691-0be576a6b0e3",
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
                    "id": "edfbd8f7-f347-44bb-8373-55cb4ca79cd6",
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
                    "id": "fb83bbba-d556-4cb3-a389-39114ee41fe6",
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
                    "id": "dc698b3b-c40e-4dd3-b5c2-ef7502893620",
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
                    "id": "bfa3bee7-16b0-4487-a13c-d5311c87b580",
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
                    "id": "252a1ecd-837e-4f2f-8885-f95873f0abcc",
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
                    "id": "2b021ec0-8370-4b4d-8863-2eca9027ab81",
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
                    "id": "967f889f-b365-4ecc-a969-c6347892e594",
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
                    "id": "dc349f01-079e-4ba2-aac8-470c1485672e",
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
                    "id": "1300a3cf-8bb7-49b7-8ea7-f4144e81d077",
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
                    "id": "44492d2c-8a20-4839-850b-28ff2b0e53dc",
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
                    "id": "b092a90c-8595-4498-8101-5dff7a9b4155",
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
                    "id": "0ede0133-ff6d-4c9c-9b52-abf076f5f20e",
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
                    "id": "f06d230f-4454-438c-9796-104f9ad1f804",
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
                    "id": "2077b7c1-269d-4aa6-84ca-5bd33055b6b6",
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
                    "id": "f9308c25-183d-4ae8-81f6-d48ca0c8ff37",
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
                "9d5b88a2-5a65-40c2-89b2-ba253f35c57e",
                "55eadc3f-d1a0-4014-bc69-bdd1208942b3",
                "19a5ee4b-0294-4501-86a9-8de14eab44de",
                "0f72244c-5fb5-4d42-8eb9-eb658d813b1e",
                "2d3e4277-5928-42e4-91e0-305352872602",
                "2b9ad70c-c420-4943-9877-48a86c8b4395",
                "5feba2fe-e1ad-4739-b728-9bb19bd9c846",
                "b5b12faa-9307-40f8-baeb-595e88139919",
                "05a0479f-6d17-4ad8-a079-dad645029d41",
                "414a44a3-334c-47a3-ba4f-8523cb7091ef",
                "1a8d61ac-24ea-43a1-b74c-574773bbe439",
                "09b07338-84ae-4149-b323-21ed97484552",
                "3dbb6b2b-3ea9-4bdc-813d-bd61f9504ed8",
                "16d84c7a-9c14-4144-85f6-b88af0a59ffd",
                "c1461511-d4de-402d-a2c7-f2328bd23b9b",
                "609f2fc9-6f1f-4587-88bc-e69d0cb6238f",
                "271df248-31bb-48a3-ab91-2d98c4878969",
                "ddef1f8c-c07f-44d3-93f9-5ea2146ce433",
                "79e2fabd-fef6-4c12-b882-cc63b5d287c7",
                "6196b5af-fc4f-4228-b0aa-4291b7220c4f",
                "cba7b4ad-2e88-4199-b962-9961857180bb",
                "e2c4f69f-54bd-452b-99e8-0bbe946ce28a",
                "ef84d791-0abe-4157-b675-036cc88c2752",
                "387e0d99-8432-4444-b5a9-4b491f6be11a",
                "b094accd-7c23-4162-b855-35ae8ba695a3",
                "c09d7f92-d825-4d67-8103-ca76a9deb31d",
                "ffe54bf6-6b5b-452c-9f4d-0bdf9d9cf6df",
                "169ce7cc-0ce8-41e6-abaa-a7b96c0cdc1a",
                "66fa6865-cb51-44e8-a04b-67e5ec203a6c",
                "2229ea7b-0fd1-4b84-9d1c-fb1889a1a55c",
                "bbd6117a-7ae5-45f4-be30-4a79d8517c18",
                "632d3067-e555-4894-a411-0afb8dabbd95",
                "d169a9f3-471e-4bc7-a421-31c898d94582",
                "2d0b4d09-73ec-4a44-b335-45db6c7685c7",
                "c155acc8-9ddf-427a-a2b4-9c8aa3da7c8a",
                "74c3bbbe-34b5-49f4-92e9-b3b4660b1cf9",
                "70998ce2-9713-4d33-916a-9bac805e29f6",
                "7c6359a1-dd82-4472-b79f-926a01fbf2a0",
                "1ae6889c-6283-45df-b631-5116ca04882c",
                "bf3aa9bb-1c4d-4f16-9c32-c1bb9cf892f9",
                "e2c52b57-6fb2-4ec4-8fe2-52bee8c656fd",
                "a97732e6-87df-4db4-80d0-094a9f555a0b",
                "9c6242db-8ca3-43d9-aaaa-21bb94bb0bb8",
                "7971731f-a191-4334-ad81-263983c32b06",
                "3ca04485-3ce4-4c05-8896-e608543ebb85",
                "673f6ea3-d7d5-4267-8174-ed6085ca9aa8",
                "758b880f-5fe7-4d0b-a41f-39db48c2f023",
                "c2f207ae-f5b3-48d3-8c69-509e81e45b74",
                "3605bfb0-5aa7-4f6f-b291-1699d57e47f1",
                "97bae617-2687-41c0-b801-903bfd64f2a6",
                "2a2c0777-2b7f-4bbd-a48f-8454247aa2cb",
                "cd7a87a7-6000-4665-96dc-671e01b52f1b",
                "d038e395-eb35-4267-b089-c793814385eb",
                "d6ac6c1c-00e1-491a-a89a-d2ce212594c6",
                "8405289c-5823-45cd-9fcd-b3fb8259b933",
                "8e24a162-a795-44d4-8b29-0dc2afec127a",
                "0add4b30-f2b7-4590-9a3c-3cef11c39f82",
                "25d26220-fd1c-46ca-8c53-116928bef49a",
                "f7dc5ea5-d8da-46c1-929c-f64cb820fe0f",
                "106e53f5-62bc-4906-ab3e-e3ad6cafdc7e",
                "fd2550ff-45ae-4397-b053-d9e768f193e4",
                "a8aa919f-49ac-4e2c-876c-685dfa24ace3",
                "e90b8b82-de97-4d11-b6ae-0f554cf56191",
                "eafbf70d-9ae1-4b41-be8e-4841bbce6a96",
                "ada4d6b3-1d84-4b76-a9a0-5f5fe552f7ab",
                "5c92b90b-a8de-4536-835d-d5faaf8ce637",
                "669206f8-2f1f-4f52-af9c-13d83f5bb378",
                "ab6bc317-4229-4106-acbf-fbec871ca7ff",
                "e56472ab-2f7b-4e5f-a8a8-1e371937e223",
                "91b604b3-538c-4636-8514-b034a18cd7fd",
                "731a748c-140d-4fda-9017-af91560432a5",
                "6146485f-7b40-4278-ba89-bca6c6578680",
                "a725cb0b-d1c8-4722-8a76-6f6bd2555949",
                "7a1897de-49b9-4561-9791-d8597b034fdf",
                "4c636de2-ac74-4bda-8775-1b35318c0736",
                "b05f33cf-d3a5-4dc1-b7d1-e5ba37b1dabb",
                "0ec22fd5-0fac-479b-8822-e47e035183a9",
                "2d557f36-97f9-4a82-9497-588aba4435fc",
                "d32c169a-e3d4-44b7-aae7-fbb7d986aee9",
                "a4db2aff-4a6d-46ea-bbef-2f580da5e463",
                "c0684d57-1bdd-4287-8960-46a1aa970a5a",
                "a75d3d48-34ff-4c8c-828e-676535524e69",
                "d0a84c88-ae30-47fc-a3a5-58eed94a996d",
                "aa69959f-c357-4a08-a113-29d66243d3d4",
                "1ff87dfc-f31d-4b64-bcbd-7ee8c40da0f4",
                "d394bdbf-eb92-4c4d-a26d-da2983fe23c1",
                "a4b513a8-32ed-461b-9bd9-3748311fe142",
                "ce34de40-3d93-4f45-b0f2-7a7950e9d09c",
                "a83aa74f-6c6e-4e40-9ff1-682a2fa6df75",
                "00e2b043-798c-4966-9936-b32da9e8f27c",
                "5ad57013-5041-45e7-8814-0ad9e42698ff",
                "3c07ba02-5ade-405b-832a-5220445c62ef",
                "038e27b4-3a6a-4e4f-926b-69f005f9b526",
                "abda1222-70d7-4247-bf38-0d8a525b283e",
                "5bd994c6-9f68-44f5-b779-d0794000b4a8",
                "b9157ae0-522a-4e87-9697-51c4d5bb036a",
                "c4df229f-cc11-4c17-9444-ea132fd0759c",
                "ef5343bc-ada4-4364-9c3d-b2c201e0ede5",
                "29fd7ef5-ceb1-4887-ac86-2ada24dc45c7",
                "0efba832-45e2-4c85-88ab-834d6c469e9a",
                "1fe1c719-240d-4569-ad40-0fa9682caa73",
                "c768bbb4-65c2-41db-be77-a7fb7a7d2d3a",
                "8459cbfa-64a8-44db-a36a-dd91afd96023",
                "f0fe539e-8752-40a6-a8b4-382470bd4deb",
                "3e451ed3-6611-480f-a30d-9e0412340227",
                "d35ebb5b-dba8-4aea-af51-abeda00e4098",
                "0d9881d8-f081-4e24-85e5-35b6cebe6241",
                "d9c40ae5-ae7e-45e7-b430-03b19187c5e8",
                "1138764e-4fda-49e9-9c95-7ea92e4e42ff",
                "b4833ffb-4887-4fbd-afe9-d216100b5c31",
                "2ccf801a-1198-4110-9a57-d9792a13f7d3",
                "41461511-c043-4550-9914-528f75967210",
                "eccac0a9-1d17-4a3d-8bbc-727b8fdacf94",
                "af6e6e6e-6815-4af5-85ab-e7801599cb4e",
                "c08761f1-20de-4944-8646-53d5f651efb9",
                "54b549f5-1f78-4c8a-8759-903b78dba7a1",
                "56ffa389-69c6-4e0b-bb87-b03e3dbea1d9",
                "3bdbf6bb-3c53-41ad-a3b3-533531a63c3e",
                "a8babd99-7524-41aa-abec-41850607a995",
                "1e4f2d9b-4db9-4aaf-8006-4b4cc15e3af5",
                "591f4a53-928c-4bff-a99c-d73674ba8bc7",
                "e27b2e82-0ff3-4212-9b11-e168894cf3ef",
                "d6ddaea7-80be-4c00-9163-c060eaa12996",
                "41d8f6f1-61da-427e-a948-47a49969a5ce",
                "8b096d1f-5b8e-4e5d-b225-fa44353ec1ae",
                "fbc4c0cd-b535-444d-8919-ef23a366c4a9",
                "0da60899-1c16-49db-a54f-383be942aafc",
                "cb2f7c0b-7ad7-4dec-8a8a-dd9aa01f3595",
                "1feab42d-4b3b-4a8f-80a2-efead67868e5",
                "bf9588eb-7acf-4711-9b0c-4fea5270409f",
                "605fef96-469c-449f-b2d1-c00c8cb76573",
                "a09aca4b-7868-4dff-88a4-8365245022bb",
                "37323c85-9b4e-49e5-a015-8411a5e87d03",
                "f50e766e-c454-46c8-af87-da64d55eb88c",
                "6be114fe-c972-4511-8562-3da52fb591bc",
                "f5a371a3-1d3b-467e-9e58-8be9bbd7fe93",
                "94b24c74-d22e-4cb4-b866-3f4de3528f1c",
                "fe4064e4-fee2-41a0-906f-9c42704d054b",
                "77d378c4-202c-4a25-a37c-e63025be6061",
                "55c22a9f-d7c2-4859-877c-4e5464b1603f",
                "89f6d313-6138-4a8c-a28a-6abbf6b729bc",
                "3d0bb09e-8219-4b43-b774-b792272f0e35",
                "02040d6c-cfc3-4df2-abdc-a19b35bf4891",
                "42f0810f-edc7-4a98-a1cf-0d3e3ed3f49b",
                "f20a9879-d158-410d-97dd-d1c8e196f3b7",
                "6419f1e7-8068-430d-95c8-8001f1e75fe3",
                "4e7e3251-3316-4dbf-9791-1204d1d93d07",
                "72c3bf6e-77b5-464c-9aeb-94618d94c4dc",
                "e487555a-ef39-41b8-b6ae-cbad86683bec",
                "80c50a01-ce00-47ee-81c9-da3f5fcf86b8",
                "c4d32d9f-015b-4120-b5ba-eb6a08dc96fa",
                "57cd054c-850e-442f-b69e-fb8aa9081f19",
                "89ff34be-443b-41c1-85b4-12912ec469e7",
                "42bac745-c050-49fd-b8a8-eac41e48f1c5",
                "792c95a8-57db-4c67-9942-378756fd0fdd",
                "519fc7fd-778f-4dd7-83e9-e15441c74381",
                "cc0208b3-530d-4653-b65b-f7e303959d11",
                "2abea250-a112-4369-b8c5-cc90736af8c1",
                "b3d3e402-74c0-42be-96b1-c6f4b7e46b2b",
                "13f6ad9b-0374-4e1c-a1b2-7a9994d49724",
                "565a761e-efba-4c04-95ef-723501d50307",
                "67b77298-e73b-49dd-b46e-cb1236c37940",
                "37c3d2a4-86ae-4175-bf5f-e5f702057983",
                "4777c203-b22b-48b5-8101-79cb550d7ff1",
                "9e78ff35-0a8b-4663-9ac7-3f17300f0147",
                "10526094-2100-410c-aac7-5ae1dbd53184",
                "0c153588-8f5b-47ac-bb94-9515fafd5f7c",
                "40378344-694a-4f68-ad51-4817e5445d60",
                "3bd46615-a8a5-47b9-9583-aeaa641d5356",
                "4c3dfd7a-e9c3-466b-9916-c5096ed38cbf",
                "2284b65e-7b60-4581-8597-4da1e7cc59a6",
                "54b9432d-6e90-461c-ab50-91c72cfebe36",
                "3983ce10-9f34-4ffa-b82a-104a1b8ec439",
                "81c60160-2ef1-4e9a-9689-1643c98fc94e",
                "f5852993-5a91-433b-a0d7-db3b244a8db1",
                "a368c9a7-72d8-465a-add4-63efc2c59d69",
                "61f48def-823c-4755-9c90-a22515ef510c",
                "cfe04e77-60b2-47e7-866b-5709b9d80e01",
                "55af3eff-16c1-4663-aa2c-0d4a3d36c20c",
                "b654b95d-867d-4b3e-b751-3216e7c6b8e8",
                "68b77543-de41-4efc-9969-1fb6b1fb1dd6",
                "b08db182-b7a8-4018-898f-5c08110232a3",
                "25800f07-e49a-4723-a241-978227bf2f9e",
                "87df0cad-c701-4dc2-b972-8e13f114e29c",
                "779ab2ca-5b45-4812-ba18-90de75eafbcc",
                "936dd994-11c4-411b-9ddc-4e44168d3c55",
                "fd06b5dd-f5f9-4e84-b84c-6bd4ef5b777d",
                "5db5ea04-5773-4718-b332-22cc4f7860d8",
                "dce4e787-eef4-4008-8e70-1f4e41eca1c3",
                "1b106a98-b41a-4d12-ae0c-f6b0fc5359b4",
                "7f960ec6-81a7-4975-b27f-3383d2c36e74",
                "a0607e84-2edb-4f44-979b-f9f2cf16976d",
                "9facfb48-dc5b-4dea-b344-843bb58893ef",
                "48317145-5805-4bdc-893f-8d7031d6d21d",
                "830e2310-0902-4485-bf47-a3bea1c51e46",
                "1474924c-4ca8-450b-9d03-2b48a5ac4493",
                "16cf74af-1731-4058-9e43-18291b07ddf5",
                "15c68458-870f-4421-b568-99decf6c5f20",
                "4fd8e240-2e74-4256-85ac-941fad02ffbf",
                "70109630-6b1e-472b-b4f0-85bd65476608",
                "9bbc5f44-9863-4fc8-82ad-7d88df554e3e",
                "79c29bac-8009-459a-a148-f0bac9befadb",
                "64c31761-9a22-412c-8fd0-37557dc15ec1",
                "ff5eea4c-5cf0-478d-8961-be01a3e64fb5",
                "5bde9863-d9c7-4e14-b407-7eebd2ab0011",
                "f14a5e43-032f-4255-a81a-01eee8046311",
                "0a55a068-c8f6-4e56-99f4-756f7d4baf9f",
                "f7cf60c3-ebb2-43cb-af4f-e704d9fbf127",
                "89cb1110-bd97-418d-9bf4-f943c2f8b74c",
                "df79bd98-be07-4dbd-966d-ece0ff3bcfd7",
                "f1a2b90b-fcc0-4e2d-8995-4c5e861bdcfd",
                "e5563a8d-ab80-4ad0-b849-6bbf2394468a",
                "028c3c95-f717-428e-8053-b3aeebde166d",
                "fc342bc7-2b36-4f81-a0bf-641119758cd6",
                "63a7ae37-ce08-4780-815d-cf81f13215db",
                "0036193a-4ada-41af-a97d-8475d8ef4058",
                "2e7bf97d-2ddb-4595-a4c4-abd899401191",
                "4ed6e677-f502-4120-8914-aa812b106d54",
                "492358b1-8748-4d68-8468-eb53f4f9e971",
                "c4dabc7d-b587-4368-89aa-35239e68ac97",
                "2634d5eb-a5cc-4342-bfc8-9e4a9f30cf5b",
                "5852213f-5a81-4d40-987a-0edcbe1648fd",
                "08b72540-0385-47e8-bd6e-df0cc0f85fd6",
                "de920adb-b47f-4c20-a010-1d80a66d22bb",
                "3d186bcc-0f50-4a01-a8f7-30b5c6f5bb38",
                "e6ac2b9e-b88c-402c-8e5b-20e108dca2cc",
                "b43161dc-b253-4def-829d-1a9697ff82c8",
                "980c3535-e736-425d-9f37-f9637cf18bf4",
                "9bb92cfa-a819-447e-9e7b-403eaec3bec5",
                "2f9973f6-8c03-41e0-b80e-3fd472523cd1",
                "31f4bc15-1e9d-4516-b068-ee951a18a2aa",
                "09d06503-21c5-422a-9a42-dd2e68ba7a99",
                "c5a693a4-72cf-459c-8029-660c25055c61",
                "9d69fb5c-be6e-4750-8c4a-3f2e627ef627",
                "5c093095-cb14-4a89-b7f8-957fcd82eba4",
                "7f084574-517d-4d40-948e-57ce96301c09",
                "6912db62-8e62-4edb-9c04-5da129d91f56",
                "e72efe80-d298-46bd-bcfe-801cfe5fe6fe",
                "195a314f-c631-460e-a4a9-22ffb1388f75",
                "b3ce0819-ecce-4222-b92e-00d0b039baf3",
                "6ef64e64-7fca-4d7a-a696-18647d378d70",
                "58a994b8-ceb8-48f8-a44e-f4cbed79e0aa",
                "5487f7fb-8606-4ffd-8a5b-811c61d8aef2",
                "12c49796-ec30-4d79-ab48-9a8a185ae9b9",
                "9f9d46f9-d4df-4586-98d3-9cdba9f9b762",
                "83f626a3-9863-4070-a7da-8a8132b4e247",
                "2bf2481c-5d3b-4b74-af8f-f94a90e54757",
                "f55c1e8c-da9a-4e68-a264-4115dfbe6723",
                "02fa5a16-9c4a-41cd-85bc-688198f77d75",
                "a38fed64-827b-468d-9c9e-d86dbaa69dee",
                "6ca57a4e-62d8-4e90-9922-0ce035ca3b51",
                "1a6e78cd-7422-4ae3-a50f-4a78e7259772",
                "ab1123d8-ee87-4a46-b959-82e56793c7c0",
                "f739c3b5-fbdb-4118-b831-b962f27699be",
                "cf68bfe5-4fcc-484e-a00b-064a62700b7a",
                "d9ff8fa4-ec7c-4372-8b68-176b24eed7b5",
                "e907a17a-fbf0-46b7-b1b7-3a7f4166a296",
                "c6a9d3f0-aabb-4a81-98cd-3b449b81dac0",
                "8e2807de-bff4-4f9a-8625-ff70968f215d",
                "4226b58f-7652-42d8-8827-bc32d58131f6",
                "91eb1dc3-86b1-422a-9c61-b12db57f8093",
                "e0d25505-5585-474e-8c8e-c3a3eadee5db",
                "4d70fc73-2999-4431-8705-f92e00ede4e7",
                "ecacf10c-9c45-4e96-94c5-d1b140548aab",
                "c18df92d-b64a-49fb-b2ee-38112e52df92",
                "f49abb77-1d7f-426d-869c-e3df48dbaadc",
                "0e0f9fd3-89d6-47f9-9b44-29cae49a4aaa",
                "a2f16b1f-c154-4d64-bfbe-cc62e0919ca7",
                "827ab042-1e07-4ae5-8f87-0cbd9f4b03a3",
                "0457c440-030d-4e26-b4ea-b481e6de047b",
                "bd1477e6-b164-4cf9-a236-37c64dad1255",
                "83d28cb0-b487-4e01-b11a-2f6b39520111",
                "2d279413-61f0-4c30-9f09-741fb248fcaa",
                "11004f3f-f6b5-4ded-aeac-59a284034e80",
                "fa21e6ec-e616-4ef5-8b37-1cf3bde3f5ed",
                "a3e25ec5-52bf-4cd4-b000-8a006a1a4f73",
                "5b8a94d0-3c0e-4a79-8a6f-03d1c42b0976",
                "87f900ae-8076-484c-b340-82bd31987175",
                "668090c5-1a7c-4992-bf8c-006fd62e26ca",
                "c20cc4fe-8cd7-4ef2-93e9-7bf1d916fbb1",
                "8f6dfdbb-8d35-41d2-9cd5-c9423fa43d1c",
                "2faafc23-5c65-4704-b1a5-e7fe40b2531d",
                "9bf83375-8e1c-42fa-a138-382631e40a1f",
                "ca470332-1eca-4044-b2a0-aa83f65a95d8",
                "7e0c32f4-575b-4868-851b-0db8fc4613aa",
                "27a70fe3-167f-44c3-a0f6-4465ef246dc8",
                "1b6f78ae-ba23-4933-b6ef-4a727c78130c",
                "50f222b0-8474-4ea7-85b2-05685f76eaf0",
                "28d0de14-7778-44d0-b886-feaba02cb086",
                "f74d47a0-e3b4-4c59-a1a7-6c9b78af49a2",
                "53d81703-43c7-4264-8546-75d37e740fa7",
                "fff5a1cb-6c3f-47af-b84b-64b687f432ba",
                "dc2599ed-5ece-483e-b655-f9f0d063754f",
                "13a3f484-348c-472a-b00e-1f5f6d1c30c2",
                "15616a78-bc16-45a8-9916-7ca4cc7a7353",
                "798f5788-87a7-4aac-86a1-e112c49023e9",
                "4b877046-d9e0-4a80-9f18-1a1afaa74976",
                "8d6defb0-3303-4a9e-8584-ee13a7747548",
                "0053cf94-4e6f-4c2d-8739-05b26d72886b",
                "608f350a-f948-4740-bf7c-2ee81cd4fcc6",
                "f4a2ad5f-dcbd-4a47-93a7-5740005b975a",
                "f03fc127-438a-4c42-9219-d434ef235ef5",
                "acbab564-35e1-4fe2-b4de-ba7c1a855da4",
                "d4a86b2e-f64b-4050-a4e7-4929eed133e8",
                "353b8a7e-0ac1-43b9-9bd2-edcc3af2d2bb",
                "58946bd0-da3b-459b-aec9-c44719cdd525",
                "c61f106c-9681-4f3f-b92c-76dc30bcaf78",
                "1ff1aadc-c6ad-4212-ae4e-a86926a087d9",
                "5592fba1-3d1a-472f-af9e-ad2d898fe53b",
                "a93bddd5-4eb1-4c10-baba-d91b38fe7824",
                "f241925d-cb0f-4b5e-869b-46b334c329a6",
                "3b740686-0c2f-440b-8a92-044d879fe54a",
                "433ced83-fa87-4187-ad05-eef4e598ba29",
                "392282e1-2b71-40c5-baf6-c4d17d36cd9d",
                "61693fb9-fb63-4822-bdd1-9d629a611b3b",
                "65db7b07-f2df-44d4-8b83-370447062825",
                "fd22de23-cc81-40cd-830a-b455799f4c9a",
                "285f8a5a-4eb6-45a7-88c6-aa43cd8a4a90",
                "9b34147c-0d94-4c40-a7b6-43f74ab6f6a1",
                "3afc8085-7682-4e44-bac7-e533329335b4",
                "2fbb590d-9eb5-45ec-8a73-a17001991406",
                "88c54cec-75ef-47f0-95eb-72418bf55e5d",
                "e500c259-5d57-49b9-be42-4b0bce54d090",
                "0be2105a-5fab-4f78-af9e-98c587db5297",
                "a80d9ab1-0cc2-4b6d-9973-2f71b4a908ff",
                "e4ace7c2-1d10-4641-9577-638488b48b78",
                "8c130ff1-5c18-4029-bf4c-17ea0a2a2066",
                "0d4b91ba-cefb-4a5a-b069-0b3655dbf9ca",
                "ba8e4ed2-657b-4370-b7c8-e13763efdbe8",
                "b38f3feb-f4de-4d46-bf13-8081c6d422c3",
                "34174a0a-06e7-4bec-8fd6-672de4a5989d",
                "c410ae18-239c-41c5-8a06-2e0f9e799ee5",
                "acfc722f-7fec-4a0d-b4d9-8877b42efc8e",
                "1f505cad-f864-46fa-9813-823e13f9e4c9",
                "dc34bca0-e916-45bc-890c-f467da93131c",
                "83170a4d-cb78-498c-9ca3-896056703005",
                "0294454f-104b-475f-8f34-a1b3b231cfd6",
                "2923417c-e1ac-4640-b4db-3c80212ad1b1",
                "225e7faf-7f84-4024-a628-b7d8111b19f8",
                "25d95e41-ef6b-48d9-8511-b3016b7ed09f",
                "4c6343e3-bef4-4dc9-bf0d-36cbba47a36d",
                "4a29be88-c84c-4060-9fe2-8b25b0ab351a",
                "3f5d43bc-50dd-40f0-bd0f-36c3fa8e82ae",
                "190bbab3-8928-4f0d-bef4-4bbc6b0b3a7c",
                "ccc9a39f-2630-4f17-8553-9488e332a2f8",
                "a10e2279-8cd3-4e5e-b96d-0d423299d23a",
                "91fda32d-a453-4547-b1f9-b3d73be79eb3",
                "3cb64ec2-ba67-43b4-8ef8-b957685b4ecd",
                "07e59808-5631-4106-a817-145c45f05c0e",
                "91b8632e-3196-4bc6-b56a-607784d331f9",
                "99511c59-26d1-4f70-8334-2d482a98ba50",
                "af69e0ca-54e1-4df9-9397-19faf0566b35",
                "df87eb87-b4f9-45f8-ac5b-bb6334b941bc",
                "b33dacaa-be64-48e1-88d1-e608821a68f7",
                "f17259c5-e9d9-4932-8a94-700858d5e70e",
                "0a0acfcf-4913-4cee-880f-78415afb678f",
                "9ba4342b-7fac-4fce-9196-d919ebf4cb48",
                "f9ab96b3-007b-4ae8-96c8-8ffea2395cd2",
                "01a87f51-c8bd-4a28-90ee-397cf36c8aca",
                "3b99dcb2-ed7d-4e12-b160-0680dc791fb3",
                "0fdefe7c-92cd-4bab-b317-cd5802a1d09a",
                "bb38256c-fd9d-4d9d-9622-0286a2bcf7d7",
                "95d75c17-f87e-4ea9-b790-4a5215211d99",
                "160d27b1-b41c-4e42-b20e-3fd7c939ab01",
                "bcb96027-5b81-40fb-a466-a377cdaa0a9d",
                "2476fb52-ef13-463f-8c94-a56675b3ad2a",
                "bada6416-b040-4fb5-a955-584a8ac573b8",
                "e8c58316-43d5-4afc-8bee-42f152314e2e",
                "c8ce2e30-b984-4e05-bb20-ab982daf5921",
                "c0193792-90e9-4818-b9f3-6a5c8f5cbd0d",
                "3bd57a20-ecad-462e-97d1-1b5cc1f7e86b",
                "88e5463a-92d3-400e-9c46-e212b93b6cd5",
                "e4d4c7a6-fc06-4eb0-9703-413ce4a79ca0",
                "7288fee2-44b2-422c-9184-2bff9cad9dcc",
                "5adaca03-a016-4248-b47c-d757e246e1f1",
                "e28b624f-f113-4cc0-9bf2-319ad9e7515b",
                "dfe357a7-5ae8-47ed-8ddb-c14d6812abe5",
                "48de530e-adb3-40cb-90b3-36029baf8615",
                "0253f3b3-b382-4c30-88e5-4c5bec309b39",
                "862a422b-1656-4a08-a379-2472607d0327",
                "4268619a-6e94-4159-810b-c0f1d4b9da03",
                "dbfe5154-449d-49cc-95f8-4662ee59c386",
                "d5a7e0fc-94ff-40ab-98b6-a2a061a209a8",
                "aef487df-ae10-4c91-8f5d-b247fc0b6205",
                "c8ee1048-35cf-4348-9541-b6cbdc2bbcc0",
                "5833e739-543a-4e21-bb3d-f6281d5018b4",
                "335f4ccd-fdd3-44dd-91d1-c3fb6bd1fbba",
                "8bdd4ad5-447b-44eb-86e5-e1a742efbf16",
                "f8612cfd-9fdc-41e6-aeb5-4f1c145fceee",
                "5dc9abf7-40d4-4476-8754-f88e41fff7bc",
                "5a81dc3a-12ee-46fb-ab1b-343074137ce3",
                "29345d1e-2576-4af1-8a68-0d24ddf024b9",
                "1785b9c4-2b0b-4fdf-9fef-0c10e2039803",
                "064fab1f-05e7-4226-86b2-3db5029d1710",
                "66f3dba0-f105-4867-b8d2-84298f17c196",
                "300c95e7-e5a9-43e8-b4ba-e1eee38280c2",
                "fb2d709f-8163-4907-bb50-ca9140e824e8",
                "985e8cca-884b-45a3-a61a-6a47575be5bf",
                "2b9a991f-ca41-49a9-98e6-ab01aa353702",
                "161a674a-1582-4627-8da4-871e1caaef9b",
                "91d61196-a18b-4a42-9178-d3a05bb6bd4f",
                "960a9295-11a9-46e7-919a-ff43126dbd2a",
                "a48889a6-fc57-416b-8af8-96989b118a39",
                "8810645c-8f90-419e-aab7-d851a111ae20",
                "68da92cc-5665-4332-a095-74de205d6fdb",
                "f7dc2666-6701-4237-adbb-ab3cdfe8ff9c",
                "8a527d2d-1ed5-465a-a93c-2a424b52e8ec",
                "8bc4bb99-5cfb-4a7d-8fb4-e2ad54cc5ca2",
                "f4bb7d4d-1bec-4600-8100-e85bd3c0caee",
                "10b05c19-f3a8-4906-8a61-5248f207215f",
                "72872b81-0c6a-4169-9977-a71da4d3666b",
                "667ccf31-bde8-47a9-b108-65d10091557d",
                "5b7cbf17-ae92-4ebd-82f5-b21ed8783f22",
                "d60c10ad-ce7b-4a95-9691-0be576a6b0e3",
                "edfbd8f7-f347-44bb-8373-55cb4ca79cd6",
                "fb83bbba-d556-4cb3-a389-39114ee41fe6",
                "dc698b3b-c40e-4dd3-b5c2-ef7502893620",
                "bfa3bee7-16b0-4487-a13c-d5311c87b580",
                "252a1ecd-837e-4f2f-8885-f95873f0abcc",
                "2b021ec0-8370-4b4d-8863-2eca9027ab81",
                "967f889f-b365-4ecc-a969-c6347892e594",
                "dc349f01-079e-4ba2-aac8-470c1485672e",
                "1300a3cf-8bb7-49b7-8ea7-f4144e81d077",
                "44492d2c-8a20-4839-850b-28ff2b0e53dc",
                "b092a90c-8595-4498-8101-5dff7a9b4155",
                "0ede0133-ff6d-4c9c-9b52-abf076f5f20e",
                "f06d230f-4454-438c-9796-104f9ad1f804",
                "2077b7c1-269d-4aa6-84ca-5bd33055b6b6",
                "f9308c25-183d-4ae8-81f6-d48ca0c8ff37"
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
    "version": "1.80.0"
}